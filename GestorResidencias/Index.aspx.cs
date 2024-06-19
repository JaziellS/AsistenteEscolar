using GestorResidencias.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorResidencias
{
    public partial class Index : System.Web.UI.Page
    {
        #region Variables
        private Mensajes oMensajes = new Mensajes();
        #endregion

        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Generales.glsUsuarioSession == null)
            {
                Response.Redirect("Acceso.aspx");
            }
            {
                if (IsPostBack == false)
                {
                    ConfiguraPagina();
                }
            }
        }

        protected void btnConoceMas_Click(object sender, EventArgs e)
        {

        }

        protected void ibtnBancoP_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("BancoProyectos.aspx");
        }

        protected void ibtnSolicitud_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Solicitudes.aspx");
        }

        protected void ibtnAnteproyecto_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Anteproyectos.aspx");
        }

        protected void ibtnModuloAdministrador_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ModuloAdministrador.aspx");
        }

        protected void btnBancoP_Click(object sender, EventArgs e)
        {
            Response.Redirect("BancoProyectos.aspx");
        }

        protected void btnSolicitudes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Solicitudes.aspx");
        }

        protected void btnAnteproyectos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Anteproyectos.aspx");
        }
        
        protected void btnModuloAdministrador_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModuloAdministrador.aspx");
        }
        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("Index.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];

            btnConoceMas.Text = oMensajes.TablaMensajes["btnConoceMas"];
            btnConoceMas.ForeColor = System.Drawing.Color.White;
            btnConoceMas.Font.Bold = true;
            btnConoceMas.CausesValidation = false;

            lblPrimerosPasos.Text = oMensajes.TablaMensajes["lblPrimerosPasos"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            //Banco de proyectos
            ibtnBancoP.ImageUrl = "~//Assets//Imagenes//Index//BancoProyectos.png";
            ibtnBancoP.CausesValidation = false;
            ibtnBancoP.ToolTip = oMensajes.TablaMensajes["ibtnBancoP"];

            lblBancoP.Text = oMensajes.TablaMensajes["lblBancoP"];
            lblBancoPDes.Text = oMensajes.TablaMensajes["lblBancoPDes"];

            btnBancoP.Text = oMensajes.TablaMensajes["btnBancoP"];
            btnBancoP.ForeColor = System.Drawing.Color.White;
            btnBancoP.Font.Bold = true;
            btnBancoP.CausesValidation = false;

            //Solicitud
            ibtnSolicitud.ImageUrl = "~//Assets//Imagenes//Index//Manos.png";
            ibtnSolicitud.CausesValidation = false;
            ibtnSolicitud.ToolTip = oMensajes.TablaMensajes["ibtnSolicitud"];

            lblSolicitud.Text = oMensajes.TablaMensajes["lblSolicitud"];
            lblSolicitudDes.Text = oMensajes.TablaMensajes["blSolicitudDes"];

            btnSolicitudes.Text = oMensajes.TablaMensajes["btnSolicitudes"];
            btnSolicitudes.ForeColor = System.Drawing.Color.White;
            btnSolicitudes.Font.Bold = true;
            btnSolicitudes.CausesValidation = false;

            divSolicitud.Visible = false;

            if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Alumno.ToString())
            {
                divSolicitud.Visible = true;
            }

            //Anteproyecto
            ibtnAnteproyecto.ImageUrl = "~//Assets//Imagenes//Index//Semilla.png";
            ibtnAnteproyecto.CausesValidation = false;
            ibtnAnteproyecto.ToolTip = oMensajes.TablaMensajes["ibtnAnteproyecto"];

            lblAnteproyecto.Text = oMensajes.TablaMensajes["lblAnteproyecto"];
            lblAnteproyectoDes.Text = oMensajes.TablaMensajes["lblAnteproyectoDes"];

            btnAnteproyectos.Text = oMensajes.TablaMensajes["btnAnteproyectos"];
            btnAnteproyectos.ForeColor = System.Drawing.Color.White;
            btnAnteproyectos.Font.Bold = true;
            btnAnteproyectos.CausesValidation = false;

            divAnteproyecto.Visible = false;

            if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Alumno.ToString())
            {
                divAnteproyecto.Visible = true;
            }

            //MuduloAdministrador
            ibtnModuloAdministrador.ImageUrl = "~//Assets//Imagenes//Index//Engranaje.png";
            ibtnModuloAdministrador.CausesValidation = false;
            ibtnModuloAdministrador.ToolTip = oMensajes.TablaMensajes["ibtnModuloAdministrador"];

            lblModuloAdministrador.Text = oMensajes.TablaMensajes["lblModuloAdministrador"];
            lblModuloAdministradorDes.Text = oMensajes.TablaMensajes["lblModuloAdministradorDes"];

            btnModuloAdministrador.Text = oMensajes.TablaMensajes["btnModuloAdministrador"];
            btnModuloAdministrador.ForeColor = System.Drawing.Color.White;
            btnModuloAdministrador.Font.Bold = true;
            btnModuloAdministrador.CausesValidation = false;

            divModuloAdministrador.Visible = true;

            if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Alumno.ToString())
            {
                divModuloAdministrador.Visible = false;
            }
        }
        #endregion
    }
}