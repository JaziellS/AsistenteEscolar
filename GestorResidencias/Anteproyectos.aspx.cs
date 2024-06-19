using System;
using GestorResidencias.Clases;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using packWord = DocumentFormat.OpenXml.Packaging;
using procWord = DocumentFormat.OpenXml.Wordprocessing;
using dWord = DocumentFormat.OpenXml.Drawing;
using System.IO;

namespace GestorResidencias
{
    public partial class Anteproyectos : System.Web.UI.Page
    {
        #region Variables
        private Mensajes oMensajes = new Mensajes();
        public StringBuilder sAnteproyectos = new StringBuilder();
        #endregion

        #region Eventos
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Generales.glsUsuarioSession == null)
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
                        ObtieneAnteproyectos();
                    }

                    sAnteproyectos = (StringBuilder)ViewState["sAnteproyectos"];
                    if (sAnteproyectos == null)
                    {
                        sAnteproyectos = new StringBuilder();
                        sAnteproyectos.AppendLine("");
                    }

                    if (Request.Form["ibtnAnteproyecto"] != null) //Evento al momento de seleccionar la imagen
                    {
                        Session["sAnteproyecto"] = Request.Form["ibtnAnteproyecto"].ToString();
                        Response.Redirect("AnteproyectoResidencia.aspx");
                    }
                    else if (Request.Form["btnEditar"] != null) //Evento al momento de seleccionar el boton de Edicion.
                    {
                        Session["sAnteproyecto"] = Request.Form["btnEditar"].ToString();
                        Response.Redirect("AnteproyectoResidencia.aspx");
                    }
                    else if (Request.Form["ibtnEliminar"] != null) //Evento al momento de seleccionar el boton de Eliminar.
                    {
                        oMensajes.MuestraMensajeConRespuesta(this, "Información", "Seguro que deseas eliminar esta solicitud?, los cambios realizados no se pueden revertir.", Mensajes.TipoMensaje.Precaucion, "EliminaAnteproyecto", Request.Form["ibtnEliminar"].ToString());
                    }
                    else if (Request.Form["btnVer"] != null)//Evento al momento de seleccionar el boton de Ver.
                    {
                        Session["sAnteproyecto"] = Request.Form["btnVer"].ToString();
                        Response.Redirect("AnteproyectoResidencia.aspx");
                    }
                    else if (Request.Form["btnVerConCalificacion"] != null)//Evento al momento de seleccionar el boton de Ver.
                    {
                        Session["sAnteproyecto"] = Request.Form["btnVerConCalificacion"].ToString();
                        Response.Redirect("AnteproyectoResidencia.aspx");
                    }
                    else if (Request.Form["btnDescargar"] != null) //Evento al momento de seleccionar el boton de Descargar ficha.
                    {
                        String[] sParametros = Request.Form["btnDescargar"].Split('|');
                        ViewState["IdPreliminaryDraft"] = sParametros[0];

                        EventoDescargarFicha();
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
            Response.Redirect("Index.aspx");
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (Anteproyecto.ValidaCrearOtroAnteproyecto(Generales.glsUsuarioSession.IdUsuario))
            {
                Response.Redirect("AnteproyectoResidencia.aspx");
            }
            else
            {
                oMensajes.MuestraMensaje(this, "Error", "Tienes una solicitud en proceso, no se puede crear una nueva.", Mensajes.TipoMensaje.Error);
        }
    }
        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("Anteproyectos.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            ibtnRetroceder.ImageUrl = "~//Assets//Imagenes//Principal//FlechaRetroceder.png";
            ibtnRetroceder.Width = 40;
            ibtnRetroceder.CausesValidation = false;

            btnAgregar.Text = oMensajes.TablaMensajes["btnAgregar"];
            btnAgregar.ForeColor = System.Drawing.Color.White;
            btnAgregar.Font.Bold = true;
            btnAgregar.CausesValidation = false;
            if (!Anteproyecto.ValidaCrearOtroAnteproyecto(Generales.glsUsuarioSession.IdUsuario))
            {
                btnAgregar.Visible = false;
            }
        }

        private void ObtieneAnteproyectos()
        {
            DataTable dtAnteproyectos = Anteproyecto.ObtieneMisAnteproyectos(Generales.glsUsuarioSession.IdUsuario);

            sAnteproyectos = new StringBuilder();

            if (dtAnteproyectos.Rows.Count != 0)
            {
                foreach (DataRow dr in dtAnteproyectos.Rows)
                {
                    sAnteproyectos.AppendLine("    <div class=\"row contenedor-solicitud\">");
                    sAnteproyectos.AppendLine("        <div class=\"row\">");
                    sAnteproyectos.AppendLine("            <div class=\"col-12 col-sm-12 col-md-12\">");
                    sAnteproyectos.AppendLine("                <div class=\"alineacion-vertical\">");
                    sAnteproyectos.AppendLine("                    <div class=\"text-center container-fluid\">");
                    sAnteproyectos.AppendLine("                         <span style=\"color:white; font-size:35px;\" class=\"fontbold\">" + (dr["NombreProyecto"].ToString() != "" ? dr["NombreProyecto"].ToString() : "Sin Asignar") + "</span>");
                    sAnteproyectos.AppendLine("                    </div>");
                    if (dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.Borrador.ToString())
                    {
                        sAnteproyectos.AppendLine("                <button name=\"ibtnEliminar\" class=\"ibtn-hover-general\" style=\"border:none; background-image: url('Assets/Imagenes/Solicitudes/Cerrar.png'); background-color: unset; background-size: 35px; background-repeat: no-repeat; width: 36px; height: 36px; \" type=\"submit\" value=\"" + dr["IdPreliminaryDraft"].ToString() + "\"></button>");
                    }
                    sAnteproyectos.AppendLine("                </div>");
                    sAnteproyectos.AppendLine("                <br />");
                    sAnteproyectos.AppendLine("                <div class=\"text-center\">");
                    sAnteproyectos.AppendLine("                    <span style=\"color:white;\">A continuación, se presenta la información detallada de tu anteproyecto junto con las acciones disponibles según su estatus actual:</span>");
                    sAnteproyectos.AppendLine("                </div>");
                    sAnteproyectos.AppendLine("                <br />");
                    sAnteproyectos.AppendLine("            </div>");
                    sAnteproyectos.AppendLine("        </div>");
                    sAnteproyectos.AppendLine("        <div class=\"col-12 col-sm-12 col-md-6 col-lg-4\" style=\"margin-bottom:10px;\">");
                    sAnteproyectos.AppendLine("            <div class=\"contenedor-estatus\">");
                    sAnteproyectos.AppendLine("                <br />");
                    sAnteproyectos.AppendLine("                <div class=\"text-center\">");
                    sAnteproyectos.AppendLine("                    <button name=\"ibtnAnteproyecto\" class=\"ibtn-hover-modulos\" style=\"border:none; background-image: url('Assets/Imagenes/Anteproyecto/Foco.png'); background-color:unset; height: 190px; background-size: 200px; background-repeat: no-repeat; width: 200px;\" type=\"submit\" value=\"" + dr["IdPreliminaryDraft"] + "|" + dr["IdUser"] + "|Ver" + "\"></button>");
                    sAnteproyectos.AppendLine("                    <br />");
                    sAnteproyectos.AppendLine("                    <br />");
                    sAnteproyectos.AppendLine("                    <div class=\"row\">");
                    sAnteproyectos.AppendLine("                        <div class=\"col-6 col-sm-6 col-md-6\" style=\"text-align:end\">");
                    sAnteproyectos.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Creado:</span>");
                    sAnteproyectos.AppendLine("                        </div>");
                    sAnteproyectos.AppendLine("                        <div class=\"col-6 col-sm-6 col-md-6\" style=\"text-align:start\">");
                    if (dr["FechaCreacion"].ToString() != "")
                    {
                        sAnteproyectos.AppendLine("                            <span style=\"color:white;\">" + DateTime.Parse(dr["FechaCreacion"].ToString()).ToString("dd/MM/yyyy") + "</span>");
                    }
                    else
                    {
                        sAnteproyectos.AppendLine("                            <span style=\"color:white;\">--/--/----</span>");
                    }
                    sAnteproyectos.AppendLine("                        </div>");
                    sAnteproyectos.AppendLine("                    </div>");
                    sAnteproyectos.AppendLine("                    <div class=\"row\">");
                    sAnteproyectos.AppendLine("                        <div class=\"col-6 col-sm-6 col-md-6\" style=\"text-align:end\">");
                    sAnteproyectos.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Editado:</span>");
                    sAnteproyectos.AppendLine("                        </div>");
                    sAnteproyectos.AppendLine("                        <div class=\"col-6 col-sm-6 col-md-6\" style=\"text-align:start\">");
                    if (dr["FechaEdicion"].ToString() != "")
                    {
                        sAnteproyectos.AppendLine("                            <span style=\"color:white;\">" + DateTime.Parse(dr["FechaEdicion"].ToString()).ToString("dd/MM/yyyy") + "</span>");
                    }
                    else
                    {
                        sAnteproyectos.AppendLine("                            <span style=\"color:white;\">--/--/----</span>");
                    }
                    sAnteproyectos.AppendLine("                        </div>");
                    sAnteproyectos.AppendLine("                    </div>");
                    sAnteproyectos.AppendLine("                    <div class=\"row\">");
                    sAnteproyectos.AppendLine("                        <div class=\"col-6 col-sm-6 col-md-6\" style=\"text-align:end\">");
                    sAnteproyectos.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Enviado:</span>");
                    sAnteproyectos.AppendLine("                        </div>");
                    sAnteproyectos.AppendLine("                        <div class=\"col-6 col-sm-6 col-md-6\" style=\"text-align:start\">");
                    if (dr["FechaEnvio"].ToString() != "")
                    {
                        sAnteproyectos.AppendLine("                            <span style=\"color:white;\">" + DateTime.Parse(dr["FechaEnvio"].ToString()).ToString("dd/MM/yyyy") + "</span>");
                    }
                    else
                    {
                        sAnteproyectos.AppendLine("                            <span style=\"color:white;\">--/--/----</span>");
                    }
                    sAnteproyectos.AppendLine("                        </div>");
                    sAnteproyectos.AppendLine("                    </div>");
                    sAnteproyectos.AppendLine("                    <br />");
                    sAnteproyectos.AppendLine("                    <br />");
                    sAnteproyectos.AppendLine("                    <div class=\"row text-center\">");
                    sAnteproyectos.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    if (dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.Enviado.ToString() || dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.EnProceso.ToString() ||
                        dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.RevisionesCompletas.ToString() || dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.Calificado.ToString())
                    {
                        sAnteproyectos.AppendLine("                            <span style=\"color:white; font-size:30px;\"><span class=\"fontbold\">Estatus:</span>&nbsp&nbsp Enviado</span>");
                    }
                    else
                    {
                        sAnteproyectos.AppendLine("                            <span style=\"color:white; font-size:30px;\"><span class=\"fontbold\">Estatus:</span>&nbsp&nbsp " + dr["Estado"].ToString() + "</span>");
                    }
                    sAnteproyectos.AppendLine("                        </div>");
                    sAnteproyectos.AppendLine("                    </div>");
                    sAnteproyectos.AppendLine("                    <br />");
                    sAnteproyectos.AppendLine("                </div>");
                    sAnteproyectos.AppendLine("            </div>");
                    sAnteproyectos.AppendLine("        </div>");
                    sAnteproyectos.AppendLine("        <div class=\"col-12 col-sm-12 col-md-6 col-lg-8\">");
                    sAnteproyectos.AppendLine("            <div class=\"row forma-informacion-solicitud\">");
                    sAnteproyectos.AppendLine("                <div class=\"col-12 col-sm-12 col-md-12\">");
                    sAnteproyectos.AppendLine("                    <br />");
                    sAnteproyectos.AppendLine("                    <div class=\"row\">");
                    sAnteproyectos.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sAnteproyectos.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Objetivos:</span>");
                    sAnteproyectos.AppendLine("                            <br />");
                    sAnteproyectos.AppendLine("                            <span style=\"color:white; font-size:13px;\">" + (dr["ObjetivoProyecto"].ToString() != "" ? dr["ObjetivoProyecto"].ToString() : "Sin Asignar")  + "</span>");
                    sAnteproyectos.AppendLine("                        </div>");
                    sAnteproyectos.AppendLine("                    </div>");
                    sAnteproyectos.AppendLine("                    <div class=\"row\">");
                    sAnteproyectos.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sAnteproyectos.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Justificación:</span>");
                    sAnteproyectos.AppendLine("                            <br />");
                    sAnteproyectos.AppendLine("                            <span style=\"color:white; font-size:13px;\">" + (dr["Justificacion"].ToString() != "" ? dr["Justificacion"].ToString() : "Sin Asignar") + "</span>");
                    sAnteproyectos.AppendLine("                        </div>");
                    sAnteproyectos.AppendLine("                    </div>");
                    sAnteproyectos.AppendLine("                    <div class=\"row\">");
                    sAnteproyectos.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sAnteproyectos.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Alcance del proyecto:</span>");
                    sAnteproyectos.AppendLine("                            <br />");
                    sAnteproyectos.AppendLine("                            <span style=\"color:white; font-size:13px;\">" + (dr["Alcance"].ToString() != "" ? dr["Alcance"].ToString() : "Sin Asignar") + "</span>");
                    sAnteproyectos.AppendLine("                        </div>");
                    sAnteproyectos.AppendLine("                    </div>");
                    sAnteproyectos.AppendLine("                    <div class=\"row\">");
                    sAnteproyectos.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sAnteproyectos.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Lugar donde se realizará el proyecto:</span>");
                    sAnteproyectos.AppendLine("                            <br />");
                    sAnteproyectos.AppendLine("                            <span style=\"color:white; font-size:13px;\">" + (dr["Locacion"].ToString() != "" ? dr["Locacion"].ToString() : "Sin Asignar") + "</span>");
                    sAnteproyectos.AppendLine("                        </div>");
                    sAnteproyectos.AppendLine("                    </div>");
                    sAnteproyectos.AppendLine("                    <br />");
                    sAnteproyectos.AppendLine("                </div>");
                    sAnteproyectos.AppendLine("            </div>");
                    sAnteproyectos.AppendLine("            <br />");
                    sAnteproyectos.AppendLine("            <div class=\"row\">");
                    sAnteproyectos.AppendLine("                <div class=\"col-12 col-sm-6 col-md-8 col-lg-4\" style=\"margin-bottom:10px;\">");
                    sAnteproyectos.AppendLine("                    <button name=\"btnDescargar\" style=\"border:none; font-weight:bold; color:white;\" class=\"form-control fontsizeh6 btn-hover-general\" type=\"submit\" value=\"" + dr["IdPreliminaryDraft"] + "|" + dr["IdUser"] + "\">Descargar Ficha</button>");
                    sAnteproyectos.AppendLine("                </div>");
                    if (dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.Borrador.ToString())
                    {
                        sAnteproyectos.AppendLine("                <div class=\"col-12 col-sm-6 col-md-8 col-lg-4\" style=\"margin-bottom:10px;\">");
                        sAnteproyectos.AppendLine("                    <button name=\"btnEditar\" style=\"border:none; font-weight:bold; color:white;\" class=\"form-control fontsizeh6 btn-hover-general\" type=\"submit\" value=\"" + dr["IdPreliminaryDraft"] + "|" + dr["IdUser"] + "|Edicion" + "\">Editar</button>");
                        sAnteproyectos.AppendLine("                </div>");
                    }

                    if (dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.Enviado.ToString() || dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.EnProceso.ToString() ||
                        dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.RevisionesCompletas.ToString() || dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.Calificado.ToString())
                    {
                        sAnteproyectos.AppendLine("                <div class=\"col-12 col-sm-6 col-md-8 col-lg-4\" style=\"margin-bottom:10px;\">");
                        sAnteproyectos.AppendLine("                    <button name=\"btnVer\" style=\"border:none; font-weight:bold; color:white;\" class=\"form-control fontsizeh6 btn-hover-general\" type=\"submit\" value=\"" + dr["IdPreliminaryDraft"] + "|" + dr["IdUser"] + "|Ver" + "\">Ver</button>");
                        sAnteproyectos.AppendLine("                </div>");
                    }
                    else if (dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.Aprobado.ToString() || dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.AprobadoConComentarios.ToString() ||
                        dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.NoAprobado.ToString())
                    {
                        sAnteproyectos.AppendLine("                <div class=\"col-12 col-sm-6 col-md-8 col-lg-4\" style=\"margin-bottom:10px;\">");
                        sAnteproyectos.AppendLine("                    <button name=\"btnVerConCalificacion\" style=\"border:none; font-weight:bold; color:white;\" class=\"form-control fontsizeh6 btn-hover-general\" type=\"submit\" value=\"" + dr["IdPreliminaryDraft"] + "|" + dr["IdUser"] + "|VerConCalificacion" + "\">Ver Calificación</button>");
                        sAnteproyectos.AppendLine("                </div>");
                    }
                    sAnteproyectos.AppendLine("            </div>");
                    sAnteproyectos.AppendLine("        </div>");
                    sAnteproyectos.AppendLine("    </div>");
                    sAnteproyectos.AppendLine("<br />");
                    sAnteproyectos.AppendLine("<br />");
                }
            }
            else
            {
                sAnteproyectos.AppendLine("<div style=\"background-color:#E8E8E8; padding:30px; border-radius: 15px;\">");
                sAnteproyectos.AppendLine("    <div class=\"row text-center\">");
                sAnteproyectos.AppendLine("        <div class=\"col-12 col-sm-12 col-md-12\">");
                sAnteproyectos.AppendLine("            <span class=\"text-muted\">No se encontraron anteproyectos, crea uno nuevo para verlo reflejado en este apartado.</span>");
                sAnteproyectos.AppendLine("        </div>");
                sAnteproyectos.AppendLine("    </div>");
                sAnteproyectos.AppendLine("</div>");
            }
            ViewState["sAnteproyectos"] = sAnteproyectos;
        }

        [System.Web.Services.WebMethod]
        public static String EliminaAnteproyecto(String parameter1)
        {
            String _sIdPreliminaryDraft = parameter1;

            Anteproyecto.EliminarAnteproyecto(_sIdPreliminaryDraft, Generales.glsUsuarioSession.IdUsuario);

            return "Anteproyectos.aspx";
        }
        
        private void EventoDescargarFicha()
        {
            String sPathPlantilla = System.AppDomain.CurrentDomain.BaseDirectory + "\\Plantillas\\Anteproyectos\\Plantilla_Anteproyecto.docx";
            String sNombreArchivo = Generales.glsUsuarioSession.NoControl + "(" + DateTime.Now.ToString("yyyy-MM-ddThh-mm-ss") + ").docx";
            String sPathCarpeta = Server.MapPath("~/Plantillas/Anteproyectos/");
            String sPathDescarga = Path.Combine(sPathCarpeta, sNombreArchivo);

            try
            {
                if (File.Exists(sPathPlantilla))
                {
                    File.Copy(sPathPlantilla, sPathDescarga, overwrite: true);

                    DescargarDocumento.GenerarWordAnteproyecto(ViewState["IdPreliminaryDraft"].ToString(), Generales.glsUsuarioSession.IdUsuario, sPathDescarga);

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
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }
        #endregion
    }
}