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
    public partial class Principal : System.Web.UI.MasterPage
    {
        #region Variables
        public String sPrcAvancereconoce;
        private Mensajes oMensajes = new Mensajes();
        public StringBuilder sNumeroNotificaciones;
        public StringBuilder sHtmlNotificaciones;
        #endregion

        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                ConfiguraPagina();
            }
            GenerarNotificaciones();

            if (Request.Form["btnNotificacion"] != null)
            {
                String[] sParametros = Request.Form["btnNotificacion"].Split('|');

                Generales.EliminarNotificacion(sParametros[0]);
                Response.Redirect(sParametros[1]);
            }
            else if (Request.Form["btnLimpiarNotificacion"] != null)
            {
                Generales.LimpiarNotificaciones(Generales.glsUsuarioSession.IdUsuario);
                GenerarNotificaciones();
            }
        }

        protected void ibtnHome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void ibtnBusquedaPM_Click(object sender, ImageClickEventArgs e)
        {
            
        }

        protected void ibtnEdcorePM_Click(object sender, ImageClickEventArgs e)
        {
            string script = $@"window.open('{"https://edcore.tecmm.mx/alum/login.jsp"}','_blank');";
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", script, true);
        }

        protected void ibtnFacebookPM_Click(object sender, ImageClickEventArgs e)
        {
            string script = $@"window.open('{"https://www.facebook.com/TSJZapopan"}','_blank');";
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", script, true);
        }

        protected void ibtnPaginaOficialPM_Click(object sender, ImageClickEventArgs e)
        {
            string script = $@"window.open('{"https://www.tecmm.edu.mx/"}','_blank');";
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", script, true);
        }

        protected void lbtnModuloAdministrador_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModuloAdministrador.aspx");
        }

        protected void lblEditarPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditarPerfil.aspx");
        }

        protected void lbtnCerrarSesion_Click(object sender, EventArgs e)
        {
            Generales.glsUsuarioSession = null;
            Response.Redirect("Acceso.aspx");
        }
        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("Principal.aspx");

            ibtnHomePM.ImageUrl = "~//Assets//Imagenes//Principal//LogoApp.png";
            ibtnHomePM.CausesValidation = false;
            ibtnHomePM.Width = 150;

            ibtnEdcorePM.ImageUrl = "~//Assets//Imagenes//Principal//Edcore.png";
            ibtnEdcorePM.CausesValidation = false;
            ibtnEdcorePM.Width = 90;
            ibtnFacebookPM.ImageUrl = "~//Assets//Imagenes//Principal/Facebook.png";
            ibtnFacebookPM.CausesValidation = false;
            ibtnFacebookPM.Width = 30;
            ibtnPaginaOficialPM.ImageUrl = "~//Assets//Imagenes//Principal/GloboInternet.png";
            ibtnPaginaOficialPM.CausesValidation = false;
            ibtnPaginaOficialPM.Width = 30;

            iCampanaNotiPM.ImageUrl = "~//Assets//Imagenes//Principal/Bell.png";
            iCampanaNotiPM.Width = 32;

            if(Generales.glsUsuarioSession.IdTipoUsuario.ToString() == Enums.TipoUsuario.Alumno.ToString())
            {
                lbtnModuloAdministrador.Visible = false;
            }

            try
            {
                Usuario oUsuario = new Usuario(Generales.glsUsuarioSession.IdUsuario);

                if (oUsuario.PathFotoPerfil != "")
                {
                    iFotoPerfilPM.ImageUrl = "~//" + oUsuario.PathFotoPerfil;
                }
                else
                {
                    iFotoPerfilPM.ImageUrl = "~//Assets//Imagenes//FotosDePerfil//Alumno.jpg";
                }
                lblNombreCompletoPM.Text = oUsuario.Nombre + " " + oUsuario.ApellidoPaterno + " " + oUsuario.ApellidoMaterno;
                lblNo.Text = oUsuario.NoControl + " - " + ValoresPorReferencia.ObtieneDatoValorPorReferencia("TipoUsuario", Generales.glsUsuarioSession.IdTipoUsuario.ToString());
            }
            catch
            {
                iFotoPerfilPM.ImageUrl = "~//Assets//Imagenes//FotosDePerfil//Alumno.jpg";
            }

            imgLogoUniPM.ImageUrl = "~//Assets//Imagenes//Principal/LogoAppFooter.png";
        }

        private void GenerarNotificaciones()
        {
            sHtmlNotificaciones = new StringBuilder();
            sNumeroNotificaciones = new StringBuilder();
            DataTable dtNotificaciones = Generales.ObtieneNotificacionesGenerales(Generales.glsUsuarioSession.IdUsuario);
            int iNumNotificaciones = dtNotificaciones.Rows.Count;

            if(iNumNotificaciones > 0)
            {
                sNumeroNotificaciones.AppendFormat("<span class=\"notification-count\"> {0} </span>", iNumNotificaciones.ToString());
                

                sHtmlNotificaciones.AppendLine("<div style=\"width:360px; max-height:400px; overflow-y:auto;\">");

                foreach (DataRow dr in dtNotificaciones.Rows)
                {
                    sHtmlNotificaciones.AppendLine("<li role=\"presentation\">");
                    sHtmlNotificaciones.AppendLine("  <button runat=\"server\" type=\"submit\" class=\"btn btn-link btn-en-dropdown \" role=\"menuitem\" name=\"btnNotificacion\" value=\"" + dr["IdNotification"] + "|" + dr["ReturnView"] + "\"> " + dr["Description"] + "</button>");
                    sHtmlNotificaciones.AppendLine("<li>");
                    sHtmlNotificaciones.AppendLine("<div class=\"dropdown-divider\"></div>");
                }
                sHtmlNotificaciones.AppendLine("</div>");
                sHtmlNotificaciones.AppendLine("<div class=\"dropdown-divider\"></div>");
                sHtmlNotificaciones.AppendLine("<li style=\"text-align:end;\">");
                sHtmlNotificaciones.AppendLine("  <button runat=\"server\" type=\"submit\" class=\"btn btn-link btn-en-dropdown \" role=\"menuitem\" name=\"btnLimpiarNotificacion\" value=\"" + Generales.glsUsuarioSession.IdUsuario + "\">Limpiar notificaciones.</button>");
                sHtmlNotificaciones.AppendLine("</li>");
            }
            else
            {
                sHtmlNotificaciones.AppendLine("<li role=\"presentation\">");
                sHtmlNotificaciones.AppendLine("  <a class=\"dropdown-item\" style=\"width: 100%;\" href=\"#\">Sin Notificaciones</a>");
                sHtmlNotificaciones.AppendLine("<li>");
            }
        }
        #endregion
    }
}