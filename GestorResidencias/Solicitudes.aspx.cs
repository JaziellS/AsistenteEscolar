using GestorResidencias.Clases;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorResidencias
{
    public partial class Solicitudes : System.Web.UI.Page
    {
        #region Variables
        private Mensajes oMensajes = new Mensajes();
        public StringBuilder sSolicitudes = new StringBuilder();
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
                        ObtieneSolicitudes();
                    }

                    sSolicitudes = (StringBuilder)ViewState["sSolicitudes"];
                    if (sSolicitudes == null)
                    {
                        sSolicitudes = new StringBuilder();
                        sSolicitudes.AppendLine("");
                    }

                    if (Request.Form["ibtnEliminar"] != null) //Evento al momento de eliminar la solicitud
                    {
                        oMensajes.MuestraMensajeConRespuesta(this, "Información", "Seguro que deseas eliminar esta solicitud?, los cambios realizados no se pueden revertir.", Mensajes.TipoMensaje.Precaucion, "EliminaSolicitud", Request.Form["ibtnEliminar"].ToString());
                    }
                    else if (Request.Form["ibtnSolicitud"] != null)
                    {
                        Session["sSolicitudes"] = Request.Form["ibtnSolicitud"].ToString();
                        Response.Redirect("SolicitudResidencia.aspx");
                    }
                    else if (Request.Form["btnDescargarFi"] != null)
                    {
                        String[] sParametros = Request.Form["btnDescargarFi"].Split('|');
                        String sIdRequest = sParametros[0];
                        String sIdUser = sParametros[1];

                        EventoDescargarFicha(sIdRequest, sIdUser);
                    }
                    else if (Request.Form["btnEditar"] != null)
                    {
                        Session["sSolicitudes"] = Request.Form["btnEditar"].ToString();
                        Response.Redirect("SolicitudResidencia.aspx");
                    }
                    else if (Request.Form["btnVer"] != null)
                    {
                        Session["sSolicitudes"] = Request.Form["btnVer"].ToString();
                        Response.Redirect("SolicitudResidencia.aspx");
                    }
                    else if (Request.Form["btnVerComentario"] != null)
                    {
                        String[] sParametros = Request.Form["btnVerComentario"].Split('|');

                        tboxComentarioMod.Text = "";
                        tboxComentarioMod.Enabled = false;
                        tboxComentarioMod.Text = sParametros[2];

                        modCancelarSolicitud.Show();
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
            if (Solicitud.ValidaCrearOtraSolicitud(Generales.glsUsuarioSession.IdUsuario))
            {
                Response.Redirect("SolicitudResidencia.aspx");
            }
            else
            {
                oMensajes.MuestraMensaje(this, "Información", "Tienes una solicitud en proceso o aprobada, no se puede crear una nueva.", Mensajes.TipoMensaje.Informacion);
            }
        }

        #region Modal Comentario Cancelacion
        protected void ibtnCerrarMod_Click(object sender, ImageClickEventArgs e)
        {
            modCancelarSolicitud.Hide();
        }
        #endregion

        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("Solicitudes.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            ibtnRetroceder.ImageUrl = "~//Assets//Imagenes//Principal//FlechaRetroceder.png";
            ibtnRetroceder.Width = 40;
            ibtnRetroceder.CausesValidation = false;

            btnAgregar.Text = oMensajes.TablaMensajes["btnAgregar"];
            btnAgregar.ForeColor = System.Drawing.Color.White;
            btnAgregar.Font.Bold = true;
            btnAgregar.CausesValidation = false;
            if (!Solicitud.ValidaCrearOtraSolicitud(Generales.glsUsuarioSession.IdUsuario))
            {
                btnAgregar.Visible = false;
            }

            #region Modal Comentario Cancelacion
            lblDescripcionModuloMod.Text = oMensajes.TablaMensajes["lblDescripcionModuloMod"];

            ibtnCerrarMod.ImageUrl = "~//Assets//Imagenes//Principal//Cerrar Negro.png";
            ibtnCerrarMod.Width = 30;
            ibtnCerrarMod.CausesValidation = false;

            lblComentarioMod.Text = oMensajes.TablaMensajes["lblComentarioMod"];
            #endregion
        }

        private void ObtieneSolicitudes()
        {
            DataTable dtSolicitudes = Solicitud.ObtieneMisSolicitudes(Generales.glsUsuarioSession.IdUsuario);

            sSolicitudes = new StringBuilder();

            if(dtSolicitudes.Rows.Count != 0)
            {
                foreach(DataRow dr in dtSolicitudes.Rows)
                {
                    sSolicitudes.AppendLine("<div class=\"row contenedor-solicitud\">");
                    sSolicitudes.AppendLine("    <div class=\"row\">");
                    sSolicitudes.AppendLine("        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("            <div class=\"alineacion-vertical\">");
                    sSolicitudes.AppendLine("                <div class=\"text-center container-fluid\">");
                    sSolicitudes.AppendLine("                    <span style=\"color:white; font-size:35px;\" class=\"fontbold\">" + (dr["NombreProyecto"].ToString() != "" ? dr["NombreProyecto"].ToString() : "Sin Asignar") + "</span>");
                    sSolicitudes.AppendLine("                </div>");
                    if (dr["IdTypeState"].ToString() == Enums.EstatusSolicitudes.Borrador.ToString())
                    {
                        sSolicitudes.AppendLine("                <button name=\"ibtnEliminar\" class=\"ibtn-hover-general\" style=\"border:none; background-image: url('Assets/Imagenes/Solicitudes/Cerrar.png'); background-color: unset; background-size: 35px; background-repeat: no-repeat; width: 36px; height: 36px;\" type=\"submit\" value=\"" + dr["IdRequest"].ToString() + "|" + dr["IdUser"].ToString() + "\"></button>");
                    }
                    sSolicitudes.AppendLine("            </div>");
                    sSolicitudes.AppendLine("            <br />");
                    sSolicitudes.AppendLine("            <div class=\"text-center\">");
                    sSolicitudes.AppendLine("                <span style=\"color:white;\">A continuación, se presenta la información detallada de tu solicitud junto con las acciones disponibles según su estatus actual:</span>");
                    sSolicitudes.AppendLine("            </div>");
                    sSolicitudes.AppendLine("            <br />");
                    sSolicitudes.AppendLine("        </div>");
                    sSolicitudes.AppendLine("    </div>");
                    sSolicitudes.AppendLine("    <div class=\"col-12 col-sm-12 col-md-4 col-lg-4\" style=\"margin-bottom:10px;\">");
                    sSolicitudes.AppendLine("        <div class=\"contenedor-estatus\">");
                    sSolicitudes.AppendLine("            <br />");
                    sSolicitudes.AppendLine("            <div class=\"text-center\">");
                    sSolicitudes.AppendLine("                <button name=\"ibtnSolicitud\" class=\"ibtn-hover-modulos\" style=\"border:none; background-image: url('Assets/Imagenes/Solicitudes/Solicitud.png'); background-color:unset; height: 190px; background-size: 200px; background-repeat: no-repeat; width: 200px;\" type=\"submit\" value=\"" + dr["IdRequest"].ToString() + "|" + dr["IdUser"].ToString() + "|Ver" + "\"></button>");
                    sSolicitudes.AppendLine("                <br />");
                    sSolicitudes.AppendLine("                <br />");
                    sSolicitudes.AppendLine("                <div class=\"row\">");
                    sSolicitudes.AppendLine("                    <div class=\"col-6 col-md-6 col-sm-6\" style=\"text-align:end;\">");
                    sSolicitudes.AppendLine("                        <span style=\"color:white;\" class=\"fontbold\">Creado:</span>");
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                    <div class=\"col-6 col-md-6 col-sm-6\" style=\"text-align:start;\">");
                    if(dr["FechaCreacion"].ToString() != "")
                    {
                        sSolicitudes.AppendLine("                        <span style=\"color:white;\">" + DateTime.Parse(dr["FechaCreacion"].ToString()).ToString("dd/MM/yyyy") + "</span>");
                    }
                    else
                    {
                        sSolicitudes.AppendLine("                        <span style=\"color:white;\">--/--/----</span>");
                    }
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                </div>");
                    sSolicitudes.AppendLine("                <div class=\"row\">");
                    sSolicitudes.AppendLine("                    <div class=\"col-6 col-md-6 col-sm-6\" style=\"text-align:end;\">");
                    sSolicitudes.AppendLine("                        <span style=\"color:white;\" class=\"fontbold\">Editado:</span>");
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                    <div class=\"col-6 col-md-6 col-sm-6\" style=\"text-align:start;\">");
                    if (dr["FechaEdicion"].ToString() != "")
                    {
                        sSolicitudes.AppendLine("                        <span style=\"color:white;\">" + DateTime.Parse(dr["FechaEdicion"].ToString()).ToString("dd/MM/yyyy") + "</span>");
                    }
                    else
                    {
                        sSolicitudes.AppendLine("                        <span style=\"color:white;\">--/--/----</span>");
                    }
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                </div>");
                    sSolicitudes.AppendLine("                <div class=\"row\">");
                    sSolicitudes.AppendLine("                    <div class=\"col-6 col-md-6 col-sm-6\" style=\"text-align:end;\">");
                    sSolicitudes.AppendLine("                        <span style=\"color:white;\" class=\"fontbold\">Enviado:</span>");
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                    <div class=\"col-6 col-md-6 col-sm-6\" style=\"text-align:start;\">");
                    if (dr["FechaEnvio"].ToString() != "")
                    {
                        sSolicitudes.AppendLine("                        <span style=\"color:white;\">" + DateTime.Parse(dr["FechaEnvio"].ToString()).ToString("dd/MM/yyyy") + "</span>");
                    }
                    else
                    {
                        sSolicitudes.AppendLine("                        <span style=\"color:white;\">--/--/----</span>");
                    }
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                </div>");
                    sSolicitudes.AppendLine("                <br />");
                    sSolicitudes.AppendLine("                <br />");
                    sSolicitudes.AppendLine("                <div class=\"row text-center\">");
                    sSolicitudes.AppendLine("                    <div class=\"col-12 col-sm-12 col-md-12\">");
                    if(dr["IdTypeState"].ToString() == Enums.EstatusSolicitudes.Enviado.ToString() || dr["IdTypeState"].ToString() == Enums.EstatusSolicitudes.Calificado.ToString())
                    {
                        sSolicitudes.AppendLine("                        <span style=\"color:white; font-size:30px;\"><span class=\"fontbold\">Estatus:</span>&nbsp&nbsp Enviado</span>");
                    }
                    else
                    {
                        sSolicitudes.AppendLine("                        <span style=\"color:white; font-size:30px;\"><span class=\"fontbold\">Estatus:</span>&nbsp&nbsp " + dr["Estatus"].ToString() + "</span>");
                    }
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                </div>");
                    sSolicitudes.AppendLine("                <br />");
                    sSolicitudes.AppendLine("            </div>");
                    sSolicitudes.AppendLine("        </div>");
                    sSolicitudes.AppendLine("    </div>");
                    sSolicitudes.AppendLine("    <div class=\"col-12 col-sm-12 col-md-8\">");
                    sSolicitudes.AppendLine("        <div class=\"row\">");
                    sSolicitudes.AppendLine("            <div class=\"col-12 col-sm-6 col-md-6\" style=\"margin-bottom:10px;\">");
                    sSolicitudes.AppendLine("                <div class=\"row forma-informacion-solicitud\">");
                    sSolicitudes.AppendLine("                    <div class=\"text-center\" style=\"margin-bottom:20px;\">");
                    sSolicitudes.AppendLine("                        <span style=\"color:white; font-size:20px;\" class=\"fontbold\">Datos de la empresa</span>");
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                    <div class=\"row\" style=\"margin-bottom:15px;\">");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Nombre:</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\">" + (dr["NombreEmpresa"].ToString() != "" ? dr["NombreEmpresa"].ToString() : "Sin Asignar") + "</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                    <div class=\"row\" style=\"margin-bottom:15px;\">");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Domicilio:</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\">" + (dr["Domicilio"].ToString() != "" ? dr["Domicilio"].ToString() : "Sin Asignar") + "</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                    <div class=\"row\" style=\"margin-bottom:15px;\">");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Telefono:</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\">" + (dr["TelefonoEmpresa"].ToString() != "" ? dr["TelefonoEmpresa"].ToString() : "Sin Asignar") + "</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                    <div class=\"row\" style=\"margin-bottom:15px;\">");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Nombre del Titular:</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\">" + (dr["NombreTitularEmpresa"].ToString() != "" ? dr["NombreTitularEmpresa"].ToString() : "Sin Asignar") +"</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                </div>");
                    sSolicitudes.AppendLine("            </div>");
                    sSolicitudes.AppendLine("            <div class=\"col-12 col-sm-6 col-md-6\" style=\"margin-bottom:10px;\">");
                    sSolicitudes.AppendLine("                <div class=\"row forma-informacion-solicitud\">");
                    sSolicitudes.AppendLine("                    <div class=\"text-center\" style=\"margin-bottom:20px;\">");
                    sSolicitudes.AppendLine("                        <span style=\"color:white; font-size:20px;\" class=\"fontbold\">Persona que dará seguimiento</span>");
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                    <div class=\"row\" style=\"margin-bottom:15px;\">");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Nombre:</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\">" + (dr["NombrePSeguimiento"].ToString() != "" ? dr["NombrePSeguimiento"].ToString() : "Sin Asignar") + "</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                    <div class=\"row\" style=\"margin-bottom:15px;\">");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Puesto:</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\">" + (dr["PuestoPSeguimiento"].ToString() != "" ? dr["PuestoPSeguimiento"].ToString() : "Sin Asignar") + "</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                    <div class=\"row\" style=\"margin-bottom:15px;\">");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">E-mail:</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\">" + (dr["CorreoPSeguimiento"].ToString() != "" ? dr["CorreoPSeguimiento"].ToString() : "Sin Asignar") + "</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                    <div class=\"row\" style=\"margin-bottom:15px;\">");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Celular:</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\">" + (dr["CelularPSeguimiento"].ToString() != "" ? dr["CelularPSeguimiento"].ToString() : "Sin Asignar") + "</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                    <div class=\"row\" style=\"margin-bottom:15px;\">");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\" class=\"fontbold\">Teléfono oficina y ext.:</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sSolicitudes.AppendLine("                            <span style=\"color:white;\">" + (dr["TelefonoPSeguimiento"].ToString() != "" ? dr["TelefonoPSeguimiento"].ToString() : "Sin Asignar") + "</span>");
                    sSolicitudes.AppendLine("                        </div>");
                    sSolicitudes.AppendLine("                    </div>");
                    sSolicitudes.AppendLine("                </div>");
                    sSolicitudes.AppendLine("            </div>");
                    sSolicitudes.AppendLine("        </div>");
                    sSolicitudes.AppendLine("        <br />");
                    sSolicitudes.AppendLine("        <div class=\"row\">");
                    sSolicitudes.AppendLine("            <div class=\"col-12 col-sm-12 col-md-5 col-lg-4\" style=\"margin-bottom:10px;\">");
                    sSolicitudes.AppendLine("                <button name=\"btnDescargarFi\" style=\"border:none; font-weight:bold; color:white;\" class=\"form-control fontsizeh6 btn-hover-general\" type=\"submit\" value=\"" + dr["IdRequest"].ToString() + "|" + dr["IdUser"].ToString() + "\">Descargar Ficha</button>");
                    sSolicitudes.AppendLine("            </div>");
                    if (dr["IdTypeState"].ToString() == Enums.EstatusSolicitudes.Borrador.ToString())
                    {
                        sSolicitudes.AppendLine("            <div class=\"col-12 col-sm-12 col-md-4 col-lg-3\" style=\"margin-bottom:10px;\">");
                        sSolicitudes.AppendLine("                <button name=\"btnEditar\" style=\"border:none; font-weight:bold; color:white;\" class=\"form-control fontsizeh6 btn-hover-general\" type=\"submit\" value=\"" + dr["IdRequest"].ToString() + "|" + dr["IdUser"].ToString() + "|Edicion" + "\">Editar</button>");
                        sSolicitudes.AppendLine("            </div>");
                    }
                    if (dr["IdTypeState"].ToString() != Enums.EstatusSolicitudes.Borrador.ToString())
                    {
                        sSolicitudes.AppendLine("            <div class=\"col-12 col-sm-12 col-md-4 col-lg-3\" style=\"margin-bottom:10px;\">");
                        sSolicitudes.AppendLine("                <button name=\"btnVer\" style=\"border:none; font-weight:bold; color:white;\" class=\"form-control fontsizeh6 btn-hover-general\" type=\"submit\" value=\"" + dr["IdRequest"].ToString() + "|" + dr["IdUser"].ToString() + "|Ver" + "\">Ver</button>");
                        sSolicitudes.AppendLine("            </div>");
                    }
                    if(dr["IdTypeState"].ToString() == Enums.EstatusSolicitudes.Cancelado.ToString())
                    {
                        sSolicitudes.AppendLine("            <div class=\"col-12 col-sm-12 col-md-9 col-lg-5\" style=\"margin-bottom:10px;\">");
                        sSolicitudes.AppendLine("                <button name=\"btnVerComentario\" style=\"border:none; font-weight:bold; color:white;\" class=\"form-control fontsizeh6 btn-hover-general\" type=\"submit\" value=\"" + dr["IdRequest"].ToString() + "|" + dr["IdUser"].ToString() + "|" + dr["ComentarioCancelacion"].ToString() + "\">Ver comentario de cancelación</button>");
                        sSolicitudes.AppendLine("            </div>");
                    }
                    sSolicitudes.AppendLine("        </div>");
                    sSolicitudes.AppendLine("    </div>");
                    sSolicitudes.AppendLine("</div>");
                    sSolicitudes.AppendLine("<br />");
                    sSolicitudes.AppendLine("<br />");
                }
            }
            else
            {
                sSolicitudes.AppendLine("<div style=\"background-color:#E8E8E8; padding:30px; border-radius: 15px;\">");
                sSolicitudes.AppendLine("    <div class=\"row text-center\">");
                sSolicitudes.AppendLine("        <div class=\"col-12 col-sm-12 col-md-12\">");
                sSolicitudes.AppendLine("            <span class=\"text-muted\">No se encontraron solicitudes, crea una nueva para verla reflejada en este apartado.</span>");
                sSolicitudes.AppendLine("        </div>");
                sSolicitudes.AppendLine("    </div>");
                sSolicitudes.AppendLine("</div>");
            }
            ViewState["sSolicitudes"] = sSolicitudes;
        }

        private void EventoDescargarFicha(String _sIdRequest, String _sIdUser)
        {
            String sPathPlantilla = System.AppDomain.CurrentDomain.BaseDirectory + "\\Plantillas\\Solicitudes\\Plantilla_Solicitud.docx";
            String sNombreArchivo = Generales.glsUsuarioSession.NoControl + "(" + DateTime.Now.ToString("yyyy-MM-ddThh-mm-ss") + ").docx";
            String sPathCarpeta = Server.MapPath("~/Plantillas/Solicitudes/");
            String sPathDescarga = Path.Combine(sPathCarpeta, sNombreArchivo);

            try
            {
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
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        [System.Web.Services.WebMethod]
        public static String EliminaSolicitud(String parameter1, String parameter2)
        {
            String _sIdRequest = parameter1;
            String _sIdUser = parameter2;

            Solicitud.EliminarSolicitud(_sIdRequest, _sIdUser);

            return "Solicitudes.aspx";
        }
        #endregion
    }
}