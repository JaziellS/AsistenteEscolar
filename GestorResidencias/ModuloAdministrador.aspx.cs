using GestorResidencias.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorResidencias
{
    public partial class ModuloAdministrador : System.Web.UI.Page
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
            {
                if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.EncargadoDeResidencias.ToString()
                    || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Maestro.ToString())
                {
                    if (IsPostBack == false)
                    {
                        ConfiguraPagina();
                    }
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
            }
        }

        protected void ibtnUsuario_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Usuarios.aspx");
        }

        protected void btnUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx");
        }

        protected void ibtnSolicitud_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("SolicitudesAdministrador.aspx");
        }

        protected void btnSolicitudes_Click(object sender, EventArgs e)
        {
            Response.Redirect("SolicitudesAdministrador.aspx");
        }

        protected void ibtnAnteproyecto_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AnteproyectosAdministrador.aspx");
        }

        protected void btnAnteproyectos_Click(object sender, EventArgs e)
        {
            Response.Redirect("AnteproyectosAdministrador.aspx");
        }

        protected void ibtnBancoProyectos_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("BancoProyectosAdministrador.aspx");
        }

        protected void btnBancoProyectos_Click(object sender, EventArgs e)
        {
            Response.Redirect("BancoProyectosAdministrador.aspx");
        }

        protected void ibtnEmpresas_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("EmpresasAdministrador.aspx");
        }

        protected void btnEmpresas_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmpresasAdministrador.aspx");
        }

        protected void ibtnMaestrosResidentes_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MaestrosResidenciasAdministrador.aspx");
        }

        protected void btnMaestrosResidentes_Click(object sender, EventArgs e)
        {
            Response.Redirect("MaestrosResidenciasAdministrador.aspx");
        }

        protected void ibtnCalificarAnteproyectos_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AnteproyectosCalificarAdministrador.aspx");
        }

        protected void btnCalificarAnteproyectos_Click(object sender, EventArgs e)
        {
            Response.Redirect("AnteproyectosCalificarAdministrador.aspx");
        }

        protected void ibtnSeleccionarAnte_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AnteproyectosSeleccionarAdministrador.aspx");
        }

        protected void btnSeleccionarAnte_Click(object sender, EventArgs e)
        {
            Response.Redirect("AnteproyectosSeleccionarAdministrador.aspx");
        }
        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("ModuloAdministrador.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            //Usuarios
            ibtnUsuario.ImageUrl = "~//Assets//Imagenes//ModuloAdministrador//Usuario.png";
            ibtnUsuario.CausesValidation = false;
            ibtnUsuario.ToolTip = oMensajes.TablaMensajes["ibtnUsuario"];

            lblUsuario.Text = oMensajes.TablaMensajes["lblUsuario"];
            lblUsuarioDes.Text = oMensajes.TablaMensajes["lblUsuarioDes"];

            btnUsuario.Text = oMensajes.TablaMensajes["btnUsuario"];
            btnUsuario.ForeColor = System.Drawing.Color.White;
            btnUsuario.Font.Bold = true;
            btnUsuario.CausesValidation = false;

            divUsuarios.Visible = false;

            if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString())
            {
                divUsuarios.Visible = true;
            }

            //Solicitudes
            ibtnSolicitud.ImageUrl = "~//Assets//Imagenes//ModuloAdministrador//Manos.png";
            ibtnSolicitud.CausesValidation = false;
            ibtnSolicitud.ToolTip = oMensajes.TablaMensajes["ibtnSolicitud"];

            lblSolicitud.Text = oMensajes.TablaMensajes["lblSolicitud"];
            lblSolicitudDes.Text = oMensajes.TablaMensajes["lblSolicitudDes"];

            btnSolicitudes.Text = oMensajes.TablaMensajes["btnSolicitudes"];
            btnSolicitudes.ForeColor = System.Drawing.Color.White;
            btnSolicitudes.Font.Bold = true;
            btnSolicitudes.CausesValidation = false;

            divSolicitudes.Visible = false;

            if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString()
                || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.EncargadoDeResidencias.ToString())
            {
                divSolicitudes.Visible = true;
            }

            //Anteproyecto
            ibtnAnteproyecto.ImageUrl = "~//Assets//Imagenes//ModuloAdministrador//Semilla.png";
            ibtnAnteproyecto.CausesValidation = false;
            ibtnAnteproyecto.ToolTip = oMensajes.TablaMensajes["ibtnAnteproyecto"];

            lblAnteproyecto.Text = oMensajes.TablaMensajes["lblAnteproyecto"];
            lblAnteproyectoDes.Text = oMensajes.TablaMensajes["lblAnteproyectoDes"];

            btnAnteproyectos.Text = oMensajes.TablaMensajes["btnAnteproyectos"];
            btnAnteproyectos.ForeColor = System.Drawing.Color.White;
            btnAnteproyectos.Font.Bold = true;
            btnAnteproyectos.CausesValidation = false;

            divAnteproyectos.Visible = false;

            if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString()
                || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.EncargadoDeResidencias.ToString())
            {
                divAnteproyectos.Visible = true;
            }

            //BancoProyectos
            ibtnBancoProyectos.ImageUrl = "~//Assets//Imagenes//ModuloAdministrador//BancoProyectos.png";
            ibtnBancoProyectos.CausesValidation = false;
            ibtnBancoProyectos.ToolTip = oMensajes.TablaMensajes["ibtnBancoProyectos"];

            lblBancoProyectos.Text = oMensajes.TablaMensajes["lblBancoProyectos"];
            lblBancoProyectosDes.Text = oMensajes.TablaMensajes["lblBancoProyectosDes"];

            btnBancoProyectos.Text = oMensajes.TablaMensajes["btnBancoProyectos"];
            btnBancoProyectos.ForeColor = System.Drawing.Color.White;
            btnBancoProyectos.Font.Bold = true;
            btnBancoProyectos.CausesValidation = false;

            divBancoProyectos.Visible = false;

            if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString()
                || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.EncargadoDeResidencias.ToString())
            {
                divBancoProyectos.Visible = true;
            }

            //Empresa
            ibtnEmpresas.ImageUrl = "~//Assets//Imagenes//ModuloAdministrador//Empresa.png";
            ibtnEmpresas.CausesValidation = false;
            ibtnEmpresas.ToolTip = oMensajes.TablaMensajes["ibtnEmpresas"];

            lblEmpresas.Text = oMensajes.TablaMensajes["lblEmpresas"];
            lblEmpresasDes.Text = oMensajes.TablaMensajes["lblEmpresasDes"];

            btnEmpresas.Text = oMensajes.TablaMensajes["btnEmpresas"];
            btnEmpresas.ForeColor = System.Drawing.Color.White;
            btnEmpresas.Font.Bold = true;
            btnEmpresas.CausesValidation = false;

            divEmpresas.Visible = false;

            if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString()
                || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.EncargadoDeResidencias.ToString())
            {
                divEmpresas.Visible = true;
            }

            //Maestros Residentes
            ibtnMaestrosResidentes.ImageUrl = "~//Assets//Imagenes//ModuloAdministrador//LibroManzana.png";
            ibtnMaestrosResidentes.CausesValidation = false;
            ibtnMaestrosResidentes.ToolTip = oMensajes.TablaMensajes["ibtnMaestrosResidentes"];

            lblMaestrosResidentes.Text = oMensajes.TablaMensajes["lblMaestrosResidentes"];
            lblMaestrosResidentesDes.Text = oMensajes.TablaMensajes["lblMaestrosResidentesDes"];

            btnMaestrosResidentes.Text = oMensajes.TablaMensajes["btnMaestrosResidentes"];
            btnMaestrosResidentes.ForeColor = System.Drawing.Color.White;
            btnMaestrosResidentes.Font.Bold = true;
            btnMaestrosResidentes.CausesValidation = false;

            divMaestrosResidentes.Visible = false;

            if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString()
                || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.EncargadoDeResidencias.ToString())
            {
                divMaestrosResidentes.Visible = true;
            }

            //Calificar Anteproyectos
            ibtnCalificarAnteproyectos.ImageUrl = "~//Assets//Imagenes//ModuloAdministrador//Calificacion.png";
            ibtnCalificarAnteproyectos.CausesValidation = false;
            ibtnCalificarAnteproyectos.ToolTip = oMensajes.TablaMensajes["ibtnCalificarAnteproyectos"];

            lblCalificarAnteproyecto.Text = oMensajes.TablaMensajes["lblCalificarAnteproyecto"];
            lblCalificarAnteproyectoDet.Text = oMensajes.TablaMensajes["lblCalificarAnteproyectoDet"];

            btnCalificarAnteproyectos.Text = oMensajes.TablaMensajes["btnCalificarAnteproyectos"];
            btnCalificarAnteproyectos.ForeColor = System.Drawing.Color.White;
            btnCalificarAnteproyectos.Font.Bold = true;
            btnCalificarAnteproyectos.CausesValidation = false;

            divCalificarAnteproyectos.Visible = false;

            if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Maestro.ToString())
            {
                divCalificarAnteproyectos.Visible = true;
            }

            //Seleccionar anteproyectos
            ibtnSeleccionarAnte.ImageUrl = "~//Assets//Imagenes//ModuloAdministrador//Seleccion.png";
            ibtnSeleccionarAnte.CausesValidation = false;
            ibtnSeleccionarAnte.ToolTip = oMensajes.TablaMensajes["ibtnSeleccionarAnte"];

            lblSeleccionarAnte.Text = oMensajes.TablaMensajes["lblSeleccionarAnte"];
            lblSeleccionarAnteDes.Text = oMensajes.TablaMensajes["lblSeleccionarAnteDes"];

            btnSeleccionarAnte.Text = oMensajes.TablaMensajes["btnSeleccionarAnte"];
            btnSeleccionarAnte.ForeColor = System.Drawing.Color.White;
            btnSeleccionarAnte.Font.Bold = true;
            btnSeleccionarAnte.CausesValidation = false;

            divSeleccionarAnte.Visible = false;

            if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Maestro.ToString())
            {
                divSeleccionarAnte.Visible = true;
            }
        }
        #endregion
    }
}