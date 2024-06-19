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
    public partial class Acceso : System.Web.UI.Page
    {
        #region Variables
        public String sNombreApp;
        private Mensajes oMensajes = new Mensajes();
        private String[] sTipoEntrada;
        private String sParametros;
        private Boolean bValidarAcceso = true;
        #endregion

        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                ConfiguraPagina();
                LlenarCombos();

                Session.Remove("UsuarioSession");
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "Script1", "ScrollMod();", true);
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                int iResp = ValidaUsuario(tboxUsuario.Text.Trim().ToUpper(), tboxContrasena.Text);

                if (iResp == Enums.TipoAcceso.Correcto)
                {
                    Response.Redirect("Index.aspx");
                }
                else if (iResp == Enums.TipoAcceso.UsuarioInactivo)
                {
                    oMensajes.MuestraMensaje(this, "Información", "Tu perfil esta inactivo, si quieres volver tener acceso al sistema solicita el acceso a tu jefe de carrera.", Mensajes.TipoMensaje.Informacion);
                    return;
                }
                else if (iResp == Enums.TipoAcceso.SolicitudDeAcceso)
                {
                    oMensajes.MuestraMensaje(this, "Información", "Tu perfil esta en proceso de solicitud, espere a recibir una notificacion de acceso al sistema", Mensajes.TipoMensaje.Informacion);
                    return;
                }
                else if (iResp == Enums.TipoAcceso.Incorrecto)
                {
                    oMensajes.MuestraMensaje(this, "Error", "Usuario o contraseña incorrectos", Mensajes.TipoMensaje.Error);
                    return;
                }
                else if (iResp == Enums.TipoAcceso.ConfiguracionIncompleta)
                {
                    oMensajes.MuestraMensaje(this, "Error", "Usuario no configurado correctamente", Mensajes.TipoMensaje.Error);
                    return;
                }
                else if (iResp == Enums.TipoAcceso.SolicitarContrasena)
                {
                    oMensajes.MuestraMensaje(this, "Error", "No cuentas con ninguna contraseña, habla con tu jefe de carrera para que se te conceda una.", Mensajes.TipoMensaje.Error);
                    return;
                }
                else if(iResp == Enums.TipoAcceso.CuentasSecundarias)
                {
                    ValidaTusCuentas();
                    modCuentaSecundaria.Show();
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message, Mensajes.TipoMensaje.Error);
            }
        }

        protected void btnSolicitarAcceso_Click(object sender, EventArgs e)
        {
            LimpiarModal();
            modSolicitar.Show();
        }

        #region Modal Solicitar Acceo
        protected void ibtnCerrarMod_Click(object sender, ImageClickEventArgs e)
        {
            modSolicitar.Hide();
        }

        protected void tboxNoControlMod_TextChanged(object sender, EventArgs e)
        {
            if (Usuario.ValidaExisteNumeroControl(tboxNoControlMod.Text))
            {
                tboxNoControlMod.Text = "";
                oMensajes.MuestraMensaje(this, "Error", "El numero de control escrito ya esta registrado para otro usuario", Mensajes.TipoMensaje.Error);
            }
        }

        protected void tboxContrasenaMod_TextChanged(object sender, EventArgs e)
        {
            if (tboxContrasenaMod.Text != tboxRepiteContrasenaMod.Text)
            {
                lblContreseniasNoCoincidenMod.Text = "Las contraseñas no coinciden";
                tboxContrasenaMod.Attributes.Add("style", "border-color:red");
                tboxRepiteContrasenaMod.Attributes.Add("style", "border-color:red");
            }
            else if (tboxContrasenaMod.Text == "" && tboxRepiteContrasenaMod.Text == "")
            {
                lblContreseniasNoCoincidenMod.Text = "Las contraseñas no deben ser vacias";
                tboxContrasenaMod.Attributes.Add("style", "border-color:red");
                tboxRepiteContrasenaMod.Attributes.Add("style", "border-color:red");
            }
            else
            {
                lblContreseniasNoCoincidenMod.Text = "";
                tboxContrasenaMod.Attributes.Add("style", "border-color:lime");
                tboxRepiteContrasenaMod.Attributes.Add("style", "border-color:lime");
            }
        }

        protected void cboxSeguridadSocialMod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboxSeguridadSocialMod.SelectedValue == "1")
            {
                tboxOtraSeguridadSocialMod.Text = "";
                divOtraSSMod.Visible = true;
                rfvOtraSeguridadSocialMod.Enabled = true;
            }
            else
            {
                tboxOtraSeguridadSocialMod.Text = "";
                divOtraSSMod.Visible = false;
                rfvOtraSeguridadSocialMod.Enabled = false;
            }
        }

        protected void btnSolicitarMod_Click(object sender, EventArgs e)
        {
            try
            {
                if (tboxContrasenaMod.Text == tboxRepiteContrasenaMod.Text)
                {
                    if (!Usuario.ValidaExisteNumeroControl(tboxNoControlMod.Text))
                    {
                        Usuario oUsaurio = new Usuario();

                        oUsaurio.NoControl = tboxNoControlMod.Text;
                        oUsaurio.Nombre = tboxNombreMod.Text;
                        oUsaurio.ApellidoPaterno = tboxApellidoPatMod.Text;
                        oUsaurio.ApellidoMaterno = tboxApellidoMatMod.Text;
                        oUsaurio.Email = tboxEmailMod.Text.ToLower();
                        oUsaurio.IdDominio = cboxDominioMod.SelectedValue;
                        oUsaurio.Telefono = tboxTelefonoMod.Text;
                        oUsaurio.TelefonoCelular = tboxCelularMod.Text;
                        oUsaurio.Semestre = tboxSemestreMod.Text;
                        oUsaurio.IdCarrera = cboxCarreraMod.SelectedValue;
                        oUsaurio.Contrasena = tboxContrasenaMod.Text;
                        oUsaurio.IdTipoUsuario = Enums.TipoUsuario.Alumno.ToString();
                        oUsaurio.IdTipoEstado = Enums.EstatusUsuario.SolictudDeAcceso.ToString();

                        oUsaurio.IdSeguridadSocial = cboxSeguridadSocialMod.SelectedValue;
                        if (cboxSeguridadSocialMod.SelectedValue == "1")
                        {
                            oUsaurio.OtraSeguridadSocial = tboxOtraSeguridadSocialMod.Text;
                        }
                        else
                        {
                            oUsaurio.OtraSeguridadSocial = "";
                        }

                        oUsaurio.NSS = tboxNSSMod.Text;

                        oUsaurio.Calle = tboxCalleMod.Text;
                        oUsaurio.NumeroExterior = tboxNumeroExteriorMod.Text;
                        oUsaurio.NumeroInterior = tboxNumeroInteriorMod.Text;
                        oUsaurio.Colonia = tboxColoniaMod.Text;
                        oUsaurio.Estado = tboxEstadoMod.Text;
                        oUsaurio.Municipio = tboxMunicipioMod.Text;
                        oUsaurio.Ciudad = tboxCiudadMod.Text;
                        oUsaurio.NumeroPostal = tboxCPMod.Text;

                        oUsaurio.InsertaUsuarioSolicitarAcceso();

                        NotificarResponsablesSolicitudAcceso(cboxCarreraMod.SelectedValue, tboxNoControlMod.Text + " - " + tboxNombreMod.Text + " " + tboxApellidoPatMod.Text + " " + tboxApellidoMatMod.Text);
                        modSolicitar.Hide();
                        oMensajes.MuestraMensaje(this, "Correcto", "Se solicito el acceso correctamente, espere a que el jefe de carrera acepte su solicitud.", Mensajes.TipoMensaje.Correcto);
                    }
                    else
                    {
                        oMensajes.MuestraMensaje(this, "Error", "El numero de control que selecciono ya esta registrado.", Mensajes.TipoMensaje.Error);
                    }
                }
                else
                {
                    tboxContrasenaMod.Focus();
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }
        #endregion

        #region Modal Cuenta Secundaria
        protected void ibtnCerrarModCS_Click(object sender, ImageClickEventArgs e)
        {
            modCuentaSecundaria.Hide();
        }

        protected void ibtnAdministradorModCS_Click(object sender, ImageClickEventArgs e)
        {
            Usuario oUsuario = new Usuario("", tboxUsuario.Text, Enums.TipoUsuario.Administrador.ToString());
            oUsuario.IdTipoUsuario = Enums.TipoUsuario.Administrador.ToString();
            Session["UsuarioSession"] = oUsuario;
            Response.Redirect("Index.aspx");
        }

        protected void ibtnJefeCarreraModCS_Click(object sender, ImageClickEventArgs e)
        {
            Usuario oUsuario = new Usuario("", tboxUsuario.Text, Enums.TipoUsuario.JefeCarrera.ToString());
            oUsuario.IdTipoUsuario = Enums.TipoUsuario.JefeCarrera.ToString();
            Session["UsuarioSession"] = oUsuario;
            Response.Redirect("Index.aspx");
        }

        protected void ibtnEncargadoResidenciaModCS_Click(object sender, ImageClickEventArgs e)
        {
            Usuario oUsuario = new Usuario("", tboxUsuario.Text, Enums.TipoUsuario.EncargadoDeResidencias.ToString());
            oUsuario.IdTipoUsuario = Enums.TipoUsuario.EncargadoDeResidencias.ToString();
            Session["UsuarioSession"] = oUsuario;
            Response.Redirect("Index.aspx");
        }

        protected void ibtnMaestroModCS_Click(object sender, ImageClickEventArgs e)
        {
            Usuario oUsuario = new Usuario("", tboxUsuario.Text, Enums.TipoUsuario.Maestro.ToString());
            oUsuario.IdTipoUsuario = Enums.TipoUsuario.Maestro.ToString();
            Session["UsuarioSession"] = oUsuario;
            Response.Redirect("Index.aspx");
        }
        #endregion

        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("Acceso.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];

            imgLogin.ImageUrl = "~//Assets//Imagenes//Principal//LogoAppFooter.png";

            lblUsuario.Text = oMensajes.TablaMensajes["lblUsuario"];
            tboxUsuario.Attributes["placeholder"] = oMensajes.TablaMensajes["tboxUsuario"];

            lblContrasena.Text = oMensajes.TablaMensajes["lblContrasena"];
            tboxContrasena.Attributes["placeholder"] = oMensajes.TablaMensajes["tboxContrasena"];
            tboxContrasena.Attributes["type"] = "password";

            btnIngresar.Text = oMensajes.TablaMensajes["btnIngresar"];
            btnIngresar.ForeColor = System.Drawing.Color.White;
            btnIngresar.Font.Bold = true;

            #region Modal Solicitar Acceso
            lblDescripcionModuloMod.Text = oMensajes.TablaMensajes["lblDescripcionModuloMod"];

            ibtnCerrarMod.ImageUrl = "~//Assets//Imagenes//Principal//Cerrar Negro.png";
            ibtnCerrarMod.Width = 30;
            ibtnCerrarMod.CausesValidation = false;

            lblDatosPersonalesMod.Text = oMensajes.TablaMensajes["lblDatosPersonalesMod"];

            lblNoControlMod.Text = oMensajes.TablaMensajes["lblNoControlMod"];
            rfvNoControlMod.Text = "Campo Obligatorio";

            lblNombreMod.Text = oMensajes.TablaMensajes["lblNombreMod"];
            rfvNombreMod.Text = "Campo Obligatorio";

            lblApellidoPatMod.Text = oMensajes.TablaMensajes["lblApellidoPatMod"];
            rfvApellidoPatMod.Text = "Campo Obligatorio";

            lblApellidoMatMod.Text = oMensajes.TablaMensajes["lblApellidoMatMod"];
            rfvApellidoMatMod.Text = "Campo Obligatorio";

            lblEmailMod.Text = oMensajes.TablaMensajes["lblEmailMod"];
            rfvEmailMod.Text = "Campo Obligatorio";

            lblSemestreMod.Text = oMensajes.TablaMensajes["lblSemestreMod"];
            rfvSemestreMod.Text = "Campo Obligatorio";

            lblTelefonoMod.Text = oMensajes.TablaMensajes["lblTelefonoMod"];
            rfvTelefonoMod.Text = "Campo Obligatorio";

            lblCelularMod.Text = oMensajes.TablaMensajes["lblCelularMod"];
            rfvCelularMod.Text = "Campo Obligatorio";

            lblCarreraMod.Text = oMensajes.TablaMensajes["lblCarreraMod"];
            rfvCarreraMod.Text = "Campo Obligatorio";

            lblContrasenaMod.Text = oMensajes.TablaMensajes["lblContrasenaMod"];
            rfvContrasenaMod.Text = "Campo Obligatorio";
            tboxContrasenaMod.Attributes["type"] = "password";
            lblRepiteContrasenaMod.Text = oMensajes.TablaMensajes["lblRepiteContrasenaMod"];
            rfvRepiteContrasenaMod.Text = "Campo Obligatorio";
            tboxRepiteContrasenaMod.Attributes["type"] = "password";

            lblDatosSeguridadSocialMod.Text = oMensajes.TablaMensajes["lblDatosSeguridadSocialMod"];

            lblSeguridadSocialMod.Text = oMensajes.TablaMensajes["lblSeguridadSocialMod"];
            rfvSeguridadSocialMod.Text = "Campo Obligatorio";

            divOtraSSMod.Visible = false;
            lblOtraSeguridadSocialMod.Text = oMensajes.TablaMensajes["lblOtraSeguridadSocialMod"];
            rfvOtraSeguridadSocialMod.Text = "Campo Obligatorio";

            lblNSSMod.Text = oMensajes.TablaMensajes["lblNSSMod"];
            rfvNSSMod.Text = "Campo Obligatorio";

            lblDatosDomicilioMod.Text = oMensajes.TablaMensajes["lblDatosDomicilioMod"];

            lblCalleMod.Text = oMensajes.TablaMensajes["lblCalleMod"];
            rfvCalleMod.Text = "Campo Obligatorio";

            lblNumeroExteriorMod.Text = oMensajes.TablaMensajes["lblNumeroExteriorMod"];
            rfvNumeroExteriorMod.Text = "Campo Obligatorio";

            lblNumeroInteriorMod.Text = oMensajes.TablaMensajes["lblNumeroInteriorMod"];

            lblColoniaMod.Text = oMensajes.TablaMensajes["lblColoniaMod"];
            rfvColoniaMod.Text = "Campo Obligatorio";

            lblCiudadMod.Text = oMensajes.TablaMensajes["lblCiudadMod"];
            rfvCiudadMod.Text = "Campo Obligatorio";

            lblMunicipioMod.Text = oMensajes.TablaMensajes["lblMunicipioMod"];
            rfvMunicipioMod.Text = "Campo Obligatorio";

            lblEstadoMod.Text = oMensajes.TablaMensajes["lblEstadoMod"];
            rfvEstadoMod.Text = "Campo Obligatorio";

            lblCPMod.Text = oMensajes.TablaMensajes["lblCPMod"];
            rfvCPMod.Text = "Campo Obligatorio";

            btnSolicitarMod.Text = oMensajes.TablaMensajes["btnSolicitarMod"];
            btnSolicitarMod.ForeColor = System.Drawing.Color.White;
            btnSolicitarMod.Font.Bold = true;
            #endregion

            #region Modal Cuentas Secundaria
            lblDescripcionModuloModCS.Text = oMensajes.TablaMensajes["lblDescripcionModuloModCS"];

            ibtnCerrarModCS.ImageUrl = "~//Assets//Imagenes//Principal//Cerrar Negro.png";
            ibtnCerrarModCS.Width = 30;
            ibtnCerrarModCS.CausesValidation = false;

            ibtnAdministradorModCS.ImageUrl = "~//Assets//Imagenes//CuentasSecundarias//Administrador.png";
            ibtnAdministradorModCS.CausesValidation = false;
            ibtnAdministradorModCS.Width = 140;
            divAdministrador.Visible = false;
            lblAdministradorModCS.Text = oMensajes.TablaMensajes["lblAdministradorModCS"];

            ibtnJefeCarreraModCS.ImageUrl = "~//Assets//Imagenes//CuentasSecundarias//JefeCarrera.png";
            ibtnJefeCarreraModCS.CausesValidation = false;
            ibtnJefeCarreraModCS.Width = 140;
            divJefeCarrera.Visible = false;
            lblJefeCarreraModCS.Text = oMensajes.TablaMensajes["lblJefeCarreraModCS"];

            ibtnEncargadoResidenciaModCS.ImageUrl = "~//Assets//Imagenes//CuentasSecundarias//EncargadoResidencia.png";
            ibtnEncargadoResidenciaModCS.CausesValidation = false;
            ibtnEncargadoResidenciaModCS.Width = 140;
            divEncargadoResidencias.Visible = false;
            lblEncargadoResidenciaModCS.Text = oMensajes.TablaMensajes["lblEncargadoResidenciaModCS"];

            ibtnMaestroModCS.ImageUrl = "~//Assets//Imagenes//CuentasSecundarias//Maestro.png";
            ibtnMaestroModCS.CausesValidation = false;
            ibtnMaestroModCS.Width = 140;
            divMaestro.Visible = false;
            lblMaestroModCS.Text = oMensajes.TablaMensajes["lblMaestroModCS"];
            #endregion
        }

        private void LlenarCombos()
        {
            cboxCarreraMod.DataTextField = "Name";
            cboxCarreraMod.DataValueField = "IdValueDetail";
            cboxCarreraMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Carreras");
            cboxCarreraMod.DataBind();
            cboxCarreraMod.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxCarreraMod.SelectedIndex = 0;

            cboxSeguridadSocialMod.DataTextField = "Name";
            cboxSeguridadSocialMod.DataValueField = "IdValueDetail";
            cboxSeguridadSocialMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("SeguridadSocial");
            cboxSeguridadSocialMod.DataBind();
            cboxSeguridadSocialMod.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxSeguridadSocialMod.SelectedIndex = 0;

            cboxDominioMod.DataTextField = "Name";
            cboxDominioMod.DataValueField = "IdValueDetail";
            cboxDominioMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("DominioCorreo");
            cboxDominioMod.DataBind();
        }

        private int ValidaUsuario(string _sUsuario, string _sContrasena)
        {
            int iResp = Usuario.ValidaUsuarioEnBaseDatos(_sUsuario, _sContrasena);

            if (iResp == Enums.TipoAcceso.Correcto)
            {
                Usuario oUsuario = new Usuario("",  tboxUsuario.Text);
                Session["UsuarioSession"] = oUsuario;
            }

            return iResp;
        }

        private void ValidaTusCuentas()
        {
            DataTable dtCuentas = Usuario.ObtieneCuentasSecundarias(tboxUsuario.Text);
            
            foreach(DataRow dr in dtCuentas.Rows)
            {
                if (dr["IdTypeUser"].ToString() == Enums.TipoUsuario.Administrador.ToString())
                {
                    divAdministrador.Visible = true;
                }
                else if (dr["IdTypeUser"].ToString() == Enums.TipoUsuario.JefeCarrera.ToString())
                {
                    divJefeCarrera.Visible = true;
                }
                else if (dr["IdTypeUser"].ToString() == Enums.TipoUsuario.EncargadoDeResidencias.ToString())
                {
                    divEncargadoResidencias.Visible = true;
                }
                else if (dr["IdTypeUser"].ToString() == Enums.TipoUsuario.Maestro.ToString())
                {
                    divMaestro.Visible = true;
                }
            }

        }

        private void LimpiarModal()
        {
            tboxNoControlMod.Text = "";
            tboxNombreMod.Text = "";
            tboxApellidoPatMod.Text = "";
            tboxApellidoMatMod.Text = "";
            tboxEmailMod.Text = "";
            cboxDominioMod.SelectedIndex = -1;
            tboxSemestreMod.Text = "";
            tboxTelefonoMod.Text = "";
            tboxCelularMod.Text = "";
            cboxCarreraMod.SelectedIndex = -1;
            tboxContrasenaMod.Text = "";
            tboxRepiteContrasenaMod.Text = "";
            tboxContrasenaMod.Style.Remove("border-color");
            tboxRepiteContrasenaMod.Style.Remove("border-color");
            lblContreseniasNoCoincidenMod.Text = "";

            cboxSeguridadSocialMod.SelectedIndex = -1;
            cboxSeguridadSocialMod_SelectedIndexChanged(null, null);
            tboxOtraSeguridadSocialMod.Text = "";
            tboxNSSMod.Text = "";

            tboxCalleMod.Text = "";
            tboxNumeroExteriorMod.Text = "";
            tboxNumeroInteriorMod.Text = "";
            tboxColoniaMod.Text = "";
            tboxCiudadMod.Text = "";
            tboxMunicipioMod.Text = "";
            tboxEstadoMod.Text = "";
            tboxCPMod.Text = "";

        }

        private void NotificarResponsablesSolicitudAcceso(String _sIdCareer, String _sNombreAlumno)
        {
            DataTable dtUsuariosNotificacion = Usuario.ObtieneUsuariosParaNotificar(_sIdCareer, "SolicitudAcceso");

            foreach (DataRow dr in dtUsuariosNotificacion.Rows)
            {
                Generales.InsertaNotificacion(dr["IdUser"].ToString(), "Tienes una solicitud de acceso del alumno \"" + _sNombreAlumno + "\".", Enums.TipoNotificacion.Hipervinculo.ToString(), "Usuarios.aspx");
            }
        }
        #endregion
    }
}