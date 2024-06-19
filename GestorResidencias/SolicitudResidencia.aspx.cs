using GestorResidencias.Clases;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorResidencias
{
    public partial class SolicitudResidencia : System.Web.UI.Page
    {
        #region Variables
        private Mensajes oMensajes = new Mensajes();
        private String[] sParametros;
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
                if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Alumno.ToString())
                {
                    if (IsPostBack == false)
                    {
                        ConfiguraPagina();
                        LlenarCombos();

                        try
                        {
                            if (Session["sSolicitudes"] != null)
                            {
                                sParametros = Session["sSolicitudes"].ToString().Split('|');
                                Session["sSolicitudes"] = null;

                                String _sIdRequest = sParametros[0];
                                String _sIdUser = sParametros[1];

                                ViewState["IdRequest"] = _sIdRequest;
                                ViewState["IdUser"] = _sIdUser;

                                RecuperaEdicion(_sIdRequest, _sIdUser);

                                String _sAccion = sParametros[2];
                                ViewState["Accion"] = _sAccion;

                                switch (_sAccion)
                                {
                                    case "Edicion":
                                        break;
                                    case "Ver":
                                        DeshabilitarComponentes();
                                        break;
                                    default:
                                        break;
                                }
                            }
                            else
                            {
                                if (Solicitud.ValidaCrearOtraSolicitud(Generales.glsUsuarioSession.IdUsuario))
                                {
                                    ViewState["IdRequest"] = Generales.ObtieneNuevoID();

                                    RecuperaDatosDelUsuarioCreacion();
                                }
                                else
                                {
                                    Response.Redirect("Solicitudes.aspx");
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
                        }
                    }
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "Popup", "InicializarComponentes();", true);
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
            }
        }

        protected void ibtnRetroceder_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Solicitudes.aspx");
        }

        protected void lbtnRecuperaInfo_Click(object sender, EventArgs e)
        {
            DataTable dtMisSolicitudes = Solicitud.ObtieneMisSolicitudesCanceladas(Generales.glsUsuarioSession.IdUsuario);

            if (dtMisSolicitudes.Rows.Count != 0)
            {
                String sIdRequest;
                sIdRequest = dtMisSolicitudes.Rows[0]["IdRequest"].ToString();

                RecuperaEdicion(sIdRequest, Generales.glsUsuarioSession.IdUsuario);
            }
        }

        protected void tboxFecha_TextChanged(object sender, EventArgs e)
        {
            DateTime dtFecha;

            if(!DateTime.TryParseExact(tboxFecha.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out dtFecha)) {
                oMensajes.MuestraMensaje(this, "Error", "La fecha ingresada no es valida, intenta con otra.", Mensajes.TipoMensaje.Error);

                tboxFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
                tboxLugar_TextChanged(null, null);
            }
            else
            {
                tboxLugar_TextChanged(null, null);
            }
        }

        protected void tboxLugar_TextChanged(object sender, EventArgs e)
        {
            try
            {
                InsertaSolicitud("1");

                ViewState["Accion"] = "Edicion";
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        protected void lboxBusquedaEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem item in lboxBusquedaEmpresa.Items)
            {
                if (item.Selected)
                {
                    /*La variables "UltimosDatos" Es utilizada debido a que el lbox es de seleccion multiple, este tiene la propiedad de 
                     quitar la seleccion y dejar el lbox en blanco, mientras que la seleccion "Single" no puedes quitar la seleccion 
                     haciendo un clik. Esta validacion es para en caso de que se desea cambiar de empresa, se selecciona la nueva 
                     empresa y la anterior que estaba seleccionada se borre*/
                    if (ViewState["UltimoDatos"] != null)
                    {
                        if (ViewState["UltimoDatos"].ToString() == item.Value)
                        {
                            item.Selected = false;
                        }
                    }
                }
            }

            if (lboxBusquedaEmpresa.SelectedValue == "")
            {
                ViewState["UltimoDatos"] = null;
                chkITSJ.Enabled = true;
                LimpiarCamposEmpresa();
            }
            else
            {
                ViewState["UltimoDatos"] = lboxBusquedaEmpresa.SelectedValue;
                chkITSJ.Enabled = false;
                LlenarSeccionEmpresa(lboxBusquedaEmpresa.SelectedValue);
            }
        }

        protected void chkITSJ_CheckedChanged(object sender, EventArgs e)
        {
            if (chkITSJ.Checked)
            {
                lboxBusquedaEmpresa.Attributes.Add("disabled", "disabled");
                //Quitar el elemento seleccionado de la lista
                foreach (ListItem item in lboxBusquedaEmpresa.Items)
                {
                    if (item.Selected)
                    {
                        item.Selected = false;
                    }
                }
                ViewState["UltimoDatos"] = null;

                LlenarSeccionEmpresa("3861cc5a-5d36-4391-b904-855bb1d15242");
            }
            else
            {
                lboxBusquedaEmpresa.Attributes.Remove("disabled");

                LimpiarCamposEmpresa();
            }
        }

        protected void cboxSeguridadSocialR_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboxSeguridadSocialR.SelectedValue == "1")
            {
                tboxCualR.Text = "";
                divSSCual.Visible = true;
                rfvCualR.Enabled = true;
            }
            else
            {
                tboxCualR.Text = "";
                divSSCual.Visible = false;
                rfvCualR.Enabled = false;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                InsertaSolicitud("1");
                Response.Redirect("Solicitudes.aspx");
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                InsertaSolicitud("2");
                NotificarResponsablesRevisionSolicitud();

                Response.Redirect("Solicitudes.aspx");
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }
        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("SolicitudResidencia.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            ibtnRetroceder.ImageUrl = "~//Assets//Imagenes//Principal//FlechaRetroceder.png";
            ibtnRetroceder.Width = 40;
            ibtnRetroceder.CausesValidation = false;

            DataTable dtSolicitudes = Solicitud.ObtieneMisSolicitudesCanceladas(Generales.glsUsuarioSession.IdUsuario);

            if(dtSolicitudes.Rows.Count != 0)
            {
                divRecuperarInfo.Visible = true;
            }
            else
            {
                divRecuperarInfo.Visible = false;
            }

            lblLugar.Text = oMensajes.TablaMensajes["lblLugar"];
            rfvLugar.Text = "Campo Obligatorio";

            lblFecha.Text = oMensajes.TablaMensajes["lblFecha"];
            rfvFecha.Text = "Campo Obligatorio";

            lblNombreProyecto.Text = oMensajes.TablaMensajes["lblNombreProyecto"];
            rfvNombreProyecto.Text = "Campo Obligatorio";

            lblProcedenciaProyecto.Text = oMensajes.TablaMensajes["lblProcedenciaProyecto"];
            rfvProcedenciaProyecto.Text = "Campo Obligatorio";

            lblNumeroResidentes.Text = oMensajes.TablaMensajes["lblNumeroResidentes"];
            rfvNumeroResidentes.Text = "Campo Obligatorio";

            lblPeriodo.Text = oMensajes.TablaMensajes["lblPeriodo"];
            rfvPeriodo.Text = "Campo Obligatorio";

            lblAnio.Text = oMensajes.TablaMensajes["lblAnio"];
            rfvAnio.Text = "Campo Obligatorio";

            lblDatosEmpresaE.Text = oMensajes.TablaMensajes["lblDatosEmpresaE"];

            lblBusquedaEmpresa.Text = oMensajes.TablaMensajes["lblBusquedaEmpresa"];
            chkITSJ.Text = "&nbsp&nbsp" + oMensajes.TablaMensajes["chkITSJ"];

            lblNombreFiscalE.Text = oMensajes.TablaMensajes["lblNombreFiscalE"];
            rfvNombreFiscalE.Text = "Campo Obligatorio";

            lblRamoE.Text = oMensajes.TablaMensajes["lblRamoE"];
            rfvRamoE.Text = "Campo Obligatorio";

            lblSectorE.Text = oMensajes.TablaMensajes["lblSectorE"];
            rfvSectorE.Text = "Campo Obligatorio";

            lblRFCE.Text = oMensajes.TablaMensajes["lblRFCE"];
            rfvRFCE.Text = "Campo Obligatorio";

            lblTelefonoE.Text = oMensajes.TablaMensajes["lblTelefonoE"];
            rfvTelefonoE.Text = "Campo Obligatorio";

            lblFaxE.Text = oMensajes.TablaMensajes["lblFaxE"];
            lblTamanoEmpresaE.Text = oMensajes.TablaMensajes["lblTamanoEmpresaE"];
            rfvTamanoEmpresaE.Text = "Campo Obligatorio";

            lblMisionE.Text = oMensajes.TablaMensajes["lblMisionE"];
            rfvMisionE.Text = "Campo Obligatorio";

            lblNombreTitularE.Text = oMensajes.TablaMensajes["lblNombreTitularE"];
            rfvNombreTitularE.Text = "Campo Obligatorio";

            lblNombreAseExtE.Text = oMensajes.TablaMensajes["lblNombreAseExtE"];
            rfvNombreAseExtE.Text = "Campo Obligatorio";

            lblPuestoAseExtE.Text = oMensajes.TablaMensajes["lblPuestoAseExtE"];
            rfvPuestoAseExtE.Text = "Campo Obligatorio";

            lblDomicilioE.Text = oMensajes.TablaMensajes["lblDomicilioE"];
            
            lblCalleE.Text = oMensajes.TablaMensajes["lblCalleE"];
            rfvCalleE.Text = "Campo Obligatorio";

            lblNumExtE.Text = oMensajes.TablaMensajes["lblNumExtE"];
            rfvNumExtE.Text = "Campo Obligatorio";

            lblNumIntE.Text = oMensajes.TablaMensajes["lblNumIntE"];
            lblColoniaE.Text = oMensajes.TablaMensajes["lblColoniaE"];
            rfvColoniaE.Text = "Campo Obligatorio";

            lblMunicipioE.Text = oMensajes.TablaMensajes["lblMunicipioE"];
            rfvMunicipioE.Text = "Campo Obligatorio";

            lblCPE.Text = oMensajes.TablaMensajes["lblCPE"];
            rfvCPE.Text = "Campo Obligatorio";
            
            lblDatosSE.Text = oMensajes.TablaMensajes["lblDatosSE"];
            
            lblNombreSE.Text = oMensajes.TablaMensajes["lblNombreSE"];
            rfvNombreSE.Text = "Campo Obligatorio";

            lblPuestoSE.Text = oMensajes.TablaMensajes["lblPuestoSE"];
            rfvPuestoSE.Text = "Campo Obligatorio";

            lblEmailSE.Text = oMensajes.TablaMensajes["lblEmailSE"];
            rfvEmailSE.Text = "Campo Obligatorio";

            lblCelularSE.Text = oMensajes.TablaMensajes["lblCelularSE"];
            rfvCelularSE.Text = "Campo Obligatorio";

            lblTelefonoOficSE.Text = oMensajes.TablaMensajes["lblTelefonoOficSE"];
            rfvTelefonoOficSE.Text = "Campo Obligatorio";
            
            lblDatosR.Text = oMensajes.TablaMensajes["lblDatosR"];
            
            lblNombreR.Text = oMensajes.TablaMensajes["lblNombreR"];
            rfvNombreR.Text = "Campo Obligatorio";

            lblSemestreR.Text = oMensajes.TablaMensajes["lblSemestreR"];
            rfvSemestreR.Text = "Campo Obligatorio";

            lblCarreraR.Text = oMensajes.TablaMensajes["lblCarreraR"];
            rfvCarreraR.Text = "Campo Obligatorio";

            lblNoControlR.Text = oMensajes.TablaMensajes["lblNoControlR"];
            rfvNoControlR.Text = "Campo Obligatorio";

            lblEmailR.Text = oMensajes.TablaMensajes["lblEmailR"];
            rfvEmailR.Text = "Campo Obligatorio";

            lblSeguridadSocialR.Text = oMensajes.TablaMensajes["lblSeguridadSocialR"];
            rfvSeguridadSocialR.Text = "Campo Obligatorio";

            divSSCual.Visible = false;
            rfvCualR.Enabled = false;
            lblCualR.Text = oMensajes.TablaMensajes["lblCualR"];
            rfvCualR.Text = "Campo Obligatorio";

            lblNSSR.Text = oMensajes.TablaMensajes["lblNSSR"];
            rfvNSSR.Text = "Campo Obligatorio";

            lblTelefonoR.Text = oMensajes.TablaMensajes["lblTelefonoR"];
            rfvTelefonoR.Text = "Campo Obligatorio";

            lblCelularR.Text = oMensajes.TablaMensajes["lblCelularR"];
            rfvCelularR.Text = "Campo Obligatorio";

            lblDomicilioR.Text = oMensajes.TablaMensajes["lblDomicilioR"];

            lblCalleR.Text = oMensajes.TablaMensajes["lblCalleR"];
            rfvCalleR.Text = "Campo Obligatorio";

            lblNumExtR.Text = oMensajes.TablaMensajes["lblNumExtR"];
            rfvNumExtR.Text = "Campo Obligatorio";

            lblNumIntR.Text = oMensajes.TablaMensajes["lblNumIntR"];
            lblColoniaR.Text = oMensajes.TablaMensajes["lblColoniaR"];
            rfvColoniaR.Text = "Campo Obligatorio";

            lblMunicipioR.Text = oMensajes.TablaMensajes["lblMunicipioR"];
            rfvMunicipioR.Text = "Campo Obligatorio";

            lblCPR.Text = oMensajes.TablaMensajes["lblCPR"];
            rfvCPR.Text = "Campo Obligatorio";

            btnGuardar.Text = oMensajes.TablaMensajes["btnGuardar"];
            btnGuardar.ForeColor = System.Drawing.Color.White;
            btnGuardar.Font.Bold = true;
            btnGuardar.CausesValidation = false;

            btnEnviar.Text = oMensajes.TablaMensajes["btnEnviar"];
            btnEnviar.ForeColor = System.Drawing.Color.White;
            btnEnviar.Font.Bold = true;
        }

        private void LlenarCombos()
        {
            cboxProcedenciaProyecto.DataTextField = "Name";
            cboxProcedenciaProyecto.DataValueField = "IdValueDetail";
            cboxProcedenciaProyecto.DataSource = ValoresPorReferencia.RecuperaValorReferencia("ProcedenciaProyecto");
            cboxProcedenciaProyecto.DataBind();
            cboxProcedenciaProyecto.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxProcedenciaProyecto.SelectedIndex = 0;

            lboxBusquedaEmpresa.DataTextField = "NombreEmpresa";
            lboxBusquedaEmpresa.DataValueField = "IdCompany";
            lboxBusquedaEmpresa.DataSource = Empresa.ObtieneEmpresasCombo();
            lboxBusquedaEmpresa.DataBind();

            cboxPeriodo.DataTextField = "Name";
            cboxPeriodo.DataValueField = "IdValueDetail";
            cboxPeriodo.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Periodo");
            cboxPeriodo.DataBind();
            cboxPeriodo.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxPeriodo.SelectedIndex = 0;

            cboxRamoE.DataTextField = "Name";
            cboxRamoE.DataValueField = "IdValueDetail";
            cboxRamoE.DataSource = ValoresPorReferencia.RecuperaValorReferencia("RamoProyecto");
            cboxRamoE.DataBind();
            cboxRamoE.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxRamoE.SelectedIndex = 0;

            cboxSectorE.DataTextField = "Name";
            cboxSectorE.DataValueField = "IdValueDetail";
            cboxSectorE.DataSource = ValoresPorReferencia.RecuperaValorReferencia("SectorProyecto");
            cboxSectorE.DataBind();
            cboxSectorE.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxSectorE.SelectedIndex = 0;

            cboxTamanoEmpresaE.DataTextField = "Name";
            cboxTamanoEmpresaE.DataValueField = "IdValueDetail";
            cboxTamanoEmpresaE.DataSource = ValoresPorReferencia.RecuperaValorReferencia("TamanoEmpresa");
            cboxTamanoEmpresaE.DataBind();
            cboxTamanoEmpresaE.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxTamanoEmpresaE.SelectedIndex = 0;

            cboxSeguridadSocialR.DataTextField = "Name";
            cboxSeguridadSocialR.DataValueField = "IdValueDetail";
            cboxSeguridadSocialR.DataSource = ValoresPorReferencia.RecuperaValorReferencia("SeguridadSocial");
            cboxSeguridadSocialR.DataBind();
            cboxSeguridadSocialR.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxSeguridadSocialR.SelectedIndex = 0;

            cboxCarreraR.DataTextField = "Name";
            cboxCarreraR.DataValueField = "IdValueDetail";
            cboxCarreraR.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Carreras");
            cboxCarreraR.DataBind();
            cboxCarreraR.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxCarreraR.SelectedIndex = 0;
        }

        private void RecuperaEdicion(String _sIdRequest, String _sIdUser)
        {
            try
            {
                Solicitud oSolicitudes = new Solicitud(_sIdRequest, _sIdUser);

                tboxLugar.Text = oSolicitudes.Lugar;
                tboxFecha.Text = oSolicitudes.Fecha;
                tboxNombreProyecto.Text = oSolicitudes.NombreProyecto;
                cboxProcedenciaProyecto.SelectedValue = oSolicitudes.IdProcedenciaProyecto;
                tboxNumeroResidentes.Text = oSolicitudes.NumeroResidentes;
                cboxPeriodo.SelectedValue = oSolicitudes.IdPeriod;
                tboxAnio.Text = oSolicitudes.Anio;

                tboxNombreFiscalE.Text = oSolicitudes.NombreEmpresa;
                cboxRamoE.SelectedValue = oSolicitudes.IdRamoEmpresa;
                cboxSectorE.SelectedValue = oSolicitudes.IdSectorEmpresa;
                tboxRFCE.Text = oSolicitudes.RFCEmpresa;
                tboxTelefonoE.Text = oSolicitudes.TelefonoOficEmpresa;
                tboxFaxE.Text = oSolicitudes.FaxEmpresa;
                cboxTamanoEmpresaE.SelectedValue = oSolicitudes.IdTamanioEmpresa;
                tboxMisionE.Text = oSolicitudes.MisionEmpresa;
                tboxNombreTitularE.Text = oSolicitudes.NombreTitularEmpresa;
                tboxNombreAseExtE.Text = oSolicitudes.NombreAsesorExterno;
                tboxPuestoAseExtE.Text = oSolicitudes.PuestoAsesorExterno;

                tboxCalleE.Text = oSolicitudes.CalleEmpresa;
                tboxNumExtE.Text = oSolicitudes.NumExteriorEmpresa;
                tboxNumIntE.Text = oSolicitudes.NumInteriorEmpresa;
                tboxColoniaE.Text = oSolicitudes.ColoniaEmpresa;
                tboxMunicipioE.Text = oSolicitudes.MunicipioEmpresa;
                tboxCPE.Text = oSolicitudes.CodigoPostalEmpresa;

                tboxNombreSE.Text = oSolicitudes.NombrePSeguimiento;
                tboxPuestoSE.Text = oSolicitudes.PuestoPSeguimiento;
                tboxEmailSE.Text = oSolicitudes.EmailPSeguimiento;
                tboxCelularSE.Text = oSolicitudes.CelularPSeguimiento;
                tboxTelefonoOficSE.Text = oSolicitudes.TelefonoOficPSeguimiento;

                tboxNombreR.Text = oSolicitudes.NombreUsuario;
                tboxSemestreR.Text = oSolicitudes.SemestreUsuario;
                cboxCarreraR.SelectedValue = oSolicitudes.IdCarreraUsuario;
                tboxNoControlR.Text = oSolicitudes.NumeroControlUsuario;
                tboxEmailR.Text = oSolicitudes.EmailUsuario;
                cboxSeguridadSocialR.SelectedValue = oSolicitudes.IdSeguroSocialUsuario;
                if (cboxSeguridadSocialR.SelectedValue == "1")
                {
                    cboxSeguridadSocialR_SelectedIndexChanged(null, null);
                }
                tboxCualR.Text = oSolicitudes.OtraSeguridadSocialUsuario;
                tboxNSSR.Text = oSolicitudes.NSSUsuario;
                tboxTelefonoR.Text = oSolicitudes.TelefonoUsuario;
                tboxCelularR.Text = oSolicitudes.CelularUsuario;

                tboxCalleR.Text = oSolicitudes.CalleUsuario;
                tboxNumExtR.Text = oSolicitudes.NumeroExteriorUsuario;
                tboxNumIntR.Text = oSolicitudes.NumeroInteriorUsuario;
                tboxColoniaR.Text = oSolicitudes.ColoniaUsuario;
                tboxMunicipioR.Text = oSolicitudes.MunicipioUsuario;
                tboxCPR.Text = oSolicitudes.NumeroPostalUsuario;

            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        private void DeshabilitarComponentes()
        {
            divRecuperarInfo.Visible = false;
            tboxLugar.Enabled = false;
            tboxFecha.Enabled = false;
            tboxNombreProyecto.Enabled = false;
            cboxProcedenciaProyecto.Enabled = false;
            tboxNumeroResidentes.Enabled = false;
            cboxPeriodo.Enabled = false;
            tboxAnio.Enabled = false;

            tboxNombreFiscalE.Enabled = false;
            cboxRamoE.Enabled = false;
            cboxSectorE.Enabled = false;
            tboxRFCE.Enabled = false;
            tboxTelefonoE.Enabled = false;
            tboxFaxE.Enabled = false;
            cboxTamanoEmpresaE.Enabled = false;
            tboxMisionE.Enabled = false;
            tboxNombreTitularE.Enabled = false;
            tboxNombreAseExtE.Enabled = false;
            tboxPuestoAseExtE.Enabled = false;
            tboxCalleE.Enabled = false;
            tboxNumExtE.Enabled = false;
            tboxNumIntE.Enabled = false;
            tboxColoniaE.Enabled = false;
            tboxMunicipioE.Enabled = false;
            tboxCPE.Enabled = false;

            tboxNombreSE.Enabled = false;
            tboxPuestoSE.Enabled = false;
            tboxEmailSE.Enabled = false;
            tboxCelularSE.Enabled = false;
            tboxTelefonoOficSE.Enabled = false;

            tboxNombreR.Enabled = false;
            tboxSemestreR.Enabled = false;
            cboxCarreraR.Enabled = false;
            tboxNoControlR.Enabled = false;
            tboxEmailR.Enabled = false;
            cboxSeguridadSocialR.Enabled = false;
            tboxCualR.Enabled = false;
            tboxNSSR.Enabled = false;
            tboxTelefonoR.Enabled = false;
            tboxCelularR.Enabled = false;
            tboxCalleR.Enabled = false;
            tboxNumExtR.Enabled = false;
            tboxNumIntR.Enabled = false;
            tboxColoniaR.Enabled = false;
            tboxMunicipioR.Enabled = false;
            tboxCPR.Enabled = false;

            lboxBusquedaEmpresa.Attributes.Add("disabled", "disabled");
            chkITSJ.Enabled = false;
            divBotones.Visible = false;
            divBusquedaE.Visible = false;
        }

        private void InsertaSolicitud(String _sidTypeState)
        {
            Solicitud oSolicitud;
                                                                
            if (ViewState["Accion"] != null)
            {
                oSolicitud = new Solicitud(ViewState["IdRequest"].ToString(), Generales.glsUsuarioSession.IdUsuario);
            }
            else
            {
                oSolicitud = new Solicitud();
                oSolicitud.IdRequest = ViewState["IdRequest"].ToString();
                oSolicitud.IdUser = Generales.glsUsuarioSession.IdUsuario;
            }
            oSolicitud.Lugar = tboxLugar.Text;
            oSolicitud.Fecha = tboxFecha.Text;
            oSolicitud.NombreProyecto = tboxNombreProyecto.Text;
            oSolicitud.IdProcedenciaProyecto = cboxProcedenciaProyecto.SelectedValue;
            oSolicitud.NumeroResidentes = tboxNumeroResidentes.Text;
            oSolicitud.IdPeriod = cboxPeriodo.SelectedValue;
            if (tboxAnio.Text == "____")
            {
                oSolicitud.Anio = "";
            }
            else
            {
                oSolicitud.Anio = tboxAnio.Text;
            }
            oSolicitud.IdTipoEstado = _sidTypeState;

            if (_sidTypeState == "1")
            {
                oSolicitud.FechaEnvio = "";
            }
            else
            {
                oSolicitud.FechaEnvio = DateTime.Now.ToString("yyyy-MM-dd");
            }

            oSolicitud.NombreEmpresa = tboxNombreFiscalE.Text;
            oSolicitud.IdRamoEmpresa = cboxRamoE.SelectedValue;
            oSolicitud.IdSectorEmpresa = cboxSectorE.SelectedValue;
            oSolicitud.RFCEmpresa = tboxRFCE.Text;
            oSolicitud.TelefonoOficEmpresa = tboxTelefonoE.Text;
            oSolicitud.FaxEmpresa = tboxFaxE.Text;
            oSolicitud.IdTamanioEmpresa = cboxTamanoEmpresaE.SelectedValue;
            oSolicitud.MisionEmpresa = tboxMisionE.Text;
            oSolicitud.NombreTitularEmpresa = tboxNombreTitularE.Text;
            oSolicitud.NombreAsesorExterno = tboxNombreAseExtE.Text;
            oSolicitud.PuestoAsesorExterno = tboxPuestoAseExtE.Text;
            oSolicitud.CalleEmpresa = tboxCalleE.Text;
            oSolicitud.NumExteriorEmpresa = tboxNumExtE.Text;
            oSolicitud.NumInteriorEmpresa = tboxNumIntE.Text;
            oSolicitud.ColoniaEmpresa = tboxColoniaE.Text;
            oSolicitud.MunicipioEmpresa = tboxMunicipioE.Text;
            oSolicitud.CodigoPostalEmpresa = tboxCPE.Text;
            
            oSolicitud.NombrePSeguimiento = tboxNombreSE.Text;
            oSolicitud.PuestoPSeguimiento = tboxPuestoSE.Text;
            oSolicitud.EmailPSeguimiento = tboxEmailSE.Text.ToLower();
            oSolicitud.CelularPSeguimiento = tboxCelularSE.Text;
            oSolicitud.TelefonoOficPSeguimiento = tboxTelefonoOficSE.Text;

            oSolicitud.NombreUsuario = tboxNombreR.Text;
            oSolicitud.SemestreUsuario = tboxSemestreR.Text;
            oSolicitud.IdCarreraUsuario = cboxCarreraR.SelectedValue;
            oSolicitud.NumeroControlUsuario = tboxNoControlR.Text;
            oSolicitud.EmailUsuario = tboxEmailR.Text.ToLower();
            oSolicitud.IdSeguroSocialUsuario = cboxSeguridadSocialR.SelectedValue;
            oSolicitud.OtraSeguridadSocialUsuario = tboxCualR.Text;
            oSolicitud.NSSUsuario = tboxNSSR.Text;
            oSolicitud.TelefonoUsuario = tboxTelefonoR.Text;
            oSolicitud.CelularUsuario = tboxCelularR.Text;
            oSolicitud.CalleUsuario = tboxCalleR.Text;
            oSolicitud.NumeroExteriorUsuario = tboxNumExtR.Text;
            oSolicitud.NumeroInteriorUsuario = tboxNumIntR.Text;
            oSolicitud.ColoniaUsuario = tboxColoniaR.Text;
            oSolicitud.MunicipioUsuario = tboxMunicipioR.Text;
            oSolicitud.NumeroPostalUsuario = tboxCPR.Text;

            oSolicitud.InsertaActualizaSolicitudResidencia();
        }

        private void RecuperaDatosDelUsuarioCreacion()
        {
            Usuario oUsuario = new Usuario(Generales.glsUsuarioSession.IdUsuario);

            tboxNombreR.Text = oUsuario.Nombre + " " + oUsuario.ApellidoPaterno + " " + oUsuario.ApellidoMaterno;
            tboxSemestreR.Text = oUsuario.Semestre;
            cboxCarreraR.SelectedValue = oUsuario.IdCarrera;
            tboxNoControlR.Text = oUsuario.NoControl;
            tboxEmailR.Text = oUsuario.Email + ValoresPorReferencia.ObtieneDatoValorPorReferencia("DominioCorreo", Generales.glsUsuarioSession.IdDominio);;
            cboxSeguridadSocialR.SelectedValue = oUsuario.IdSeguridadSocial;
            if(cboxSeguridadSocialR.SelectedValue == "1")
            {
                cboxSeguridadSocialR_SelectedIndexChanged(null, null);
            }

            tboxCualR.Text = oUsuario.OtraSeguridadSocial;
            tboxNSSR.Text = oUsuario.NSS;
            tboxTelefonoR.Text = oUsuario.Telefono;
            tboxCelularR.Text = oUsuario.TelefonoCelular;

            tboxCalleR.Text = oUsuario.Calle;
            tboxNumExtR.Text = oUsuario.NumeroExterior;
            tboxNumIntR.Text = oUsuario.NumeroInterior;
            tboxColoniaR.Text = oUsuario.Colonia;
            tboxMunicipioR.Text = oUsuario.Municipio;
            tboxCPR.Text = oUsuario.NumeroPostal;
        }

        private void LimpiarCamposEmpresa()
        {
            tboxNombreFiscalE.Text = "";
            cboxRamoE.SelectedIndex = -1;
            cboxSectorE.SelectedIndex = -1;
            tboxRFCE.Text = "";
            tboxTelefonoE.Text = "";
            tboxFaxE.Text = "";
            cboxTamanoEmpresaE.SelectedIndex = -1;
            tboxMisionE.Text = "";
            tboxNombreTitularE.Text = "";

            tboxCalleE.Text = "";
            tboxNumExtE.Text = "";
            tboxNumIntE.Text = "";
            tboxColoniaE.Text = "";
            tboxMunicipioE.Text = "";
            tboxCPE.Text = "";
        }

        private void LlenarSeccionEmpresa(String _sIdCompany)
        {
            Empresa oEmpresa = new Empresa(_sIdCompany);

            tboxNombreFiscalE.Text = oEmpresa.Nombre;
            cboxRamoE.SelectedValue = oEmpresa.IdRamo;
            cboxSectorE.SelectedValue = oEmpresa.IdSector;
            tboxRFCE.Text = oEmpresa.RFC;
            tboxTelefonoE.Text = oEmpresa.TelefonoOficina;
            tboxFaxE.Text = oEmpresa.Fax;
            cboxTamanoEmpresaE.SelectedValue = oEmpresa.IdTamanioCompania;
            tboxMisionE.Text = oEmpresa.MisionEmpresa;
            tboxNombreTitularE.Text = oEmpresa.NombreDuenio;

            tboxCalleE.Text = oEmpresa.NombreCalle;
            tboxNumExtE.Text = oEmpresa.NumeriorExterior;
            tboxNumIntE.Text = oEmpresa.NumeroInterior;
            tboxColoniaE.Text = oEmpresa.Colonia;
            tboxMunicipioE.Text = oEmpresa.Municipio;
            tboxCPE.Text = oEmpresa.NumeroPostal;
        }

        private void NotificarResponsablesRevisionSolicitud()
        {
            DataTable dtUsuariosNotificacion = Usuario.ObtieneUsuariosParaNotificar(Generales.glsUsuarioSession.IdCarrera, "EnvioSolicitud");

            foreach (DataRow dr in dtUsuariosNotificacion.Rows)
            {
                Generales.InsertaNotificacion(dr["IdUser"].ToString(), "El Alumno \"" + Generales.glsUsuarioSession.NoControl + " - " + Generales.glsUsuarioSession.Nombre + " " + Generales.glsUsuarioSession.ApellidoPaterno + " " +
                    Generales.glsUsuarioSession.ApellidoMaterno + "\" ha enviado su solicitud", Enums.TipoNotificacion.Hipervinculo.ToString(), "SolicitudesAdministrador.aspx");
            }
        }
        #endregion
    }
}