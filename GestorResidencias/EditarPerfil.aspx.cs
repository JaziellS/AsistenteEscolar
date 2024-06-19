using GestorResidencias.Clases;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorResidencias
{
    public partial class EditarPerfil : System.Web.UI.Page
    {
        #region Variables
        private Mensajes oMensajes = new Mensajes();
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
                if (IsPostBack == false)
                {
                    ConfiguraPagina();
                    LlenarCombos();
                    LlenarCamposUsuario();
                    ObtieneMiFotoDePerfil();
                    ValidaComponentes();
                }
            }
        }

        protected void ibtnRetroceder_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void cboxAcudir_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(cboxAcudir.SelectedValue == "1")
            {
                divOtro.Visible = true;
                rfvCual.Enabled = true;
            }
            else
            {

                tboxCual.Text = "";
                divOtro.Visible = false;
                rfvCual.Enabled = false;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (tboxContrasena.Text == tboxRepiteContrasena.Text)
                {
                    Usuario oUsuario = new Usuario(Generales.glsUsuarioSession.IdUsuario);

                    oUsuario.Nombre = tboxNombreE.Text;
                    oUsuario.ApellidoPaterno = tboxApellidoPat.Text;
                    oUsuario.ApellidoMaterno = tboxApellidoMat.Text;
                    oUsuario.IdCarrera = cboxCarrera.SelectedValue;
                    oUsuario.TelefonoCelular = tboxTelefonoCelular.Text;
                    oUsuario.Telefono = tboxTelefonoFijo.Text;
                    oUsuario.Semestre = tboxSemestres.Text;
                    oUsuario.Contrasena = tboxContrasena.Text;

                    oUsuario.NSS = tboxNSS.Text;
                    oUsuario.IdSeguridadSocial = cboxAcudir.SelectedValue;

                    if (cboxAcudir.SelectedValue == "1")
                    {
                        oUsuario.OtraSeguridadSocial = tboxCual.Text;
                    }
                    else
                    {
                        oUsuario.OtraSeguridadSocial = "";
                    }

                    oUsuario.Calle = tboxCalle.Text;
                    oUsuario.NumeroExterior = tboxNumExterior.Text;
                    oUsuario.NumeroInterior = tboxNumInterior.Text;
                    oUsuario.Colonia = tboxColonia.Text;
                    oUsuario.Estado = tboxEstado.Text;
                    oUsuario.Municipio = tboxMunicipio.Text;
                    oUsuario.Ciudad = tboxCiudad.Text;
                    oUsuario.NumeroPostal = tboxCP.Text;

                    oUsuario.InsertaActualizaUsuario();

                    oMensajes.MuestraMensajeConRespuestaSoloAceptar(this, "Información", "Para ver reflejado los cambios reinicia sesion", Mensajes.TipoMensaje.Informacion, "RedireccionarInicio");
                }
                else
                {
                    tboxContrasena.Focus();
                }

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
            oMensajes.RecuperarTablaMensajes("EditarPerfil.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            ibtnRetroceder.ImageUrl = "~//Assets//Imagenes//Principal//FlechaRetroceder.png";
            ibtnRetroceder.Width = 40;
            ibtnRetroceder.CausesValidation = false;

            fuArchivoDO.Attributes["onchange"] = "UploadFileFotoPerfil(this)";
            fuArchivoDO.Attributes["accept"] = ".jpg,.jpeg,.JPG,.JPEG,.png,.PNG";

            btnCambiarFoto.Text = oMensajes.TablaMensajes["btnCambiarFoto"];
            btnCambiarFoto.ForeColor = System.Drawing.Color.White;
            btnCambiarFoto.Font.Bold = true;
            btnCambiarFoto.CausesValidation = false;
            btnCambiarFoto.Attributes.Add("onclick", "document.getElementById('" + fuArchivoDO.ClientID + "').click(); return false;");

            Usuario oUsuario = new Usuario(Generales.glsUsuarioSession.IdUsuario);

            lblNombre.Text = oUsuario.Nombre + " " + oUsuario.ApellidoPaterno + " " + oUsuario.ApellidoMaterno;
            lblNoControl.Text = oUsuario.NoControl;
            lblCorreo.Text = oUsuario.Email + ValoresPorReferencia.ObtieneDatoValorPorReferencia("DominioCorreo", oUsuario.IdDominio);

            lblMiPerfil.Text = oMensajes.TablaMensajes["lblMiPerfil"];

            lblNombreE.Text = oMensajes.TablaMensajes["lblNombreE"];
            rfvNombreE.Text = "Campo Obligatorio";

            lblApellidoPat.Text = oMensajes.TablaMensajes["lblApellidoPat"];
            rfvApellidoPat.Text = "Campo Obligatorio";

            lblApellidoMat.Text = oMensajes.TablaMensajes["lblApellidoMat"];
            rfvApellidoMat.Text = "Campo Obligatorio";

            lblCarrera.Text = oMensajes.TablaMensajes["lblCarrera"];
            rfvCarrera.Text = "Campo Obligatorio";

            lblTelefonoCelular.Text = oMensajes.TablaMensajes["lblTelefonoCelular"];
            rfvTelefonoCelular.Text = "Campo Obligatorio";

            lblTelefonoFijo.Text = oMensajes.TablaMensajes["lblTelefonoFijo"];
            rfvTelefonoFijo.Text = "Campo Obligatorio";

            lblSemestre.Text = oMensajes.TablaMensajes["lblSemestre"];
            rfvSemestres.Text = "Campo Obligatorio";

            lblContrasena.Text = oMensajes.TablaMensajes["lblContrasena"];
            rfvContrasena.Text = "Campo Obligatorio";
            tboxContrasena.Attributes["type"] = "password";

            lblRepiteContrasena.Text = oMensajes.TablaMensajes["lblRepiteContrasena"];
            rfvRepiteContrasena.Text = "Campo Obligatorio";
            tboxRepiteContrasena.Attributes["type"] = "password";

            lblSeguroSocial.Text = oMensajes.TablaMensajes["lblSeguroSocial"];

            lblNSS.Text = oMensajes.TablaMensajes["lblNSS"];
            rfvNSS.Text = "Campo Obligatorio";

            lblAcudir.Text = oMensajes.TablaMensajes["lblAcudir"];
            rfvAcudir.Text = "Campo Obligatorio";

            lblCual.Text = oMensajes.TablaMensajes["lblCual"];
            rfvCual.Text = "Campo Obligatorio";
            rfvCual.Enabled = false;
            divOtro.Visible = false;
            
            lblDomicilio.Text = oMensajes.TablaMensajes["lblDomicilio"];

            lblCalle.Text = oMensajes.TablaMensajes["lblCalle"];
            rfvCalle.Text = "Campo Obligatorio";

            lblNumExterior.Text = oMensajes.TablaMensajes["lblNumExterior"];
            rfvNumExterior.Text = "Campo Obligatorio";

            lblNumInterior.Text = oMensajes.TablaMensajes["lblNumInterior"];
            rfvNumInterior.Text = "Campo Obligatorio";
            rfvNumInterior.Enabled = false;

            lblColonia.Text = oMensajes.TablaMensajes["lblColonia"];
            rfvColonia.Text = "Campo Obligatorio";

            lblEstado.Text = oMensajes.TablaMensajes["lblEstado"];
            rfvEstado.Text = "Campo Obligatorio";

            lblMunicipio.Text = oMensajes.TablaMensajes["lblMunicipio"];
            rfvMunicipio.Text = "Campo Obligatorio";

            lblCiudad.Text = oMensajes.TablaMensajes["lblCiudad"];
            rfvCiudad.Text = "Campo Obligatorio";

            lblCP.Text = oMensajes.TablaMensajes["lblCP"];
            rfvCP.Text = "Campo Obligatorio";


            btnGuardar.Text = oMensajes.TablaMensajes["btnGuardar"];
            btnGuardar.ForeColor = System.Drawing.Color.White;
            btnGuardar.Font.Bold = true;
        }

        private void LlenarCombos()
        {
            cboxCarrera.DataTextField = "Name";
            cboxCarrera.DataValueField = "IdValueDetail";
            cboxCarrera.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Carreras");
            cboxCarrera.DataBind();
            cboxCarrera.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxCarrera.SelectedIndex = 0;

            cboxAcudir.DataTextField = "Name";
            cboxAcudir.DataValueField = "IdValueDetail";
            cboxAcudir.DataSource = ValoresPorReferencia.RecuperaValorReferencia("SeguridadSocial");
            cboxAcudir.DataBind();
            cboxAcudir.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxAcudir.SelectedIndex = 0;
        }

        private void LlenarCamposUsuario()
        {
            Usuario oUsuario = new Usuario(Generales.glsUsuarioSession.IdUsuario);
            
            tboxNombreE.Text = oUsuario.Nombre;
            tboxApellidoPat.Text = oUsuario.ApellidoPaterno;
            tboxApellidoMat.Text = oUsuario.ApellidoMaterno;
            cboxCarrera.SelectedValue = oUsuario.IdCarrera;
            tboxTelefonoFijo.Text = oUsuario.Telefono;
            tboxTelefonoCelular.Text = oUsuario.TelefonoCelular;
            tboxSemestres.Text = oUsuario.Semestre;
            tboxContrasena.Text = oUsuario.Contrasena;
            tboxRepiteContrasena.Text = oUsuario.Contrasena;

            tboxNSS.Text = oUsuario.NSS;
            cboxAcudir.SelectedValue = oUsuario.IdSeguridadSocial;
            cboxAcudir_SelectedIndexChanged(null, null);
            tboxCual.Text = oUsuario.OtraSeguridadSocial;

            tboxCalle.Text = oUsuario.Calle;
            tboxNumExterior.Text = oUsuario.NumeroExterior;
            tboxNumInterior.Text = oUsuario.NumeroInterior;
            tboxColonia.Text = oUsuario.Colonia;
            tboxEstado.Text = oUsuario.Estado;
            tboxMunicipio.Text = oUsuario.Municipio;
            tboxCiudad.Text = oUsuario.Ciudad;
            tboxCP.Text = oUsuario.NumeroPostal;
        }

        private void ObtieneMiFotoDePerfil()
        {
            Usuario oUsuario = new Usuario(Generales.glsUsuarioSession.IdUsuario);

            if(oUsuario.PathFotoPerfil != "")
            {
                String sDestino =  Server.MapPath( "~//" + oUsuario.PathFotoPerfil);

                if (File.Exists(sDestino))
                {
                    imgFotoDePerfil.ImageUrl = "~//" + oUsuario.PathFotoPerfil;
                }
                else
                {
                    imgFotoDePerfil.ImageUrl = "~//Assets//Imagenes//FotosDePerfil//Alumno.jpg";
                }
            }
            else
            {
                imgFotoDePerfil.ImageUrl = "~//Assets//Imagenes//FotosDePerfil//Alumno.jpg";
            }
            hfImage.Value = "";
        }

        private void GuardaArchivosServidor(FileUpload fuArchivo)
        {
            try
            {
                String sDestino = "~/Assets/Imagenes/FotosDePerfil/" + Generales.glsUsuarioSession.NoControl + "/";

                String sCarpetaDestino = Server.MapPath(sDestino);

                if (!(Directory.Exists(sCarpetaDestino)))
                {
                    Directory.CreateDirectory(sCarpetaDestino);
                }

                if (fuArchivo.PostedFiles.Count == 1)
                {
                    String sNumeroDeFoto = "";
                    Usuario oUsuario = new Usuario(Generales.glsUsuarioSession.IdUsuario);

                    if(oUsuario.PathFotoPerfil != "")
                    {
                        String sArchivoPorEliminar = Server.MapPath("~//" + oUsuario.PathFotoPerfil);

                        String[] sDivide = oUsuario.PathFotoPerfil.Split('\\');
                        String[] sDivideGuion = sDivide[4].Split('_');
                        String[] sDividePunto = sDivideGuion[1].Split('.');

                        sNumeroDeFoto = sDividePunto[0];
                        int iNuevoNumero = int.Parse(sNumeroDeFoto) + 1;

                        if (File.Exists(sArchivoPorEliminar))
                        {
                            File.Delete(sArchivoPorEliminar);
                        }

                        String sNombreArchivo = oUsuario.NoControl + "_" + iNuevoNumero.ToString() +  ".jpg";
                        String SaveLocation = sCarpetaDestino + "\\" + sNombreArchivo;
                        String sPathBD = "Assets\\Imagenes\\FotosDePerfil\\" + Generales.glsUsuarioSession.NoControl + "\\" + sNombreArchivo;

                        Usuario.ActualizaPathFotoPerfil(Generales.glsUsuarioSession.NoControl, sPathBD);
                        fuArchivo.PostedFile.SaveAs(SaveLocation);
                    }
                    else
                    {
                        String sNombreArchivo = oUsuario.NoControl + "_1.jpg";
                        String SaveLocation = sCarpetaDestino + "\\" + sNombreArchivo;
                        String sPathBD = "Assets\\Imagenes\\FotosDePerfil\\" + Generales.glsUsuarioSession.NoControl + "\\" + sNombreArchivo;

                        Usuario.ActualizaPathFotoPerfil(Generales.glsUsuarioSession.NoControl, sPathBD);
                        fuArchivo.PostedFile.SaveAs(SaveLocation);
                    }
                }
                fuArchivo.Dispose();
                ObtieneMiFotoDePerfil();
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string RedireccionarInicio()
        {
            return "Index.aspx";
        }
        #endregion

        protected void btnHacerElCambio_Click(object sender, EventArgs e)
        {
            if (fuArchivoDO.HasFile)
            {
                if (fuArchivoDO.PostedFiles.Count == 1)
                {
                    hfImage.Value = fuArchivoDO.FileName;
                }
            }

            if (hfImage.Value == "")
            {
                oMensajes.MuestraMensaje(this.Page, "Precaución", "Es necesario seleccionar una Imagen", Mensajes.TipoMensaje.Precaucion);
                return;
            }
            else
            {
                GuardaArchivosServidor(fuArchivoDO);
            }
        }

        protected void tboxContrasena_TextChanged(object sender, EventArgs e)
        {
            if (tboxContrasena.Text != tboxRepiteContrasena.Text)
            {
                lblContreseniasNoCoinciden.Text = "Las contras no coinciden";
                tboxContrasena.Attributes.Add("style", "border-color:red");
                tboxRepiteContrasena.Attributes.Add("style", "border-color:red");
            }
            else if (tboxContrasena.Text == "" && tboxRepiteContrasena.Text == "")
            {
                lblContreseniasNoCoinciden.Text = "Las contraseñas no deben ser vacias";
                tboxContrasena.Attributes.Add("style", "border-color:red");
                tboxRepiteContrasena.Attributes.Add("style", "border-color:red");
            }
            else
            {
                lblContreseniasNoCoinciden.Text = "";
                tboxContrasena.Attributes.Add("style", "border-color:lime");
                tboxRepiteContrasena.Attributes.Add("style", "border-color:lime");
            }
        }

        protected void ValidaComponentes()
        {
            if(Generales.glsUsuarioSession.IdTipoUsuario==Enums.TipoUsuario.EncargadoDeResidencias.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString()
                || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Maestro.ToString())
            {
                divCamposExtras.Visible = false;
                divTelefonoFijo.Visible = false;
                divSemestre.Visible = false;
            }
        }
    }
}