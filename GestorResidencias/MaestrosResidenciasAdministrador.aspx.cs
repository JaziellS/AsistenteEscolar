using GestorResidencias.Clases;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorResidencias
{
    public partial class MaestrosResidenciasAdministrador : System.Web.UI.Page
    {
        #region Variables
        private Mensajes oMensajes = new Mensajes();
        private Dictionary<string, string> dicOrdenacion = new Dictionary<string, string>();
        private Dictionary<string, string> dicOrdenacionMaestrosMod = new Dictionary<string, string>();
        private Dictionary<string, string> dicOrdenacionAnteproyectosMod = new Dictionary<string, string>();
        #endregion

        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Generales.glsUsuarioSession == null)
            {
                Response.Redirect("Acceso.aspx");
            }
            else
            {
                if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString()
                    || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.EncargadoDeResidencias.ToString())
                {
                    if (IsPostBack == false)
                    {
                        ConfiguraPagina();
                        LlenarCombos();
                        LlenarMaestrosResidencia();
                    }
                    ConfiguraGrids();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Script1", "Scrolls();", true);
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
            }
        }

        protected void ibtnRetroceder_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ModuloAdministrador.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            LlenarMaestrosResidencia(tboxNoEmpleado.Text, tboxNombreMaestro.Text, tboxProyectosAsignados.Text, cboxPeriodo.SelectedValue, tboxAnio.Text);
        }

        protected void ibtnAgregar_Click(object sender, ImageClickEventArgs e)
        {
            modAsignarMaestros.Show();
        }

        protected void gvMaestrosResidencia_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dicOrdenacion = new Dictionary<string, string>((Dictionary<string, string>)ViewState["dicOrdenacion"]);

            DataView m_DataView = new DataView((DataTable)ViewState["dtMaestrosResidencia"]);
            if (ViewState["ultOrdenacion"] != null)
            {
                m_DataView.Sort = ViewState["ultOrdenacion"].ToString() + " " + dicOrdenacion[ViewState["ultOrdenacion"].ToString()];
            }

            gvMaestrosResidencia.DataSource = m_DataView;
            gvMaestrosResidencia.PageIndex = e.NewPageIndex;
            gvMaestrosResidencia.DataBind();
        }

        protected void gvMaestrosResidencia_Sorting(object sender, GridViewSortEventArgs e)
        {
            gvMaestrosResidencia.PageIndex = 0;

            dicOrdenacion = new Dictionary<string, string>((Dictionary<string, string>)ViewState["dicOrdenacion"]);
            if (!dicOrdenacion.ContainsKey(e.SortExpression))
            {
                dicOrdenacion.Add(e.SortExpression, "ASC");
            }
            else
            {
                if (dicOrdenacion[e.SortExpression] == "ASC")
                {
                    dicOrdenacion[e.SortExpression] = "DESC";
                }
                else
                {
                    dicOrdenacion[e.SortExpression] = "ASC";
                }
            }
            ViewState["dicOrdenacion"] = dicOrdenacion;
            ViewState["ultOrdenacion"] = e.SortExpression;

            if (ViewState["dtMaestrosResidencia"] != null)
            {
                DataView m_DataView = new DataView((DataTable)ViewState["dtMaestrosResidencia"]);
                m_DataView.Sort = e.SortExpression + " " + dicOrdenacion[e.SortExpression];

                gvMaestrosResidencia.DataSource = m_DataView;
                gvMaestrosResidencia.DataBind();
            }
        }

        protected void gvMaestrosResidencia_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[12].ColumnSpan = 2;
                e.Row.Cells.RemoveAt(13);
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button ibtnAsignarAnteproyecto = (Button)e.Row.Cells[12].Controls[0];
                ibtnAsignarAnteproyecto.ID = "ibtnAsignarAnteproyecto";
                ibtnAsignarAnteproyecto.CommandName = "ibtnAsignarAnteproyecto";
                ibtnAsignarAnteproyecto.CssClass = "form-control fontsizeh6 btn-hover-general";
                ibtnAsignarAnteproyecto.Text = "Asignar Anteproyecto";
                ibtnAsignarAnteproyecto.ForeColor = System.Drawing.Color.White;
                ibtnAsignarAnteproyecto.Font.Bold = true;

                Button btnVerAnteproyectos = (Button)e.Row.Cells[13].Controls[0];
                btnVerAnteproyectos.ID = "btnVerAnteproyectos";
                btnVerAnteproyectos.CommandName = "btnVerAnteproyectos";
                btnVerAnteproyectos.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnVerAnteproyectos.Text = "Ver Anteproyecto";
                btnVerAnteproyectos.ForeColor = System.Drawing.Color.White;
                btnVerAnteproyectos.Font.Bold = true;

            }
        }

        protected void gvMaestrosResidencia_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "ibtnAsignarAnteproyecto")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvMaestrosResidencia.Rows[index];

                    String _sIdTeacher = gvMaestrosResidencia.DataKeys[index].Values[0].ToString();
                    String _sIdTeacherDet = gvMaestrosResidencia.DataKeys[index].Values[1].ToString();
                    String _sIdUser = gvMaestrosResidencia.DataKeys[index].Values[2].ToString();
                    String _sIdPeriod = gvMaestrosResidencia.DataKeys[index].Values[3].ToString();
                    String _sIdIdTypeState = gvMaestrosResidencia.DataKeys[index].Values[4].ToString();
                    String _sYear = gvMaestrosResidencia.DataKeys[index].Values[5].ToString();
                    String _sNombreMaestro = gvMaestrosResidencia.DataKeys[index].Values[6].ToString();
                    String _sHorasAsignadas = gvMaestrosResidencia.DataKeys[index].Values[7].ToString();
                    
                    ViewState["IdTeachersDet"] = _sIdTeacherDet;
                    ViewState["IdPeriod"] = _sIdPeriod;
                    ViewState["Year"] = _sYear;
                    ViewState["sIdUserMaestro"] = _sIdUser;

                    int iHorasAsignadas = int.Parse(_sHorasAsignadas) - MaestroResidencia.ObtineNumeroAnteproyectosLigados(_sIdTeacherDet);

                    lblNombreMaestroAA.Text = _sNombreMaestro;
                    lblHorasAsignarAA.Text = "Horas totales por asignar: " + iHorasAsignadas.ToString();

                    tboxNombreModAA.Text = "";
                    tboxMaestrosAsigModAA.Text = "";

                    LlenarAnteproyectosModAsignar(_sIdTeacherDet, _sIdPeriod, _sYear);
                    modAsignarAnteproyectos.Show();
                }
                else if (e.CommandName == "btnVerAnteproyectos")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvMaestrosResidencia.Rows[index];

                    String _sIdTeacher = gvMaestrosResidencia.DataKeys[index].Values[0].ToString();
                    String _sIdTeacherDet = gvMaestrosResidencia.DataKeys[index].Values[1].ToString();
                    String _sIdUser = gvMaestrosResidencia.DataKeys[index].Values[2].ToString();
                    String _sIdPeriod = gvMaestrosResidencia.DataKeys[index].Values[3].ToString();
                    String _sIdIdTypeState = gvMaestrosResidencia.DataKeys[index].Values[4].ToString();
                    String _sYear = gvMaestrosResidencia.DataKeys[index].Values[5].ToString();

                    LlenarAnteproyectosModVer(_sIdTeacher, _sIdTeacherDet);
                    modVerAnteproyectos.Show();
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }
        
        protected void btnDescargar_Click(object sender, EventArgs e)
        {
            DataTable dtDatos = (DataTable)ViewState["dtMaestrosResidencia"];

            if (dtDatos.Rows.Count > 0)
            {
                GeneraExcel(dtDatos);
            }
            else
            {
                oMensajes.MuestraMensaje(this, "Info", "No exite información para descargar", Mensajes.TipoMensaje.Informacion);
            }
        }

        #region Modal Asignar Maestros
        protected void ibtnCerrarMod_Click(object sender, ImageClickEventArgs e)
        {
            modAsignarMaestros.Hide();
            LimpiarModalAsiganrMaestros();
        }

        protected void btnCargarMod_Click(object sender, EventArgs e)
        {
            if (cboxPeriodoMod.SelectedValue != "" && tboxAnioMod.Text != "")
            {
                MaestroResidencia oMaestro;

                if (!MaestroResidencia.ValidaExistePeriodoAnio(cboxPeriodoMod.SelectedValue, tboxAnioMod.Text))
                {
                    oMaestro = new MaestroResidencia();
                    oMaestro.IdPeriod = cboxPeriodoMod.SelectedValue;
                    oMaestro.Anio = tboxAnioMod.Text;

                    oMaestro.InsertaPeriodoMaestrosResidencias();
                }
                else
                {
                    oMaestro = new MaestroResidencia(cboxPeriodoMod.SelectedValue, tboxAnioMod.Text);
                }

                DataTable dtMaestros = MaestroResidencia.ObtieneTodosLosMaestros();

                if(dtMaestros.Rows.Count > 0)
                {
                    foreach(DataRow dr in dtMaestros.Rows)
                    {
                        if(!MaestroResidencia.ValidaExisteMaestroEnElPeriodo(oMaestro.IdTeachers, dr["IdUser"].ToString()))
                        {
                            MaestroResidencia.InsertaMaestrosResidenciasDetalle(oMaestro.IdTeachers, Generales.ObtieneNuevoID(), dr["IdUser"].ToString(), Enums.EstatusMaestrosResidenciaDetalle.Inactivo.ToString(), "0");
                        }
                    }
                }
                lblTituloPeriodoMod.Text = cboxPeriodoMod.SelectedItem.Text + " " + tboxAnioMod.Text;
                divTablaMaestrosMod.Visible = true;
                LlenarMaestrosMod(oMaestro.IdTeachers);
            }
        }

        protected void gvMaestros_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dicOrdenacionMaestrosMod = new Dictionary<string, string>((Dictionary<string, string>)ViewState["dicOrdenacionMaestrosMod"]);

            DataView m_DataView = new DataView((DataTable)ViewState["dtMaestrosMod"]);
            if (ViewState["ultOrdenacionMaestrosMod"] != null)
            {
                m_DataView.Sort = ViewState["ultOrdenacionMaestrosMod"].ToString() + " " + dicOrdenacionMaestrosMod[ViewState["ultOrdenacionMaestrosMod"].ToString()];
            }

            gvMaestros.DataSource = m_DataView;
            gvMaestros.PageIndex = e.NewPageIndex;
            gvMaestros.DataBind();
        }

        protected void gvMaestros_Sorting(object sender, GridViewSortEventArgs e)
        {
            gvMaestros.PageIndex = 0;

            dicOrdenacionMaestrosMod = new Dictionary<string, string>((Dictionary<string, string>)ViewState["dicOrdenacionMaestrosMod"]);
            if (!dicOrdenacionMaestrosMod.ContainsKey(e.SortExpression))
            {
                dicOrdenacionMaestrosMod.Add(e.SortExpression, "ASC");
            }
            else
            {
                if (dicOrdenacionMaestrosMod[e.SortExpression] == "ASC")
                {
                    dicOrdenacionMaestrosMod[e.SortExpression] = "DESC";
                }
                else
                {
                    dicOrdenacionMaestrosMod[e.SortExpression] = "ASC";
                }
            }
            ViewState["dicOrdenacionMaestrosMod"] = dicOrdenacionMaestrosMod;
            ViewState["ultOrdenacionMaestrosMod"] = e.SortExpression;

            if (ViewState["dtMaestrosMod"] != null)
            {
                DataView m_DataView = new DataView((DataTable)ViewState["dtMaestrosMod"]);
                m_DataView.Sort = e.SortExpression + " " + dicOrdenacionMaestrosMod[e.SortExpression];

                gvMaestros.DataSource = m_DataView;
                gvMaestros.DataBind();
            }
        }

        protected void chkAsignar_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;

            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            CheckBox cb = (CheckBox)gvMaestros.Rows[selRowIndex].FindControl(chk.ID);
            GridViewRow row = gvMaestros.Rows[selRowIndex];
            
            String _sIdUser = gvMaestros.DataKeys[selRowIndex].Values[0].ToString();
            String _sIdTeachers = gvMaestros.DataKeys[selRowIndex].Values[1].ToString();
            String _sIdTeachersDetail = gvMaestros.DataKeys[selRowIndex].Values[2].ToString();
            
            if (MaestroResidencia.ValidarExisteAnteproyectosLigados(_sIdTeachersDetail))
            {
                oMensajes.MuestraMensaje(this, "Error", "El maestro ya tiene ligados uno o mas anteproyectos, no se puede retirar.", Mensajes.TipoMensaje.Error);
            }
            else
            {
                MaestroResidencia.ActualizaEstatusMaestrosDetalle(_sIdTeachers, _sIdTeachersDetail, (cb.Checked ? "1" : "0"));

                if (cb.Checked)
                {
                    Generales.InsertaNotificacion(_sIdUser, "Has sido asignado como un maestro encargado de revisar anteproyectos. Haz clic en esta notificación y serás redirigido a seleccionar los anteproyectos de tu interés.", Enums.TipoNotificacion.Hipervinculo.ToString(), "AnteproyectosSeleccionarAdministrador.aspx");
                }
                else
                {
                    Generales.InsertaNotificacion(_sIdUser, "Has sido retirado como maestro encargado de revisar anteproyectos.", Enums.TipoNotificacion.Hipervinculo.ToString(), "Index.aspx");
                }
            }
            
            LlenarMaestrosMod(_sIdTeachers);
            btnBuscar_Click(null, null);
        }

        protected void tboxCantidadHoras_TextChanged(object sender, EventArgs e)
        {
            TextBox tbox = (TextBox)sender;
            int selRowIndex = ((GridViewRow)(((TextBox)sender).Parent.Parent)).RowIndex;
            
            string sIdUser = gvMaestros.DataKeys[selRowIndex].Values[0].ToString();
            string sIdTeachers = gvMaestros.DataKeys[selRowIndex].Values[1].ToString();
            string sIdTeachersDet = gvMaestros.DataKeys[selRowIndex].Values[2].ToString();
            string sHora = tbox.Text;

            try
            {
                if (sHora == "")
                {
                    sHora = "0";
                }

                int iHora = int.Parse(sHora);
                if (MaestroResidencia.ValidarExisteAnteproyectosLigados(sIdTeachersDet))
                {
                    if (iHora >= MaestroResidencia.ObtineNumeroAnteproyectosLigados(sIdTeachersDet))
                    {
                        MaestroResidencia.ActualizaHorasMaestrosDetalle(sIdTeachers, sIdTeachersDet, iHora);
                    }
                    else
                    {
                        oMensajes.MuestraMensaje(this, "Error", "La cantidad de horas asignadas es menor a la catidad de anteproyectos que tiene asignado este maestro.", Mensajes.TipoMensaje.Error);
                    }
                }
                else
                {
                    MaestroResidencia.ActualizaHorasMaestrosDetalle(sIdTeachers, sIdTeachersDet, iHora);
                }

                LlenarMaestrosMod(sIdTeachers);
                btnBuscar_Click(null, null);
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        #endregion

        #region Modal Asignar Anteproyectos
        protected void ibtnCerrarModAA_Click(object sender, ImageClickEventArgs e)
        {
            ViewState["IdTeachersDet"] = null;
            ViewState["IdPeriod"] = null;
            ViewState["Year"] = null;
            ViewState["sIdUserMaestro"] = null;

            modAsignarAnteproyectos.Hide();
        }

        protected void btnBuscarModAA_Click(object sender, EventArgs e)
        {
            LlenarAnteproyectosModAsignar(ViewState["IdTeachersDet"].ToString(), ViewState["IdPeriod"].ToString(), ViewState["Year"].ToString(), tboxNombreModAA.Text, tboxMaestrosAsigModAA.Text);
        }

        protected void gvAnteproyectosModAA_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dicOrdenacionAnteproyectosMod = new Dictionary<string, string>((Dictionary<string, string>)ViewState["dicOrdenacionAnteproyectosMod"]);

            DataView m_DataView = new DataView((DataTable)ViewState["dtAnteproyectosModAsignar"]);
            if (ViewState["ultOrdenacionAnteproyectosMod"] != null)
            {
                m_DataView.Sort = ViewState["ultOrdenacionAnteproyectosMod"].ToString() + " " + dicOrdenacionAnteproyectosMod[ViewState["ultOrdenacionAnteproyectosMod"].ToString()];
            }

            gvAnteproyectosModAA.DataSource = m_DataView;
            gvAnteproyectosModAA.PageIndex = e.NewPageIndex;
            gvAnteproyectosModAA.DataBind();
        }

        protected void gvAnteproyectosModAA_Sorting(object sender, GridViewSortEventArgs e)
        {
            gvAnteproyectosModAA.PageIndex = 0;

            dicOrdenacionAnteproyectosMod = new Dictionary<string, string>((Dictionary<string, string>)ViewState["dicOrdenacionAnteproyectosMod"]);
            if (!dicOrdenacionAnteproyectosMod.ContainsKey(e.SortExpression))
            {
                dicOrdenacionAnteproyectosMod.Add(e.SortExpression, "ASC");
            }
            else
            {
                if (dicOrdenacionAnteproyectosMod[e.SortExpression] == "ASC")
                {
                    dicOrdenacionAnteproyectosMod[e.SortExpression] = "DESC";
                }
                else
                {
                    dicOrdenacionAnteproyectosMod[e.SortExpression] = "ASC";
                }
            }
            ViewState["dicOrdenacionAnteproyectosMod"] = dicOrdenacionAnteproyectosMod;
            ViewState["ultOrdenacionAnteproyectosMod"] = e.SortExpression;

            if (ViewState["dtAnteproyectosModAsignar"] != null)
            {
                DataView m_DataView = new DataView((DataTable)ViewState["dtAnteproyectosModAsignar"]);
                m_DataView.Sort = e.SortExpression + " " + dicOrdenacionAnteproyectosMod[e.SortExpression];

                gvAnteproyectosModAA.DataSource = m_DataView;
                gvAnteproyectosModAA.DataBind();
            }
        }

        protected void chkAsignarAnteproyecto_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;

            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            CheckBox cb = (CheckBox)gvAnteproyectosModAA.Rows[selRowIndex].FindControl(chk.ID);
            GridViewRow row = gvAnteproyectosModAA.Rows[selRowIndex];

            String _sIdPreliminaryDraft = gvAnteproyectosModAA.DataKeys[selRowIndex].Values[0].ToString();
            String _sIdUser = gvAnteproyectosModAA.DataKeys[selRowIndex].Values[2].ToString();
            String _sNombreAnteproyecto = gvAnteproyectosModAA.DataKeys[selRowIndex].Values[3].ToString();

            if (MaestroResidencia.ValidaExisteComentearioJefeCarrera(_sIdPreliminaryDraft) || MaestroResidencia.ValidaExisteComentarioGuardadoMaestros(ViewState["IdTeachersDet"].ToString(), _sIdPreliminaryDraft))
            {
                btnBuscarModAA_Click(null, null);
                btnBuscar_Click(null, null);
                oMensajes.MuestraMensaje(this, "Error", "Este anteproyecto ya fue calificado, no se pueden hacer modificaciones.", Mensajes.TipoMensaje.Error);
                return;
            }

            Anteproyecto oAnteproyecto = new Anteproyecto(_sIdPreliminaryDraft, _sIdUser);

            if (cb.Checked)
            {
                if (!(MaestroResidencia.ObtieneHorasAsignadas(ViewState["IdTeachersDet"].ToString()) > MaestroResidencia.ObtineNumeroAnteproyectosLigados(ViewState["IdTeachersDet"].ToString())))
                {
                    btnBuscarModAA_Click(null, null);
                    btnBuscar_Click(null, null);
                    oMensajes.MuestraMensaje(this, "Error", "Ya no le quedan horas a este maestro para asignarle un anteproyecto.", Mensajes.TipoMensaje.Error);
                    return;
                }

                if (!(MaestroResidencia.ObtieneMaestrosAsignadosAnteproyecto(_sIdPreliminaryDraft) < 3))
                {
                    btnBuscarModAA_Click(null, null);
                    btnBuscar_Click(null, null);
                    oMensajes.MuestraMensaje(this, "Error", "El anteproyecto ya tiene 3 maestros asignados, no puedes seleccionar mas.", Mensajes.TipoMensaje.Error);
                    return;
                }

                MaestroResidencia.InsertaAnteproyectosMaestros(ViewState["IdTeachersDet"].ToString(), _sIdPreliminaryDraft);
                Generales.InsertaNotificacion(ViewState["sIdUserMaestro"].ToString(), "Se te ha asignado el anteproyecto \"" + _sNombreAnteproyecto +  "\". Haz clic en la notificación para ver tus anteproyectos por calificar.", Enums.TipoNotificacion.Hipervinculo.ToString(), "AnteproyectosCalificarAdministrador.aspx");
                /*Condicional para cambiar el estatus de "Revisiones Completas" a "En proceso", debido a que 
                    se agrega un nuevo maestro y se continua el proceso*/
                if (oAnteproyecto.IdTipoEstado == Enums.EstatusAnteproyecto.RevisionesCompletas.ToString())
                {
                    Anteproyecto.ActualizaEstatusAnteproyecto(_sIdPreliminaryDraft, Enums.EstatusAnteproyecto.EnProceso.ToString());
                }
            }
            else
            {
                MaestroResidencia.EliminaAnteproyectosMaestros(ViewState["IdTeachersDet"].ToString(), _sIdPreliminaryDraft);
                Generales.InsertaNotificacion(ViewState["sIdUserMaestro"].ToString(), "Se te ha desasignado el anteproyecto \"" + _sNombreAnteproyecto + "\". Haz clic en la notificación para ver tus anteproyectos por calificar.", Enums.TipoNotificacion.Hipervinculo.ToString(), "AnteproyectosCalificarAdministrador.aspx");

                /*Si el anteproyecto esta "En proceso" y los maestros sobrantes ya calificaron, se cambia el estatus a "Revisiones completas".*/
                if (oAnteproyecto.IdTipoEstado == Enums.EstatusAnteproyecto.EnProceso.ToString())
                {
                    if (Anteproyecto.ObtieneRevisiones(_sIdPreliminaryDraft) == Anteproyecto.ObtieneRevisionesTotales(_sIdPreliminaryDraft))
                    {
                        Anteproyecto.ActualizaEstatusAnteproyecto(_sIdPreliminaryDraft, Enums.EstatusAnteproyecto.RevisionesCompletas.ToString());
                    }
                }
            }

            int iHorasAsignadas = MaestroResidencia.ObtieneHorasAsignadas(ViewState["IdTeachersDet"].ToString()) - MaestroResidencia.ObtineNumeroAnteproyectosLigados(ViewState["IdTeachersDet"].ToString());
                
            lblHorasAsignarAA.Text = "Horas totales por asignar: " + iHorasAsignadas.ToString();

            btnBuscarModAA_Click(null, null);
            btnBuscar_Click(null, null);
        }
        #endregion

        #region Modal Ver Anteproyectos
        protected void ibtnCerrarModVA_Click(object sender, ImageClickEventArgs e)
        {
            modVerAnteproyectos.Hide();
        }
        #endregion

        #endregion

        #region Funcione
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("MaestrosResidenciasAdministrador.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            ibtnRetroceder.ImageUrl = "~//Assets//Imagenes//Principal//FlechaRetroceder.png";
            ibtnRetroceder.Width = 40;
            ibtnRetroceder.CausesValidation = false;

            lblNoEmpleado.Text = oMensajes.TablaMensajes["lblNoEmpleado"];
            lblNombreMaestro.Text = oMensajes.TablaMensajes["lblNombreMaestro"];
            lblProyectosAsignados.Text = oMensajes.TablaMensajes["lblProyectosAsignados"];
            lblPeriodo.Text = oMensajes.TablaMensajes["lblPeriodo"];
            lblAnio.Text = oMensajes.TablaMensajes["lblAnio"];

            ibtnAgregar.ImageUrl = "~//Assets//Imagenes//Principal//Agregar.png";
            ibtnAgregar.CausesValidation = false;
            ibtnAgregar.ToolTip = oMensajes.TablaMensajes["ibtnAgregar"];

            gvMaestrosResidencia.HeaderStyle.Wrap = true;
            gvMaestrosResidencia.RowStyle.Wrap = true;
            gvMaestrosResidencia.EmptyDataText = "No se encontraron resgistros";
            gvMaestrosResidencia.Columns[0].Visible = false;
            gvMaestrosResidencia.Columns[1].Visible = false;
            gvMaestrosResidencia.Columns[2].Visible = false;
            gvMaestrosResidencia.Columns[3].Visible = false;
            gvMaestrosResidencia.Columns[4].Visible = false;
            gvMaestrosResidencia.Columns[5].Visible = false;
            gvMaestrosResidencia.Columns[6].HeaderText = oMensajes.TablaMensajes["gvMaestrosResidencia_NoControl"];
            gvMaestrosResidencia.Columns[7].HeaderText = oMensajes.TablaMensajes["gvMaestrosResidencia_NombreMaestro"];
            gvMaestrosResidencia.Columns[8].HeaderText = oMensajes.TablaMensajes["gvMaestrosResidencia_Email"];
            gvMaestrosResidencia.Columns[9].HeaderText = oMensajes.TablaMensajes["gvMaestrosResidencia_ProyectosAsignados"];
            gvMaestrosResidencia.Columns[10].HeaderText = oMensajes.TablaMensajes["gvMaestrosResidencia_HorasAsignadas"];
            gvMaestrosResidencia.Columns[11].HeaderText = oMensajes.TablaMensajes["gvMaestrosResidencia_Periodo"];
            gvMaestrosResidencia.Columns[12].HeaderText = oMensajes.TablaMensajes["gvMaestrosResidencia_Opciones"];

            for (int i = 0; i < gvMaestrosResidencia.Columns.Count; i++)
            {
                gvMaestrosResidencia.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvMaestrosResidencia.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }

            btnDescargar.Text = oMensajes.TablaMensajes["btnDescargar"];
            btnDescargar.ForeColor = System.Drawing.Color.White;
            btnDescargar.Font.Bold = true;
            btnDescargar.CausesValidation = false;

            #region Modal Asignar Maestros
            lblDescripcionModuloMod.Text = oMensajes.TablaMensajes["lblDescripcionModuloMod"];

            ibtnCerrarMod.ImageUrl = "~//Assets//Imagenes//Principal//Cerrar Negro.png";
            ibtnCerrarMod.Width = 30;
            ibtnCerrarMod.CausesValidation = false;
            ibtnCerrarMod.ToolTip = oMensajes.TablaMensajes["ibtnCerrarMod"];

            lblPeriodoMod.Text = oMensajes.TablaMensajes["lblPeriodoMod"];
            rfvPeriodoMod.Text = "Campo Obligatorio";

            lblAnioMod.Text = oMensajes.TablaMensajes["lblAnioMod"];
            rfvAnioMod.Text = "Campo Obligatorio";

            btnCargarMod.Text = oMensajes.TablaMensajes["btnCargarMod"];
            btnCargarMod.ForeColor = System.Drawing.Color.White;
            btnCargarMod.Font.Bold = true;

            gvMaestros.HeaderStyle.Wrap = true;
            gvMaestros.RowStyle.Wrap = true;
            gvMaestros.EmptyDataText = "No se encontraron resgistros";
            gvMaestros.Columns[0].Visible = false;
            gvMaestros.Columns[1].Visible = false;
            gvMaestros.Columns[2].Visible = false;
            gvMaestros.Columns[3].Visible = false;
            gvMaestros.Columns[4].Visible = false;
            gvMaestros.Columns[5].HeaderText = oMensajes.TablaMensajes["gvMaestros_NoControl"];
            gvMaestros.Columns[6].HeaderText = oMensajes.TablaMensajes["gvMaestros_NombreMaestro"];
            gvMaestros.Columns[7].Visible = false;
            gvMaestros.Columns[8].HeaderText = oMensajes.TablaMensajes["gvMaestros_Asignar"];
            gvMaestros.Columns[9].HeaderText = oMensajes.TablaMensajes["gvMaestros_Horas"];

            for (int i = 0; i < gvMaestros.Columns.Count; i++)
            {
                gvMaestros.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvMaestros.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }
            #endregion

            #region Modal Asignar Anteproyectos
            lblDescripcionModuloModAA.Text = oMensajes.TablaMensajes["lblDescripcionModuloModAA"];
            
            ibtnCerrarModAA.ImageUrl = "~//Assets//Imagenes//Principal//Cerrar Negro.png";
            ibtnCerrarModAA.Width = 30;
            ibtnCerrarModAA.CausesValidation = false;
            ibtnCerrarModAA.ToolTip = oMensajes.TablaMensajes["ibtnCerrarModAA"];

            lblNombreModAA.Text = oMensajes.TablaMensajes["lblNombreModAA"];
            lblMaestrosAsigModAA.Text = oMensajes.TablaMensajes["lblMaestrosAsigModAA"];
            
            gvAnteproyectosModAA.HeaderStyle.Wrap = true;
            gvAnteproyectosModAA.RowStyle.Wrap = true;
            gvAnteproyectosModAA.EmptyDataText = "No se encontraron resgistros";
            gvAnteproyectosModAA.Columns[0].Visible = false;
            gvAnteproyectosModAA.Columns[1].Visible = false;
            gvAnteproyectosModAA.Columns[2].HeaderText = oMensajes.TablaMensajes["gvAnteproyectosModAA_NombreAbteproyecto"];
            gvAnteproyectosModAA.Columns[3].HeaderText = oMensajes.TablaMensajes["gvAnteproyectosModAA_MaestrosAsignados"];
            gvAnteproyectosModAA.Columns[4].HeaderText = oMensajes.TablaMensajes["gvAnteproyectosModAA_AsignaranteProyectos"];

            for (int i = 0; i < gvAnteproyectosModAA.Columns.Count; i++)
            {
                gvAnteproyectosModAA.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvAnteproyectosModAA.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }
            #endregion

            #region Modal Ver Anteproyectos
            lblDescripcionModuloModVA.Text = oMensajes.TablaMensajes["lblDescripcionModuloModVA"];

            ibtnCerrarModVA.ImageUrl = "~//Assets//Imagenes//Principal//Cerrar Negro.png";
            ibtnCerrarModVA.Width = 30;
            ibtnCerrarModVA.CausesValidation = false;
            ibtnCerrarModVA.ToolTip = oMensajes.TablaMensajes["ibtnCerrarModVA"];

            gvAnteproyectosModVA.HeaderStyle.Wrap = true;
            gvAnteproyectosModVA.RowStyle.Wrap = true;
            gvAnteproyectosModVA.EmptyDataText = "No se encontraron resgistros";
            gvAnteproyectosModVA.Columns[0].Visible = false;
            gvAnteproyectosModVA.Columns[1].Visible = false;
            gvAnteproyectosModVA.Columns[2].Visible = false;
            gvAnteproyectosModVA.Columns[3].HeaderText = oMensajes.TablaMensajes["gvAnteproyectosModVA_NombreAnteproyecto"];
            gvAnteproyectosModVA.Columns[4].HeaderText = oMensajes.TablaMensajes["gvAnteproyectosModVA_Calificacion"];

            for (int i = 0; i < gvAnteproyectosModVA.Columns.Count; i++)
            {
                gvAnteproyectosModVA.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvAnteproyectosModVA.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }
            #endregion
        }

        private void ConfiguraGrids()
        {
            gvMaestrosResidencia.Columns[6].ControlStyle.Width = 120; //No. Empleado
            gvMaestrosResidencia.Columns[7].ControlStyle.Width = 200; //Nombre maestro
            gvMaestrosResidencia.Columns[8].ControlStyle.Width = 230; //Email
            gvMaestrosResidencia.Columns[9].ControlStyle.Width = 100; //Proyectos asignados
            gvMaestrosResidencia.Columns[10].ControlStyle.Width = 80; //Horas
            gvMaestrosResidencia.Columns[11].ControlStyle.Width = 150; //Periodo

            gvMaestros.Columns[5].ControlStyle.Width = 130;
            gvMaestros.Columns[6].ControlStyle.Width = 400;
            gvMaestros.Columns[8].ControlStyle.Width = 60;
            gvMaestros.Columns[9].ControlStyle.Width = 100;

            gvAnteproyectosModAA.Columns[2].ControlStyle.Width = 500;
            gvAnteproyectosModAA.Columns[3].ControlStyle.Width = 100;
            gvAnteproyectosModAA.Columns[4].ControlStyle.Width = 70;

            gvAnteproyectosModVA.Columns[3].ControlStyle.Width =500;
            gvAnteproyectosModVA.Columns[4].ControlStyle.Width =200;
        }

        private void LlenarCombos()
        {
            cboxPeriodo.DataTextField = "Name";
            cboxPeriodo.DataValueField = "IdValueDetail";
            cboxPeriodo.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Periodo");
            cboxPeriodo.DataBind();
            cboxPeriodo.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxPeriodo.SelectedIndex = 0;

            cboxPeriodoMod.DataTextField = "Name";
            cboxPeriodoMod.DataValueField = "IdValueDetail";
            cboxPeriodoMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Periodo");
            cboxPeriodoMod.DataBind();
            cboxPeriodoMod.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxPeriodoMod.SelectedIndex = 0;
        }

        private void LlenarMaestrosResidencia(String _sNoEmpleado="", String _sNombreMaestro="", String _sProyectosAsignados="", String _sIdPeriod="", String _sYear="")
        {
            DataTable dtMaestrosResidencia = MaestroResidencia.ObtieneMaestrosEncargadosResidencia(_sNoEmpleado, _sNombreMaestro, _sProyectosAsignados, _sIdPeriod, _sYear);
            ViewState["dtMaestrosResidencia"] = dtMaestrosResidencia;

            gvMaestrosResidencia.DataSource = dtMaestrosResidencia;
            gvMaestrosResidencia.DataBind();

            ViewState["dicOrdenacion"] = dicOrdenacion;
        }

        private void LlenarMaestrosMod(String _sIdTeachers)
        {
            DataTable dtMaestrosMod = MaestroResidencia.ObtieneMaestros(_sIdTeachers);
            ViewState["dtMaestrosMod"] = dtMaestrosMod;

            gvMaestros.DataSource = dtMaestrosMod;
            gvMaestros.DataBind();

            ViewState["dicOrdenacionMaestrosMod"] = dicOrdenacionMaestrosMod;
        }

        private void LimpiarModalAsiganrMaestros()
        {
            cboxPeriodoMod.SelectedIndex = -1;
            tboxAnioMod.Text = "";

            divTablaMaestrosMod.Visible = false;
            gvMaestros.DataSource = null;
            gvMaestros.DataBind();
        }

        private void LlenarAnteproyectosModAsignar(String _sIdTeachersDet, String _sIdPeriod, String _sYear, String _sNombreAnteproyecto="", String _sMaestrosAsignados="")
        {
            DataTable dtAnteproyectosModAsignar = MaestroResidencia.ObtieneAnteproyectosMaestros(_sIdTeachersDet, _sIdPeriod, _sYear, _sNombreAnteproyecto, _sMaestrosAsignados);
            ViewState["dtAnteproyectosModAsignar"] = dtAnteproyectosModAsignar;

            gvAnteproyectosModAA.DataSource = dtAnteproyectosModAsignar;
            gvAnteproyectosModAA.DataBind();

            ViewState["dicOrdenacionAnteproyectosMod"] = dicOrdenacionAnteproyectosMod;
        }

        private void LlenarAnteproyectosModVer(String _sIdTeachers, String _sIdTeachersDet)
        {
            DataTable dtAnteproyectosVerMod = MaestroResidencia.ObtieneAnteproyectosLigadosVer(_sIdTeachers, _sIdTeachersDet);

            gvAnteproyectosModVA.DataSource = dtAnteproyectosVerMod;
            gvAnteproyectosModVA.DataBind();
        }

        private void GeneraExcel(DataTable _dtDatos)
        {
            oMensajes.RecuperarTablaMensajes("MaestrosResidenciasAdministrador.aspx");

            ExcelPackage ep = new ExcelPackage();
            ep.Workbook.Worksheets.Add("Hoja 1");
            ExcelWorksheet ew = ep.Workbook.Worksheets[0];

            //Titulo
            String sNombreReporte = oMensajes.TablaMensajes["lblTitulo"];
            ew.Cells["A1"].Value = sNombreReporte;
            ew.Cells["A1:H1"].Merge = true;
            ew.Cells["A1"].Style.Font.Bold = true;
            ew.Cells["A1"].Style.Font.Size = 16;
            ew.Cells["A1"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;

            //Encabezados
            Color cFondoTitulo = System.Drawing.ColorTranslator.FromHtml("#003A63");
            Color cLetraTitulo = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");

            ew.Cells["A3"].Value = oMensajes.TablaMensajes["gvMaestrosResidencia_NoControl"];
            ew.Cells["A3"].Style.Font.Bold = true;
            ew.Cells["A3:H3"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
            ew.Cells["A3:H3"].Style.Fill.BackgroundColor.SetColor(cFondoTitulo);
            ew.Cells["A3:H3"].Style.Font.Bold = true;
            ew.Cells["A3:H3"].Style.Font.Size = 13;
            ew.Cells["A3:H3"].Style.Font.Color.SetColor(cLetraTitulo);
            ew.Cells["A3:H3"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;

            ew.Cells["B3"].Value = oMensajes.TablaMensajes["gvMaestrosResidencia_NombreMaestro"];
            ew.Cells["C3"].Value = oMensajes.TablaMensajes["gvMaestrosResidencia_Email"];
            ew.Cells["D3"].Value = oMensajes.TablaMensajes["gvMaestrosResidencia_ProyectosAsignados"];
            ew.Cells["E3"].Value = oMensajes.TablaMensajes["gvMaestrosResidencia_HorasAsignadas"];
            ew.Cells["F3"].Value = oMensajes.TablaMensajes["gvMaestrosResidencia_Periodo"];

            ew.Cells["G3"].Value = oMensajes.TablaMensajes["gvAnteproyectosModVA_NombreAnteproyecto"];
            ew.Cells["H3"].Value = oMensajes.TablaMensajes["gvAnteproyectosModVA_Calificacion"];

            //Detalle            
            int i = 4;
            foreach (DataRow dr in _dtDatos.Rows)
            {
                ew.Cells["A" + i.ToString()].Value = dr["NoControl"];
                ew.Cells["B" + i.ToString()].Value = dr["NombreMaestro"];
                ew.Cells["C" + i.ToString()].Value = dr["Email"];
                ew.Cells["D" + i.ToString()].Value = dr["ProyectosAsignados"];
                ew.Cells["E" + i.ToString()].Value = dr["HorasAsignadas"];
                ew.Cells["F" + i.ToString()].Value = dr["Periodo"];

                i++;

                DataTable dtAnteproyectosLigados = MaestroResidencia.ObtieneAnteproyectosLigadosVer(dr["IdTeachers"].ToString(), dr["IdTeachersDet"].ToString());
                foreach(DataRow drA in dtAnteproyectosLigados.Rows)
                {
                    ew.Cells["G" + i.ToString()].Value = drA["NombreAnteproyecto"];
                    ew.Cells["H" + i.ToString()].Value = drA["Calificacion"];
                    i++;
                }

            }
            ew.Cells[ew.Dimension.Address].AutoFitColumns();

            String sNombreArchivo = sNombreReporte + "(" + DateTime.Now.ToString("yyyy-MM-ddThh-mm-ss") + ").xlsx";
            String sCarpeta = System.AppDomain.CurrentDomain.BaseDirectory + "\\Reportes";
            String sPathReporte = sCarpeta + "\\" + sNombreArchivo;

            if (!Directory.Exists(sCarpeta))
            {
                Directory.CreateDirectory(sCarpeta);
            }

            ep.SaveAs(new FileInfo(sPathReporte));
            ep.Dispose();

            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AppendHeader("Content-Disposition", string.Format("attachment; filename={0}", sNombreArchivo));
            Response.TransmitFile(Server.MapPath("~/Reportes/" + sNombreArchivo));
            Response.End();
        }
        #endregion
    }
}