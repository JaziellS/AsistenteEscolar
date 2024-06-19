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
    public partial class AnteproyectosSeleccionarAdministrador : System.Web.UI.Page
    {
        #region Variables
        private Mensajes oMensajes = new Mensajes();
        public StringBuilder sDetalleActividad = new StringBuilder();
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
                if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Maestro.ToString())
                {
                    if (IsPostBack == false)
                    {
                        ConfiguraPagina();
                        LlenarCombos();
                        LlenarAnteproyectos("", "", "");

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

                    sDetalleActividad = (StringBuilder)ViewState["sDetalleActividad"];
                    if (sDetalleActividad == null)
                    {
                        sDetalleActividad = new StringBuilder();
                        sDetalleActividad.AppendLine("");
                    }

                    ConfiguraGrid();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Script1", "ScrollTab();", true);
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

                LlenarAnteproyectos(cboxPeriodo.SelectedValue, tboxAnio.Text, Generales.glsUsuarioSession.IdUsuario);

                Session["IdPeriodo"] = cboxPeriodo.SelectedValue;
                Session["Anio"] = tboxAnio.Text;

                lblHorasAsignar.Text = "Horas totales por asignar: " + MaestroResidencia.ObtieneMisHorasSobrantes(cboxPeriodo.SelectedValue, tboxAnio.Text, Generales.glsUsuarioSession.IdUsuario);
            }
            else
            {
                divTabla.Visible = false;
                divSinRegistros.Visible = true;
                LlenarAnteproyectos("", "", "");
                lblPeriodoDes.Text = "";
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            LlenarAnteproyectos(cboxPeriodo.SelectedValue, tboxAnio.Text, Generales.glsUsuarioSession.IdUsuario, tboxNoControl.Text, tboxNombre.Text, tboxNombreProyecto.Text, tboxEmpresa.Text, tboxRevisores.Text);
        }

        protected void gvAnteproyectos_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {

            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                String _sIdPreliminaryDraft = gvAnteproyectos.DataKeys[e.Row.RowIndex].Values[0].ToString();
                String _sIdTypeState = gvAnteproyectos.DataKeys[e.Row.RowIndex].Values[3].ToString();

                if(Enums.EstatusAnteproyecto.Calificado.ToString()==_sIdTypeState || Enums.EstatusAnteproyecto.Aprobado.ToString() == _sIdTypeState ||
                    Enums.EstatusAnteproyecto.AprobadoConComentarios.ToString() == _sIdTypeState || Enums.EstatusAnteproyecto.NoAprobado.ToString() == _sIdTypeState)
                {
                    e.Row.Cells[9].Enabled = false;
                }

                if(MaestroResidencia.ObtieneMaestrosAsignadosAnteproyecto(_sIdPreliminaryDraft) > 3)
                {
                    e.Row.Cells[9].Enabled = false;
                }
                
                Button btnVer = (Button)e.Row.Cells[10].Controls[0];
                btnVer.ID = "btnVer";
                btnVer.CommandName = "btnVer";
                btnVer.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnVer.Text = "Ver";
                btnVer.ForeColor = System.Drawing.Color.White;
                btnVer.Font.Bold = true;
            }
        }

        protected void gvAnteproyectos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "btnVer")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvAnteproyectos.Rows[index];

                    String _sIdPreliminaryDraft = gvAnteproyectos.DataKeys[index].Values[0].ToString();
                    String _sIdUser = gvAnteproyectos.DataKeys[index].Values[1].ToString();

                    DeshabilitarComponentes();
                    ObtieneAnteproyecto(_sIdPreliminaryDraft, _sIdUser);

                    modVerAnteproyecto.Show();
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        protected void chkSeleccionar_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;

            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            CheckBox cb = (CheckBox)gvAnteproyectos.Rows[selRowIndex].FindControl(chk.ID);
            GridViewRow row = gvAnteproyectos.Rows[selRowIndex];

            String _sIdPreliminaryDraft = gvAnteproyectos.DataKeys[selRowIndex].Values[0].ToString();
            String _sIdUser = gvAnteproyectos.DataKeys[selRowIndex].Values[1].ToString();
            String _sIdTeachersDet = gvAnteproyectos.DataKeys[selRowIndex].Values[2].ToString();
            String _sIdTypeState = gvAnteproyectos.DataKeys[selRowIndex].Values[3].ToString();

            if (MaestroResidencia.ValidaExisteComentearioJefeCarrera(_sIdPreliminaryDraft) || MaestroResidencia.ValidaExisteComentarioGuardadoMaestros(_sIdTeachersDet, _sIdPreliminaryDraft))
            {
                btnBuscar_Click(null, null);
                oMensajes.MuestraMensaje(this, "Error", "Este anteproyecto ya ha sido calificado, por lo que no se pueden realizar modificaciones.", Mensajes.TipoMensaje.Error);
                return;
            }
            
            Anteproyecto oAnteproyecto = new Anteproyecto(_sIdPreliminaryDraft, _sIdUser);
            if (cb.Checked)
            {
                if (!(MaestroResidencia.ObtieneHorasAsignadas(_sIdTeachersDet) > MaestroResidencia.ObtineNumeroAnteproyectosLigados(_sIdTeachersDet)))
                {
                    oMensajes.MuestraMensaje(this, "Error", "Ya no te quedan horas disponibles para asignar un anteproyecto.", Mensajes.TipoMensaje.Error);
                    btnBuscar_Click(null, null);
                    return;
                }

                if (MaestroResidencia.ObtieneMaestrosAsignadosAnteproyecto(_sIdPreliminaryDraft) < 3)
                {
                    MaestroResidencia.InsertaAnteproyectosMaestros(_sIdTeachersDet, _sIdPreliminaryDraft);

                    /*Condicional para cambiar el estatus del anteproyecto de "Revisiones Completas" a "En proceso", debido a que 
                        se agrega un nuevo maestro y se continua el proceso*/
                    if (oAnteproyecto.IdTipoEstado == Enums.EstatusAnteproyecto.RevisionesCompletas.ToString())
                    {
                        Anteproyecto.ActualizaEstatusAnteproyecto(_sIdPreliminaryDraft, Enums.EstatusAnteproyecto.EnProceso.ToString());
                    }
                }
                else
                {
                    oMensajes.MuestraMensaje(this, "Error", "El anteproyecto ya tiene tres maestros asignados, por lo que no se puede agregar más.", Mensajes.TipoMensaje.Error);
                }
            }
            else
            {
                if (!MaestroResidencia.ValidaPosibilidadRetirarAnteproyecto(_sIdTeachersDet, _sIdPreliminaryDraft))
                {
                    btnBuscar_Click(null, null);
                    oMensajes.MuestraMensaje(this, "Error", "Este anteproyecto no se puede retirar porque fue asignado por otra persona.", Mensajes.TipoMensaje.Error);
                    return;
                }

                MaestroResidencia.EliminaAnteproyectosMaestros(_sIdTeachersDet, _sIdPreliminaryDraft);

                /*Si el anteproyecto esta "En proceso" y los maestros sobrantes ya calificaron, se cambia el estatus a "Revisiones completas".*/
                if (oAnteproyecto.IdTipoEstado == Enums.EstatusAnteproyecto.EnProceso.ToString())
                {
                    if (Anteproyecto.ObtieneRevisiones(_sIdPreliminaryDraft) == Anteproyecto.ObtieneRevisionesTotales(_sIdPreliminaryDraft))
                    {
                        Anteproyecto.ActualizaEstatusAnteproyecto(_sIdPreliminaryDraft, Enums.EstatusAnteproyecto.RevisionesCompletas.ToString());
                    }
                }
            }

            lblHorasAsignar.Text = "Horas totales por asignar: " + MaestroResidencia.ObtieneMisHorasSobrantes(cboxPeriodo.SelectedValue, tboxAnio.Text, Generales.glsUsuarioSession.IdUsuario);
            btnBuscar_Click(null, null);
        }

        #region Modal Ver Anteproyectos
        protected void ibtnCerrarMod_Click(object sender, ImageClickEventArgs e)
        {
            modVerAnteproyecto.Hide();
        }
        #endregion

        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("AnteproyectosSeleccionarAdministrador.aspx");

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
            lblNombre.Text = oMensajes.TablaMensajes["lblNombre"];
            lblNombreProyecto.Text = oMensajes.TablaMensajes["lblNombreProyecto"];
            lblEmpresa.Text = oMensajes.TablaMensajes["lblEmpresa"];
            lblRevisores.Text = oMensajes.TablaMensajes["lblRevisores"];

            gvAnteproyectos.HeaderStyle.Wrap = true;
            gvAnteproyectos.RowStyle.Wrap = true;
            gvAnteproyectos.EmptyDataText = "No se encontraron resgistros o no fuiste seleccionado para revisar anteproyectos.";
            gvAnteproyectos.Columns[0].Visible = false;
            gvAnteproyectos.Columns[1].Visible = false;
            gvAnteproyectos.Columns[2].Visible = false;
            gvAnteproyectos.Columns[3].Visible = false;
            gvAnteproyectos.Columns[4].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_NoControl"];
            gvAnteproyectos.Columns[5].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_Alumno"];
            gvAnteproyectos.Columns[6].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_NombreProyecto"];
            gvAnteproyectos.Columns[7].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_NombreEmpresa"];
            gvAnteproyectos.Columns[8].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_Revisores"];
            gvAnteproyectos.Columns[9].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_Seleccionar"];
            gvAnteproyectos.Columns[10].HeaderText = oMensajes.TablaMensajes["gvAnteproyectos_Opciones"];

            #region Modal ver anteproyectos
            lblDescripcionModuloMod.Text = oMensajes.TablaMensajes["lblDescripcionModuloMod"];

            ibtnCerrarMod.ImageUrl = "~//Assets//Imagenes//Principal//Cerrar Negro.png";
            ibtnCerrarMod.Width = 30;
            ibtnCerrarMod.CausesValidation = false;
            ibtnCerrarMod.ToolTip = oMensajes.TablaMensajes["ibtnCerrarMod"];

            lblNombreProyectoMod.Text = oMensajes.TablaMensajes["lblNombreProyectoMod"];
            lblObjetivoProyectoMod.Text = oMensajes.TablaMensajes["lblObjetivoProyectoMod"];
            lblJustificacionMod.Text = oMensajes.TablaMensajes["lblJustificacionMod"];
            lblCronogramaMod.Text = oMensajes.TablaMensajes["lblCronogramaMod"];

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


            lblCronogramaDesMod.Text = oMensajes.TablaMensajes["lblCronogramaDesMod"];
            lblAlcanceMod.Text = oMensajes.TablaMensajes["lblAlcanceMod"];
            lblLugarMod.Text = oMensajes.TablaMensajes["lblLugarMod"];
            lblNombreEMod.Text = oMensajes.TablaMensajes["lblNombreEMod"];
            lblGiroEMod.Text = oMensajes.TablaMensajes["lblGiroEMod"];
            lblDepartamentoEMod.Text = oMensajes.TablaMensajes["lblDepartamentoEMod"];
            lblTelefonoEMod.Text = oMensajes.TablaMensajes["lblTelefonoEMod"];
            lblNombreGerenteEMod.Text = oMensajes.TablaMensajes["lblNombreGerenteEMod"];
            lblNombreJefeAreaEMod.Text = oMensajes.TablaMensajes["lblNombreJefeAreaEMod"];

            lblDomicilioEMod.Text = oMensajes.TablaMensajes["lblDomicilioEMod"];
            lblCalleEMod.Text = oMensajes.TablaMensajes["lblCalleEMod"];
            lblNumExtEMod.Text = oMensajes.TablaMensajes["lblNumExtEMod"];
            lblNumIntEMod.Text = oMensajes.TablaMensajes["lblNumIntEMod"];
            lblColoniaEMod.Text = oMensajes.TablaMensajes["lblColoniaEMod"];
            lblMunicipioEMod.Text = oMensajes.TablaMensajes["lblMunicipioEMod"];
            lblCiudadEMod.Text = oMensajes.TablaMensajes["lblCiudadEMod"];
            lblCPEMod.Text = oMensajes.TablaMensajes["lblCPEMod"];
            lblEstadoEMod.Text = oMensajes.TablaMensajes["lblEstadoEMod"];

            lblDatosRMod.Text = oMensajes.TablaMensajes["lblDatosRMod"];
            lblNoControlRMod.Text = oMensajes.TablaMensajes["lblNoControlRMod"];
            lblCarreraRMod.Text = oMensajes.TablaMensajes["lblCarreraRMod"];
            lblNombreRMod.Text = oMensajes.TablaMensajes["lblNombreRMod"];
            lblTelefonoRMod.Text = oMensajes.TablaMensajes["lblTelefonoRMod"];
            lblEmailRMod.Text = oMensajes.TablaMensajes["lblEmailRMod"];
            #endregion
        }

        private void ConfiguraGrid()
        {
            gvAnteproyectos.Columns[4].ControlStyle.Width = 120;
            gvAnteproyectos.Columns[5].ControlStyle.Width = 250;
            gvAnteproyectos.Columns[6].ControlStyle.Width = 250;
            gvAnteproyectos.Columns[7].ControlStyle.Width = 250;
            gvAnteproyectos.Columns[8].ControlStyle.Width = 100;

            gvAnteproyectos.Columns[8].ControlStyle.Width = 300;
        }

        private void LlenarCombos()
        {
            cboxPeriodo.DataTextField = "Name";
            cboxPeriodo.DataValueField = "IdValueDetail";
            cboxPeriodo.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Periodo");
            cboxPeriodo.DataBind();
            cboxPeriodo.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxPeriodo.SelectedIndex = 0;

            cboxCarreraRMod.DataTextField = "Name";
            cboxCarreraRMod.DataValueField = "IdValueDetail";
            cboxCarreraRMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Carreras");
            cboxCarreraRMod.DataBind();
        }

        private void LlenarAnteproyectos(String _sIdPeriod, String _sYear, String _sIdUser, String _sNoControl = "", String _sAlumno = "", String _sNombreProyecto = "", String _sNombreEmpresa = "", String _sRevisores = "")
        {
            DataTable dtAnteproyectos = Anteproyecto.ObtieneAnteproyectosSeleccionar(_sIdPeriod, _sYear, _sIdUser, _sNoControl, _sAlumno, _sNombreProyecto, _sNombreEmpresa, _sRevisores);
            ViewState["dtAnteproyectos"] = dtAnteproyectos;

            gvAnteproyectos.DataSource = dtAnteproyectos;
            gvAnteproyectos.DataBind();
        }

        private void ObtieneAnteproyecto(String _sIdPreliminaryDraft, String _sIdUser)
        {
            Anteproyecto oAnteproyecto = new Anteproyecto(_sIdPreliminaryDraft, _sIdUser);

            tboxNombreProyectoMod.Text = oAnteproyecto.Nombre;
            tboxObjetivoProyectoMod.Text = oAnteproyecto.Objetivo;
            tboxJustificacionMod.Text = oAnteproyecto.Justificacion;
            tboxAlcanceMod.Text = oAnteproyecto.AlcanceProyecto;
            tboxLugarMod.Text = oAnteproyecto.Lugar;

            tboxNombreEMod.Text = oAnteproyecto.NombreEmpresa;
            tboxGiroEMod.Text = oAnteproyecto.GiroEmpresa;
            tboxDepartamentoEMod.Text = oAnteproyecto.DepartamentoEmpresa;
            tboxTelefonoEMod.Text = oAnteproyecto.TelefonoOficinaEmpresa;
            tboxNombreGerenteEMod.Text = oAnteproyecto.DuenioEmpresa;
            tboxNombreJefeAreaEMod.Text = oAnteproyecto.JefeAreaEmpresa;

            tboxCalleEMod.Text = oAnteproyecto.CalleEmpresa;
            tboxNumExtEMod.Text = oAnteproyecto.NumeroExteriorEmpresa;
            tboxNumIntEMod.Text = oAnteproyecto.NumeroInteriorEmpresa;
            tboxColoniaEMod.Text = oAnteproyecto.ColoniaEmpresa;
            tboxMunicipioEMod.Text = oAnteproyecto.MunicipioEmpresa;
            tboxCiudadEMod.Text = oAnteproyecto.CiudadEmpresa;
            tboxCPEMod.Text = oAnteproyecto.CodigoPostaEmpresa;
            tboxEstadoEMod.Text = oAnteproyecto.EstadoEmpresa;

            tboxNoControlRMod.Text = oAnteproyecto.NumeroControlUsuario;
            cboxCarreraRMod.SelectedValue = oAnteproyecto.IdCareerUsuario;
            tboxNombreRMod.Text = oAnteproyecto.NombreUsuario;
            tboxTelefonoRMod.Text = oAnteproyecto.CelularUsuario;
            tboxEmailRMod.Text = oAnteproyecto.EmailUsuario;

            ObtieneActividades(_sIdPreliminaryDraft);
            ObtieneActividadesDetalle(_sIdPreliminaryDraft);
        }

        private void ObtieneActividades(String _sIdPreliminaryDraft)
        {
            DataTable dtActividades = AnteproyectoCronograma.ObtieneMisActividades(_sIdPreliminaryDraft);

            gvCronograma.DataSource = dtActividades;
            gvCronograma.DataBind();
        }

        private void ObtieneActividadesDetalle(String _sIdPreliminaryDraft)
        {
            DataTable dtAnteproyectos = AnteproyectoCronograma.ObtieneMisActividades(_sIdPreliminaryDraft);

            sDetalleActividad = new StringBuilder();

            if (dtAnteproyectos.Rows.Count != 0)
            {
                foreach (DataRow dr in dtAnteproyectos.Rows)
                {
                    sDetalleActividad.AppendLine("<div class=\"row\">");
                    sDetalleActividad.AppendLine("    <div class=\"col-12 col-sm-12 col-md-12\" style=\"margin-bottom:10px;\">");
                    sDetalleActividad.AppendLine("       <span class=\"fontsizeh6\">" + dr["NombreActividadDes"].ToString() + "</span>");
                    sDetalleActividad.AppendLine("       <textarea class=\"form-control cambio-texto fontsizeh6\" style=\"resize:none;\" rows=\"3\" id=\"" + dr["IdPreliminaryDraft"].ToString() + "|" + dr["IdSchedule"].ToString() + "\" disabled>" + dr["Description"].ToString() + "</textarea>");
                    sDetalleActividad.AppendLine("   </div>");
                    sDetalleActividad.AppendLine("</div>");
                }
            }
            ViewState["sDetalleActividad"] = sDetalleActividad;
        }

        private void DeshabilitarComponentes()
        {
            tboxNombreProyectoMod.Enabled = false;
            tboxObjetivoProyectoMod.Enabled = false;
            tboxJustificacionMod.Enabled = false;
            tboxAlcanceMod.Enabled = false;
            tboxLugarMod.Enabled = false;

            tboxNombreEMod.Enabled = false;
            tboxGiroEMod.Enabled = false;
            tboxDepartamentoEMod.Enabled = false;
            tboxTelefonoEMod.Enabled = false;
            tboxNombreGerenteEMod.Enabled = false;
            tboxNombreJefeAreaEMod.Enabled = false;

            tboxCalleEMod.Enabled = false;
            tboxNumExtEMod.Enabled = false;
            tboxNumIntEMod.Enabled = false;
            tboxColoniaEMod.Enabled = false;
            tboxMunicipioEMod.Enabled = false;
            tboxCiudadEMod.Enabled = false;
            tboxCPEMod.Enabled = false;
            tboxEstadoEMod.Enabled = false;

            tboxNoControlRMod.Enabled = false;
            cboxCarreraRMod.Enabled = false;
            tboxNombreRMod.Enabled = false;
            tboxTelefonoRMod.Enabled = false;
            tboxEmailRMod.Enabled = false;
        }

        private void LimpiarFiltro()
        {
            tboxNoControl.Text = "";
            tboxNombre.Text = "";
            tboxNombreProyecto.Text = "";
            tboxEmpresa.Text = "";
            tboxRevisores.Text = "";
        }
        #endregion
    }
}