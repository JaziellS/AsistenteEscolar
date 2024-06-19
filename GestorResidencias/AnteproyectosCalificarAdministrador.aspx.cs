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
    public partial class AnteproyectosCalificarAdministrador : System.Web.UI.Page
    {
        #region Variables
        private Mensajes oMensajes = new Mensajes();
        public StringBuilder sAnteproyectos = new StringBuilder();
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

                        if (Session["IdPeriodo"] != null)
                        {
                            cboxPeriodo.SelectedValue = Session["IdPeriodo"].ToString();
                            tboxAnio.Text = Session["Anio"].ToString();
                        }
                        cboxPeriodo_SelectedIndexChanged(null, null);
                    }

                    sAnteproyectos = (StringBuilder)ViewState["sAnteproyectos"];
                    if (sAnteproyectos == null)
                    {
                        sAnteproyectos = new StringBuilder();
                        sAnteproyectos.AppendLine("");
                    }

                    if (Request.Form["btnCalificar"] != null)
                    {
                        Session["VieneDeVista"] = "AnteproyectosCalificarAdministrador.aspx";
                        Session["sAnteproyectoCalificar"] = Request.Form["btnCalificar"].ToString();
                        Response.Redirect("AnteproyectoResidenciaCalificar.aspx");
                    }
                    else if (Request.Form["btnVer"] != null)
                    {
                        Session["VieneDeVista"] = "AnteproyectosCalificarAdministrador.aspx";
                        Session["sAnteproyectoCalificar"] = Request.Form["btnVer"].ToString();
                        Response.Redirect("AnteproyectoResidenciaCalificar.aspx");
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
            Response.Redirect("ModuloAdministrador.aspx");
        }

        protected void cboxPeriodo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(cboxPeriodo.SelectedValue != "" && tboxAnio.Text != "")
            {
                lblPeriodoDes.Text = cboxPeriodo.SelectedItem.Text + " " + tboxAnio.Text;
                ObtieneAnteproyectos(cboxPeriodo.SelectedValue, tboxAnio.Text);

                Session["IdPeriodo"] = cboxPeriodo.SelectedValue;
                Session["Anio"] = tboxAnio.Text;
            }
            else
            {
                ObtieneAnteproyectos("", "");
                lblPeriodoDes.Text = "";
            }
        }

        protected void tboxAnio_TextChanged(object sender, EventArgs e)
        {
            if (cboxPeriodo.SelectedValue != "" && tboxAnio.Text != "")
            {
                lblPeriodoDes.Text = cboxPeriodo.SelectedItem.Text + " " + tboxAnio.Text;
                ObtieneAnteproyectos(cboxPeriodo.SelectedValue, tboxAnio.Text);

                Session["IdPeriodo"] = cboxPeriodo.SelectedValue;
                Session["Anio"] = tboxAnio.Text;
            }
            else
            {
                ObtieneAnteproyectos("", "");
                lblPeriodoDes.Text = "";
            }
        }
        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("AnteproyectosCalificarAdministrador.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            ibtnRetroceder.ImageUrl = "~//Assets//Imagenes//Principal//FlechaRetroceder.png";
            ibtnRetroceder.Width = 40;
            ibtnRetroceder.CausesValidation = false;

            imgPendienteDes.ImageUrl = "~//Assets//Imagenes//CalificarAnteproyectos//Pendiente.png";
            imgPendienteDes.Width = 75;
            lblPendienteDes.Text = oMensajes.TablaMensajes["lblPendienteDes"];

            imgAprobadoConComentariosDes.ImageUrl = "~//Assets//Imagenes//CalificarAnteproyectos//AprobadoConComentarios.png";
            imgAprobadoConComentariosDes.Width = 75;
            lblAprobadoConComentariosDes.Text = oMensajes.TablaMensajes["lblAprobadoConComentariosDes"];

            imgAprobadoDes.ImageUrl = "~//Assets//Imagenes//CalificarAnteproyectos//Aprobado.png";
            imgAprobadoDes.Width = 75;
            lblAprobadoDes.Text = oMensajes.TablaMensajes["lblAprobadoDes"];

            imgNoAprobadoDes.ImageUrl = "~//Assets//Imagenes//CalificarAnteproyectos//NoAprobado.png";
            imgNoAprobadoDes.Width = 75;
            lblNoAprobadoDes.Text = oMensajes.TablaMensajes["lblNoAprobadoDes"];

            lblPeriodo.Text = oMensajes.TablaMensajes["lblPeriodo"];
            lblAnio.Text = oMensajes.TablaMensajes["lblAnio"];
        }

        private void LlenarCombos()
        {
            cboxPeriodo.DataTextField = "Name";
            cboxPeriodo.DataValueField = "IdValueDetail";
            cboxPeriodo.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Periodo");
            cboxPeriodo.DataBind();
            cboxPeriodo.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxPeriodo.SelectedIndex = 0;
        }

        private void ObtieneAnteproyectos(String _sIdPeriod, String _sYear)
        {
            DataTable dtAnteproyectos = MaestroResidencia.ObtieneMisAnteproyectosPorCalificar(_sIdPeriod, _sYear, Generales.glsUsuarioSession.IdUsuario);

            sAnteproyectos = new StringBuilder();

            if (dtAnteproyectos.Rows.Count != 0)
            {
                foreach (DataRow dr in dtAnteproyectos.Rows)
                {   
                    sAnteproyectos.AppendLine("    <div class=\"col-12 col-sm-12 col-md-6 col-lg-4\" style=\"margin-bottom:20px;\">");
                    sAnteproyectos.AppendLine("        <div class=\"card contenedor-anteproyecto-cal\">");
                    sAnteproyectos.AppendLine("            <div class=\"centrar-imagen-anteproyectos\">");
                    switch (dr["EstadoAnteproyecto"].ToString())
                    {
                        case "1":
                            sAnteproyectos.AppendLine("                <img src=\"Assets/Imagenes/CalificarAnteproyectos/Pendiente.png\" style=\"width: 90px; background-color:white; border-radius:50%\"/>");
                            break;
                        case "2":
                            sAnteproyectos.AppendLine("                <img src=\"Assets/Imagenes/CalificarAnteproyectos/Aprobado.png\" style=\"width: 90px; background-color:white; border-radius:50%\"/>");
                            break;
                        case "3":
                            sAnteproyectos.AppendLine("                <img src=\"Assets/Imagenes/CalificarAnteproyectos/AprobadoConComentarios.png\" style=\"width: 90px; background-color:white; border-radius:50%\"/>");
                            break;
                        case "4":
                            sAnteproyectos.AppendLine("                <img src=\"Assets/Imagenes/CalificarAnteproyectos/NoAprobado.png\" style=\"width: 90px; background-color:white; border-radius:50%\"/>");
                            break;
                    }
                    sAnteproyectos.AppendLine("            </div>");
                    sAnteproyectos.AppendLine("            <div class=\"card-body\">");
                    sAnteproyectos.AppendLine("                <div class=\"row text-center\">");
                    sAnteproyectos.AppendLine("                    <div class=\"col-12 col-sm-12 col-md-12\">");
                    sAnteproyectos.AppendLine("                        <span style=\"color:white; font-size:18px;\" class=\"fontbold\">" + dr["NombreProyecto"].ToString() + "</span>");
                    sAnteproyectos.AppendLine("                    </div>");
                    sAnteproyectos.AppendLine("                </div>");
                    sAnteproyectos.AppendLine("                <br />");
                    sAnteproyectos.AppendLine("                <div class=\"row\" style=\"margin-bottom:10px;\">");
                    sAnteproyectos.AppendLine("                    <div class=\"col-12 col-sm-12 col-md-12 contenedor-informacion-anteproyectos\">");
                    sAnteproyectos.AppendLine("                        <div class=\"row\">");
                    sAnteproyectos.AppendLine("                            <span style=\"color:white; font-size:13px;\" class=\"fontbold \">Objetivo:</span>");
                    sAnteproyectos.AppendLine("                        </div>");
                    sAnteproyectos.AppendLine("                        <div class=\"row\">");
                    sAnteproyectos.AppendLine("                            <span style=\"color:white; font-size:13px;\">" + dr["ObjetivoProyecto"].ToString() + "</span>");
                    sAnteproyectos.AppendLine("                        </div>");
                    sAnteproyectos.AppendLine("                    </div>");
                    sAnteproyectos.AppendLine("                </div>");
                    sAnteproyectos.AppendLine("                <div class=\"row text-center\" style=\"margin-bottom:15px;\">");
                    sAnteproyectos.AppendLine("                    <div class=\"col-12 col-sm-12 col-md-12 contenedor-informacion-anteproyectos\">");
                    sAnteproyectos.AppendLine("                        <span style=\"color:white; font-size:17px;\"><span class=\"fontbold\">Estatus:</span>&nbsp&nbsp" + dr["EstadoAnteproyectosText"].ToString() + "</span>");
                    sAnteproyectos.AppendLine("                    </div>");
                    sAnteproyectos.AppendLine("                </div>");
                    if (dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.Enviado.ToString() || dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.EnProceso.ToString() ||
                        dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.RevisionesCompletas.ToString())
                    {
                        sAnteproyectos.AppendLine("                <div class=\"row\" style=\"margin-bottom:10px;\">");
                        sAnteproyectos.AppendLine("                    <div class=\"col-12 col-sm-12 col-md-8 offset-md-2\">");
                        sAnteproyectos.AppendLine("                        <button name=\"btnCalificar\" style=\"border:none; background-color:#372d86; color:white;\" class=\"form-control fontbold\" type=\"submit\" value=\"" + dr["IdPreliminaryDraft"].ToString() + "|" + dr["IdUser"].ToString() + "|Calificar|" + dr["IdTeachersDet"].ToString() + "\">Calificar</button>");
                        sAnteproyectos.AppendLine("                    </div>");
                        sAnteproyectos.AppendLine("                </div>");
                    }
                    if (dr["EstadoAnteproyecto"].ToString() != "1")
                    {
                        sAnteproyectos.AppendLine("                <div class=\"row\">");
                        sAnteproyectos.AppendLine("                    <div class=\"col-12 col-sm-12 col-md-8 offset-md-2\">");
                        sAnteproyectos.AppendLine("                        <button name=\"btnVer\" style=\"border:none; background-color:#372d86; color:white;\" class=\"form-control fontbold\" type=\"submit\" value=\"" + dr["IdPreliminaryDraft"].ToString() + "|" + dr["IdUser"].ToString() + "|Ver|" + dr["IdTeachersDet"].ToString() + "\">Ver</button>");
                        sAnteproyectos.AppendLine("                    </div>");
                        sAnteproyectos.AppendLine("                </div>");
                    }
                    else if (dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.Calificado.ToString() || dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.Aprobado.ToString() ||
                        dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.AprobadoConComentarios.ToString() || dr["IdTypeState"].ToString() == Enums.EstatusAnteproyecto.NoAprobado.ToString())
                    {
                        sAnteproyectos.AppendLine("                <div class=\"row\">");
                        sAnteproyectos.AppendLine("                    <div class=\"col-12 col-sm-12 col-md-8 offset-md-2\">");
                        sAnteproyectos.AppendLine("                        <button name=\"btnVer\" style=\"border:none; background-color:#372d86; color:white;\" class=\"form-control fontbold\" type=\"submit\" value=\"" + dr["IdPreliminaryDraft"].ToString() + "|" + dr["IdUser"].ToString() + "|VerSinComentario|" + dr["IdTeachersDet"].ToString() + "\">Ver</button>");
                        sAnteproyectos.AppendLine("                    </div>");
                        sAnteproyectos.AppendLine("                </div>");
                    }
                    sAnteproyectos.AppendLine("            </div>");
                    sAnteproyectos.AppendLine("        </div>");
                    sAnteproyectos.AppendLine("    </div>");
                        
                }
            }
            else
            {
                if (cboxPeriodo.SelectedValue != "" && tboxAnio.Text != "")
                {
                    sAnteproyectos.AppendLine("</br>");
                }
                sAnteproyectos.AppendLine("<div class=\"row text-center\">");
                sAnteproyectos.AppendLine("    <div class=\"col-12 col-sm-12 col-md-12\">");
                sAnteproyectos.AppendLine("        <span class=\"text-muted\">No se encontraron anteproyectos por calificar.</span>");
                sAnteproyectos.AppendLine("    </div>");
                sAnteproyectos.AppendLine("</div>");
            }
            ViewState["sAnteproyectos"] = sAnteproyectos;
        }
        #endregion
    }
}