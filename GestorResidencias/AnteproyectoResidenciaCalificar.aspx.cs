using GestorResidencias.Clases;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorResidencias
{
    public partial class AnteproyectoResidenciaCalificar : System.Web.UI.Page
    {
        #region Variables
        private Mensajes oMensajes = new Mensajes();
        private String[] sParametros;
        public StringBuilder sDetalleActividadCal = new StringBuilder();
        public StringBuilder sMisComentarios = new StringBuilder();
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
                    || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Maestro.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.EncargadoDeResidencias.ToString())
                {
                    if (IsPostBack == false)
                    {
                        ConfiguraPagina();
                        LlenarCombos();

                        try
                        {
                            if (Session["sAnteproyectoCalificar"] != null)
                            {
                                sParametros = Session["sAnteproyectoCalificar"].ToString().Split('|');
                                /*Respaldar la variable de parametros solo para la eliminacion de comentarios*/
                                ViewState["sParametros"] = Session["sAnteproyectoCalificar"].ToString().Replace('|', ',');
                                Session["sAnteproyectoCalificar"] = null;

                                String _sIdPreliminaryDraft = sParametros[0];
                                String _sidUser = sParametros[1];
                                String _sAccion = sParametros[2];

                                ViewState["IdPreliminaryDraft"] = _sIdPreliminaryDraft;
                                ViewState["IdUser"] = _sidUser;
                                ViewState["Accion"] = _sAccion;

                                RecuperaEdicion(_sIdPreliminaryDraft, _sidUser);
                                DeshabilitarComponentes();

                                switch (_sAccion)
                                {
                                    case "Revision":
                                        btnCalificarJefeC.Visible = true;
                                        btnCalificarJefeC.Enabled = true;
                                        ViewState["IdTeachers"] = sParametros[3];
                                        ObtieneTodosLosComentarios(sParametros[3], _sIdPreliminaryDraft);
                                        break;
                                    case "Calificar":
                                        btnCalificar.Visible = true;
                                        btnCalificar.Enabled = true;
                                        ViewState["IdTeachersDet"] = sParametros[3];
                                        ObtieneMisComentariosMaestro(sParametros[3], _sIdPreliminaryDraft);
                                        break;
                                    case "Ver":
                                        ViewState["IdTeachersDet"] = sParametros[3];
                                        ObtieneMisComentariosMaestro(sParametros[3], _sIdPreliminaryDraft);
                                        divBotones.Visible = false;
                                        break;
                                    case "VerSinComentario":
                                        ViewState["IdTeachersDet"] = sParametros[3];
                                        divBotones.Visible = false;
                                        oMensajes.MuestraMensaje(this, "Precaución", "El anteproyecto ya fue calificado por el jefe de carrera, ya no puedes asignar una calificación.", Mensajes.TipoMensaje.Precaucion);
                                        break;
                                    case "VerConComentarios":
                                        ViewState["IdTeachers"] = sParametros[3];
                                        ObtieneTodosLosComentarios(sParametros[3], _sIdPreliminaryDraft);
                                        divBotones.Visible = false;
                                        break;
                                    default:
                                        break;
                                }
                            }
                            else
                            {
                                Response.Redirect("ModuloAdministrador.aspx");
                            }

                            ObtieneActividades();
                            ObtieneActividadesDetalle();
                        }
                        catch (Exception ex)
                        {
                            oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
                        }
                    }

                    ConfiguraGrid();

                    sMisComentarios = (StringBuilder)ViewState["sMisComentarios"];
                    if (sMisComentarios == null)
                    {
                        sMisComentarios = new StringBuilder();
                        sMisComentarios.AppendLine("");
                    }

                    if (Request.Form["ibtnEliminar"] != null)
                    {
                        if (!(Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Maestro.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString()))
                        {
                            oMensajes.MuestraMensaje(this.Page, "Error", "No tienes los permisos para esta opcion", Mensajes.TipoMensaje.Error);
                            return;
                        }

                        String[] sIds = Request.Form["ibtnEliminar"].ToString().Split('|');

                        Anteproyecto oAnteproyectos = new Anteproyecto(sIds[2]);

                        if (oAnteproyectos.IdTipoEstado == Enums.EstatusAnteproyecto.Enviado.ToString() || oAnteproyectos.IdTipoEstado == Enums.EstatusAnteproyecto.EnProceso.ToString() ||
                            oAnteproyectos.IdTipoEstado == Enums.EstatusAnteproyecto.RevisionesCompletas.ToString())
                        {
                            oMensajes.MuestraMensajeConRespuesta(this, "Información", "Seguro que deseas eliminar tu calificacion?, los cambios realizados no se pueden revertir.", Mensajes.TipoMensaje.Precaucion, "EliminarComentario", Request.Form["ibtnEliminar"].ToString() + "|" + ViewState["sParametros"].ToString());
                        }
                        else
                        {
                            oMensajes.MuestraMensaje(this, "Precaución", "El anteproyecto ya fue calificado por el jefe de carrera, ya no puedes eliminar tu calificacion.", Mensajes.TipoMensaje.Precaucion);
                        }
                    }
                    else if (Request.Form["ibtnEditar"] != null)
                    {
                        String[] sIds = Request.Form["ibtnEditar"].ToString().Split('|');
                        LimpiarModalComentario();

                        ViewState["IdComment"] = sIds[0];

                        cboxEstatusMod.SelectedValue = sIds[1];
                        tboxComentariosMod.Text = sIds[2];
                        cboxEstatusMod_SelectedIndexChanged(null, null);

                        modAgregarComentario.Show();
                    }
                    else if (Request.Form["ibtnEliminarJC"] != null)
                    {
                        if (!(Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString()))
                        {
                            oMensajes.MuestraMensaje(this.Page, "Error", "No tienes los permisos para esta opcion", Mensajes.TipoMensaje.Error);
                            return;
                        }

                        oMensajes.MuestraMensajeConRespuesta(this, "Información", "Seguro que deseas eliminar tu calificacion?, los cambios realizados no se pueden revertir.", Mensajes.TipoMensaje.Precaucion, "EliminarComentarioJefeCarrera", Request.Form["ibtnEliminarJC"].ToString() + "|" + ViewState["sParametros"].ToString());
                    }
                    else if (Request.Form["ibtnEditarJC"] != null)
                    {
                        String[] sIds = Request.Form["ibtnEditarJC"].ToString().Split('|');
                        LimpiarModalComentario();

                        ViewState["IdQualification"] = sIds[0];

                        cboxEstatusModJC.SelectedValue = sIds[1];
                        tboxComentariosModJC.Text = sIds[2];
                        cboxEstatusModJC_SelectedIndexChanged(null, null);

                        LlenarComentariosModal(ViewState["IdTeachers"].ToString(), ViewState["IdPreliminaryDraft"].ToString());
                        modAgregarComentarioJC.Show();
                    }
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
            }
        }

        protected void ibtnRetroceder_Click(object sender, ImageClickEventArgs e)
        {
            if(Session["VieneDeVista"] != null)
            {
                Response.Redirect(Session["VieneDeVista"].ToString());
            }
            else
            {
                Response.Redirect("ModuloAdministrador.aspx");
            }
        }

        protected void btnCalificar_Click(object sender, EventArgs e)
        {
            if (!(Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Maestro.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString()))
            {
                oMensajes.MuestraMensaje(this.Page, "Error", "No tienes los permisos para esta opcion", Mensajes.TipoMensaje.Error);
                return;
            }

            LimpiarModalComentario();
            ViewState["IdComment"] = Generales.ObtieneNuevoID();
            if (!MaestroResidencia.ValidaExisteComentarioGuardadoMaestros(ViewState["IdTeachersDet"].ToString(), ViewState["IdPreliminaryDraft"].ToString(), ViewState["IdComment"].ToString()))
            {
                rfvComentariosMod.Enabled = true;
                modAgregarComentario.Show();
            }
            else
            {
                ViewState["IdComment"] = null;
                oMensajes.MuestraMensaje(this, "Error", "Ya hiciste un comentario, no puedes crear mas de uno.", Mensajes.TipoMensaje.Error);
            }
        }

        protected void btnCalificarJefeC_Click(object sender, EventArgs e)
        {
            if (!(Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString()))
            {
                oMensajes.MuestraMensaje(this.Page, "Error", "No tienes los permisos para esta opcion", Mensajes.TipoMensaje.Error);
                return;
            }

            LimpiarModalComentarioJefeCarrera();
            ViewState["IdQualification"] = Generales.ObtieneNuevoID();

            if (!MaestroResidencia.ValidaExisteComentearioJefeCarrera(ViewState["IdPreliminaryDraft"].ToString(), ViewState["IdQualification"].ToString()))
            {
                rfvComentariosModJC.Enabled = true;
                modAgregarComentarioJC.Show();
            }
            else
            {
                ViewState["IdQualification"] = null;
                oMensajes.MuestraMensaje(this, "Error", "Ya calificaste el anteproyecto, no puedes hacer mas de una.", Mensajes.TipoMensaje.Error);
            }

            LlenarComentariosModal(ViewState["IdTeachers"].ToString(), ViewState["IdPreliminaryDraft"].ToString());
        }

        #region Modal Agregar Calificacion Maestros
        protected void cboxEstatusMod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(cboxEstatusMod.SelectedValue == Enums.EstatusAnteproyectoCalificacion.Aprobado.ToString())
            {
                rfvComentariosMod.Enabled = false;
            }
            else
            {
                rfvComentariosMod.Enabled = true;
            }
        }

        protected void btnCancelarMod_Click(object sender, EventArgs e)
        {
            ViewState["IdComment"] = null;
            modAgregarComentario.Hide();
        }

        protected void btnAceptarMod_Click(object sender, EventArgs e)
        {
            try
            {
                if (!(Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Maestro.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString()))
                {
                    oMensajes.MuestraMensaje(this.Page, "Error", "No tienes los permisos para esta opcion", Mensajes.TipoMensaje.Error);
                    return;
                }

                if (MaestroResidencia.ValidaExisteComentarioGuardadoMaestros(ViewState["IdTeachersDet"].ToString(), ViewState["IdPreliminaryDraft"].ToString(), ViewState["IdComment"].ToString()))
                {
                    oMensajes.MuestraMensaje(this, "Error", "Ya hiciste un comentario, no puedes crear mas de uno.", Mensajes.TipoMensaje.Error);
                    return;
                }

                Anteproyecto oAntroproyectos = new Anteproyecto(ViewState["IdPreliminaryDraft"].ToString(), ViewState["IdUser"].ToString());

                if(oAntroproyectos.IdTipoEstado == Enums.EstatusAnteproyecto.Enviado.ToString() || oAntroproyectos.IdTipoEstado == Enums.EstatusAnteproyecto.EnProceso.ToString() ||
                    oAntroproyectos.IdTipoEstado == Enums.EstatusAnteproyecto.RevisionesCompletas.ToString())
                {
                    /*Condicional para cambiar el estatus de "Enviado" a "En proceso".*/
                    if (oAntroproyectos.IdTipoEstado == Enums.EstatusAnteproyecto.Enviado.ToString())
                    {
                        Anteproyecto.ActualizaEstatusAnteproyecto(ViewState["IdPreliminaryDraft"].ToString(), Enums.EstatusAnteproyecto.EnProceso.ToString());
                    }

                    MaestroResidencia.InsertaActualizaComentarioMaestros(ViewState["IdComment"].ToString(), ViewState["IdTeachersDet"].ToString(), ViewState["IdPreliminaryDraft"].ToString(), tboxComentariosMod.Text, cboxEstatusMod.SelectedValue);

                    /*Condicional para cambiar el estatus a "revisiones completas", comparando la revision actual con el numero de 
                        revisiones totales de los maestros.*/
                    if (Anteproyecto.ObtieneRevisiones(ViewState["IdPreliminaryDraft"].ToString()) == Anteproyecto.ObtieneRevisionesTotales(ViewState["IdPreliminaryDraft"].ToString()))
                    {
                        Anteproyecto.ActualizaEstatusAnteproyecto(ViewState["IdPreliminaryDraft"].ToString(), Enums.EstatusAnteproyecto.RevisionesCompletas.ToString());
                    }

                    modAgregarComentario.Hide();
                    ObtieneMisComentariosMaestro(ViewState["IdTeachersDet"].ToString(), ViewState["IdPreliminaryDraft"].ToString());
                }
                else
                {
                    oMensajes.MuestraMensaje(this, "Precaución", "El anteproyecto ya fue calificado por el jefe de carrera, ya no puedes asignar una calificación.", Mensajes.TipoMensaje.Precaucion);
                }
                
            }
            catch(Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }
        #endregion

        #region Modal Asignar Calificacion Final
        protected void cboxEstatusModJC_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboxEstatusModJC.SelectedValue == Enums.EstatusAnteproyectoCalificacion.Aprobado.ToString())
            {
                rfvComentariosModJC.Enabled = false;
            }
            else
            {
                rfvComentariosModJC.Enabled = true;
            }
        }

        protected void gvComentariosModJC_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {

            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton ibtnTrascribir = (ImageButton)e.Row.Cells[6].Controls[1];
                ibtnTrascribir.ID = "ibtnTrascribir";
                ibtnTrascribir.CommandName = "ibtnTrascribir";
                ibtnTrascribir.ImageUrl = "~//Assets//Imagenes//Principal//Editar.png";
            }
        }

        protected void gvComentariosModJC_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "ibtnTrascribir")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvComentariosModJC.Rows[index];

                    String _sComentario = gvComentariosModJC.DataKeys[index].Values[0].ToString();

                    tboxComentariosModJC.Text += _sComentario + "\n\n";
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        protected void btnCancelarModJC_Click(object sender, EventArgs e)
        {
            ViewState["IdQualification"] = null;
            modAgregarComentarioJC.Hide();
        }

        protected void btnAceptarModJC_Click(object sender, EventArgs e)
        {
            try
            {
                if (!(Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString()))
                {
                    oMensajes.MuestraMensaje(this.Page, "Error", "No tienes los permisos para esta opcion", Mensajes.TipoMensaje.Error);
                    return;
                }

                if (MaestroResidencia.ValidaExisteComentearioJefeCarrera(ViewState["IdPreliminaryDraft"].ToString(), ViewState["IdQualification"].ToString()))
                {
                    oMensajes.MuestraMensaje(this, "Error", "Ya hiciste un comentario, no puedes crear mas de uno.", Mensajes.TipoMensaje.Error);
                    return;
                }

                MaestroResidencia.InsertaActualizaComentarioJefeCarrera(ViewState["IdQualification"].ToString(), ViewState["IdPreliminaryDraft"].ToString(), cboxEstatusModJC.SelectedValue, tboxComentariosModJC.Text);
                Anteproyecto.ActualizaEstatusAnteproyecto(ViewState["IdPreliminaryDraft"].ToString(), Enums.EstatusAnteproyecto.Calificado.ToString());

                NotificarEvaluadroesDeAnteproyecto(ViewState["IdTeachers"].ToString(), ViewState["IdPreliminaryDraft"].ToString(), tboxNombreP.Text);
                ObtieneTodosLosComentarios(ViewState["IdTeachers"].ToString(), ViewState["IdPreliminaryDraft"].ToString());
                modAgregarComentarioJC.Hide();
                
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }
        #endregion
        
        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("AnteproyectoResidencia.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            ibtnRetroceder.ImageUrl = "~//Assets//Imagenes//Principal//FlechaRetroceder.png";
            ibtnRetroceder.Width = 40;
            ibtnRetroceder.CausesValidation = false;

            lblPeriodo.Text = oMensajes.TablaMensajes["lblPeriodo"];
            lblAnio.Text = oMensajes.TablaMensajes["lblAnio"];
            lblNombreP.Text = oMensajes.TablaMensajes["lblNombreP"];
            lblObjetivoP.Text = oMensajes.TablaMensajes["lblObjetivoP"];
            lblJustificacion.Text = oMensajes.TablaMensajes["lblJustificacion"];
            lblCronograma.Text = oMensajes.TablaMensajes["lblCronograma"];
            lblDescripcionDet.Text = oMensajes.TablaMensajes["lblDescripcionDet"];
            lblAlcanceP.Text = oMensajes.TablaMensajes["lblAlcanceP"];
            lblLugar.Text = oMensajes.TablaMensajes["lblLugar"];
            lblInformacionEmpresa.Text = oMensajes.TablaMensajes["lblInformacionEmpresa"];

            gvCronograma.HeaderStyle.Wrap = true;
            gvCronograma.RowStyle.Wrap = true;
            gvCronograma.EmptyDataText = "No se encontraron resgistros";
            gvCronograma.Columns[0].Visible = false;
            gvCronograma.Columns[1].Visible = false;
            gvCronograma.Columns[2].HeaderText = oMensajes.TablaMensajes["gvCronograma_NombreActividad"];
            gvCronograma.Columns[3].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana1"];
            gvCronograma.Columns[4].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana2"];
            gvCronograma.Columns[5].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana3"];
            gvCronograma.Columns[6].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana4"];
            gvCronograma.Columns[7].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana5"];
            gvCronograma.Columns[8].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana6"];
            gvCronograma.Columns[9].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana7"];
            gvCronograma.Columns[10].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana8"];
            gvCronograma.Columns[11].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana9"];
            gvCronograma.Columns[12].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana10"];
            gvCronograma.Columns[13].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana11"];
            gvCronograma.Columns[14].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana12"];
            gvCronograma.Columns[15].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana13"];
            gvCronograma.Columns[16].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana14"];
            gvCronograma.Columns[17].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana15"];
            gvCronograma.Columns[18].HeaderText = oMensajes.TablaMensajes["gvCronograma_Semana16"];
            gvCronograma.Columns[19].Visible = false;

            for (int i = 0; i < gvCronograma.Columns.Count; i++)
            {
                gvCronograma.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvCronograma.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }

            lblNombreE.Text = oMensajes.TablaMensajes["lblNombreE"];
            lblTelefonoE.Text = oMensajes.TablaMensajes["lblTelefonoE"];
            lblGiroE.Text = oMensajes.TablaMensajes["lblGiroE"];
            lblDepartamentoE.Text = oMensajes.TablaMensajes["lblDepartamentoE"];
            lblNombreGerenteE.Text = oMensajes.TablaMensajes["lblNombreGerenteE"];
            lblJefeAreaE.Text = oMensajes.TablaMensajes["lblJefeAreaE"];
            lblDomicilioE.Text = oMensajes.TablaMensajes["lblDomicilioE"];
            lblCalleE.Text = oMensajes.TablaMensajes["lblCalleE"];
            lblNumExtE.Text = oMensajes.TablaMensajes["lblNumExtE"];
            lblNumIntE.Text = oMensajes.TablaMensajes["lblNumIntE"];
            lblColoniaE.Text = oMensajes.TablaMensajes["lblColoniaE"];
            lblMunicipioE.Text = oMensajes.TablaMensajes["lblMunicipioE"];
            lblCiudadE.Text = oMensajes.TablaMensajes["lblCiudadE"];
            lblCPE.Text = oMensajes.TablaMensajes["lblCPE"];
            lblEstadoE.Text = oMensajes.TablaMensajes["lblEstadoE"];

            lblDatosR.Text = oMensajes.TablaMensajes["lblDatosR"];
            lblNumControlR.Text = oMensajes.TablaMensajes["lblNumControlR"];
            lblCarreraR.Text = oMensajes.TablaMensajes["lblCarreraR"];
            lblNombreR.Text = oMensajes.TablaMensajes["lblNombreR"];
            lblTelefonoR.Text = oMensajes.TablaMensajes["lblTelefonoR"];
            lblEmailR.Text = oMensajes.TablaMensajes["lblEmailR"];

            btnCalificar.Text = oMensajes.TablaMensajes["btnCalificar"];
            btnCalificar.ForeColor = System.Drawing.Color.White;
            btnCalificar.Font.Bold = true;
            btnCalificar.CausesValidation = false;
            btnCalificar.Enabled = false;
            btnCalificar.Visible = false;

            btnCalificarJefeC.Text = oMensajes.TablaMensajes["btnCalificarJefeC"];
            btnCalificarJefeC.ForeColor = System.Drawing.Color.White;
            btnCalificarJefeC.Font.Bold = true;
            btnCalificarJefeC.CausesValidation = false;
            btnCalificarJefeC.Enabled = false;
            btnCalificarJefeC.Visible = false;

            #region Modal Agregar Comentarios
            lblDescripcionModuloModC.Text = oMensajes.TablaMensajes["lblDescripcionModuloModC"];

            lblEstatusMod.Text = oMensajes.TablaMensajes["lblEstatusMod"];
            rfvEstatusMod.Text = "Campo Obligatorio";

            lblComentarioMod.Text = oMensajes.TablaMensajes["lblComentarioMod"];
            rfvComentariosMod.Text = "Campo Obligatorio";

            btnCancelarMod.Text = oMensajes.TablaMensajes["btnCancelarMod"];
            btnCancelarMod.ForeColor = System.Drawing.Color.White;
            btnCancelarMod.Font.Bold = true;
            btnCancelarMod.CausesValidation = false;

            btnAceptarMod.Text = oMensajes.TablaMensajes["btnAceptarMod"];
            btnAceptarMod.ForeColor = System.Drawing.Color.White;
            btnAceptarMod.Font.Bold = true;
            #endregion

            #region Modal Asignar Calificacion Final
            lblDescripcionModuloModJC.Text = oMensajes.TablaMensajes["lblDescripcionModuloModJC"];

            lblEstatusModJC.Text = oMensajes.TablaMensajes["lblEstatusModJC"];
            rfvEstatusModJC.Text = "Campo Obligatorio";

            lblComentarioModJC.Text = oMensajes.TablaMensajes["lblComentarioModJC"];
            rfvComentariosModJC.Text = "Campo Obligatorio";

            gvComentariosModJC.HeaderStyle.Wrap = true;
            gvComentariosModJC.RowStyle.Wrap = true;
            gvComentariosModJC.EmptyDataText = "No se encontraron resgistros";
            gvComentariosModJC.Columns[0].Visible = false;
            gvComentariosModJC.Columns[1].Visible = false;
            gvComentariosModJC.Columns[2].Visible = false;
            gvComentariosModJC.Columns[3].HeaderText = oMensajes.TablaMensajes["gvComentariosModJC_NombreMaestro"];
            gvComentariosModJC.Columns[4].HeaderText = oMensajes.TablaMensajes["gvComentariosModJC_Comentario"];
            gvComentariosModJC.Columns[5].HeaderText = oMensajes.TablaMensajes["gvComentariosModJC_EstadoAnteproyectos"];
            gvComentariosModJC.Columns[6].HeaderText = oMensajes.TablaMensajes["gvComentariosModJC_TranscribirTexto"];

            for (int i = 0; i < gvComentariosModJC.Columns.Count; i++)
            {
                gvComentariosModJC.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvComentariosModJC.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }

            btnCancelarModJC.Text = oMensajes.TablaMensajes["btnCancelarModJC"];
            btnCancelarModJC.ForeColor = System.Drawing.Color.White;
            btnCancelarModJC.Font.Bold = true;
            btnCancelarModJC.CausesValidation = false;

            btnAceptarModJC.Text = oMensajes.TablaMensajes["btnAceptarModJC"];
            btnAceptarModJC.ForeColor = System.Drawing.Color.White;
            btnAceptarModJC.Font.Bold = true;
            #endregion
        }

        private void ConfiguraGrid()
        {
            gvCronograma.Columns[2].ControlStyle.Width = 300;

            gvComentariosModJC.Columns[3].ControlStyle.Width = 150;
            gvComentariosModJC.Columns[4].ControlStyle.Width = 400;
            gvComentariosModJC.Columns[5].ControlStyle.Width = 100;
        }

        private void LlenarCombos()
        {
            cboxCarreraR.DataTextField = "Name";
            cboxCarreraR.DataValueField = "IdValueDetail";
            cboxCarreraR.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Carreras");
            cboxCarreraR.DataBind();
            cboxCarreraR.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxCarreraR.SelectedIndex = 0;

            cboxPeriodo.DataTextField = "Name";
            cboxPeriodo.DataValueField = "IdValueDetail";
            cboxPeriodo.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Periodo");
            cboxPeriodo.DataBind();
            cboxPeriodo.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxPeriodo.SelectedIndex = 0;

            cboxEstatusMod.DataTextField = "Name";
            cboxEstatusMod.DataValueField = "IdValueDetail";
            cboxEstatusMod.DataSource = ValoresPorReferencia.RecuperaValorReferenciaOmitiendoDato("EstatusAnteproyectoCalificacion", "1");
            cboxEstatusMod.DataBind();
            cboxEstatusMod.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxEstatusMod.SelectedIndex = 0;

            cboxEstatusModJC.DataTextField = "Name";
            cboxEstatusModJC.DataValueField = "IdValueDetail";
            cboxEstatusModJC.DataSource = ValoresPorReferencia.RecuperaValorReferenciaOmitiendoDato("EstatusAnteproyectoCalificacion", "1");
            cboxEstatusModJC.DataBind();
            cboxEstatusModJC.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxEstatusModJC.SelectedIndex = 0;
        }

        private void RecuperaEdicion(String _sIdPreliminaryDraft, String _sIdUser)
        {
            try
            {
                Anteproyecto oAnteproyecto = new Anteproyecto(_sIdPreliminaryDraft, _sIdUser);

                cboxPeriodo.SelectedValue = oAnteproyecto.IdPeriod;
                tboxAnio.Text = oAnteproyecto.Anio;
                tboxNombreP.Text = oAnteproyecto.Nombre;
                tboxObjetivoP.Text = oAnteproyecto.Objetivo;
                tboxJustificacion.Text = oAnteproyecto.Justificacion;
                tboxAlcanceP.Text = oAnteproyecto.AlcanceProyecto;
                tboxLugarP.Text = oAnteproyecto.Lugar;
                tboxNombreE.Text = oAnteproyecto.NombreEmpresa;
                tboxGiroE.Text = oAnteproyecto.GiroEmpresa;
                tboxDepartamentoE.Text = oAnteproyecto.DepartamentoEmpresa;
                tboxTelefonoE.Text = oAnteproyecto.TelefonoOficinaEmpresa;
                tboxNombreGerenteE.Text = oAnteproyecto.DuenioEmpresa;
                tboxJefeAreaE.Text = oAnteproyecto.JefeAreaEmpresa;
                tboxCalleE.Text = oAnteproyecto.CalleEmpresa;
                tboxNumExtE.Text = oAnteproyecto.NumeroExteriorEmpresa;
                tboxNumIntE.Text = oAnteproyecto.NumeroInteriorEmpresa;
                tboxColoniaE.Text = oAnteproyecto.ColoniaEmpresa;
                tboxMunicipioE.Text = oAnteproyecto.MunicipioEmpresa;
                tboxCPE.Text = oAnteproyecto.CodigoPostaEmpresa;
                tboxCiudadE.Text = oAnteproyecto.CiudadEmpresa;
                tboxEstadoE.Text = oAnteproyecto.EstadoEmpresa;

                tboxNumControlR.Text = oAnteproyecto.NumeroControlUsuario;
                cboxCarreraR.SelectedValue = oAnteproyecto.IdCareerUsuario;
                tboxNombreR.Text = oAnteproyecto.NombreUsuario;
                tboxTelefonoR.Text = oAnteproyecto.CelularUsuario;
                tboxEmailR.Text = oAnteproyecto.EmailUsuario;
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        private void DeshabilitarComponentes()
        {
            cboxPeriodo.Enabled = false;
            tboxAnio.Enabled = false;
            tboxNombreP.Enabled = false;
            tboxObjetivoP.Enabled = false;
            tboxJustificacion.Enabled = false;
            
            gvCronograma.Enabled = false;

            tboxAlcanceP.Enabled = false;
            tboxLugarP.Enabled = false;
            tboxNombreE.Enabled = false;
            tboxCiudadE.Enabled = false;
            tboxCPE.Enabled = false;
            tboxEstadoE.Enabled = false;
            tboxTelefonoE.Enabled = false;
            tboxGiroE.Enabled = false;
            tboxDepartamentoE.Enabled = false;
            tboxNombreGerenteE.Enabled = false;
            tboxJefeAreaE.Enabled = false;
            tboxCalleE.Enabled = false;
            tboxNumExtE.Enabled = false;
            tboxNumIntE.Enabled = false;
            tboxColoniaE.Enabled = false;
            tboxMunicipioE.Enabled = false;

            tboxNumControlR.Enabled = false;
            cboxCarreraR.Enabled = false;
            tboxNombreR.Enabled = false;
            tboxTelefonoR.Enabled = false;
            tboxEmailR.Enabled = false;
        }

        private void ObtieneActividades()
        {
            DataTable dtActividades = AnteproyectoCronograma.ObtieneMisActividades(ViewState["IdPreliminaryDraft"].ToString());
            ViewState["dtActividades"] = dtActividades;

            gvCronograma.DataSource = dtActividades;
            gvCronograma.DataBind();
        }

        private void ObtieneActividadesDetalle()
        {
            DataTable dtAnteproyectos = AnteproyectoCronograma.ObtieneMisActividades(ViewState["IdPreliminaryDraft"].ToString());

            sDetalleActividadCal = new StringBuilder();

            if (dtAnteproyectos.Rows.Count != 0)
            {
                foreach (DataRow dr in dtAnteproyectos.Rows)
                {
                    sDetalleActividadCal.AppendLine("<div class=\"row\">");
                    sDetalleActividadCal.AppendLine("    <div class=\"col-12 col-sm-12 col-md-12\">");
                    sDetalleActividadCal.AppendLine("       <span class=\"fontsizeh6\">" + dr["NombreActividadDes"].ToString() + "</span>");
                    sDetalleActividadCal.AppendLine("       <textarea class=\"form-control cambio-texto fontsizeh6\" style=\"resize:none;\" rows=\"3\" name=\"" + dr["IdPreliminaryDraft"].ToString() + "|" + dr["IdSchedule"].ToString() + "\" id=\"" + dr["IdPreliminaryDraft"].ToString() + "|" + dr["IdSchedule"].ToString() + "\" disabled>" + dr["Description"].ToString() + "</textarea>");
                    sDetalleActividadCal.AppendLine("   </div>");
                    sDetalleActividadCal.AppendLine("</div>");
                    sDetalleActividadCal.AppendLine("<br />");
                }
            }
            else
            {

            }
            ViewState["sDetalleActividadCal"] = sDetalleActividadCal;
        }

        private void ObtieneMisComentariosMaestro(String _sIdTeachersDet, String _sIdPreliminaryDraft)
        {
            DataTable dtComenatrios = MaestroResidencia.ObtieneMisComentariosMaestros(_sIdTeachersDet, _sIdPreliminaryDraft);

            sMisComentarios = new StringBuilder();

            if(dtComenatrios.Rows.Count != 0)
            {
                foreach(DataRow dr in dtComenatrios.Rows)
                {
                    sMisComentarios.AppendLine("<div class=\"row\">");
                    sMisComentarios.AppendLine("    <div class=\"col-12 col-sm-12 col-md-8 offset-md-2\">");
                    sMisComentarios.AppendLine("        <div style=\"background-color:#E8E8E8; padding:30px;\">");
                    sMisComentarios.AppendLine("            <div class=\"row text-center\" style=\"margin-bottom:10px;\">");
                    sMisComentarios.AppendLine("                <div class=\"col-12 col-sm-12 col-md-12 contenedor-centrar\">");
                    sMisComentarios.AppendLine("                    <div class=\"circulo contenedor-centrar-centro\">");
                    if (dr["PathFoto"].ToString() != "")
                    {
                        sMisComentarios.AppendLine("                        <img src=\"" + dr["PathFoto"].ToString() + "\" style=\"border-radius:50%;\"/>");   
                    }
                    else
                    {
                        sMisComentarios.AppendLine("                        <img src=\"Assets/Imagenes/FotosDePerfil/Alumno.jpg\" style=\"border-radius:50%;\"/>");
                    }
                    sMisComentarios.AppendLine("                    </div>");
                    if (ViewState["Accion"].ToString() != "Ver")
                    {
                        sMisComentarios.AppendLine("                    <button name=\"ibtnEliminar\" class=\"ibtn-hover-general\" style=\"border:none; background-image: url('Assets/Imagenes/Principal/Cerrar Negro.png'); background-color: unset; background-size: 30px; background-repeat: no-repeat; width: 31px; height: 31px;\" type=\"submit\" value=\"" + dr["IdComment"].ToString() + "|" + dr["IdTeachersDet"].ToString() + "|" + dr["IdPreliminaryDraft"].ToString() + "\"></button>");
                    }
                    sMisComentarios.AppendLine("                </div>");
                    sMisComentarios.AppendLine("            </div>");
                    sMisComentarios.AppendLine("            <div class=\"row text-center\" style=\"margin-bottom:20px;\">");
                    sMisComentarios.AppendLine("                <div class=\"col-12 col-sm-12 col-md-12\">");
                    sMisComentarios.AppendLine("                    <span class=\"fontbold\" style=\"font-size:20px;\">" + dr["NombreMaestro"] + "</span>");
                    sMisComentarios.AppendLine("                </div>");
                    sMisComentarios.AppendLine("            </div>");
                    sMisComentarios.AppendLine("            <div class=\"row\" style=\"margin-bottom:10px;\">");
                    sMisComentarios.AppendLine("                <div class=\"col-2 col-sm-2 col-md-2 text-center\" style=\"padding:0px;\">");
                    sMisComentarios.AppendLine("                    <img src=\"Assets/Imagenes/Principal/ComillasAbrir.png\" style=\"width:50px;\"/>");
                    sMisComentarios.AppendLine("                </div>");
                    sMisComentarios.AppendLine("                <div class=\"col-8 col-sm-8 col-md-8\">");
                    sMisComentarios.AppendLine("                    <div class=\"row text-center\" style=\"margin-bottom:20px;\">");
                    sMisComentarios.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sMisComentarios.AppendLine("                            <span style=\"font-size:15px;\">" + dr["Comentario"].ToString().Replace("\n", "<br />") + "</span>");
                    sMisComentarios.AppendLine("                        </div>");
                    sMisComentarios.AppendLine("                    </div>");
                    sMisComentarios.AppendLine("                    <div class=\"row text-center\" style=\"margin-bottom:10px;\">");
                    sMisComentarios.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    switch (dr["EstadoAnteproyecto"].ToString())
                    {
                        case "2":
                            sMisComentarios.AppendLine("                            <img src=\"Assets/Imagenes/CalificarAnteproyectos/Aprobado.png\" style=\"width:100px;\"/>");
                            break;
                        case "3":
                            sMisComentarios.AppendLine("                            <img src=\"Assets/Imagenes/CalificarAnteproyectos/AprobadoConComentarios.png\" style=\"width:100px;\"/>");
                            break;
                        case "4":
                            sMisComentarios.AppendLine("                            <img src=\"Assets/Imagenes/CalificarAnteproyectos/NoAprobado.png\" style=\"width:100px;\"/>");
                            break;
                    }
                    sMisComentarios.AppendLine("                        </div>");
                    sMisComentarios.AppendLine("                    </div>");
                    sMisComentarios.AppendLine("                    <div class=\"row text-center\">");
                    sMisComentarios.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sMisComentarios.AppendLine("                            <span class=\"fontbold\" style=\"font-size:17px;\">" + dr["EstadoAnteproyectoText"].ToString() + "</span>");
                    sMisComentarios.AppendLine("                        </div>");
                    sMisComentarios.AppendLine("                    </div>");
                    sMisComentarios.AppendLine("                </div>");
                    sMisComentarios.AppendLine("                <div class=\"col-2 col-sm-2 col-md-2 text-center\" style=\"padding:0px;\">");
                    sMisComentarios.AppendLine("                    <img src=\"Assets/Imagenes/Principal/ComillasCerrar.png\" style=\"width:50px;\"/>");
                    sMisComentarios.AppendLine("                </div>");
                    sMisComentarios.AppendLine("            </div>");
                    if(ViewState["Accion"].ToString() != "Ver")
                    {
                        sMisComentarios.AppendLine("            <div class=\"row\" style=\"text-align:end;\">");
                        sMisComentarios.AppendLine("                <div class=\"col-12 col-sm-12 col-md-12\">");
                        sMisComentarios.AppendLine("                    <button name=\"ibtnEditar\" class=\"ibtn-hover-general\" style=\"border:none; background-image: url('Assets/Imagenes/Principal/Editar.png'); background-color: unset; background-size: 30px; background-repeat: no-repeat; width: 31px; height: 31px;\" type=\"submit\" value=\"" + dr["IdComment"].ToString() + "|" + dr["EstadoAnteproyecto"].ToString() + "|" + dr["Comentario"].ToString() + "\"></button>");
                        sMisComentarios.AppendLine("                </div>");
                        sMisComentarios.AppendLine("            </div>");
                    }
                    sMisComentarios.AppendLine("        </div>");
                    sMisComentarios.AppendLine("    </div>");
                    sMisComentarios.AppendLine("</div>");
                    sMisComentarios.AppendLine("<br />");
                    sMisComentarios.AppendLine("<br />");
                }
            }
            else
            {

            }

            ViewState["sMisComentarios"] = sMisComentarios;
        }

        private void ObtieneTodosLosComentarios(String _sIdTeacher, String _sidPreliminaryDraft)
        {
            DataTable dtComenatrios = MaestroResidencia.ObtieneComentarios(_sIdTeacher, _sidPreliminaryDraft);

            sMisComentarios = new StringBuilder();
            sMisComentarios = ObtieneComentarioFinalJefeCarrera(_sidPreliminaryDraft);

            if (dtComenatrios.Rows.Count != 0)
            {
                foreach (DataRow dr in dtComenatrios.Rows)
                {
                    sMisComentarios.AppendLine("<div class=\"row\">");
                    sMisComentarios.AppendLine("   <div class=\"col-12 col-sm-12 col-md-12 col-lg-8 offset-lg-2\">");
                    sMisComentarios.AppendLine("       <div style=\"background-color:#E8E8E8; padding:20px;\">");
                    sMisComentarios.AppendLine("           <div class=\"row\" style=\"margin-bottom:10px;\">");
                    sMisComentarios.AppendLine("               <div class=\"col-12 col-sm-12 col-md-2 col-lg-2 text-center\">");
                    sMisComentarios.AppendLine("                   <div class=\"circuloM\">");
                    if (dr["PathFoto"].ToString() != "")
                    {
                        sMisComentarios.AppendLine("                        <img src=\"" + dr["PathFoto"].ToString() + "\" style=\"border-radius:50%;\"/>");
                    }
                    else
                    {
                        sMisComentarios.AppendLine("                        <img src=\"Assets/Imagenes/FotosDePerfil/Alumno.jpg\" style=\"border-radius:50%;\"/>");
                    }
                    sMisComentarios.AppendLine("                    </div>");
                    sMisComentarios.AppendLine("                </div>");
                    sMisComentarios.AppendLine("               <div class=\"col-12 col-sm-12 col-md-8 col-lg-8\">");
                    sMisComentarios.AppendLine("                   <div class=\"row\" style=\"margin-bottom:10px;\">");
                    sMisComentarios.AppendLine("                       <div class=\"col-12 col-sm-12 col-md-12 col-lg-12\">");
                    sMisComentarios.AppendLine("                            <span class=\"fontbold\" style=\"font-size:18px;\">" + dr["NombreMaestro"].ToString() + "</span>");
                    sMisComentarios.AppendLine("                        </div>");
                    sMisComentarios.AppendLine("                    </div>");
                    sMisComentarios.AppendLine("                    <div class=\"row\" style=\"margin-bottom:10px;\">");
                    sMisComentarios.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12 col-lg-12\">");
                    sMisComentarios.AppendLine("                            <span style=\"font-size:15px;\">" + dr["Comentario"].ToString().Replace("\n", "<br />") + "</span>");
                    sMisComentarios.AppendLine("                        </div>");
                    sMisComentarios.AppendLine("                    </div>");
                    sMisComentarios.AppendLine("                </div>");
                    sMisComentarios.AppendLine("                <div class=\"col-12 col-sm-12 col-md-2 col-lg-2\" style=\"line-height:120%;\">");
                    sMisComentarios.AppendLine("                    <div class=\"row text-center\" style=\"margin-bottom:10px;\">");
                    sMisComentarios.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12 col-lg-12\">");
                    switch (dr["EstadoAnteproyecto"].ToString())
                    {
                        case "2":
                            sMisComentarios.AppendLine("                            <img src=\"Assets/Imagenes/CalificarAnteproyectos/Aprobado.png\" style=\"width:80px;\"/>");
                            break;
                        case "3":
                            sMisComentarios.AppendLine("                            <img src=\"Assets/Imagenes/CalificarAnteproyectos/AprobadoConComentarios.png\" style=\"width:80px;\"/>");
                            break;
                        case "4":
                            sMisComentarios.AppendLine("                            <img src=\"Assets/Imagenes/CalificarAnteproyectos/NoAprobado.png\" style=\"width:80px;\"/>");
                            break;
                    }
                    sMisComentarios.AppendLine("                        </div>");
                    sMisComentarios.AppendLine("                    </div>");
                    sMisComentarios.AppendLine("                   <div class=\"row text-center\">");
                    sMisComentarios.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12 col-lg-12\">");
                    sMisComentarios.AppendLine("                            <span class=\"fontbold\" style=\"font-size:14px;\">" + dr["EstadoAnteproyectoText"].ToString() + "</span>");
                    sMisComentarios.AppendLine("                        </div>");
                    sMisComentarios.AppendLine("                    </div>");
                    sMisComentarios.AppendLine("                </div>");
                    sMisComentarios.AppendLine("            </div>");
                    sMisComentarios.AppendLine("        </div>");
                    sMisComentarios.AppendLine("    </div>");
                    sMisComentarios.AppendLine("</div>");
                    sMisComentarios.AppendLine("<br />");
                    sMisComentarios.AppendLine("<br />");
                }
            }
            else
            {

            }

            ViewState["sMisComentarios"] = sMisComentarios;
        }

        private StringBuilder ObtieneComentarioFinalJefeCarrera(String _sIdPreliminaryDraft)
        {
            DataTable dtComenatrios = MaestroResidencia.ObtieneMisComentariosJefeCarrera(_sIdPreliminaryDraft);

            StringBuilder sCalificacionFinal = new StringBuilder();

            if (dtComenatrios.Rows.Count != 0)
            {
                foreach (DataRow dr in dtComenatrios.Rows)
                {
                    sCalificacionFinal.AppendLine("<div class=\"row\">");
                    sCalificacionFinal.AppendLine("    <div class=\"col-12 col-sm-12 col-md-8 offset-md-2\">");
                    sCalificacionFinal.AppendLine("        <div style=\"background-color:#F1EEC7; padding:30px;\">");
                    sCalificacionFinal.AppendLine("            <div class=\"row text-center\" style=\"margin-bottom:10px;\">");
                    sCalificacionFinal.AppendLine("                <div class=\"col-12 col-sm-12 col-md-12 contenedor-centrar\">");
                    sCalificacionFinal.AppendLine("                    <div class=\"circulo contenedor-centrar-centro\">");
                    if (dr["PathFoto"].ToString() != "")
                    {
                        sCalificacionFinal.AppendLine("                        <img src=\"" + dr["PathFoto"].ToString() + "\" style=\"border-radius:50%;\"/>");
                    }
                    else
                    {
                        sCalificacionFinal.AppendLine("                        <img src=\"Assets/Imagenes/FotosDePerfil/Alumno.jpg\" style=\"border-radius:50%;\"/>");
                    }
                    sCalificacionFinal.AppendLine("                    </div>");
                    if (ViewState["Accion"].ToString() != "VerConComentarios")
                    {
                        if (dr["EstatusAnteproyecto"].ToString() == Enums.EstatusAnteproyecto.Enviado.ToString() || dr["EstatusAnteproyecto"].ToString() == Enums.EstatusAnteproyecto.EnProceso.ToString()
                        || dr["EstatusAnteproyecto"].ToString() == Enums.EstatusAnteproyecto.RevisionesCompletas.ToString() || dr["EstatusAnteproyecto"].ToString() == Enums.EstatusAnteproyecto.Calificado.ToString())
                        {
                            sCalificacionFinal.AppendLine("                    <button name=\"ibtnEliminarJC\" class=\"ibtn-hover-general\" style=\"border:none; background-image: url('Assets/Imagenes/Principal/Cerrar Negro.png'); background-color: unset; background-size: 30px; background-repeat: no-repeat; width: 31px; height: 31px;\" type=\"submit\" value=\"" + dr["IdQualification"].ToString() + "|" + dr["IdPreliminaryDraft"].ToString() + "\"></button>");
                        }
                    }
                    sCalificacionFinal.AppendLine("                </div>");
                    sCalificacionFinal.AppendLine("            </div>");
                    sCalificacionFinal.AppendLine("            <div class=\"row text-center\" style=\"margin-bottom:20px;\">");
                    sCalificacionFinal.AppendLine("                <div class=\"col-12 col-sm-12 col-md-12\">");
                    sCalificacionFinal.AppendLine("                    <span class=\"fontbold\" style=\"font-size:20px;\">" + dr["NombreJefeCarrera"] + "</span>");
                    sCalificacionFinal.AppendLine("                </div>");
                    sCalificacionFinal.AppendLine("            </div>");
                    sCalificacionFinal.AppendLine("            <div class=\"row\" style=\"margin-bottom:10px;\">");
                    sCalificacionFinal.AppendLine("                <div class=\"col-2 col-sm-2 col-md-2 text-center\" style=\"padding:0px;\">");
                    sCalificacionFinal.AppendLine("                    <img src=\"Assets/Imagenes/Principal/ComillasAbrir.png\" style=\"width:50px;\"/>");
                    sCalificacionFinal.AppendLine("                </div>");
                    sCalificacionFinal.AppendLine("                <div class=\"col-8 col-sm-8 col-md-8\">");
                    sCalificacionFinal.AppendLine("                    <div class=\"row text-center\" style=\"margin-bottom:20px;\">");
                    sCalificacionFinal.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sCalificacionFinal.AppendLine("                            <span style=\"font-size:15px;\">" + dr["ComentarioGeneral"].ToString().Replace("\n", "<br />") + "</span>");
                    sCalificacionFinal.AppendLine("                        </div>");
                    sCalificacionFinal.AppendLine("                    </div>");
                    sCalificacionFinal.AppendLine("                    <div class=\"row text-center\" style=\"margin-bottom:10px;\">");
                    sCalificacionFinal.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    switch (dr["EstatusCalificacionFinal"].ToString())
                    {
                        case "2":
                            sCalificacionFinal.AppendLine("                            <img src=\"Assets/Imagenes/CalificarAnteproyectos/Aprobado.png\" style=\"width:100px;\"/>");
                            break;
                        case "3":
                            sCalificacionFinal.AppendLine("                            <img src=\"Assets/Imagenes/CalificarAnteproyectos/AprobadoConComentarios.png\" style=\"width:100px;\"/>");
                            break;
                        case "4":
                            sCalificacionFinal.AppendLine("                            <img src=\"Assets/Imagenes/CalificarAnteproyectos/NoAprobado.png\" style=\"width:100px;\"/>");
                            break;
                    }
                    sCalificacionFinal.AppendLine("                        </div>");
                    sCalificacionFinal.AppendLine("                    </div>");
                    sCalificacionFinal.AppendLine("                    <div class=\"row text-center\">");
                    sCalificacionFinal.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sCalificacionFinal.AppendLine("                            <span class=\"fontbold\" style=\"font-size:17px;\">" + dr["CalificacionFinal"].ToString() + "</span>");
                    sCalificacionFinal.AppendLine("                        </div>");
                    sCalificacionFinal.AppendLine("                    </div>");
                    sCalificacionFinal.AppendLine("                </div>");
                    sCalificacionFinal.AppendLine("                <div class=\"col-2 col-sm-2 col-md-2 text-center\" style=\"padding:0px;\">");
                    sCalificacionFinal.AppendLine("                    <img src=\"Assets/Imagenes/Principal/ComillasCerrar.png\" style=\"width:50px;\"/>");
                    sCalificacionFinal.AppendLine("                </div>");
                    sCalificacionFinal.AppendLine("            </div>");
                    if (ViewState["Accion"].ToString() != "VerConComentarios")
                    {
                        if (dr["EstatusAnteproyecto"].ToString() == Enums.EstatusAnteproyecto.Enviado.ToString() || dr["EstatusAnteproyecto"].ToString() == Enums.EstatusAnteproyecto.EnProceso.ToString()
                        || dr["EstatusAnteproyecto"].ToString() == Enums.EstatusAnteproyecto.RevisionesCompletas.ToString() || dr["EstatusAnteproyecto"].ToString() == Enums.EstatusAnteproyecto.Calificado.ToString())
                        {
                            sCalificacionFinal.AppendLine("            <div class=\"row\" style=\"text-align:end;\">");
                            sCalificacionFinal.AppendLine("                <div class=\"col-12 col-sm-12 col-md-12\">");
                            sCalificacionFinal.AppendLine("                    <button name=\"ibtnEditarJC\" class=\"ibtn-hover-general\" style=\"border:none; background-image: url('Assets/Imagenes/Principal/Editar.png'); background-color: unset; background-size: 30px; background-repeat: no-repeat; width: 31px; height: 31px;\" type=\"submit\" value=\"" + dr["IdQualification"].ToString() + "|" + dr["EstatusCalificacionFinal"].ToString() + "|" + dr["ComentarioGeneral"].ToString() + "\"></button>");
                            sCalificacionFinal.AppendLine("                </div>");
                            sCalificacionFinal.AppendLine("            </div>");
                        }
                    }
                    sCalificacionFinal.AppendLine("        </div>");
                    sCalificacionFinal.AppendLine("    </div>");
                    sCalificacionFinal.AppendLine("</div>");
                    sCalificacionFinal.AppendLine("<br />");
                    sCalificacionFinal.AppendLine("<br />");
                }
            }
            else
            {

            }

            return sCalificacionFinal;
        }

        private void LlenarComentariosModal(String _sIdTeacher, String _sidPreliminaryDraft)
        {
            DataTable dtComenatrios = MaestroResidencia.ObtieneComentarios(_sIdTeacher, _sidPreliminaryDraft);

            gvComentariosModJC.DataSource = dtComenatrios;
            gvComentariosModJC.DataBind();
        }

        private void LimpiarModalComentario()
        {
            cboxEstatusMod.SelectedIndex = -1;
            tboxComentariosMod.Text = "";
        }

        private void LimpiarModalComentarioJefeCarrera()
        {
            cboxEstatusModJC.SelectedIndex = -1;
            tboxComentariosModJC.Text = "";
        }

        private void NotificarEvaluadroesDeAnteproyecto(String _sidTeachers, String _sIdPreliminaryDraft, String _sNombreAnteproyecto)
        {
            DataTable dtEvaluadores = Anteproyecto.ObtieneEvaluadores(_sidTeachers, _sIdPreliminaryDraft);

            foreach (DataRow dr in dtEvaluadores.Rows)
            {
                Generales.InsertaNotificacion(dr["IdUser"].ToString(), "El anteproyecto \"" + _sNombreAnteproyecto + "\" ya fue calificado por el jefe de carrera. Ya no puedes hacer ninguna modificación.", Enums.TipoNotificacion.Hipervinculo.ToString(), "AnteproyectosCalificarAdministrador.aspx");
            }
        }

        [System.Web.Services.WebMethod]
        public static String EliminarComentarioJefeCarrera(String parameter1, String parameter2, String parameter3)
        {
            String _sIdQualification = parameter1;
            String _sIdPreliminaryDraft = parameter2;
            String _sParametros = parameter3;

            MaestroResidencia.EliminarComentarioJefeCarrera(_sIdQualification);

            /*Si ya no tiene ninguna revision, se cambia el estatus a enviado, debido a que no existe ninguna calificacion
             echa por los maestros, si no, se cambia a "En proceso" debido a que si esxiste una calificacion y el anteproyecto
             esta en solicitud, si las revisiones totales y las revisiones echas son iguales, se cambia el estatus a RevisionesCompletas.*/
            if (Anteproyecto.ObtieneRevisiones(_sIdPreliminaryDraft) == 0)
            {
                Anteproyecto.ActualizaEstatusAnteproyecto(_sIdPreliminaryDraft, Enums.EstatusAnteproyecto.Enviado.ToString());
            }
            else if (Anteproyecto.ObtieneRevisiones(_sIdPreliminaryDraft) == Anteproyecto.ObtieneRevisionesTotales(_sIdPreliminaryDraft))
            {
                Anteproyecto.ActualizaEstatusAnteproyecto(_sIdPreliminaryDraft, Enums.EstatusAnteproyecto.RevisionesCompletas.ToString());
            }
            else
            {
                Anteproyecto.ActualizaEstatusAnteproyecto(_sIdPreliminaryDraft, Enums.EstatusAnteproyecto.EnProceso.ToString());
            }
            

            HttpContext.Current.Session["sAnteproyectoCalificar"] = _sParametros.Replace(',', '|');

            return "AnteproyectoResidenciaCalificar.aspx";
        }

        [System.Web.Services.WebMethod]
        public static String EliminarComentario(String parameter1, String parameter2, String parameter3, String parameter4)
        {
            String _sIdComment = parameter1;
            String _sIdTeacherDet = parameter2;
            String _sIdPreliminaryDraft = parameter3;
            String _sParametros = parameter4;

            MaestroResidencia.EliminarComentario(_sIdComment, _sIdTeacherDet, _sIdPreliminaryDraft);

            /*Si ya no tiene ninguna revision se cambia el estatus a enviado, debido a que no existe ninguna calificacion
             echa por los maestros, si no, se cambia a "En proceso" debido a que si esxiste una calificacion y el anteproyecto
             esta en solicitud.*/
            if (Anteproyecto.ObtieneRevisiones(_sIdPreliminaryDraft)==0)
            {
                Anteproyecto.ActualizaEstatusAnteproyecto(_sIdPreliminaryDraft, Enums.EstatusAnteproyecto.Enviado.ToString());
            }
            else
            {
                Anteproyecto.ActualizaEstatusAnteproyecto(_sIdPreliminaryDraft, Enums.EstatusAnteproyecto.EnProceso.ToString());
            }
            

            HttpContext.Current.Session["sAnteproyectoCalificar"] = _sParametros.Replace(',', '|');

            return "AnteproyectoResidenciaCalificar.aspx";
        }
        #endregion
    }
}