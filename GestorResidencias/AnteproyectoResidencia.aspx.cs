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
    public partial class AnteproyectoResidencia : System.Web.UI.Page
    {
        #region Variables
        private Mensajes oMensajes = new Mensajes();
        private String[] sParametros;
        public StringBuilder sDetalleActividad = new StringBuilder();
        public StringBuilder sCalificacion = new StringBuilder();
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
                            if (Session["sAnteproyecto"] != null)
                            {
                                sParametros = Session["sAnteproyecto"].ToString().Split('|');
                                Session["sAnteproyecto"] = null;

                                String _sIdPreliminaryDraft = sParametros[0];
                                String _sidUser = sParametros[1];

                                ViewState["IdPreliminaryDraft"] = _sIdPreliminaryDraft;

                                RecuperaEdicion(_sIdPreliminaryDraft, _sidUser);


                                String _sAccion = sParametros[2];
                                ViewState["Accion"] = _sAccion;

                                switch (_sAccion)
                                {
                                    case "Ver":
                                        DeshabilitarComponentes();
                                        break;
                                    case "VerConCalificacion":
                                        DeshabilitarComponentes();
                                        sCalificacion = ObtieneComentarioFinalJefeCarrera(_sIdPreliminaryDraft);
                                        break;
                                    case "Edicion":
                                        break;
                                    default:
                                        break;
                                }
                            }
                            else
                            {
                                if (Anteproyecto.ValidaCrearOtroAnteproyecto(Generales.glsUsuarioSession.IdUsuario))
                                {
                                    ViewState["IdPreliminaryDraft"] = Generales.ObtieneNuevoID();
                                    LlenarSeccionUsuario(Generales.glsUsuarioSession.IdUsuario);

                                    InsertaAnteproyecto("1");

                                    AnteproyectoCronograma.InsertaActividadesDeEjemplo(ViewState["IdPreliminaryDraft"].ToString());

                                    ViewState["Accion"] = "Edicion";
                                }
                                else
                                {
                                    Response.Redirect("Anteproyectos.aspx");
                                }
                            }

                            ObtieneActividades(ViewState["IdPreliminaryDraft"].ToString());
                            ObtieneActividadesDetalle(ViewState["IdPreliminaryDraft"].ToString());
                            upDetalle.Update();
                        }
                        catch (Exception ex)
                        {
                            oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
                        }
                    }
                    ConfiguraGrid();
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "Popup", "InicializarComponentes()", true);
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
            }
        }

        protected void ibtnRetroceder_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Anteproyectos.aspx");
        }

        protected void lbtnRecuperaInfo_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dtMisAnteproyectos = Anteproyecto.ObtieneMisAnteproyectosNoAprobados(Generales.glsUsuarioSession.IdUsuario);

                if (dtMisAnteproyectos.Rows.Count != 0)
                {
                    String sIdPreliminaryDraft;
                    sIdPreliminaryDraft = dtMisAnteproyectos.Rows[0]["IdPreliminaryDraft"].ToString();

                    RecuperaEdicion(sIdPreliminaryDraft, Generales.glsUsuarioSession.IdUsuario);

                    DataTable dtDatos = AnteproyectoCronograma.ObtieneMisActividades(sIdPreliminaryDraft);

                    if(dtDatos.Rows.Count != 0)
                    {
                        AnteproyectoCronograma.EliminarTodasActividades(ViewState["IdPreliminaryDraft"].ToString());

                        foreach(DataRow dr in dtDatos.Rows)
                        {
                            AnteproyectoCronograma oAnteproyectoCro = new AnteproyectoCronograma(ViewState["IdPreliminaryDraft"].ToString());

                            oAnteproyectoCro.Nombre = dr["Name"].ToString();
                            oAnteproyectoCro.Descripcion = dr["Description"].ToString();
                            oAnteproyectoCro.Semana1 = dr["Semana1"].ToString();
                            oAnteproyectoCro.Semana2 = dr["Semana2"].ToString();
                            oAnteproyectoCro.Semana3 = dr["Semana3"].ToString();
                            oAnteproyectoCro.Semana4 = dr["Semana4"].ToString();
                            oAnteproyectoCro.Semana5 = dr["Semana5"].ToString();
                            oAnteproyectoCro.Semana6 = dr["Semana6"].ToString();
                            oAnteproyectoCro.Semana7 = dr["Semana7"].ToString();
                            oAnteproyectoCro.Semana8 = dr["Semana8"].ToString();
                            oAnteproyectoCro.Semana9 = dr["Semana9"].ToString();
                            oAnteproyectoCro.Semana10 = dr["Semana10"].ToString();
                            oAnteproyectoCro.Semana11 = dr["Semana11"].ToString();
                            oAnteproyectoCro.Semana12 = dr["Semana12"].ToString();
                            oAnteproyectoCro.Semana13 = dr["Semana13"].ToString();
                            oAnteproyectoCro.Semana14 = dr["Semana14"].ToString();
                            oAnteproyectoCro.Semana15 = dr["Semana15"].ToString();
                            oAnteproyectoCro.Semana16 = dr["Semana16"].ToString();
                            oAnteproyectoCro.Orden = dr["OrdenAcomodo"].ToString();

                            oAnteproyectoCro.InsertaActividad();
                            oAnteproyectoCro.ActualizaSemana();
                        }
                        cboxPeriodo_SelectedIndexChanged(null, null);

                        ObtieneActividades(ViewState["IdPreliminaryDraft"].ToString());
                        ObtieneActividadesDetalle(ViewState["IdPreliminaryDraft"].ToString());

                        upDetalle.Update();
                    }
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        protected void cboxPeriodo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                InsertaAnteproyecto("1");
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        protected void gvCronograma_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {

            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton ibtnFlechaArriba = (ImageButton)e.Row.Cells[20].FindControl("ibtnFlechaArriba");
                ibtnFlechaArriba.ID = "ibtnFlechaArriba";
                ibtnFlechaArriba.CommandName = "ibtnFlechaArriba";
                ibtnFlechaArriba.CommandArgument = e.Row.RowIndex.ToString();
                ibtnFlechaArriba.ImageUrl = "~//Assets//Imagenes//Principal//FlechaArriba.png";
                ibtnFlechaArriba.Width = 25;

                ImageButton ibtnFlechaAbajo = (ImageButton)e.Row.Cells[20].FindControl("ibtnFlechaAbajo");
                ibtnFlechaAbajo.ID = "ibtnFlechaAbajo";
                ibtnFlechaAbajo.CommandName = "ibtnFlechaAbajo";
                ibtnFlechaAbajo.CommandArgument = e.Row.RowIndex.ToString();
                ibtnFlechaAbajo.ImageUrl = "~//Assets//Imagenes//Principal//FlechaAbajo.png";
                ibtnFlechaAbajo.Width = 25;

                Button btnEliminar = (Button)e.Row.Cells[21].Controls[0];
                btnEliminar.ID = "btnEliminar";
                btnEliminar.CommandName = "btnEliminar";
                btnEliminar.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnEliminar.Text = "Eliminar";
                btnEliminar.ForeColor = System.Drawing.Color.White;
                btnEliminar.Font.Bold = true;
            }
        }

        protected void gvCronograma_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ibtnFlechaArriba")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvCronograma.Rows[index];

                String _sIdPreliminaryDraft = gvCronograma.DataKeys[index].Values[0].ToString();
                String _sIdSchedule = gvCronograma.DataKeys[index].Values[1].ToString();
                int _iOrden = int.Parse(gvCronograma.DataKeys[index].Values[2].ToString());

                if (_iOrden != 1)
                {
                    int _iOrdenNuevo = _iOrden - 1;
                    AnteproyectoCronograma.MoverActividad(_sIdPreliminaryDraft, _sIdSchedule, _iOrden.ToString(), _iOrdenNuevo.ToString());

                    ObtieneActividades(_sIdPreliminaryDraft);
                    ObtieneActividadesDetalle(_sIdPreliminaryDraft);
                    upDetalle.Update();
                }
            }
            else if (e.CommandName == "ibtnFlechaAbajo")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvCronograma.Rows[index];

                String _sIdPreliminaryDraft = gvCronograma.DataKeys[index].Values[0].ToString();
                String _sIdSchedule = gvCronograma.DataKeys[index].Values[1].ToString();
                int _iOrden = int.Parse(gvCronograma.DataKeys[index].Values[2].ToString());

                if (_iOrden < AnteproyectoCronograma.ObtieneNumeroUltimoOrden(_sIdPreliminaryDraft))
                {
                    int _iOrdenNuevo = _iOrden + 1;
                    AnteproyectoCronograma.MoverActividad(_sIdPreliminaryDraft, _sIdSchedule, _iOrden.ToString(), _iOrdenNuevo.ToString());

                    ObtieneActividades(_sIdPreliminaryDraft);
                    ObtieneActividadesDetalle(_sIdPreliminaryDraft);
                    upDetalle.Update();
                }
            }
            else if (e.CommandName == "btnEliminar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvCronograma.Rows[index];

                String _sIdPreliminaryDraft = gvCronograma.DataKeys[index].Values[0].ToString();
                String _sIdSchedule = gvCronograma.DataKeys[index].Values[1].ToString();
                int _iOrden = int.Parse(gvCronograma.DataKeys[index].Values[2].ToString());

                AnteproyectoCronograma.EliminarActividad(_sIdPreliminaryDraft, _sIdSchedule, _iOrden.ToString());

                ObtieneActividades(_sIdPreliminaryDraft);
                ObtieneActividadesDetalle(_sIdPreliminaryDraft);
                upDetalle.Update();
            }
        }

        protected void chkSemana1_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;

            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            CheckBox cb = (CheckBox)gvCronograma.Rows[selRowIndex].FindControl(chk.ID);
            GridViewRow row = gvCronograma.Rows[selRowIndex];

            String _sidPreliminaryDraft = gvCronograma.DataKeys[selRowIndex].Values[0].ToString();
            String _sIdSchedule = gvCronograma.DataKeys[selRowIndex].Values[1].ToString();

            AnteproyectoCronograma oAnteproyectoC = new AnteproyectoCronograma(_sidPreliminaryDraft, _sIdSchedule);

            switch (chk.ID)
            {
                case "chkSemana1":
                    oAnteproyectoC.Semana1 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana2":
                    oAnteproyectoC.Semana2 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana3":
                    oAnteproyectoC.Semana3 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana4":
                    oAnteproyectoC.Semana4 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana5":
                    oAnteproyectoC.Semana5 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana6":
                    oAnteproyectoC.Semana6 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana7":
                    oAnteproyectoC.Semana7 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana8":
                    oAnteproyectoC.Semana8 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana9":
                    oAnteproyectoC.Semana9 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana10":
                    oAnteproyectoC.Semana10 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana11":
                    oAnteproyectoC.Semana11 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana12":
                    oAnteproyectoC.Semana12 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana13":
                    oAnteproyectoC.Semana13 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana14":
                    oAnteproyectoC.Semana14 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana15":
                    oAnteproyectoC.Semana15 = (cb.Checked ? "1" : "0");
                    break;
                case "chkSemana16":
                    oAnteproyectoC.Semana16 = (cb.Checked ? "1" : "0");
                    break;
                default:
                    break;
            }

            oAnteproyectoC.ActualizaSemana();
            ObtieneActividades(_sidPreliminaryDraft);
            ObtieneActividadesDetalle(_sidPreliminaryDraft);
        }

        protected void ibtnAgregar_Click(object sender, ImageClickEventArgs e)
        {
            tboxNombreActividadMod.Text = "";
            modAgregar.Show();
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

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                InsertaAnteproyecto("1");
                Response.Redirect("Anteproyectos.aspx");
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
                if (!AnteproyectoCronograma.ValidaSiExistenActividades(ViewState["IdPreliminaryDraft"].ToString()) || AnteproyectoCronograma.ValidaSiUnaActividadEstaVacia(ViewState["IdPreliminaryDraft"].ToString()))
                {
                    oMensajes.MuestraMensaje(this, "Error", "No puedes enviar el anteproyecto, no has seleccionado ninguna actividad o dejaste una descripcion de actividad vacia.", Mensajes.TipoMensaje.Error);
                    return;
                }

                InsertaAnteproyecto("2");
                NotificarResponsablesRevisionAnteproyecto();
                Response.Redirect("Anteproyectos.aspx");
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        #region Botones de ayuda
        protected void ibtnNombreP_Click(object sender, ImageClickEventArgs e)
        {
            oMensajes.MuestraMensaje(this, "Informacion", "", Mensajes.TipoMensaje.Informacion);
        }

        protected void ibtnObjetivoP_Click(object sender, ImageClickEventArgs e)
        {
            oMensajes.MuestraMensaje(this, "Informacion", "", Mensajes.TipoMensaje.Informacion);
        }

        protected void ibtnJustificacion_Click(object sender, ImageClickEventArgs e)
        {
            oMensajes.MuestraMensaje(this, "Informacion", "", Mensajes.TipoMensaje.Informacion);
        }

        protected void ibtnCronograma_Click(object sender, ImageClickEventArgs e)
        {
            oMensajes.MuestraMensaje(this, "Informacion", "", Mensajes.TipoMensaje.Informacion);
        }

        protected void ibtnDescripcionDet_Click(object sender, ImageClickEventArgs e)
        {
            oMensajes.MuestraMensaje(this, "Informacion", "", Mensajes.TipoMensaje.Informacion);
        }

        protected void ibtnAlcanceP_Click(object sender, ImageClickEventArgs e)
        {
            oMensajes.MuestraMensaje(this, "Informacion", "", Mensajes.TipoMensaje.Informacion);
        }

        protected void ibtnLugar_Click(object sender, ImageClickEventArgs e)
        {
            oMensajes.MuestraMensaje(this, "Informacion", "", Mensajes.TipoMensaje.Informacion);
        }
        #endregion

        #region Modal Agregar Actividad
        protected void btnAceptarMod_Click(object sender, EventArgs e)
        {
            try
            {
                int iOrden =  AnteproyectoCronograma.ObtieneNumeroUltimoOrden(ViewState["IdPreliminaryDraft"].ToString()) + 1;
                AnteproyectoCronograma oAnteproyecto = new AnteproyectoCronograma(ViewState["IdPreliminaryDraft"].ToString());

                oAnteproyecto.Nombre = tboxNombreActividadMod.Text;
                oAnteproyecto.Descripcion = "";
                oAnteproyecto.Orden = iOrden.ToString();

                oAnteproyecto.InsertaActividad();

                ObtieneActividades(ViewState["IdPreliminaryDraft"].ToString());
                ObtieneActividadesDetalle(ViewState["IdPreliminaryDraft"].ToString());
                modAgregar.Hide();
                upDetalle.Update();
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        protected void btnCancelarMod_Click(object sender, EventArgs e)
        {
            modAgregar.Hide();
        }
        #endregion
        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("AnteproyectoResidencia.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            ibtnRetroceder.ImageUrl = "~//Assets//Imagenes//Principal//FlechaRetroceder.png";
            ibtnRetroceder.Width = 40;
            ibtnRetroceder.CausesValidation = false;

            DataTable dtAnteproyectos = Anteproyecto.ObtieneMisAnteproyectosNoAprobados(Generales.glsUsuarioSession.IdUsuario);

            if (dtAnteproyectos.Rows.Count != 0)
            {
                divRecuperarInfo.Visible = true;
            }
            else
            {
                divRecuperarInfo.Visible = false;
            }

            lblPeriodo.Text = oMensajes.TablaMensajes["lblPeriodo"];
            rfvPeriodo.Text = "Campo Obligatorio";

            lblAnio.Text = oMensajes.TablaMensajes["lblAnio"];
            rfvAnio.Text = "Campo Obligatorio";

            lblNombreP.Text = oMensajes.TablaMensajes["lblNombreP"];
            ibtnNombreP.ImageUrl = "~//Assets//Imagenes//Principal//SignoInterrogacion.png";
            ibtnNombreP.CausesValidation = false;
            rfvNombreP.Text = "Campo Obligatorio";

            lblObjetivoP.Text = oMensajes.TablaMensajes["lblObjetivoP"];
            ibtnObjetivoP.ImageUrl = "~//Assets//Imagenes//Principal//SignoInterrogacion.png";
            ibtnObjetivoP.CausesValidation = false;
            rfvObjetivoP.Text = "Campo Obligatorio";

            lblJustificacion.Text = oMensajes.TablaMensajes["lblJustificacion"];
            ibtnJustificacion.ImageUrl = "~//Assets//Imagenes//Principal//SignoInterrogacion.png";
            ibtnJustificacion.CausesValidation = false;
            rfvJustificacion.Text = "Campo Obligatorio";

            lblCronograma.Text = oMensajes.TablaMensajes["lblCronograma"];
            ibtnCronograma.ImageUrl = "~//Assets//Imagenes//Principal//SignoInterrogacion.png";
            ibtnCronograma.CausesValidation = false;
            
            lblDescripcionDet.Text = oMensajes.TablaMensajes["lblDescripcionDet"];
            ibtnDescripcionDet.ImageUrl = "~//Assets//Imagenes//Principal//SignoInterrogacion.png";
            ibtnDescripcionDet.CausesValidation = false;

            lblAlcanceP.Text = oMensajes.TablaMensajes["lblAlcanceP"];
            ibtnAlcanceP.ImageUrl = "~//Assets//Imagenes//Principal//SignoInterrogacion.png";
            ibtnAlcanceP.CausesValidation = false;
            rfvAlcanceP.Text = "Campo Obligatorio";

            lblLugar.Text = oMensajes.TablaMensajes["lblLugar"];
            ibtnLugar.ImageUrl = "~//Assets//Imagenes//Principal//SignoInterrogacion.png";
            ibtnLugar.CausesValidation = false;
            rfvLugarP.Text = "Campo Obligatorio";

            lblInformacionEmpresa.Text = oMensajes.TablaMensajes["lblInformacionEmpresa"];

            ibtnAgregar.ImageUrl = "~//Assets//Imagenes//Principal//Agregar.png";
            ibtnAgregar.CausesValidation = false;
            ibtnAgregar.ToolTip = oMensajes.TablaMensajes["ibtnAgregar"];

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
            gvCronograma.Columns[20].HeaderText = oMensajes.TablaMensajes["gvCronograma_Orden"];
            gvCronograma.Columns[21].HeaderText = oMensajes.TablaMensajes["gvCronograma_Opciones"];

            for (int i = 0; i < gvCronograma.Columns.Count; i++)
            {
                gvCronograma.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvCronograma.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }

            lblBusquedaEmpresa.Text = oMensajes.TablaMensajes["lblBusquedaEmpresa"];
            chkITSJ.Text = "&nbsp&nbsp" + oMensajes.TablaMensajes["chkITSJ"];

            lblNombreE.Text = oMensajes.TablaMensajes["lblNombreE"];
            rfvNombreE.Text = "Campo Obligatorio";

            lblTelefonoE.Text = oMensajes.TablaMensajes["lblTelefonoE"];
            rfvTelefonoE.Text = "Campo Obligatorio";

            lblGiroE.Text = oMensajes.TablaMensajes["lblGiroE"];
            rfvGiroE.Text = "Campo Obligatorio";

            lblDepartamentoE.Text = oMensajes.TablaMensajes["lblDepartamentoE"];
            rfvDepartamentoE.Text = "Campo Obligatorio";

            lblNombreGerenteE.Text = oMensajes.TablaMensajes["lblNombreGerenteE"];
            rfvNombreGerenteE.Text = "Campo Obligatorio";

            lblJefeAreaE.Text = oMensajes.TablaMensajes["lblJefeAreaE"];
            rfvJefeAreaE.Text = "Campo Obligatorio";
            
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

            lblCiudadE.Text = oMensajes.TablaMensajes["lblCiudadE"];
            rfvCiudadE.Text = "Campo Obligatorio";

            lblCPE.Text = oMensajes.TablaMensajes["lblCPE"];
            rfvCPE.Text = "Campo Obligatorio";

            lblEstadoE.Text = oMensajes.TablaMensajes["lblEstadoE"];
            rfvEstadoE.Text = "Campo Obligatorio";

            lblDatosR.Text = oMensajes.TablaMensajes["lblDatosR"];
            lblNumControlR.Text = oMensajes.TablaMensajes["lblNumControlR"];
            rfvNumControlR.Text = "Campo Obligatorio";

            lblCarreraR.Text = oMensajes.TablaMensajes["lblCarreraR"];
            rfvCarreraR.Text = "Campo Obligatorio";

            lblNombreR.Text = oMensajes.TablaMensajes["lblNombreR"];
            rfvNombreR.Text = "Campo Obligatorio";

            lblTelefonoR.Text = oMensajes.TablaMensajes["lblTelefonoR"];
            rfvTelefonoR.Text = "Campo Obligatorio";

            lblEmailR.Text = oMensajes.TablaMensajes["lblEmailR"];
            rfvEmailR.Text = "Campo Obligatorio";

            btnGuardar.Text = oMensajes.TablaMensajes["btnGuardar"];
            btnGuardar.ForeColor = System.Drawing.Color.White;
            btnGuardar.Font.Bold = true;
            btnGuardar.CausesValidation = false;

            btnEnviar.Text = oMensajes.TablaMensajes["btnEnviar"];
            btnEnviar.ForeColor = System.Drawing.Color.White;
            btnEnviar.Font.Bold = true;

            #region Modal Agregar Actividad
            lblDescripcionModuloMod.Text = oMensajes.TablaMensajes["lblDescripcionModuloMod"];

            lblNombreActividadMod.Text = oMensajes.TablaMensajes["lblNombreActividadMod"];
            rfvNombreActividadMod.Text = "Campo Obligatorio";

            btnCancelarMod.Text = oMensajes.TablaMensajes["btnCancelarMod"];
            btnCancelarMod.ForeColor = System.Drawing.Color.White;
            btnCancelarMod.Font.Bold = true;
            btnCancelarMod.CausesValidation = false;

            btnAceptarMod.Text = oMensajes.TablaMensajes["btnAceptarMod"];
            btnAceptarMod.ForeColor = System.Drawing.Color.White;
            btnAceptarMod.Font.Bold = true;
            #endregion
        }

        private void ConfiguraGrid()
        {
            gvCronograma.Columns[2].ControlStyle.Width = 300;
        }

        private void LlenarCombos()
        {
            cboxCarreraR.DataTextField = "Name";
            cboxCarreraR.DataValueField = "IdValueDetail";
            cboxCarreraR.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Carreras");
            cboxCarreraR.DataBind();
            cboxCarreraR.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxCarreraR.SelectedIndex = 0;

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
        }

        private void RecuperaEdicion(String _sIdPreliminaryDraft, String _sIdUser)
        {
            try
            {
                Anteproyecto oAnteproyecto = new Anteproyecto(_sIdPreliminaryDraft, _sIdUser);

                cboxPeriodo.SelectedValue = oAnteproyecto.IdPeriod;
                tboxAnio.Text = oAnteproyecto.Anio;
                tboxNombreP.Text = oAnteproyecto.Nombre;
                tboxObjetivoP.Text = oAnteproyecto.Objetivo;
                tboxJustificacion.Text = oAnteproyecto.Justificacion;
                tboxAlcanceP.Text = oAnteproyecto.AlcanceProyecto;
                tboxLugarP.Text = oAnteproyecto.Lugar;
                tboxNombreE.Text = oAnteproyecto.NombreEmpresa;
                tboxGiroE.Text = oAnteproyecto.GiroEmpresa;
                tboxDepartamentoE.Text = oAnteproyecto.DepartamentoEmpresa;
                tboxTelefonoE.Text = oAnteproyecto.TelefonoOficinaEmpresa;
                tboxNombreGerenteE.Text = oAnteproyecto.DuenioEmpresa;
                tboxJefeAreaE.Text = oAnteproyecto.JefeAreaEmpresa;
                tboxCalleE.Text = oAnteproyecto.CalleEmpresa;
                tboxNumExtE.Text = oAnteproyecto.NumeroExteriorEmpresa;
                tboxNumIntE.Text = oAnteproyecto.NumeroInteriorEmpresa;
                tboxColoniaE.Text = oAnteproyecto.ColoniaEmpresa;
                tboxMunicipioE.Text = oAnteproyecto.MunicipioEmpresa;
                tboxCPE.Text = oAnteproyecto.CodigoPostaEmpresa;
                tboxCiudadE.Text = oAnteproyecto.CiudadEmpresa;
                tboxEstadoE.Text = oAnteproyecto.EstadoEmpresa;

                tboxNumControlR.Text = oAnteproyecto.NumeroControlUsuario;
                cboxCarreraR.SelectedValue = oAnteproyecto.IdCareerUsuario;
                tboxNombreR.Text = oAnteproyecto.NombreUsuario;
                tboxTelefonoR.Text = oAnteproyecto.CelularUsuario;
                tboxEmailR.Text = oAnteproyecto.EmailUsuario;

                //LlenarSeccionUsuario(_sIdUser);
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        private void DeshabilitarComponentes()
        {
            divRecuperarInfo.Visible = false;
            cboxPeriodo.Enabled = false;
            tboxAnio.Enabled = false;
            tboxNombreP.Enabled = false;
            tboxObjetivoP.Enabled = false;
            tboxJustificacion.Enabled = false;

            ibtnAgregar.Visible = false;
            gvCronograma.Columns[20].Visible = false;
            gvCronograma.Columns[21].Visible = false;
            gvCronograma.Enabled = false;

            tboxAlcanceP.Enabled = false;
            tboxLugarP.Enabled = false;
            tboxNombreE.Enabled = false;
            tboxCiudadE.Enabled = false;
            tboxCPE.Enabled = false;
            tboxEstadoE.Enabled = false;
            tboxTelefonoE.Enabled = false;
            tboxGiroE.Enabled = false;
            tboxDepartamentoE.Enabled = false;
            tboxNombreGerenteE.Enabled = false;
            tboxJefeAreaE.Enabled = false;
            tboxCalleE.Enabled = false;
            tboxNumExtE.Enabled = false;
            tboxNumIntE.Enabled = false;
            tboxColoniaE.Enabled = false;
            tboxMunicipioE.Enabled = false;

            tboxNumControlR.Enabled = false;
            cboxCarreraR.Enabled = false;
            tboxNombreR.Enabled = false;
            tboxTelefonoR.Enabled = false;
            tboxEmailR.Enabled = false;


            lboxBusquedaEmpresa.Attributes.Add("disabled", "disabled");
            chkITSJ.Enabled = false;
            divBotones.Visible = false;
            divBusquedaE.Visible = false;
        }

        private void ObtieneActividades(String _sIdPreliminaryDraft)
        {
            DataTable dtActividades = AnteproyectoCronograma.ObtieneMisActividades(_sIdPreliminaryDraft);
            ViewState["dtActividades"] = dtActividades;

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
                    if(ViewState["Accion"] != null)
                    {
                        if(ViewState["Accion"].ToString() == "Ver" || ViewState["Accion"].ToString() == "VerConCalificacion" || ViewState["Accion"].ToString() == "Revision")
                        {
                            sDetalleActividad.AppendLine("       <textarea class=\"form-control cambio-texto fontsizeh6\" style=\"resize:none;\" rows=\"3\" name=\"" + dr["IdPreliminaryDraft"].ToString() + "|" + dr["IdSchedule"].ToString() + "\" id=\"" + dr["IdPreliminaryDraft"].ToString() + "|" + dr["IdSchedule"].ToString() + "\" disabled>" + dr["Description"].ToString() + "</textarea>");
                        }
                        else
                        {
                            sDetalleActividad.AppendLine("       <textarea class=\"form-control cambio-texto fontsizeh6\" style=\"resize:none;\" rows=\"3\" name=\"" + dr["IdPreliminaryDraft"].ToString() + "|" + dr["IdSchedule"].ToString() + "\" id=\"" + dr["IdPreliminaryDraft"].ToString() + "|" + dr["IdSchedule"].ToString() + "\">" + dr["Description"].ToString() + "</textarea>");
                        }
                    }
                    else
                    {
                        sDetalleActividad.AppendLine("       <textarea class=\"form-control cambio-texto fontsizeh6\" style=\"resize:none;\" rows=\"3\" name=\"" + dr["IdPreliminaryDraft"].ToString() + "|" + dr["IdSchedule"].ToString() + "\" id=\"" + dr["IdPreliminaryDraft"].ToString() + "|" + dr["IdSchedule"].ToString() + "\">" + dr["Description"].ToString() + "</textarea>");
                    }
                    sDetalleActividad.AppendLine("   </div>");
                    sDetalleActividad.AppendLine("</div>");
                }
            }
            else
            {

            }
            ViewState["sDetalleActividad"] = sDetalleActividad;
        }

        private void LlenarSeccionUsuario(String _sIdUser)
        {
            tboxNumControlR.Text = Generales.glsUsuarioSession.NoControl;
            cboxCarreraR.SelectedValue = Generales.glsUsuarioSession.IdCarrera;
            tboxNombreR.Text = Generales.glsUsuarioSession.Nombre + " " + Generales.glsUsuarioSession.ApellidoPaterno + " " + Generales.glsUsuarioSession.ApellidoMaterno;
            tboxTelefonoR.Text = Generales.glsUsuarioSession.Telefono;
            tboxEmailR.Text = Generales.glsUsuarioSession.Email + ValoresPorReferencia.ObtieneDatoValorPorReferencia("DominioCorreo", Generales.glsUsuarioSession.IdDominio);
        }

        private void LlenarSeccionEmpresa(String _sIdCompany)
        {
            Empresa oEmpresa = new Empresa(_sIdCompany);
            
            tboxNombreE.Text = oEmpresa.Nombre;
            tboxGiroE.Text = oEmpresa.Giro;
            tboxTelefonoE.Text = oEmpresa.TelefonoOficina;
            tboxNombreGerenteE.Text = oEmpresa.NombreDuenio;
            tboxCalleE.Text = oEmpresa.NombreCalle;
            tboxNumExtE.Text = oEmpresa.NumeriorExterior;
            tboxNumIntE.Text = oEmpresa.NumeroInterior;
            tboxColoniaE.Text = oEmpresa.Colonia;
            tboxMunicipioE.Text = oEmpresa.Municipio;
            tboxCiudadE.Text = oEmpresa.Ciudad;
            tboxCPE.Text = oEmpresa.NumeroPostal;
            tboxEstadoE.Text = oEmpresa.Estado;
        }

        private void LimpiarCamposEmpresa()
        {
            tboxNombreE.Text = "";
            tboxGiroE.Text = "";
            tboxTelefonoE.Text = "";
            tboxNombreGerenteE.Text = "";
            tboxCalleE.Text = "";
            tboxNumExtE.Text = "";
            tboxNumIntE.Text = "";
            tboxColoniaE.Text = "";
            tboxMunicipioE.Text = "";
            tboxCiudadE.Text = "";
            tboxCPE.Text = "";
            tboxEstadoE.Text = "";
        }

        private void InsertaAnteproyecto(String _sIdTypeState)
        {
            
            Anteproyecto oAnteproyecto = new Anteproyecto();

            //Si la variable de "Accion" es nula, significa que se esta agregando un nuevo anteproyecto.
            if (ViewState["Accion"] != null)
            {
                oAnteproyecto = new Anteproyecto(ViewState["IdPreliminaryDraft"].ToString(), Generales.glsUsuarioSession.IdUsuario);
            }
            else
            {
                oAnteproyecto = new Anteproyecto();
                oAnteproyecto.IdPreliminaryDraft = ViewState["IdPreliminaryDraft"].ToString();
            }

            oAnteproyecto.IdUser = Generales.glsUsuarioSession.IdUsuario;
            oAnteproyecto.IdPeriod = cboxPeriodo.SelectedValue;
            if (tboxAnio.Text == "____")
            {
                oAnteproyecto.Anio = "";
            }
            else
            {
                oAnteproyecto.Anio = tboxAnio.Text;
            }
            oAnteproyecto.Nombre = tboxNombreP.Text;
            oAnteproyecto.Objetivo = tboxObjetivoP.Text;
            oAnteproyecto.Justificacion = tboxJustificacion.Text;
            oAnteproyecto.AlcanceProyecto = tboxAlcanceP.Text;
            oAnteproyecto.Lugar = tboxLugarP.Text;
            oAnteproyecto.IdTipoEstado = _sIdTypeState;
            
            if (_sIdTypeState == "1")
            {
                oAnteproyecto.FechaEnvio = "";
            }
            else
            {
                oAnteproyecto.FechaEnvio = DateTime.Now.ToString("yyyy-MM-dd");
            }

            oAnteproyecto.NombreEmpresa = tboxNombreE.Text;
            oAnteproyecto.GiroEmpresa = tboxGiroE.Text;
            oAnteproyecto.DepartamentoEmpresa = tboxDepartamentoE.Text;
            oAnteproyecto.TelefonoOficinaEmpresa = tboxTelefonoE.Text;
            oAnteproyecto.DuenioEmpresa = tboxNombreGerenteE.Text;
            oAnteproyecto.JefeAreaEmpresa = tboxJefeAreaE.Text;
            oAnteproyecto.CalleEmpresa = tboxCalleE.Text;
            oAnteproyecto.NumeroExteriorEmpresa = tboxNumExtE.Text;
            oAnteproyecto.NumeroInteriorEmpresa = tboxNumIntE.Text;
            oAnteproyecto.ColoniaEmpresa = tboxColoniaE.Text;
            oAnteproyecto.MunicipioEmpresa = tboxMunicipioE.Text;
            oAnteproyecto.CodigoPostaEmpresa = tboxCPE.Text;
            oAnteproyecto.CiudadEmpresa = tboxCiudadE.Text;
            oAnteproyecto.EstadoEmpresa = tboxEstadoE.Text;

            oAnteproyecto.NumeroControlUsuario = tboxNumControlR.Text;
            oAnteproyecto.NombreUsuario = tboxNombreR.Text;
            oAnteproyecto.IdCareerUsuario = cboxCarreraR.SelectedValue;
            oAnteproyecto.CelularUsuario = tboxTelefonoR.Text;
            oAnteproyecto.EmailUsuario = tboxEmailR.Text.ToLower();

            oAnteproyecto.InsertaActualizaAnteproyecto();
        }

        private StringBuilder ObtieneComentarioFinalJefeCarrera(String _sIdPreliminaryDraft)
        {
            DataTable dtComenatrios = MaestroResidencia.ObtieneMisComentariosJefeCarrera(_sIdPreliminaryDraft);

            StringBuilder sCalificacionFinal = new StringBuilder();

            if (dtComenatrios.Rows.Count != 0)
            {
                foreach (DataRow dr in dtComenatrios.Rows)
                {
                    sCalificacionFinal.AppendLine("<div class=\"row\">");
                    sCalificacionFinal.AppendLine("    <div class=\"col-12 col-sm-12 col-md-8 offset-md-2\">");
                    sCalificacionFinal.AppendLine("        <div style=\"background-color:#F1EEC7; padding:30px;\">");
                    sCalificacionFinal.AppendLine("            <div class=\"row text-center\" style=\"margin-bottom:10px;\">");
                    sCalificacionFinal.AppendLine("                <div class=\"col-12 col-sm-12 col-md-12 contenedor-centrar\">");
                    sCalificacionFinal.AppendLine("                    <div class=\"circulo contenedor-centrar-centro\">");
                    if (dr["PathFoto"].ToString() != "")
                    {
                        sCalificacionFinal.AppendLine("                        <img src=\"" + dr["PathFoto"].ToString() + "\" style=\"border-radius:50%;\"/>");
                    }
                    else
                    {
                        sCalificacionFinal.AppendLine("                        <img src=\"Assets/Imagenes/FotosDePerfil/Alumno.jpg\" style=\"border-radius:50%;\"/>");
                    }
                    sCalificacionFinal.AppendLine("                    </div>");
                    sCalificacionFinal.AppendLine("                </div>");
                    sCalificacionFinal.AppendLine("            </div>");
                    sCalificacionFinal.AppendLine("            <div class=\"row text-center\" style=\"margin-bottom:20px;\">");
                    sCalificacionFinal.AppendLine("                <div class=\"col-12 col-sm-12 col-md-12\">");
                    sCalificacionFinal.AppendLine("                    <span class=\"fontbold\" style=\"font-size:20px;\">" + dr["NombreJefeCarrera"] + "</span>");
                    sCalificacionFinal.AppendLine("                </div>");
                    sCalificacionFinal.AppendLine("            </div>");
                    sCalificacionFinal.AppendLine("            <div class=\"row\" style=\"margin-bottom:10px;\">");
                    sCalificacionFinal.AppendLine("                <div class=\"col-2 col-sm-2 col-md-2 text-center\" style=\"padding:0px;\">");
                    sCalificacionFinal.AppendLine("                    <img src=\"Assets/Imagenes/Principal/ComillasAbrir.png\" style=\"width:50px;\"/>");
                    sCalificacionFinal.AppendLine("                </div>");
                    sCalificacionFinal.AppendLine("                <div class=\"col-8 col-sm-8 col-md-8\">");
                    sCalificacionFinal.AppendLine("                    <div class=\"row text-center\" style=\"margin-bottom:20px;\">");
                    sCalificacionFinal.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sCalificacionFinal.AppendLine("                            <span style=\"font-size:15px;\">" + dr["ComentarioGeneral"].ToString().Replace("\n", "<br />") + "</span>");
                    sCalificacionFinal.AppendLine("                        </div>");
                    sCalificacionFinal.AppendLine("                    </div>");
                    sCalificacionFinal.AppendLine("                    <div class=\"row text-center\" style=\"margin-bottom:10px;\">");
                    sCalificacionFinal.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    switch (dr["EstatusCalificacionFinal"].ToString())
                    {
                        case "2":
                            sCalificacionFinal.AppendLine("                            <img src=\"Assets/Imagenes/CalificarAnteproyectos/Aprobado.png\" style=\"width:100px;\"/>");
                            break;
                        case "3":
                            sCalificacionFinal.AppendLine("                            <img src=\"Assets/Imagenes/CalificarAnteproyectos/AprobadoConComentarios.png\" style=\"width:100px;\"/>");
                            break;
                        case "4":
                            sCalificacionFinal.AppendLine("                            <img src=\"Assets/Imagenes/CalificarAnteproyectos/NoAprobado.png\" style=\"width:100px;\"/>");
                            break;
                    }
                    sCalificacionFinal.AppendLine("                        </div>");
                    sCalificacionFinal.AppendLine("                    </div>");
                    sCalificacionFinal.AppendLine("                    <div class=\"row text-center\">");
                    sCalificacionFinal.AppendLine("                        <div class=\"col-12 col-sm-12 col-md-12\">");
                    sCalificacionFinal.AppendLine("                            <span class=\"fontbold\" style=\"font-size:17px;\">" + dr["CalificacionFinal"].ToString() + "</span>");
                    sCalificacionFinal.AppendLine("                        </div>");
                    sCalificacionFinal.AppendLine("                    </div>");
                    sCalificacionFinal.AppendLine("                </div>");
                    sCalificacionFinal.AppendLine("                <div class=\"col-2 col-sm-2 col-md-2 text-center\" style=\"padding:0px;\">");
                    sCalificacionFinal.AppendLine("                    <img src=\"Assets/Imagenes/Principal/ComillasCerrar.png\" style=\"width:50px;\"/>");
                    sCalificacionFinal.AppendLine("                </div>");
                    sCalificacionFinal.AppendLine("            </div>");
                    sCalificacionFinal.AppendLine("        </div>");
                    sCalificacionFinal.AppendLine("    </div>");
                    sCalificacionFinal.AppendLine("</div>");
                    sCalificacionFinal.AppendLine("<br />");
                    sCalificacionFinal.AppendLine("<br />");
                }
            }

            return sCalificacionFinal;
        }

        private void NotificarResponsablesRevisionAnteproyecto()
        {
            DataTable dtUsuariosNotificacion = Usuario.ObtieneUsuariosParaNotificar(Generales.glsUsuarioSession.IdCarrera, "EnvioAnteproyecto");

            foreach (DataRow dr in dtUsuariosNotificacion.Rows)
            {
                Generales.InsertaNotificacion(dr["IdUser"].ToString(), "El Alumno \"" + Generales.glsUsuarioSession.NoControl + " - " + Generales.glsUsuarioSession.Nombre + " " + Generales.glsUsuarioSession.ApellidoPaterno + " " +
                    Generales.glsUsuarioSession.ApellidoMaterno + "\" ha enviado su anteproyecto, asignale los maestros que seran encargados de revisarlo o deja que los maestros lo seleccionen.", Enums.TipoNotificacion.Hipervinculo.ToString(), "MaestrosResidenciasAdministrador.aspx");
            }
        }

        [System.Web.Services.WebMethod]
        public static string ActualizaCambiosDetActividades(string sName, string sValorTexto)
        {
            String[] sParametros = sName.Split('|');

            String _sIdPreliminaryDraft = sParametros[0];
            String _sIdSchedule = sParametros[1];

            AnteproyectoCronograma.ActualizaDescripcionActividad(_sIdPreliminaryDraft , _sIdSchedule, sValorTexto);

            return $"";
        }
        #endregion
    }
}