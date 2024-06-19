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
    public partial class AnteproyectosAdministrador : System.Web.UI.Page
    {
        #region Variables
        private Mensajes oMensajes = new Mensajes();
        private Dictionary<string, string> dicOrdenacion = new Dictionary<string, string>();
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
                        LlenarAnteproyectos("", "");

                        /*Al momento de seleccionar un periodo en cualquier seccion administradora se guarda e esta variable de session,
                         esto con el fin de no estar marcando el periodo y anio en cada momento.*/
                        if (Session["IdPeriodo"] != null)
                        {
                            cboxPeriodo.SelectedValue = Session["IdPeriodo"].ToString();
                            tboxAnio.Text = Session["Anio"].ToString();

                            cboxPeriodo_SelectedIndexChanged(null, null);
                        }

                        /*Esta variable de Session funciona como un auxiliar para saber la vista en la cual estamos, esto con el fin de
                         poder navegar mejor en la pagina*/
                        if (Session["VieneDeVista"] != null)
                        {
                            Session["VieneDeVista"] = null;
                        }
                    }
                    ConfiguraGrid();
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

        protected void cboxPeriodo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(cboxPeriodo.SelectedValue != "" && tboxAnio.Text != "")
            {
                LimpiarFiltro();
                divTabla.Visible = true;
                divSinRegistros.Visible = false;
                lblPeriodoDes.Text = cboxPeriodo.SelectedItem.Text + " " + tboxAnio.Text;

                LlenarAnteproyectos(cboxPeriodo.SelectedValue, tboxAnio.Text);

                Session["IdPeriodo"] = cboxPeriodo.SelectedValue;
                Session["Anio"] = tboxAnio.Text;

                ScriptManager.RegisterStartupScript(this, GetType(), "Script1", "ScrollTab();", true);
            }
            else
            {
                divTabla.Visible = false;
                divSinRegistros.Visible = true;
                lblPeriodoDes.Text = "";
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            LlenarAnteproyectos(cboxPeriodo.SelectedValue, tboxAnio.Text, tboxNoControl.Text, tboxAlumno.Text, tboxNombreProyecto.Text, tboxEmpresa.Text, cboxEstatus.SelectedValue);
        }

        protected void btnNotificarTodos_Click(object sender, EventArgs e)
        {
            if (!(Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString()))
            {
                oMensajes.MuestraMensaje(this.Page, "Error", "No tienes los permisos para esta opcion", Mensajes.TipoMensaje.Error);
                return;
            }

            if (cboxPeriodo.SelectedValue != "" && tboxAnio.Text != "")
            {
                String sError = "";
                DataTable dtAnteproyectos = Anteproyecto.ObtieneAnteproyectosAdministrador(cboxPeriodo.SelectedValue, tboxAnio.Text, "", "", "", "", "5");
                
                if(dtAnteproyectos.Rows.Count != 0)
                {
                    foreach (DataRow dr in dtAnteproyectos.Rows)
                    {
                        switch (Anteproyecto.ObtieneEstatusCalificadoJefeCarrera(dr["IdPreliminaryDraft"].ToString()))
                        {
                            case 2:
                                Anteproyecto.ActualizaEstatusAnteproyecto(dr["IdPreliminaryDraft"].ToString(), Enums.EstatusAnteproyecto.Aprobado.ToString());
                                Generales.InsertaNotificacion(dr["IdUser"].ToString(), "¡Felicidades! Tu anteproyecto ha sido aprobado. Ya estás listo para continuar con tu residencia. Espera futuras indicaciones.", Enums.TipoNotificacion.Hipervinculo.ToString(), "Anteproyectos.aspx");
                                break;
                            case 3:
                                Anteproyecto.ActualizaEstatusAnteproyecto(dr["IdPreliminaryDraft"].ToString(), Enums.EstatusAnteproyecto.AprobadoConComentarios.ToString());
                                Generales.InsertaNotificacion(dr["IdUser"].ToString(), "Tu anteproyecto ha sido aprobado, pero con comentarios. Revisa los comentarios que te hicieron para mejorar el desarrollo de tu residencia.", Enums.TipoNotificacion.Hipervinculo.ToString(), "Anteproyectos.aspx");
                                break;
                            case 4:
                                Anteproyecto.ActualizaEstatusAnteproyecto(dr["IdPreliminaryDraft"].ToString(), Enums.EstatusAnteproyecto.NoAprobado.ToString());
                                Generales.InsertaNotificacion(dr["IdUser"].ToString(), "Tu anteproyecto no ha sido aprobado. Revisa el comentario que te hicieron y crea un nuevo anteproyecto para que sea revisado nuevamente.", Enums.TipoNotificacion.Hipervinculo.ToString(), "Anteproyectos.aspx");
                                break;
                            default:
                                if (sError == "")
                                {
                                    sError = dr["Alumno"].ToString();
                                }
                                else
                                {
                                    sError = sError + ", " + dr["Alumno"].ToString();
                                }
                                break;
                        }
                    }
                    if (sError != "")
                    {
                        oMensajes.MuestraMensaje(this, "Error", "Hubo un error con el alumno(s) \"" + sError + "\". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
                    }
                    else
                    {
                        oMensajes.MuestraMensaje(this, "Correcto", "Todos los alumnos a los que ya se les califico su anteproyecto fueron notificados con exito.", Mensajes.TipoMensaje.Correcto);
                    }

                    LlenarAnteproyectos(cboxPeriodo.SelectedValue, tboxAnio.Text);
                }
                else
                {
                    oMensajes.MuestraMensaje(this, "Informacion", "No existen alumnos que notificar, califique los anteproyectos para poder notificarlos.", Mensajes.TipoMensaje.Informacion);
                }
            }
        }

        protected void gvAnteproyectos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dicOrdenacion = new Dictionary<string, string>((Dictionary<string, string>)ViewState["dicOrdenacion"]);

            DataView m_DataView = new DataView((DataTable)ViewState["dtAnteproyectos"]);
            if (ViewState["ultOrdenacion"] != null)
            {
                m_DataView.Sort = ViewState["ultOrdenacion"].ToString() + " " + dicOrdenacion[ViewState["ultOrdenacion"].ToString()];
            }

            gvAnteproyectos.DataSource = m_DataView;
            gvAnteproyectos.PageIndex = e.NewPageIndex;
            gvAnteproyectos.DataBind();
        }

        protected void gvAnteproyectos_Sorting(object sender, GridViewSortEventArgs e)
        {
            gvAnteproyectos.PageIndex = 0;

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

            if (ViewState["dtAnteproyectos"] != null)
            {
                DataView m_DataView = new DataView((DataTable)ViewState["dtAnteproyectos"]);
                m_DataView.Sort = e.SortExpression + " " + dicOrdenacion[e.SortExpression];

                gvAnteproyectos.DataSource = m_DataView;
                gvAnteproyectos.DataBind();
            }
        }

        protected void gvAnteproyectos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[32].ColumnSpan = 4;
                e.Row.Cells.RemoveAt(33);
                e.Row.Cells.RemoveAt(33);
                e.Row.Cells.RemoveAt(33);
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                String _sIdTypeState = gvAnteproyectos.DataKeys[e.Row.RowIndex].Values[3].ToString();

                ImageButton ibtnDesFicha = (ImageButton)e.Row.Cells[31].Controls[1];
                ibtnDesFicha.ID = "ibtnDesFicha";
                ibtnDesFicha.CommandName = "ibtnDesFicha";
                ibtnDesFicha.ImageUrl = "~//Assets//Imagenes//Principal//Archivos.png";

                Button btnEvaluadores = (Button)e.Row.Cells[32].Controls[0];
                btnEvaluadores.ID = "btnEvaluadores";
                btnEvaluadores.CommandName = "btnEvaluadores";
                btnEvaluadores.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnEvaluadores.Text = "Evaluadores";
                btnEvaluadores.ForeColor = System.Drawing.Color.White;
                btnEvaluadores.Font.Bold = true;

                Button btnComentar = (Button)e.Row.Cells[33].Controls[0];
                btnComentar.ID = "btnComentar";
                btnComentar.CommandName = "btnComentar";
                btnComentar.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnComentar.Text = "Comentar";
                btnComentar.ForeColor = System.Drawing.Color.White;
                btnComentar.Font.Bold = true;

                if (_sIdTypeState == Enums.EstatusAnteproyecto.Aprobado.ToString() || _sIdTypeState == Enums.EstatusAnteproyecto.AprobadoConComentarios.ToString() ||
                    _sIdTypeState == Enums.EstatusAnteproyecto.NoAprobado.ToString())
                {
                    btnComentar.Visible = false;
                }

                Button btnVerComentarios = (Button)e.Row.Cells[34].Controls[0];
                btnVerComentarios.ID = "btnVerComentarios";
                btnVerComentarios.CommandName = "btnVerComentarios";
                btnVerComentarios.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnVerComentarios.Text = "Ver con comentarios";
                btnVerComentarios.ForeColor = System.Drawing.Color.White;
                btnVerComentarios.Font.Bold = true;

                Button btnNotificar = (Button)e.Row.Cells[35].Controls[0];
                btnNotificar.ID = "btnNotificar";
                btnNotificar.CommandName = "btnNotificar";
                btnNotificar.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnNotificar.Text = "Notificar al alumno";
                btnNotificar.ForeColor = System.Drawing.Color.White;
                btnNotificar.Font.Bold = true;

                if(_sIdTypeState != Enums.EstatusAnteproyecto.Calificado.ToString())
                {
                    btnNotificar.Visible = false;
                }
            }
        }

        protected void gvAnteproyectos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "ibtnDesFicha")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvAnteproyectos.Rows[index];

                    String _sIdPreliminaryDraft = gvAnteproyectos.DataKeys[index].Values[0].ToString();
                    String _sidUser = gvAnteproyectos.DataKeys[index].Values[1].ToString();
                    String _sidTeachers = gvAnteproyectos.DataKeys[index].Values[2].ToString();
                    String _sidTypeState = gvAnteproyectos.DataKeys[index].Values[3].ToString();

                    Usuario oUsuario = new Usuario(_sidUser);

                    String sPathPlantilla = System.AppDomain.CurrentDomain.BaseDirectory + "\\Plantillas\\Anteproyectos\\Plantilla_Anteproyecto.docx";
                    String sNombreArchivo = oUsuario.Nombre + " " + oUsuario.ApellidoPaterno + " " + oUsuario.ApellidoMaterno + "(" + DateTime.Now.ToString("yyyy-MM-ddThh-mm-ss") + ").docx";
                    String sPathCarpeta = Server.MapPath("~/Plantillas/Anteproyectos/");
                    String sPathDescarga = Path.Combine(sPathCarpeta, sNombreArchivo);

                    if (File.Exists(sPathPlantilla))
                    {
                        File.Copy(sPathPlantilla, sPathDescarga, overwrite: true);

                        DescargarDocumento.GenerarWordAnteproyecto(_sIdPreliminaryDraft, _sidUser, sPathDescarga);

                        if (File.Exists(sPathDescarga))
                        {
                            Response.Redirect("Download.aspx?filename=" + sNombreArchivo + "|" + sPathDescarga);
                        }
                        else
                        {
                            oMensajes.MuestraMensaje(this, "Error", "El archivo que deseas descargar no existe.", Mensajes.TipoMensaje.Error);
                        }
                    }
                    else
                    {
                        oMensajes.MuestraMensaje(this, "Error", "No existe ninguna plantilla, favor de comunicarse con su jefe de carrera.", Mensajes.TipoMensaje.Error);
                    }
                }
                else if (e.CommandName == "btnEvaluadores")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvAnteproyectos.Rows[index];

                    String _sIdPreliminaryDraft = gvAnteproyectos.DataKeys[index].Values[0].ToString();
                    String _sidUser = gvAnteproyectos.DataKeys[index].Values[1].ToString();
                    String _sidTeachers = gvAnteproyectos.DataKeys[index].Values[2].ToString();
                    String _sidTypeState = gvAnteproyectos.DataKeys[index].Values[3].ToString();

                    LlenarEvaluadores(_sidTeachers, _sIdPreliminaryDraft);
                    ConfiguraGridEvaluadores();
                    modEvaluadores.Show();

                }
                else if (e.CommandName == "btnComentar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvAnteproyectos.Rows[index];

                    String _sIdPreliminaryDraft = gvAnteproyectos.DataKeys[index].Values[0].ToString();
                    String _sidUser = gvAnteproyectos.DataKeys[index].Values[1].ToString();
                    String _sidTeachers = gvAnteproyectos.DataKeys[index].Values[2].ToString();
                    String _sidTypeState = gvAnteproyectos.DataKeys[index].Values[3].ToString();

                    if (!(Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString()))
                    {
                        oMensajes.MuestraMensaje(this.Page, "Error", "No tienes los permisos para esta opcion", Mensajes.TipoMensaje.Error);
                        return;
                    }

                    Session["VieneDeVista"] = "AnteproyectosAdministrador.aspx";
                    Session["sAnteproyectoCalificar"] = _sIdPreliminaryDraft + "|" + _sidUser + "|Revision|" + _sidTeachers;
                    Response.Redirect("AnteproyectoResidenciaCalificar.aspx");
                }
                else if (e.CommandName == "btnVerComentarios")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvAnteproyectos.Rows[index];

                    String _sIdPreliminaryDraft = gvAnteproyectos.DataKeys[index].Values[0].ToString();
                    String _sidUser = gvAnteproyectos.DataKeys[index].Values[1].ToString();
                    String _sidTeachers = gvAnteproyectos.DataKeys[index].Values[2].ToString();
                    String _sidTypeState = gvAnteproyectos.DataKeys[index].Values[3].ToString();

                    Session["VieneDeVista"] = "AnteproyectosAdministrador.aspx";
                    Session["sAnteproyectoCalificar"] = _sIdPreliminaryDraft + "|" + _sidUser + "|VerConComentarios|" + _sidTeachers;
                    Response.Redirect("AnteproyectoResidenciaCalificar.aspx");

                }
                else if (e.CommandName == "btnNotificar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvAnteproyectos.Rows[index];

                    String _sIdPreliminaryDraft = gvAnteproyectos.DataKeys[index].Values[0].ToString();
                    String _sidUser = gvAnteproyectos.DataKeys[index].Values[1].ToString();
                    String _sidTeachers = gvAnteproyectos.DataKeys[index].Values[2].ToString();
                    String _sidTypeState = gvAnteproyectos.DataKeys[index].Values[3].ToString();

                    if (!(Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString()))
                    {
                        oMensajes.MuestraMensaje(this.Page, "Error", "No tienes los permisos para esta opcion", Mensajes.TipoMensaje.Error);
                        return;
                    }

                    switch (Anteproyecto.ObtieneEstatusCalificadoJefeCarrera(_sIdPreliminaryDraft))
                    {
                        case 2:
                            Anteproyecto.ActualizaEstatusAnteproyecto(_sIdPreliminaryDraft, Enums.EstatusAnteproyecto.Aprobado.ToString());
                            Generales.InsertaNotificacion(_sidUser, "¡Felicidades! Tu anteproyecto ha sido aprobado. Ya estás listo para continuar con tu residencia. Espera futuras indicaciones.", Enums.TipoNotificacion.Hipervinculo.ToString(), "Anteproyectos.aspx");
                            oMensajes.MuestraMensaje(this, "Correcto", "Se le notifico al alumno correctamente, se califico como \"Aprobado\".", Mensajes.TipoMensaje.Correcto);
                            break;
                        case 3:
                            Anteproyecto.ActualizaEstatusAnteproyecto(_sIdPreliminaryDraft, Enums.EstatusAnteproyecto.AprobadoConComentarios.ToString());
                            Generales.InsertaNotificacion(_sidUser, "Tu anteproyecto ha sido aprobado, pero con comentarios. Revisa los comentarios que te hicieron para mejorar el desarrollo de tu residencia.", Enums.TipoNotificacion.Hipervinculo.ToString(), "Anteproyectos.aspx");
                            oMensajes.MuestraMensaje(this, "Correcto", "Se le notifico al alumno correctamente, se califico como \"Aprobado con comentarios\".", Mensajes.TipoMensaje.Correcto);
                            break;
                        case 4:
                            Anteproyecto.ActualizaEstatusAnteproyecto(_sIdPreliminaryDraft, Enums.EstatusAnteproyecto.NoAprobado.ToString());
                            Generales.InsertaNotificacion(_sidUser, "Tu anteproyecto no ha sido aprobado. Revisa el comentario que te hicieron y crea un nuevo anteproyecto para que sea revisado nuevamente.", Enums.TipoNotificacion.Hipervinculo.ToString(), "Anteproyectos.aspx");
                            oMensajes.MuestraMensaje(this, "Correcto", "Se le notifico al alumno correctamente, se califico como \"No Aprobado\".", Mensajes.TipoMensaje.Correcto);
                            break;
                        default:
                            oMensajes.MuestraMensaje(this, "Error", "Error al momento de notificar al alumno, revisa que la calificacion final se haya guardado correctamente. Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
                            break;
                    }

                    cboxPeriodo_SelectedIndexChanged(null, null);
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        protected void btnDescargar_Click(object sender, EventArgs e)
        {
            DataTable dtDatos = (DataTable)ViewState["dtAnteproyectos"];

            if (dtDatos.Rows.Count > 0)
            {
                GeneraExcel(dtDatos);
            }
            else
            {
                oMensajes.MuestraMensaje(this, "Info", "No exite información para descargar", Mensajes.TipoMensaje.Informacion);
            }
        }

        #region Modal Evaluadores
        protected void ibtnCerrarMod_Click(object sender, ImageClickEventArgs e)
        {
            modEvaluadores.Hide();
        }
        #endregion

        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("AnteproyectosAdministrador.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            ibtnRetroceder.ImageUrl = "~//Assets//Imagenes//Principal//FlechaRetroceder.png";
            ibtnRetroceder.Width = 40;
            ibtnRetroceder.CausesValidation = false;

            lblPeriodo.Text = oMensajes.TablaMensajes["lblPeriodo"];
            lblAnio.Text = oMensajes.TablaMensajes["lblAnio"];

            divTabla.Visible = false;
            divSinRegistros.Visible = true;

            lblSinRegistros.Text = oMensajes.TablaMensajes["lblSinRegistros"];

            lblNoControl.Text = oMensajes.TablaMensajes["lblNoControl"];
            lblNombre.Text = oMensajes.TablaMensajes["lblAlumno"];
            lblNombreProyecto.Text = oMensajes.TablaMensajes["lblNombreProyecto"];
            lblEmpresa.Text = oMensajes.TablaMensajes["lblEmpresa"];
            lblEstatus.Text = oMensajes.TablaMensajes["lblEstatus"];

            btnBuscar.Text = oMensajes.TablaMensajes["btnBuscar"];
            btnBuscar.CausesValidation = false;

            btnNotificarTodos.Text = "Notificar a todos";
            btnNotificarTodos.ForeColor = System.Drawing.Color.White;
            btnNotificarTodos.Font.Bold = true;
            btnNotificarTodos.CausesValidation = false;

            gvAnteproyectos.HeaderStyle.Wrap = true;
            gvAnteproyectos.RowStyle.Wrap = true;
            gvAnteproyectos.EmptyDataText = "No se encontraron resgistros";
            gvAnteproyectos.Columns[0].Visible = false; //IdPreliminaryDraft
            gvAnteproyectos.Columns[1].Visible = false; //IdUser
            gvAnteproyectos.Columns[2].Visible = false; //IdTeachers
            gvAnteproyectos.Columns[3].Visible = false; //IdTypeState
            gvAnteproyectos.Columns[4].Visible = false; //ObjetivoProyecto
            gvAnteproyectos.Columns[5].Visible = false; //Justificacion
            gvAnteproyectos.Columns[6].Visible = false; //AlcanceProyecto
            gvAnteproyectos.Columns[7].Visible = false; //LocacionProyecto
            gvAnteproyectos.Columns[8].Visible = false; //GiroEmpresa
            gvAnteproyectos.Columns[9].Visible = false; //DepartamentoEmpresa
            gvAnteproyectos.Columns[10].Visible = false; //TelefonoEmpresa
            gvAnteproyectos.Columns[11].Visible = false; //DirectorEmpresa
            gvAnteproyectos.Columns[12].Visible = false; //JefeDeArea
            gvAnteproyectos.Columns[13].Visible = false; //CalleEmpresa
            gvAnteproyectos.Columns[14].Visible = false; //NumeroExterior
            gvAnteproyectos.Columns[15].Visible = false; //NumeroInterior
            gvAnteproyectos.Columns[16].Visible = false; //ColoniaEmpresa
            gvAnteproyectos.Columns[17].Visible = false; //CiudadEmpresa
            gvAnteproyectos.Columns[18].Visible = false; //MunicipioEmpresa
            gvAnteproyectos.Columns[19].Visible = false; //EstadoEmpresa
            gvAnteproyectos.Columns[20].Visible = false; //CodigoPostalEmpresa
            gvAnteproyectos.Columns[21].Visible = false; //Carrera
            gvAnteproyectos.Columns[22].Visible = false; //TelefonoUsuario
            gvAnteproyectos.Columns[23].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_NoControl"];
            gvAnteproyectos.Columns[24].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_Alumno"];
            gvAnteproyectos.Columns[25].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_Email"];
            gvAnteproyectos.Columns[26].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_NombreProyecto"];
            gvAnteproyectos.Columns[27].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_Empresa"];
            gvAnteproyectos.Columns[28].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_Periodo"];
            gvAnteproyectos.Columns[29].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_Estatus"];
            gvAnteproyectos.Columns[30].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_Revisiones"];
            gvAnteproyectos.Columns[31].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_DescargarFicha"];
            gvAnteproyectos.Columns[32].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_Opciones"];

            for (int i = 0; i < gvAnteproyectos.Columns.Count; i++)
            {
                gvAnteproyectos.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvAnteproyectos.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }

            btnDescargar.Text = oMensajes.TablaMensajes["btnDescargar"];
            btnDescargar.ForeColor = System.Drawing.Color.White;
            btnDescargar.Font.Bold = true;
            btnDescargar.CausesValidation = false;

            if(!(Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString()))
            {
                btnNotificarTodos.Visible = false;
                gvAnteproyectos.Columns[33].Visible = false;
                gvAnteproyectos.Columns[35].Visible = false;
            }

            #region Modal Evaluadores
            lblDescripcionModuloMod.Text = oMensajes.TablaMensajes["lblDescripcionModuloMod"];

            ibtnCerrarMod.ImageUrl = "~//Assets//Imagenes//Principal//Cerrar Negro.png";
            ibtnCerrarMod.Width = 30;
            ibtnCerrarMod.CausesValidation = false;

            gvEvaluadoresMod.HeaderStyle.Wrap = true;
            gvEvaluadoresMod.RowStyle.Wrap = true;
            gvEvaluadoresMod.EmptyDataText = "No se encontraron resgistros";
            gvEvaluadoresMod.Columns[0].Visible = false;
            gvEvaluadoresMod.Columns[1].Visible = false;
            gvEvaluadoresMod.Columns[2].Visible = false;
            gvEvaluadoresMod.Columns[3].Visible = false;
            gvEvaluadoresMod.Columns[4].HeaderText = oMensajes.TablaMensajes["gvEvaluadoresMod_NoControl"];
            gvEvaluadoresMod.Columns[5].HeaderText = oMensajes.TablaMensajes["gvEvaluadoresMod_NombreMaestro"];
            gvEvaluadoresMod.Columns[6].HeaderText = oMensajes.TablaMensajes["gvEvaluadoresMod_Email"];
            gvEvaluadoresMod.Columns[7].HeaderText = oMensajes.TablaMensajes["gvEvaluadoresMod_Calificacion"];

            for (int i = 0; i < gvEvaluadoresMod.Columns.Count; i++)
            {
                gvEvaluadoresMod.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvEvaluadoresMod.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }
            #endregion
        }

        private void ConfiguraGrid()
        {
            gvAnteproyectos.Columns[23].ControlStyle.Width = 100;
            gvAnteproyectos.Columns[24].ControlStyle.Width = 150;
            gvAnteproyectos.Columns[25].ControlStyle.Width = 220;
            gvAnteproyectos.Columns[26].ControlStyle.Width = 150;
            gvAnteproyectos.Columns[27].ControlStyle.Width = 150;
            gvAnteproyectos.Columns[28].ControlStyle.Width = 150;
            gvAnteproyectos.Columns[29].ControlStyle.Width = 100;
            gvAnteproyectos.Columns[30].ControlStyle.Width = 100;
            gvAnteproyectos.Columns[32].ControlStyle.Width = 100;
            gvAnteproyectos.Columns[33].ControlStyle.Width = 100;
            gvAnteproyectos.Columns[34].ControlStyle.Width = 150;
            gvAnteproyectos.Columns[35].ControlStyle.Width = 150;
        }

        private void ConfiguraGridEvaluadores()
        {
            gvEvaluadoresMod.Columns[4].ControlStyle.Width = 100;
            gvEvaluadoresMod.Columns[5].ControlStyle.Width = 150;
            gvEvaluadoresMod.Columns[6].ControlStyle.Width = 220;
            gvEvaluadoresMod.Columns[7].ControlStyle.Width = 150;
        }

        private void LlenarCombos()
        {
            cboxPeriodo.DataTextField = "Name";
            cboxPeriodo.DataValueField = "IdValueDetail";
            cboxPeriodo.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Periodo");
            cboxPeriodo.DataBind();
            cboxPeriodo.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxPeriodo.SelectedIndex = 0;

            cboxEstatus.DataTextField = "Name";
            cboxEstatus.DataValueField = "IdValueDetail";
            cboxEstatus.DataSource = ValoresPorReferencia.RecuperaValorReferenciaOmitiendoDato("EstatusAnteproyecto", "1");
            cboxEstatus.DataBind();
            cboxEstatus.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxEstatus.SelectedIndex = 0;
        }

        private void LimpiarFiltro()
        {
            tboxNoControl.Text = "";
            tboxAlumno.Text = "";
            tboxNombreProyecto.Text = "";
            tboxEmpresa.Text = "";
            cboxEstatus.SelectedIndex = -1;
        }

        private void LlenarAnteproyectos(String _sIdPeriod, String _sYear, String _sNoContorl="", String _sAlumno="", String _sNombreProyecto="", String _sNombreEmpresa="", String _sIdTypeState="")
        {
            DataTable dtAnteproyectos = Anteproyecto.ObtieneAnteproyectosAdministrador(_sIdPeriod, _sYear, _sNoContorl, _sAlumno, _sNombreProyecto, _sNombreEmpresa, _sIdTypeState);
            ViewState["dtAnteproyectos"] = dtAnteproyectos;

            gvAnteproyectos.DataSource = dtAnteproyectos;
            gvAnteproyectos.DataBind();

            ViewState["dicOrdenacion"] = dicOrdenacion;
        }

        private void LlenarEvaluadores(String _sIdTeachers, String _sIdPreliminaryDraft)
        {
            DataTable dtEvaluadores = Anteproyecto.ObtieneEvaluadores(_sIdTeachers, _sIdPreliminaryDraft);

            gvEvaluadoresMod.DataSource = dtEvaluadores;
            gvEvaluadoresMod.DataBind();
        }

        private void GeneraExcel(DataTable _dtDatos)
        {
            oMensajes.RecuperarTablaMensajes("AnteproyectosAdministrador.aspx");

            ExcelPackage ep = new ExcelPackage();
            ep.Workbook.Worksheets.Add("Hoja 1");
            ExcelWorksheet ew = ep.Workbook.Worksheets[0];

            //Titulo
            String sNombreReporte = oMensajes.TablaMensajes["lblTitulo"];
            ew.Cells["A1"].Value = sNombreReporte;
            ew.Cells["A1:AD1"].Merge = true;
            ew.Cells["A1"].Style.Font.Bold = true;
            ew.Cells["A1"].Style.Font.Size = 16;
            ew.Cells["A1"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;

            //Encabezados
            Color cFondoTitulo = System.Drawing.ColorTranslator.FromHtml("#003A63");
            Color cLetraTitulo = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");

            ew.Cells["A3"].Value = oMensajes.TablaMensajes["gvAnteproyectos_NoControl"];
            ew.Cells["A3"].Style.Font.Bold = true;
            ew.Cells["A3:AD3"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
            ew.Cells["A3:AD3"].Style.Fill.BackgroundColor.SetColor(cFondoTitulo);
            ew.Cells["A3:AD3"].Style.Font.Bold = true;
            ew.Cells["A3:AD3"].Style.Font.Size = 13;
            ew.Cells["A3:AD3"].Style.Font.Color.SetColor(cLetraTitulo);
            ew.Cells["A3:AD3"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            
            ew.Cells["B3"].Value = oMensajes.TablaMensajes["gvAnteproyectos_Alumno"];
            ew.Cells["C3"].Value = "Carrera";
            ew.Cells["D3"].Value = "Teléfono";
            ew.Cells["E3"].Value = oMensajes.TablaMensajes["gvAnteproyectos_Email"];
            ew.Cells["F3"].Value = oMensajes.TablaMensajes["gvAnteproyectos_Periodo"];

            ew.Cells["G3"].Value = oMensajes.TablaMensajes["gvAnteproyectos_NombreProyecto"];
            ew.Cells["H3"].Value = "Objetivo del proyecto";
            ew.Cells["I3"].Value = "Justificación";
            ew.Cells["J3"].Value = "Alcance del proyecto";
            ew.Cells["K3"].Value = "Lugar donde se realizará el proyecto";
            ew.Cells["L3"].Value = oMensajes.TablaMensajes["gvAnteproyectos_Empresa"];
            ew.Cells["M3"].Value = "Giro de la Empresa";
            ew.Cells["N3"].Value = "Departamento";
            ew.Cells["O3"].Value = "Teléfono";
            ew.Cells["P3"].Value = "Nombre del Gerente o director de la Empresa";
            ew.Cells["Q3"].Value = "Jefe del área";
            ew.Cells["R3"].Value = "Calle";
            ew.Cells["S3"].Value = "Núm. Exterior";
            ew.Cells["T3"].Value = "Núm. Interior";
            ew.Cells["U3"].Value = "Colonia";
            ew.Cells["V3"].Value = "Ciudad";
            ew.Cells["W3"].Value = "Municipio";
            ew.Cells["X3"].Value = "Estado";
            ew.Cells["Y3"].Value = "C.P.";
            ew.Cells["Z3"].Value = oMensajes.TablaMensajes["gvAnteproyectos_Estatus"];
            ew.Cells["AA3"].Value = oMensajes.TablaMensajes["gvAnteproyectos_Revisiones"];

            ew.Cells["AB3"].Value = oMensajes.TablaMensajes["gvEvaluadoresMod_NoControl"];
            ew.Cells["AC3"].Value = oMensajes.TablaMensajes["gvEvaluadoresMod_NombreMaestro"];
            ew.Cells["AD3"].Value = oMensajes.TablaMensajes["gvEvaluadoresMod_Calificacion"];

            //Detalle            
            int i = 4;
            foreach (DataRow dr in _dtDatos.Rows)
            {
                ew.Cells["A" + i.ToString()].Value = dr["NoControl"];
                ew.Cells["B" + i.ToString()].Value = dr["Alumno"];
                ew.Cells["C" + i.ToString()].Value = dr["Carrera"];
                ew.Cells["D" + i.ToString()].Value = dr["TelefonoUsuario"];
                ew.Cells["E" + i.ToString()].Value = dr["Email"];
                ew.Cells["F" + i.ToString()].Value = dr["Periodo"];

                ew.Cells["G" + i.ToString()].Value = dr["NombreProyecto"];
                ew.Cells["H" + i.ToString()].Value = dr["ObjetivoProyecto"];
                ew.Cells["I" + i.ToString()].Value = dr["Justificacion"];
                ew.Cells["J" + i.ToString()].Value = dr["AlcanceProyecto"];
                ew.Cells["K" + i.ToString()].Value = dr["LocacionProyecto"];
                ew.Cells["L" + i.ToString()].Value = dr["NombreEmpresa"];
                ew.Cells["M" + i.ToString()].Value = dr["GiroEmpresa"];
                ew.Cells["N" + i.ToString()].Value = dr["DepartamentoEmpresa"];
                ew.Cells["O" + i.ToString()].Value = dr["TelefonoEmpresa"];
                ew.Cells["P" + i.ToString()].Value = dr["DirectorEmpresa"];
                ew.Cells["Q" + i.ToString()].Value = dr["JefeDeArea"];
                ew.Cells["R" + i.ToString()].Value = dr["CalleEmpresa"];
                ew.Cells["S" + i.ToString()].Value = dr["NumeroExterior"];
                ew.Cells["T" + i.ToString()].Value = dr["NumeroInterior"];
                ew.Cells["U" + i.ToString()].Value = dr["ColoniaEmpresa"];
                ew.Cells["V" + i.ToString()].Value = dr["CiudadEmpresa"];
                ew.Cells["W" + i.ToString()].Value = dr["MunicipioEmpresa"];
                ew.Cells["X" + i.ToString()].Value = dr["EstadoEmpresa"];
                ew.Cells["Y" + i.ToString()].Value = dr["CodigoPostalEmpresa"];
                ew.Cells["Z" + i.ToString()].Value = dr["Estatus"];
                ew.Cells["AA" + i.ToString()].Value = dr["Revisiones"];

                i++;

                DataTable dtEvaluadores = Anteproyecto.ObtieneEvaluadores(dr["IdTeachers"].ToString(), dr["IdPreliminaryDraft"].ToString());

                foreach(DataRow drE in dtEvaluadores.Rows)
                {
                    ew.Cells["AB" + i.ToString()].Value = drE["NoControl"];
                    ew.Cells["AC" + i.ToString()].Value = drE["NombreMaestro"];
                    ew.Cells["AD" + i.ToString()].Value = drE["Calificacion"];

                    i++;
                }

                
            }
            ew.Cells[ew.Dimension.Address].AutoFitColumns();

            //Tamaño de las columnas
            ew.Column(8).Width = 120;
            ew.Cells["H:H"].Style.WrapText = true;
            ew.Column(9).Width = 120;
            ew.Cells["I:I"].Style.WrapText = true;
            ew.Column(10).Width = 120;
            ew.Cells["J:J"].Style.WrapText = true;
            ew.Column(13).Width = 110;
            ew.Cells["M:M"].Style.WrapText = true;

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