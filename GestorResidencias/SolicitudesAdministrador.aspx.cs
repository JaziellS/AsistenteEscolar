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
    public partial class SolicitudesAdministrador : System.Web.UI.Page
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
                        LlenarSolicitudes("", "");
                        LlenarCombos();

                        /*Al momento de seleccionar un periodo en cualquier seccion administradora se guarda e esta variable de session,
                         esto con el fin de no estar marcando el periodo y anio en cada momento.*/
                        if (Session["IdPeriodo"] != null)
                        {
                            cboxPeriodo.SelectedValue = Session["IdPeriodo"].ToString();
                            tboxAnio.Text = Session["Anio"].ToString();

                            cboxPeriodo_SelectedIndexChanged(null, null);
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
            if (cboxPeriodo.SelectedValue != "" && tboxAnio.Text != "")
            {
                LimpiarFiltro();
                divTabla.Visible = true;
                divSinRegistros.Visible = false;
                lblPeriodoDes.Text = cboxPeriodo.SelectedItem.Text + " " + tboxAnio.Text;

                LlenarSolicitudes(cboxPeriodo.SelectedValue, tboxAnio.Text);

                Session["IdPeriodo"] = cboxPeriodo.SelectedValue;
                Session["Anio"] = tboxAnio.Text;

                ScriptManager.RegisterStartupScript(this, GetType(), "Script1", "ScrollTab();", true);
            }
            else
            {
                LlenarSolicitudes("", "");
                divTabla.Visible = false;
                divSinRegistros.Visible = true;
                lblPeriodoDes.Text = "";
            }
        }

        protected void tboxNoControl_TextChanged(object sender, EventArgs e)
        {
            LlenarSolicitudes(cboxPeriodo.SelectedValue, tboxAnio.Text, tboxNoControl.Text, tboxAlumno.Text, tboxNombreProyecto.Text, tboxEmpresa.Text, cboxEstatus.SelectedValue);
        }

        protected void btnNotificarTodos_Click(object sender, EventArgs e)
        {
            try
            {
                if (cboxPeriodo.SelectedValue != "" && tboxAnio.Text != "")
                {
                    DataTable dtSolicitudes = Solicitud.ObtieneSolicitudesAdmin(cboxPeriodo.SelectedValue, tboxAnio.Text, "", "", "", "", "3");

                    if (dtSolicitudes.Rows.Count != 0)
                    {
                        foreach(DataRow dr in dtSolicitudes.Rows)
                        {
                            if (!Solicitud.ValidaSiElAlumnoFueNotificado(dr["IdRequest"].ToString()))
                            {
                                if (Solicitud.ValidaSiEstaCalificado(dr["IdRequest"].ToString()))
                                {
                                    Solicitud.ActualizaEstatusSolicitud(dr["IdRequest"].ToString(), dr["EstatusCalificacion"].ToString());

                                    //Notificacion
                                    if (dr["EstatusCalificacion"].ToString() == Enums.EstatusSolicitudes.Aprobado.ToString())
                                    { //Aprobada
                                        Generales.InsertaNotificacion(dr["IdUser"].ToString(), "!Felicidades! Tu solicitud ha sido aprobada. Ya puedes descargar tu ficha y enviarla a la empresa.", Enums.TipoNotificacion.Hipervinculo.ToString(), "Solicitudes.aspx");
                                    }
                                    else
                                    { //Rechazada
                                        Generales.InsertaNotificacion(dr["IdUser"].ToString(), "Tu solicitud ha sido rechazada. Revisa el comentario de cancelación y crea una nueva solicitud para que sea revisada nuevamente.", Enums.TipoNotificacion.Hipervinculo.ToString(), "Solicitudes.aspx");
                                    }

                                    oMensajes.MuestraMensaje(this, "Correcto", "Los alumnos fueron notificado con exito.", Mensajes.TipoMensaje.Correcto);
                                }
                            }
                        }
                    }
                    else
                    {
                        oMensajes.MuestraMensaje(this, "Informacion", "No existen alumnos por notificar.", Mensajes.TipoMensaje.Informacion);
                    }
                    tboxNoControl_TextChanged(null, null);
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        protected void gvSolicitudes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dicOrdenacion = new Dictionary<string, string>((Dictionary<string, string>)ViewState["dicOrdenacion"]);

            DataView m_DataView = new DataView((DataTable)ViewState["dtSolicitudes"]);
            if (ViewState["ultOrdenacion"] != null)
            {
                m_DataView.Sort = ViewState["ultOrdenacion"].ToString() + " " + dicOrdenacion[ViewState["ultOrdenacion"].ToString()];
            }

            gvSolicitudes.DataSource = m_DataView;
            gvSolicitudes.PageIndex = e.NewPageIndex;
            gvSolicitudes.DataBind();
        }

        protected void gvSolicitudes_Sorting(object sender, GridViewSortEventArgs e)
        {
            gvSolicitudes.PageIndex = 0;

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

            if (ViewState["dtSolicitudes"] != null)
            {
                DataView m_DataView = new DataView((DataTable)ViewState["dtSolicitudes"]);
                m_DataView.Sort = e.SortExpression + " " + dicOrdenacion[e.SortExpression];

                gvSolicitudes.DataSource = m_DataView;
                gvSolicitudes.DataBind();
            }
        }

        protected void gvSolicitudes_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[52].ColumnSpan = 4;
                e.Row.Cells.RemoveAt(53);
                e.Row.Cells.RemoveAt(53);
                e.Row.Cells.RemoveAt(53);

            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                String _sIdTypeState = gvSolicitudes.DataKeys[e.Row.RowIndex].Values[2].ToString();
                String _sIdTypeStateCalificacion = gvSolicitudes.DataKeys[e.Row.RowIndex].Values[3].ToString();

                ImageButton ibtnDesFicha = (ImageButton)e.Row.Cells[51].Controls[1];
                ibtnDesFicha.ID = "ibtnDesFicha";
                ibtnDesFicha.CommandName = "ibtnDesFicha";
                ibtnDesFicha.ImageUrl = "~//Assets//Imagenes//Principal//Archivos.png";

                Button btnVer = (Button)e.Row.Cells[52].Controls[0];
                btnVer.ID = "btnVer";
                btnVer.CommandName = "btnVer";
                btnVer.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnVer.Text = "Ver";
                btnVer.ForeColor = System.Drawing.Color.White;
                btnVer.Font.Bold = true;

                Button btnCalificar = (Button)e.Row.Cells[53].Controls[0];
                btnCalificar.ID = "btnCalificar";
                btnCalificar.CommandName = "btnCalificar";
                btnCalificar.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnCalificar.Text = "Calificar";
                btnCalificar.ForeColor = System.Drawing.Color.White;
                btnCalificar.Font.Bold = true;
                btnCalificar.Visible = false;
                if (_sIdTypeState == Enums.EstatusSolicitudes.Enviado.ToString())
                {
                    btnCalificar.Visible = true;
                }

                Button btnEliminarCalificacion = (Button)e.Row.Cells[54].Controls[0];
                btnEliminarCalificacion.ID = "btnEliminarCalificacion";
                btnEliminarCalificacion.CommandName = "btnEliminarCalificacion";
                btnEliminarCalificacion.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnEliminarCalificacion.Text = "Eliminar Calificacion";
                btnEliminarCalificacion.ForeColor = System.Drawing.Color.White;
                btnEliminarCalificacion.Font.Bold = true;
                btnEliminarCalificacion.Visible = false;
                if (_sIdTypeState == Enums.EstatusSolicitudes.Calificado.ToString())
                {
                    btnEliminarCalificacion.Visible = true;
                }

                Button btnNotificar = (Button)e.Row.Cells[55].Controls[0];
                btnNotificar.ID = "btnNotificar";
                btnNotificar.CommandName = "btnNotificar";
                btnNotificar.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnNotificar.Text = "Notificar Alumno";
                btnNotificar.ForeColor = System.Drawing.Color.White;
                btnNotificar.Font.Bold = true;
                btnNotificar.Visible = false;
                if (_sIdTypeState == Enums.EstatusSolicitudes.Calificado.ToString())
                {
                    btnNotificar.Visible = true;
                }
            }
        }

        protected void gvSolicitudes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "ibtnDesFicha")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvSolicitudes.Rows[index];

                    String _sIdRequest = gvSolicitudes.DataKeys[index].Values[0].ToString();
                    String _sIdUser = gvSolicitudes.DataKeys[index].Values[1].ToString();

                    Usuario oUsuario = new Usuario(_sIdUser);

                    String sPathPlantilla = System.AppDomain.CurrentDomain.BaseDirectory + "\\Plantillas\\Solicitudes\\Plantilla_Solicitud.docx";
                    String sNombreArchivo = oUsuario.Nombre + "-" + oUsuario.NoControl + "(" + DateTime.Now.ToString("yyyy-MM-ddThh-mm-ss") + ").docx";
                    String sPathCarpeta = Server.MapPath("~/Plantillas/Solicitudes/");
                    String sPathDescarga = Path.Combine(sPathCarpeta, sNombreArchivo);

                    if (File.Exists(sPathPlantilla))
                    {
                        File.Copy(sPathPlantilla, sPathDescarga, overwrite: true);

                        DescargarDocumento.GenerarWordSolicitud(_sIdRequest, _sIdUser, sPathDescarga);

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
                else if (e.CommandName == "btnVer")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvSolicitudes.Rows[index];

                    String _sIdRequest = gvSolicitudes.DataKeys[index].Values[0].ToString();
                    String _sIdUser = gvSolicitudes.DataKeys[index].Values[1].ToString();

                    ViewState["IdRequest"] = _sIdRequest;
                    
                    LLenarSolicitud(_sIdRequest, _sIdUser);
                    DeshabilitarComponentes();
                    divBotonesCalificarModS.Visible = false;

                    modSolicitud.Show();
                }
                else if (e.CommandName == "btnCalificar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvSolicitudes.Rows[index];

                    String _sIdRequest = gvSolicitudes.DataKeys[index].Values[0].ToString();
                    String _sIdUser = gvSolicitudes.DataKeys[index].Values[1].ToString();

                    ViewState["IdRequest"] = _sIdRequest;

                    LLenarSolicitud(_sIdRequest, _sIdUser);
                    DeshabilitarComponentes();
                    divBotonesCalificarModS.Visible = true;

                    modSolicitud.Show();
                }
                else if (e.CommandName == "btnEliminarCalificacion")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvSolicitudes.Rows[index];

                    String _sIdRequest = gvSolicitudes.DataKeys[index].Values[0].ToString();
                    String _sIdUser = gvSolicitudes.DataKeys[index].Values[1].ToString();
                    if (!Solicitud.ValidaSiElAlumnoFueNotificado(_sIdRequest))
                    {
                        if (Solicitud.ValidaSiEstaCalificado(_sIdRequest))
                        {
                            Solicitud.EliminarCalificacion(_sIdRequest);
                        }
                        else
                        {
                            oMensajes.MuestraMensaje(this, "Error", "Ya se elimino la calificacion con anterioridad. Favor de intentarlo de nuevo.", Mensajes.TipoMensaje.Error);
                        }
                    }
                    else
                    {
                        oMensajes.MuestraMensaje(this, "Error", "Ya se notifico al alumno con anterioridad, no se puede eliminar la calificacion.", Mensajes.TipoMensaje.Error);
                    }

                    tboxNoControl_TextChanged(null, null);
                }
                else if (e.CommandName == "btnNotificar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvSolicitudes.Rows[index];

                    String _sIdRequest = gvSolicitudes.DataKeys[index].Values[0].ToString();
                    String _sIdUser = gvSolicitudes.DataKeys[index].Values[1].ToString();
                    String _sEstatusCalificacion = gvSolicitudes.DataKeys[index].Values[3].ToString();

                    if (!Solicitud.ValidaSiElAlumnoFueNotificado(_sIdRequest))
                    {
                        if (Solicitud.ValidaSiEstaCalificado(_sIdRequest))
                        {
                            Solicitud.ActualizaEstatusSolicitud(_sIdRequest, _sEstatusCalificacion);

                            oMensajes.MuestraMensaje(this, "Correcto", "El alumno fue notificado con exito.", Mensajes.TipoMensaje.Correcto);

                            //Notificacion
                            if (_sEstatusCalificacion == Enums.EstatusSolicitudes.Aprobado.ToString())
                            { //Aprobada
                                Generales.InsertaNotificacion(_sIdUser, "¡Felicidades! Tu solicitud ha sido aprobada. Ya puedes descargar tu ficha y enviarla a la empresa.", Enums.TipoNotificacion.Hipervinculo.ToString(), "Solicitudes.aspx");
                            }
                            else
                            { //Rechazada
                                Generales.InsertaNotificacion(_sIdUser, "Tu solicitud ha sido rechazada. Revisa el comentario de cancelación y crea una nueva solicitud para que sea revisada nuevamente.", Enums.TipoNotificacion.Hipervinculo.ToString(), "Solicitudes.aspx");
                            }
                        }
                        else
                        {
                            oMensajes.MuestraMensaje(this, "Error", "Ya se elimino la calificacion con anterioridad. Favor de intentarlo de nuevo.", Mensajes.TipoMensaje.Error);
                        }
                    }
                    else
                    {
                        oMensajes.MuestraMensaje(this, "Error", "Ya se notifico al alumno con anterioridad, actualiza la tabla para comprobarlo.", Mensajes.TipoMensaje.Error);
                    }

                    tboxNoControl_TextChanged(null, null);
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        protected void btnDescargar_Click(object sender, EventArgs e)
        {
            DataTable dtDatos = (DataTable)ViewState["dtSolicitudes"];

            if (dtDatos.Rows.Count > 0)
            {
                GeneraExcel(dtDatos);
            }
            else
            {
                oMensajes.MuestraMensaje(this, "Info", "No exite información para descargar", Mensajes.TipoMensaje.Informacion);
            }
        }

        #region Modal Cancelar Solicitud
        protected void ibtnCerrarMod_Click(object sender, ImageClickEventArgs e)
        {
            modCancelarSolicitud.Hide();
            modSolicitud.Show();
        }

        protected void btnNotificarMod_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Solicitud.ValidaSiEstaCalificado(ViewState["IdRequest"].ToString()))
                {
                    Solicitud.InsertaCalificacionSolicitud(ViewState["IdRequest"].ToString(), tboxComentarioMod.Text, Enums.EstatusSolicitudes.Cancelado.ToString());

                    oMensajes.MuestraMensaje(this, "Correcto", "La solicitud fue calificada correctamente.", Mensajes.TipoMensaje.Correcto);

                    ViewState.Remove("IdRequest");
                    modCancelarSolicitud.Hide();
                }
                else
                {
                    oMensajes.MuestraMensaje(this, "Error", "La solicitud ya fue calificada, actualiza la tabla para comprobarlo.", Mensajes.TipoMensaje.Error);
                }

                tboxNoControl_TextChanged(null, null);
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }
        #endregion

        #region Modal Solicitud
        protected void ibtnCerrarModS_Click(object sender, ImageClickEventArgs e)
        {
            ViewState.Remove("IdRequest");
            modSolicitud.Hide();
        }

        protected void ibtnAprobarModS_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (!Solicitud.ValidaSiEstaCalificado(ViewState["IdRequest"].ToString()))
                {
                    Solicitud.InsertaCalificacionSolicitud(ViewState["IdRequest"].ToString(), "", Enums.EstatusSolicitudes.Aprobado.ToString());

                    modSolicitud.Hide();
                    oMensajes.MuestraMensaje(this, "Correcto", "La solicitud fue calificada correctamente.", Mensajes.TipoMensaje.Correcto);
                }
                else
                {
                    oMensajes.MuestraMensaje(this, "Error", "La solicitud ya fue calificada, actualiza la tabla para comprobarlo.", Mensajes.TipoMensaje.Error);
                }

                tboxNoControl_TextChanged(null, null);
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        protected void ibtnCancelarModS_Click(object sender, ImageClickEventArgs e)
        {
            LimpiarModal();
            modSolicitud.Hide();
            modCancelarSolicitud.Show();
        }
        #endregion

        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("SolicitudesAdministrador.aspx");

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
            lblAlumno.Text = oMensajes.TablaMensajes["lblAlumno"];
            lblNombreProyecto.Text = oMensajes.TablaMensajes["lblNombreProyecto"];
            lblEmpresa.Text = oMensajes.TablaMensajes["lblEmpresa"];
            lblEstatus.Text = oMensajes.TablaMensajes["lblEstatus"];
            

            btnNotificarTodos.Text = oMensajes.TablaMensajes["btnNotificarTodos"];
            btnNotificarTodos.ForeColor = System.Drawing.Color.White;
            btnNotificarTodos.Font.Bold = true;
            btnNotificarTodos.CausesValidation = false;

            gvSolicitudes.HeaderStyle.Wrap = true;
            gvSolicitudes.RowStyle.Wrap = true;
            gvSolicitudes.EmptyDataText = "No se encontraron resgistros";
            gvSolicitudes.Columns[0].Visible = false; //IdRequest
            gvSolicitudes.Columns[1].Visible = false; //IdUser
            gvSolicitudes.Columns[2].Visible = false; //Lugar
            gvSolicitudes.Columns[3].Visible = false; //Fecha
            gvSolicitudes.Columns[4].Visible = false; //ProcedenciaDelProyecto
            gvSolicitudes.Columns[5].Visible = false; //NumeroResidentes
            gvSolicitudes.Columns[6].Visible = false; //PeriodoProyectado
            gvSolicitudes.Columns[7].Visible = false; //Anio
            gvSolicitudes.Columns[8].Visible = false; //RamoEmpresa
            gvSolicitudes.Columns[9].Visible = false; //SectorEmpresa
            gvSolicitudes.Columns[10].Visible = false; //RFCEmpresa
            gvSolicitudes.Columns[11].Visible = false; //TelefonoOficina
            gvSolicitudes.Columns[12].Visible = false; //FaxEmpresa
            gvSolicitudes.Columns[13].Visible = false; //TamanioEmpresa
            gvSolicitudes.Columns[14].Visible = false; //MisionEmpresa
            gvSolicitudes.Columns[15].Visible = false; //NombreTitular
            gvSolicitudes.Columns[16].Visible = false; //NombreAsesorExterno
            gvSolicitudes.Columns[17].Visible = false; //PuestoAsesorExterno
            gvSolicitudes.Columns[18].Visible = false; //CalleEmpresa
            gvSolicitudes.Columns[19].Visible = false; //NumeroExteriorEmpresa
            gvSolicitudes.Columns[20].Visible = false; //NumeroInteriorEmpresa
            gvSolicitudes.Columns[21].Visible = false; //ColoniaEmpresa
            gvSolicitudes.Columns[22].Visible = false; //MunicipioEmpresa
            gvSolicitudes.Columns[23].Visible = false; //NumeroPostalEmpresa
            gvSolicitudes.Columns[24].Visible = false; //NombrePSeguimiento
            gvSolicitudes.Columns[25].Visible = false; //PuestoPSeguimiento
            gvSolicitudes.Columns[26].Visible = false; //EmailPSeguimiento
            gvSolicitudes.Columns[27].Visible = false; //CelularPSeguimiento
            gvSolicitudes.Columns[28].Visible = false; //TelefonoPSeguimiento
            gvSolicitudes.Columns[29].Visible = false; //SemestreResidente
            gvSolicitudes.Columns[30].Visible = false; //CarreraResidente
            gvSolicitudes.Columns[31].Visible = false; //SeguridadSocialResidente
            gvSolicitudes.Columns[32].Visible = false; //OtraSeguridadSocialResidente
            gvSolicitudes.Columns[33].Visible = false; //NSSResidente
            gvSolicitudes.Columns[34].Visible = false; //TelefonoResidente
            gvSolicitudes.Columns[35].Visible = false; //CelularResidente
            gvSolicitudes.Columns[36].Visible = false; //CalleResidente
            gvSolicitudes.Columns[37].Visible = false; //NumeroExteriorResidente
            gvSolicitudes.Columns[38].Visible = false; //NumeroInteriorResidente
            gvSolicitudes.Columns[39].Visible = false; //ColoniaResidente
            gvSolicitudes.Columns[40].Visible = false; //MunicipioResidente
            gvSolicitudes.Columns[41].Visible = false; //NumeroPostalResidente
            gvSolicitudes.Columns[42].Visible = false; //IdTypeState
            gvSolicitudes.Columns[43].Visible = false; //EstatusCalificacion
            gvSolicitudes.Columns[44].HeaderText = oMensajes.TablaMensajes["gvSolicitudes_NoControl"];
            gvSolicitudes.Columns[45].HeaderText = oMensajes.TablaMensajes["gvSolicitudes_Alumno"];
            gvSolicitudes.Columns[46].HeaderText = oMensajes.TablaMensajes["gvSolicitudes_Email"];
            gvSolicitudes.Columns[47].HeaderText = oMensajes.TablaMensajes["gvSolicitudes_NombreProyecto"];
            gvSolicitudes.Columns[48].HeaderText = oMensajes.TablaMensajes["gvSolicitudes_Empresa"];
            gvSolicitudes.Columns[49].HeaderText = oMensajes.TablaMensajes["gvSolicitudes_Estatus"];
            gvSolicitudes.Columns[50].HeaderText = oMensajes.TablaMensajes["gvSolicitudes_ComentarioCancelacion"];
            gvSolicitudes.Columns[51].HeaderText = oMensajes.TablaMensajes["gvSolicitudes_DescargarFicha"];
            gvSolicitudes.Columns[52].HeaderText = oMensajes.TablaMensajes["gvSolicitudes_Opciones"];

            for (int i = 0; i < gvSolicitudes.Columns.Count; i++)
            {
                gvSolicitudes.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvSolicitudes.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }

            btnDescargar.Text = oMensajes.TablaMensajes["btnDescargar"];
            btnDescargar.ForeColor = System.Drawing.Color.White;
            btnDescargar.Font.Bold = true;
            btnDescargar.CausesValidation = false;

            #region Modal Cancelar Solicitud
            lblDescripcionModuloMod.Text = oMensajes.TablaMensajes["lblDescripcionModuloMod"];

            ibtnCerrarMod.ImageUrl = "~//Assets//Imagenes//Principal//Cerrar Negro.png";
            ibtnCerrarMod.Width = 30;
            ibtnCerrarMod.CausesValidation = false;

            lblComentarioMod.Text = oMensajes.TablaMensajes["lblComentarioMod"];
            rfvComentarioMod.Text = "Campo Obligatorio";
            
            btnNotificarMod.Text = oMensajes.TablaMensajes["btnNotificarMod"];
            btnNotificarMod.ForeColor = System.Drawing.Color.White;
            btnNotificarMod.Font.Bold = true;
            #endregion

            #region Modal Solicitud
            lblDescripcionModuloModS.Text = oMensajes.TablaMensajes["lblDescripcionModuloModS"];

            ibtnCerrarModS.ImageUrl = "~//Assets//Imagenes//Principal//Cerrar Negro.png";
            ibtnCerrarModS.Width = 30;
            ibtnCerrarModS.CausesValidation = false;

            lblLugarModS.Text = oMensajes.TablaMensajes["lblLugarModS"];
            lblFechaModS.Text = oMensajes.TablaMensajes["lblFechaModS"];
            lblNombreProyectoModS.Text = oMensajes.TablaMensajes["lblNombreProyectoModS"];
            lblProcedenciaProyectoModS.Text = oMensajes.TablaMensajes["lblProcedenciaProyectoModS"];
            lblNumeroResidentesModS.Text = oMensajes.TablaMensajes["lblNumeroResidentesModS"];
            lblPeriodoModS.Text = oMensajes.TablaMensajes["lblPeriodoModS"];
            lblAnioModS.Text = oMensajes.TablaMensajes["lblAnioModS"];
            
            lblDatosEmpresaEModS.Text = oMensajes.TablaMensajes["lblDatosEmpresaEModS"];

            lblNombreFiscalEModS.Text = oMensajes.TablaMensajes["lblNombreFiscalEModS"];
            lblRamoEModS.Text = oMensajes.TablaMensajes["lblRamoEModS"];
            lblSectorEModS.Text = oMensajes.TablaMensajes["lblSectorEModS"];
            lblRFCEModS.Text = oMensajes.TablaMensajes["lblRFCEModS"];
            lblTelefonoEModS.Text = oMensajes.TablaMensajes["lblTelefonoEModS"];
            lblFaxEModS.Text = oMensajes.TablaMensajes["lblFaxEModS"];
            lblTamanioEmpresaEModS.Text = oMensajes.TablaMensajes["lblTamanioEmpresaEModS"];
            lblMisionEModS.Text = oMensajes.TablaMensajes["lblMisionEModS"];
            lblNombreTitularEModS.Text = oMensajes.TablaMensajes["lblNombreTitularEModS"];
            lblNombreAseExtEModS.Text = oMensajes.TablaMensajes["lblNombreAseExtEModS"];
            lblPuestoAseExtEModS.Text = oMensajes.TablaMensajes["lblPuestoAseExtEModS"];

            lblDomicilioEModS.Text = oMensajes.TablaMensajes["lblDomicilioEModS"];

            lblCalleEModS.Text = oMensajes.TablaMensajes["lblCalleEModS"];
            lblNumExtEModS.Text = oMensajes.TablaMensajes["lblNumExtEModS"];
            lblNumIntEModS.Text = oMensajes.TablaMensajes["lblNumIntEModS"];
            lblColoniaEModS.Text = oMensajes.TablaMensajes["lblColoniaEModS"];
            lblMunicipioEModS.Text = oMensajes.TablaMensajes["lblMunicipioEModS"];
            lblCPEModS.Text = oMensajes.TablaMensajes["lblCPEModS"];

            lblDatosSEModS.Text = oMensajes.TablaMensajes["lblDatosSEModS"];

            lblNombreSEModS.Text = oMensajes.TablaMensajes["lblNombreSEModS"];
            lblPuestoSEModS.Text = oMensajes.TablaMensajes["lblPuestoSEModS"];
            lblEmailSEModS.Text = oMensajes.TablaMensajes["lblEmailSEModS"];
            lblCelularSEModS.Text = oMensajes.TablaMensajes["lblCelularSEModS"];
            lblTelefonoOficSEModS.Text = oMensajes.TablaMensajes["lblTelefonoOficSEModS"];

            lblDatosRModS.Text = oMensajes.TablaMensajes["lblDatosRModS"];

            lblNombreRModS.Text = oMensajes.TablaMensajes["lblNombreRModS"];
            lblSemestreRModS.Text = oMensajes.TablaMensajes["lblSemestreRModS"];
            lblCarreraRModS.Text = oMensajes.TablaMensajes["lblCarreraRModS"];
            lblNoControlRModS.Text = oMensajes.TablaMensajes["lblNoControlRModS"];
            lblEmailRModS.Text = oMensajes.TablaMensajes["lblEmailRModS"];
            lblSeguridadSocialRModS.Text = oMensajes.TablaMensajes["lblSeguridadSocialRModS"];
            lblCualRModS.Text = oMensajes.TablaMensajes["lblCualRModS"];
            lblNSSRModS.Text = oMensajes.TablaMensajes["lblNSSRModS"];
            lblTelefonoRModS.Text = oMensajes.TablaMensajes["lblTelefonoRModS"];
            lblCelularRModS.Text = oMensajes.TablaMensajes["lblCelularRModS"];

            lblDomicilioRModS.Text = oMensajes.TablaMensajes["lblDomicilioRModS"];

            lblCalleRModS.Text = oMensajes.TablaMensajes["lblCalleRModS"];
            lblNumExtRModS.Text = oMensajes.TablaMensajes["lblNumExtRModS"];
            lblNumIntRModS.Text = oMensajes.TablaMensajes["lblNumIntRModS"];
            lblColoniaRModS.Text = oMensajes.TablaMensajes["lblColoniaRModS"];
            lblMunicipioRModS.Text = oMensajes.TablaMensajes["lblMunicipioRModS"];
            lblCPRModS.Text = oMensajes.TablaMensajes["lblCPRModS"];

            ibtnAprobarModS.ImageUrl = "~//Assets//Imagenes//Principal//Aprobar.png";
            ibtnAprobarModS.Width = 35;
            ibtnAprobarModS.CausesValidation = false;

            ibtnCancelarModS.ImageUrl = "~//Assets//Imagenes//Principal//Cancelar.png";
            ibtnCancelarModS.Width = 35;
            ibtnCancelarModS.CausesValidation = false;
            #endregion
        }

        private void ConfiguraGrid()
        {
            gvSolicitudes.Columns[44].ControlStyle.Width = 130;
            gvSolicitudes.Columns[45].ControlStyle.Width = 250;
            gvSolicitudes.Columns[46].ControlStyle.Width = 250;
            gvSolicitudes.Columns[47].ControlStyle.Width = 220;
            gvSolicitudes.Columns[48].ControlStyle.Width = 300;
            gvSolicitudes.Columns[49].ControlStyle.Width = 130;
            gvSolicitudes.Columns[50].ControlStyle.Width = 300;
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
            cboxEstatus.DataSource = ValoresPorReferencia.RecuperaValorReferenciaOmitiendoDato("EstatusSolicitud", "1");
            cboxEstatus.DataBind();
            cboxEstatus.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxEstatus.SelectedIndex = 0;

            cboxProcedenciaProyectoModS.DataTextField = "Name";
            cboxProcedenciaProyectoModS.DataValueField = "IdValueDetail";
            cboxProcedenciaProyectoModS.DataSource = ValoresPorReferencia.RecuperaValorReferencia("ProcedenciaProyecto");
            cboxProcedenciaProyectoModS.DataBind();
            cboxProcedenciaProyectoModS.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxProcedenciaProyectoModS.SelectedIndex = 0;

            cboxPeriodoModS.DataTextField = "Name";
            cboxPeriodoModS.DataValueField = "IdValueDetail";
            cboxPeriodoModS.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Periodo");
            cboxPeriodoModS.DataBind();
            cboxPeriodoModS.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxPeriodoModS.SelectedIndex = 0;

            cboxRamoEModS.DataTextField = "Name";
            cboxRamoEModS.DataValueField = "IdValueDetail";
            cboxRamoEModS.DataSource = ValoresPorReferencia.RecuperaValorReferencia("RamoProyecto");
            cboxRamoEModS.DataBind();
            cboxRamoEModS.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxRamoEModS.SelectedIndex = 0;

            cboxSectorEModS.DataTextField = "Name";
            cboxSectorEModS.DataValueField = "IdValueDetail";
            cboxSectorEModS.DataSource = ValoresPorReferencia.RecuperaValorReferencia("SectorProyecto");
            cboxSectorEModS.DataBind();
            cboxSectorEModS.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxSectorEModS.SelectedIndex = 0;

            cboxTamanioEmpresaEModS.DataTextField = "Name";
            cboxTamanioEmpresaEModS.DataValueField = "IdValueDetail";
            cboxTamanioEmpresaEModS.DataSource = ValoresPorReferencia.RecuperaValorReferencia("TamanoEmpresa");
            cboxTamanioEmpresaEModS.DataBind();
            cboxTamanioEmpresaEModS.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxTamanioEmpresaEModS.SelectedIndex = 0;

            cboxSeguridadSocialRModS.DataTextField = "Name";
            cboxSeguridadSocialRModS.DataValueField = "IdValueDetail";
            cboxSeguridadSocialRModS.DataSource = ValoresPorReferencia.RecuperaValorReferencia("SeguridadSocial");
            cboxSeguridadSocialRModS.DataBind();
            cboxSeguridadSocialRModS.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxSeguridadSocialRModS.SelectedIndex = 0;

            cboxCarreraRModS.DataTextField = "Name";
            cboxCarreraRModS.DataValueField = "IdValueDetail";
            cboxCarreraRModS.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Carreras");
            cboxCarreraRModS.DataBind();
            cboxCarreraRModS.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxCarreraRModS.SelectedIndex = 0;
        }

        private void LlenarSolicitudes(String _sIdPeriod, String _sYear, String _sNoControl="", String _sAlumno="", String _sNombreProyecto="", String _sEmpresa="", String _sEstatus="")
        {
            DataTable dtSolicitudes = Solicitud.ObtieneSolicitudesAdmin(_sIdPeriod, _sYear, _sNoControl, _sAlumno, _sNombreProyecto, _sEmpresa, _sEstatus);
            ViewState["dtSolicitudes"] = dtSolicitudes;

            gvSolicitudes.DataSource = dtSolicitudes;
            gvSolicitudes.DataBind();

            ViewState["dicOrdenacion"] = dicOrdenacion;
        }

        private void LimpiarFiltro()
        {
            tboxNoControl.Text = "";
            tboxAlumno.Text = "";
            tboxNombreProyecto.Text = "";
            tboxEmpresa.Text = "";
            cboxEstatus.SelectedIndex = -1;
        }

        private void LimpiarModal()
        {
            tboxComentarioMod.Text = "";
        }

        private void DeshabilitarComponentes()
        {
            tboxLugarS.Enabled = false;
            tboxFechaModS.Enabled = false;
            tboxNombreProyectoModS.Enabled = false;
            cboxProcedenciaProyectoModS.Enabled = false;
            tboxNumeroResidentesModS.Enabled = false;
            cboxPeriodoModS.Enabled = false;
            tboxAnioModS.Enabled = false;

            tboxNombreFiscalEModS.Enabled = false;
            cboxRamoEModS.Enabled = false;
            cboxSectorEModS.Enabled = false;
            tboxRFCEModS.Enabled = false;
            tboxTelefonoEModS.Enabled = false;
            tboxFaxEModS.Enabled = false;
            cboxTamanioEmpresaEModS.Enabled = false;
            tboxMisionEModS.Enabled = false;
            tboxNombreTitularEModS.Enabled = false;
            tboxNombreAseExtEModS.Enabled = false;
            tboxPuestoAseExtEModS.Enabled = false;

            tboxCalleEModS.Enabled = false;
            tboxNumExtEModS.Enabled = false;
            tboxNumIntEModS.Enabled = false;
            tboxColoniaEModS.Enabled = false;
            tboxMunicipioEModS.Enabled = false;
            tboxCPEModS.Enabled = false;

            tboxNombreSEModS.Enabled = false;
            tboxPuestoSEModS.Enabled = false;
            tboxEmailSEModS.Enabled = false;
            tboxCelularSEModS.Enabled = false;
            tboxTelefonoOficSEModS.Enabled = false;

            tboxNombreRModS.Enabled = false;
            tboxSemestreRModS.Enabled = false;
            cboxCarreraRModS.Enabled = false;
            tboxNoControlRModS.Enabled = false;
            tboxEmailRModS.Enabled = false;
            cboxSeguridadSocialRModS.Enabled = false;
            tboxCualRModS.Enabled = false;
            tboxNSSRModS.Enabled = false;
            tboxTelefonoRModS.Enabled = false;
            tboxCelularRModS.Enabled = false;

            tboxCalleRModS.Enabled = false;
            tboxNumExtRModS.Enabled = false;
            tboxNumIntRModS.Enabled = false;
            tboxColoniaRModS.Enabled = false;
            tboxMunicipioRModS.Enabled = false;
            tboxCPRModS.Enabled = false;
        }

        private void LLenarSolicitud(String _IdRequest, String _IdUser)
        {
            Solicitud oSolicitud = new Solicitud(_IdRequest, _IdUser);

            tboxLugarS.Text = oSolicitud.Lugar;
            tboxFechaModS.Text = DateTime.Parse(oSolicitud.Fecha).ToString("dd/MM/yyyy");
            tboxNombreProyectoModS.Text = oSolicitud.NombreProyecto;
            cboxProcedenciaProyectoModS.SelectedValue = oSolicitud.IdProcedenciaProyecto;
            tboxNumeroResidentesModS.Text = oSolicitud.NumeroResidentes;
            cboxPeriodoModS.SelectedValue = oSolicitud.IdPeriod;
            tboxAnioModS.Text = oSolicitud.Anio;

            tboxNombreFiscalEModS.Text = oSolicitud.NombreEmpresa;
            cboxRamoEModS.SelectedValue = oSolicitud.IdRamoEmpresa;
            cboxSectorEModS.SelectedValue = oSolicitud.IdSectorEmpresa;
            tboxRFCEModS.Text = oSolicitud.RFCEmpresa;
            tboxTelefonoEModS.Text = oSolicitud.TelefonoOficEmpresa;
            tboxFaxEModS.Text = oSolicitud.FaxEmpresa;
            cboxTamanioEmpresaEModS.SelectedValue = oSolicitud.IdTamanioEmpresa;
            tboxMisionEModS.Text = oSolicitud.MisionEmpresa;
            tboxNombreTitularEModS.Text = oSolicitud.NombreTitularEmpresa;
            tboxNombreAseExtEModS.Text = oSolicitud.NombreAsesorExterno;
            tboxPuestoAseExtEModS.Text = oSolicitud.PuestoAsesorExterno;

            tboxCalleEModS.Text = oSolicitud.CalleEmpresa;
            tboxNumExtEModS.Text = oSolicitud.NumExteriorEmpresa;
            tboxNumIntEModS.Text = oSolicitud.NumInteriorEmpresa;
            tboxColoniaEModS.Text = oSolicitud.ColoniaEmpresa;
            tboxMunicipioEModS.Text = oSolicitud.MunicipioEmpresa;
            tboxCPEModS.Text = oSolicitud.CodigoPostalEmpresa;

            tboxNombreSEModS.Text = oSolicitud.NombrePSeguimiento;
            tboxPuestoSEModS.Text = oSolicitud.PuestoPSeguimiento;
            tboxEmailSEModS.Text = oSolicitud.EmailPSeguimiento;
            tboxCelularSEModS.Text = oSolicitud.CelularPSeguimiento;
            tboxTelefonoOficSEModS.Text = oSolicitud.TelefonoOficPSeguimiento;

            tboxNombreRModS.Text = oSolicitud.NombreUsuario;
            tboxSemestreRModS.Text = oSolicitud.SemestreUsuario;
            cboxCarreraRModS.SelectedValue = oSolicitud.IdCarreraUsuario;
            tboxNoControlRModS.Text = oSolicitud.NumeroControlUsuario;
            tboxEmailRModS.Text = oSolicitud.EmailUsuario;
            cboxSeguridadSocialRModS.SelectedValue = oSolicitud.IdSeguroSocialUsuario;
            tboxCualRModS.Text = oSolicitud.OtraSeguridadSocialUsuario;
            tboxNSSRModS.Text = oSolicitud.NSSUsuario;
            tboxTelefonoRModS.Text = oSolicitud.TelefonoUsuario;
            tboxCelularRModS.Text = oSolicitud.CelularUsuario;

            tboxCalleRModS.Text = oSolicitud.CalleUsuario;
            tboxNumExtRModS.Text = oSolicitud.NumeroExteriorUsuario;
            tboxNumIntRModS.Text = oSolicitud.NumeroInteriorUsuario;
            tboxColoniaRModS.Text = oSolicitud.ColoniaUsuario;
            tboxMunicipioRModS.Text = oSolicitud.MunicipioUsuario;
            tboxCPRModS.Text = oSolicitud.NumeroPostalUsuario;
        }

        private void GeneraExcel(DataTable _dtDatos)
        {
            oMensajes.RecuperarTablaMensajes("SolicitudesAdministrador.aspx");

            ExcelPackage ep = new ExcelPackage();
            ep.Workbook.Worksheets.Add("Hoja 1");
            ExcelWorksheet ew = ep.Workbook.Worksheets[0];

            //Titulo
            String sNombreReporte = oMensajes.TablaMensajes["lblTitulo"];
            ew.Cells["A1"].Value = sNombreReporte;
            ew.Cells["A1:AY1"].Merge = true;
            ew.Cells["A1"].Style.Font.Bold = true;
            ew.Cells["A1"].Style.Font.Size = 16;
            ew.Cells["A1"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;

            //Encabezados
            Color cFondoTitulo = System.Drawing.ColorTranslator.FromHtml("#003A63");
            Color cLetraTitulo = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");

            ew.Cells["A3"].Value = oMensajes.TablaMensajes["gvSolicitudes_NoControl"];
            ew.Cells["A3"].Style.Font.Bold = true;
            ew.Cells["A3:AY3"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
            ew.Cells["A3:AY3"].Style.Fill.BackgroundColor.SetColor(cFondoTitulo);
            ew.Cells["A3:AY3"].Style.Font.Bold = true;
            ew.Cells["A3:AY3"].Style.Font.Size = 13;
            ew.Cells["A3:AY3"].Style.Font.Color.SetColor(cLetraTitulo);
            ew.Cells["A3:AY3"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;

            ew.Cells["B3"].Value = oMensajes.TablaMensajes["gvSolicitudes_Alumno"];
            ew.Cells["C3"].Value = oMensajes.TablaMensajes["gvSolicitudes_Email"];
            ew.Cells["D3"].Value = oMensajes.TablaMensajes["gvSolicitudes_Periodo"];
            ew.Cells["E3"].Value = oMensajes.TablaMensajes["gvSolicitudes_Estatus"];
            ew.Cells["F3"].Value = oMensajes.TablaMensajes["gvSolicitudes_ComentarioCancelacion"];
            ew.Cells["G3"].Value = oMensajes.TablaMensajes["lblLugarModS"];
            ew.Cells["H3"].Value = oMensajes.TablaMensajes["lblFechaModS"];
            ew.Cells["I3"].Value = oMensajes.TablaMensajes["lblNombreProyectoModS"];
            ew.Cells["J3"].Value = oMensajes.TablaMensajes["lblProcedenciaProyectoModS"];
            ew.Cells["K3"].Value = oMensajes.TablaMensajes["lblNumeroResidentesModS"];
            ew.Cells["L3"].Value = oMensajes.TablaMensajes["lblPeriodoModS"];
            ew.Cells["M3"].Value = oMensajes.TablaMensajes["lblAnioModS"];
            ew.Cells["N3"].Value = oMensajes.TablaMensajes["lblNombreFiscalEModS"];
            ew.Cells["O3"].Value = oMensajes.TablaMensajes["lblRamoEModS"];
            ew.Cells["P3"].Value = oMensajes.TablaMensajes["lblSectorEModS"];
            ew.Cells["Q3"].Value = oMensajes.TablaMensajes["lblRFCEModS"];
            ew.Cells["R3"].Value = oMensajes.TablaMensajes["lblTelefonoEModS"];
            ew.Cells["S3"].Value = oMensajes.TablaMensajes["lblFaxEModS"];
            ew.Cells["T3"].Value = oMensajes.TablaMensajes["lblTamanioEmpresaEModS"];
            ew.Cells["U3"].Value = oMensajes.TablaMensajes["lblMisionEModS"];
            ew.Cells["V3"].Value = oMensajes.TablaMensajes["lblNombreTitularEModS"];
            ew.Cells["W3"].Value = oMensajes.TablaMensajes["lblNombreAseExtEModS"];
            ew.Cells["X3"].Value = oMensajes.TablaMensajes["lblPuestoAseExtEModS"];
            ew.Cells["Y3"].Value = oMensajes.TablaMensajes["lblCalleEModS"];
            ew.Cells["Z3"].Value = oMensajes.TablaMensajes["lblNumExtEModS"];
            ew.Cells["AA3"].Value = oMensajes.TablaMensajes["lblNumIntEModS"];
            ew.Cells["AB3"].Value = oMensajes.TablaMensajes["lblColoniaEModS"];
            ew.Cells["AC3"].Value = oMensajes.TablaMensajes["lblMunicipioEModS"];
            ew.Cells["AD3"].Value = oMensajes.TablaMensajes["lblCPEModS"];
            ew.Cells["AE3"].Value = oMensajes.TablaMensajes["lblNombreSEModS"];
            ew.Cells["AF3"].Value = oMensajes.TablaMensajes["lblPuestoSEModS"];
            ew.Cells["AG3"].Value = oMensajes.TablaMensajes["lblEmailSEModS"];
            ew.Cells["AH3"].Value = oMensajes.TablaMensajes["lblCelularSEModS"];
            ew.Cells["AI3"].Value = oMensajes.TablaMensajes["lblTelefonoOficSEModS"];
            ew.Cells["AJ3"].Value = oMensajes.TablaMensajes["lblNombreRModS"];
            ew.Cells["AK3"].Value = oMensajes.TablaMensajes["lblSemestreRModS"];
            ew.Cells["AL3"].Value = oMensajes.TablaMensajes["lblCarreraRModS"];
            ew.Cells["AM3"].Value = oMensajes.TablaMensajes["lblNoControlRModS"];
            ew.Cells["AN3"].Value = oMensajes.TablaMensajes["lblEmailRModS"];
            ew.Cells["AO3"].Value = oMensajes.TablaMensajes["lblSeguridadSocialRModS"];
            ew.Cells["AP3"].Value = oMensajes.TablaMensajes["lblCualRModS"];
            ew.Cells["AQ3"].Value = oMensajes.TablaMensajes["lblNSSRModS"];
            ew.Cells["AR3"].Value = oMensajes.TablaMensajes["lblTelefonoRModS"];
            ew.Cells["AS3"].Value = oMensajes.TablaMensajes["lblCelularRModS"];
            ew.Cells["AT3"].Value = oMensajes.TablaMensajes["lblCalleRModS"];
            ew.Cells["AU3"].Value = oMensajes.TablaMensajes["lblNumExtRModS"];
            ew.Cells["AV3"].Value = oMensajes.TablaMensajes["lblNumIntRModS"];
            ew.Cells["AW3"].Value = oMensajes.TablaMensajes["lblColoniaRModS"];
            ew.Cells["AX3"].Value = oMensajes.TablaMensajes["lblMunicipioRModS"];
            ew.Cells["AY3"].Value = oMensajes.TablaMensajes["lblCPRModS"];

            //Detalle            
            int i = 4;
            foreach (DataRow dr in _dtDatos.Rows)
            {
                ew.Cells["A" + i.ToString()].Value = dr["NumeroControResidente"];
                ew.Cells["B" + i.ToString()].Value = dr["NombreResidente"];
                ew.Cells["C" + i.ToString()].Value = dr["EmailResidente"];
                ew.Cells["D" + i.ToString()].Value = dr["PeriodoProyectado"];
                ew.Cells["E" + i.ToString()].Value = dr["EstatusSolicitud"];
                ew.Cells["F" + i.ToString()].Value = dr["ComentarioCancelacion"];
                ew.Cells["G" + i.ToString()].Value = dr["Lugar"];
                ew.Cells["H" + i.ToString()].Value = dr["Fecha"];
                ew.Cells["I" + i.ToString()].Value = dr["NombreProyecto"];
                ew.Cells["J" + i.ToString()].Value = dr["ProcedenciaDelProyecto"];
                ew.Cells["K" + i.ToString()].Value = dr["NumeroResidentes"];
                ew.Cells["L" + i.ToString()].Value = dr["PeriodoProyectado"];
                ew.Cells["M" + i.ToString()].Value = dr["Anio"];
                ew.Cells["N" + i.ToString()].Value = dr["NombreEmpresa"];
                ew.Cells["O" + i.ToString()].Value = dr["RamoEmpresa"];
                ew.Cells["P" + i.ToString()].Value = dr["SectorEmpresa"];
                ew.Cells["Q" + i.ToString()].Value = dr["RFCEmpresa"];
                ew.Cells["R" + i.ToString()].Value = dr["TelefonoOficina"];
                ew.Cells["S" + i.ToString()].Value = dr["FaxEmpresa"];
                ew.Cells["T" + i.ToString()].Value = dr["TamanioEmpresa"];
                ew.Cells["U" + i.ToString()].Value = dr["MisionEmpresa"];
                ew.Cells["V" + i.ToString()].Value = dr["NombreTitular"];
                ew.Cells["W" + i.ToString()].Value = dr["NombreAsesorExterno"];
                ew.Cells["X" + i.ToString()].Value = dr["PuestoAsesorExterno"];
                ew.Cells["Y" + i.ToString()].Value = dr["CalleEmpresa"];
                ew.Cells["Z" + i.ToString()].Value = dr["NumeroExteriorEmpresa"];
                ew.Cells["AA" + i.ToString()].Value = dr["NumeroInteriorEmpresa"];
                ew.Cells["AB" + i.ToString()].Value = dr["ColoniaEmpresa"];
                ew.Cells["AC" + i.ToString()].Value = dr["MunicipioEmpresa"];
                ew.Cells["AD" + i.ToString()].Value = dr["NumeroPostalEmpresa"];
                ew.Cells["AE" + i.ToString()].Value = dr["NombrePSeguimiento"];
                ew.Cells["AF" + i.ToString()].Value = dr["PuestoPSeguimiento"];
                ew.Cells["AG" + i.ToString()].Value = dr["EmailPSeguimiento"];
                ew.Cells["AH" + i.ToString()].Value = dr["CelularPSeguimiento"];
                ew.Cells["AI" + i.ToString()].Value = dr["TelefonoPSeguimiento"];
                ew.Cells["AJ" + i.ToString()].Value = dr["NombreResidente"];
                ew.Cells["AK" + i.ToString()].Value = dr["SemestreResidente"];
                ew.Cells["AL" + i.ToString()].Value = dr["CarreraResidente"];
                ew.Cells["AM" + i.ToString()].Value = dr["NumeroControResidente"];
                ew.Cells["AN" + i.ToString()].Value = dr["EmailResidente"];
                ew.Cells["AO" + i.ToString()].Value = dr["SeguridadSocialResidente"];
                ew.Cells["AP" + i.ToString()].Value = dr["OtraSeguridadSocialResidente"];
                ew.Cells["AQ" + i.ToString()].Value = dr["NSSResidente"];
                ew.Cells["AR" + i.ToString()].Value = dr["TelefonoResidente"];
                ew.Cells["AS" + i.ToString()].Value = dr["CelularResidente"];
                ew.Cells["AT" + i.ToString()].Value = dr["CalleResidente"];
                ew.Cells["AU" + i.ToString()].Value = dr["NumeroExteriorResidente"];
                ew.Cells["AV" + i.ToString()].Value = dr["NumeroInteriorResidente"];
                ew.Cells["AW" + i.ToString()].Value = dr["ColoniaResidente"];
                ew.Cells["AX" + i.ToString()].Value = dr["MunicipioResidente"];
                ew.Cells["AY" + i.ToString()].Value = dr["NumeroPostalResidente"];

                i++;
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