using GestorResidencias.Clases;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorResidencias
{
    public partial class BancoProyectosAdministrador : System.Web.UI.Page
    {
        #region Variables
        private Mensajes oMensajes = new Mensajes();
        private Dictionary<string, string> dicOrdenacion = new Dictionary<string, string>();
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
                if (Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString()
                    || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.EncargadoDeResidencias.ToString())
                {
                    if (IsPostBack == false)
                    {
                        ConfiguraPagina();
                        LlenarCombos();
                        LlenarBancoProyectos("", "");

                        /*Al momento de seleccionar un periodo en cualquier seccion administradora se guarda e esta variable de session,
                         esto con el fin de no estar marcando el periodo y anio en cada momento.*/
                        if (Session["IdPeriodo"] != null)
                        {
                            cboxPeriodo.SelectedValue = Session["IdPeriodo"].ToString();
                            tboxAnio.Text = Session["Anio"].ToString();

                            cboxPeriodo_SelectedIndexChanged(null, null);
                        }
                    }
                    ScriptManager.RegisterStartupScript(this, GetType(), "Script1", "Scrolls();", true);
                    ConfiguraGrid();
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
            if (cboxPeriodo.SelectedValue != "" && tboxAnio.Text != "")
            {
                LimpiarFiltro();
                divTabla.Visible = true;
                divSinRegistros.Visible = false;
                lblPeriodoDes.Text = cboxPeriodo.SelectedItem.Text + " " + tboxAnio.Text;

                LlenarBancoProyectos(cboxPeriodo.SelectedValue, tboxAnio.Text);

                Session["IdPeriodo"] = cboxPeriodo.SelectedValue;
                Session["Anio"] = tboxAnio.Text;
            }
            else
            {
                LlenarBancoProyectos("", "");
                divTabla.Visible = false;
                divSinRegistros.Visible = true;
                lblPeriodoDes.Text = "";
            }
        }

        protected void btnDescargarPlantilla_Click(object sender, EventArgs e)
        {
            try
            {
                String sDestino = "~\\Plantillas\\BancoDeProyectos\\Plantilla_BancoDeProyectos.xlsx";
                String sPath = Server.MapPath(sDestino);

                if (File.Exists(sPath))
                {
                    Response.Clear();
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AppendHeader("Content-Disposition", string.Format("attachment; filename={0}", "Plantilla_BancoDeProyectos.xlsx"));
                    Response.TransmitFile(sPath);
                    Response.End();
                }
                else
                {
                    oMensajes.MuestraMensaje(this, "Error", "La plantilla no existe o esta en mantenimiento. Favor de intentarlo mas tarde.", Mensajes.TipoMensaje.Error);
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }
        
        protected void tboxNombreEmpresa_TextChanged(object sender, EventArgs e)
        {
            LlenarBancoProyectos(cboxPeriodo.SelectedValue, tboxAnio.Text, tboxNombreEmpresa.Text, tboxNombreProyecto.Text, tboxNumeroRes.Text, cboxTurno.SelectedValue,
                cboxCarrera.SelectedValue, cboxEstatus.SelectedValue);
        }

        protected void ibtnAgregar_Click(object sender, ImageClickEventArgs e)
        {
            LimpiarModal();

            tboxNoMod.Enabled = false;
            tboxNoMod.Text = "0";
            
            modAgregar.Show();
        }

        protected void ibtnAgregarExcel_Click(object sender, ImageClickEventArgs e)
        {
            modProcesarEx.Show();
        }

        protected void gvBanco_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dicOrdenacion = new Dictionary<string, string>((Dictionary<string, string>)ViewState["dicOrdenacion"]);

            DataView m_DataView = new DataView((DataTable)ViewState["dtBanco"]);
            if (ViewState["ultOrdenacion"] != null)
            {
                m_DataView.Sort = ViewState["ultOrdenacion"].ToString() + " " + dicOrdenacion[ViewState["ultOrdenacion"].ToString()];
            }

            gvBanco.DataSource = m_DataView;
            gvBanco.PageIndex = e.NewPageIndex;
            gvBanco.DataBind();
        }

        protected void gvBanco_Sorting(object sender, GridViewSortEventArgs e)
        {
            gvBanco.PageIndex = 0;

            dicOrdenacion = new Dictionary<string, string>((Dictionary<string, string>)ViewState["dicOrdenacion"]);
            if (!dicOrdenacion.ContainsKey(e.SortExpression))
            {
                dicOrdenacion.Add(e.SortExpression, "ASC");
            }
            else
            {
                if (dicOrdenacion[e.SortExpression] == "ASC")
                {
                    dicOrdenacion[e.SortExpression] = "DESC";
                }
                else
                {
                    dicOrdenacion[e.SortExpression] = "ASC";
                }
            }
            ViewState["dicOrdenacion"] = dicOrdenacion;
            ViewState["ultOrdenacion"] = e.SortExpression;

            if (ViewState["dtBanco"] != null)
            {
                DataView m_DataView = new DataView((DataTable)ViewState["dtBanco"]);
                m_DataView.Sort = e.SortExpression + " " + dicOrdenacion[e.SortExpression];

                gvBanco.DataSource = m_DataView;
                gvBanco.DataBind();
            }
        }

        protected void gvBanco_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[23].ColumnSpan = 2;
                e.Row.Cells.RemoveAt(24);
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btnEditar = (Button)e.Row.Cells[23].Controls[0];
                btnEditar.ID = "btnEditar";
                btnEditar.CommandName = "btnEditar";
                btnEditar.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnEditar.Text = "Editar";
                btnEditar.ForeColor = System.Drawing.Color.White;
                btnEditar.Font.Bold = true;

                Button btnEliminar = (Button)e.Row.Cells[24].Controls[0];
                btnEliminar.ID = "btnEliminar";
                btnEliminar.CommandName = "btnEliminar";
                btnEliminar.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnEliminar.Text = "Eliminar";
                btnEliminar.ForeColor = System.Drawing.Color.White;
                btnEliminar.Font.Bold = true;
            }
        }

        protected void gvBanco_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "btnEditar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvBanco.Rows[index];
                    String _sIdBank = gvBanco.DataKeys[index].Values[0].ToString();

                    ViewState["IdBank"] = _sIdBank;
                    LimpiarModal();

                    BancoProyecto oBanco = new BancoProyecto(_sIdBank);

                    tboxNoMod.Text = oBanco.Numero;
                    cboxEstadoMod.SelectedValue = oBanco.IdTypeState;
                    tboxNombreEmpresaMod.Text = oBanco.NombreEmpresa;
                    tboxGiroMod.Text = oBanco.Giro;
                    tboxDomicilioMod.Text = oBanco.Domicilio;
                    tboxNombreContactoMod.Text = oBanco.NombreContacto;
                    tboxAreaRecptoraMod.Text = oBanco.AreaReceptora;
                    tboxPuestoMod.Text = oBanco.Puesto;
                    tboxEmailMod.Text = oBanco.Email;
                    tboxNombreProyectoMod.Text = oBanco.NombreProyecto;
                    tboxActividadesMod.Text = oBanco.Actividades;
                    cboxCarreraMod.SelectedValue = oBanco.IdCarrera;
                    cboxTurnoMod.SelectedValue = oBanco.Turno;
                    if(oBanco.Turno == "4")
                    {
                        divOtroTurno.Visible = true;
                        rfvOtroTurnoMod.Enabled = true;
                        tboxOtroTurnoMod.Text = oBanco.TurnoOtro;
                    }
                    else
                    {
                        rfvOtroTurnoMod.Enabled = false;
                        divOtroTurno.Visible = false;
                        tboxOtroTurnoMod.Text = "";
                    }
                    tboxHorarioMod.Text = oBanco.Horario;
                    tboxDiasLaboralesMod.Text = oBanco.DiasLaborales;
                    tboxNumeroResidentesMod.Text = oBanco.NumeroResidentes;
                    tboxCapacitacionPrevMod.Text = oBanco.Capacitacion;
                    tboxEnQueConsisteMod.Text = oBanco.CapacitacionDet;
                    tboxFechaCapacitacionMod.Text = oBanco.CapacitacionFecha;
                    tboxOtorgaPrestacionMod.Text = oBanco.Prestacion;
                    tboxCualPrestacionMod.Text = oBanco.PrestacionDet;
                    tboxMontoMod.Text = oBanco.Monto;

                    modAgregar.Show();

                }
                else if (e.CommandName == "btnEliminar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvBanco.Rows[index];

                    String _sIdBank = gvBanco.DataKeys[index].Values[0].ToString();

                    oMensajes.MuestraMensajeConRespuesta(this, "Información", "Seguro que deseas eliminar este proyecto?, los cambios realizados no se pueden revertir.", Mensajes.TipoMensaje.Precaucion, "EliminarProyecto", _sIdBank);
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        protected void btnDescargar_Click(object sender, EventArgs e)
        {
            DataTable dtDatos = (DataTable)ViewState["dtBanco"];

            if (dtDatos.Rows.Count > 0)
            {
                GeneraExcel(dtDatos);
            }
            else
            {
                oMensajes.MuestraMensaje(this, "Info", "No exite información para descargar", Mensajes.TipoMensaje.Informacion);
            }
        }

        #region Modal Agregar
        protected void cboxCarreraMod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboxCarreraMod.SelectedValue != "")
            {
                tboxNoMod.Text = BancoProyecto.ObtieneUltimoNumero(cboxPeriodo.SelectedValue, tboxAnio.Text, cboxCarreraMod.SelectedValue).ToString();
            }
            else
            {
                tboxNoMod.Text = "0";
            }
        }

        protected void cboxTurnoMod_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (cboxTurnoMod.SelectedValue == "4")
            {
                divOtroTurno.Visible = true;
                rfvOtroTurnoMod.Enabled = true;
            }
            else
            {
                divOtroTurno.Visible = false;
                rfvOtroTurnoMod.Enabled = false;
                tboxOtroTurnoMod.Text = "";
            }
        }
        
        protected void btnCancelarMod_Click(object sender, EventArgs e)
        {
            ViewState.Remove("IdBank");
            modAgregar.Hide();
        }

        protected void btnAceptarMod_Click(object sender, EventArgs e)
        {
            try
            {
                BancoProyecto oBanco;

                if (ViewState["IdBank"]!= null)
                {
                    oBanco = new BancoProyecto(ViewState["IdBank"].ToString());
                }
                else
                {
                    oBanco = new BancoProyecto();
                }
                

                oBanco.Numero = tboxNoMod.Text;
                oBanco.IdTypeState = cboxEstadoMod.SelectedValue;
                oBanco.IdPeriod = cboxPeriodo.SelectedValue;
                oBanco.Anio = tboxAnio.Text;
                oBanco.NombreEmpresa = tboxNombreEmpresaMod.Text;
                oBanco.Giro = tboxGiroMod.Text;
                oBanco.Domicilio = tboxDomicilioMod.Text;
                oBanco.NombreContacto = tboxNombreContactoMod.Text;
                oBanco.AreaReceptora = tboxAreaRecptoraMod.Text;
                oBanco.Puesto = tboxPuestoMod.Text;
                oBanco.Email = tboxEmailMod.Text;
                oBanco.NombreProyecto = tboxNombreProyectoMod.Text;
                oBanco.Actividades = tboxActividadesMod.Text;
                oBanco.IdCarrera = cboxCarreraMod.SelectedValue;
                oBanco.Turno = cboxTurnoMod.SelectedValue;
                oBanco.TurnoOtro = (cboxTurnoMod.SelectedValue == "4" ? tboxOtroTurnoMod.Text : "");
                oBanco.Horario = tboxHorarioMod.Text;
                oBanco.DiasLaborales = tboxDiasLaboralesMod.Text;
                oBanco.NumeroResidentes = tboxNumeroResidentesMod.Text;
                oBanco.Capacitacion = tboxCapacitacionPrevMod.Text;
                oBanco.CapacitacionDet = tboxEnQueConsisteMod.Text;
                oBanco.CapacitacionFecha = tboxFechaCapacitacionMod.Text;
                oBanco.Prestacion = tboxOtorgaPrestacionMod.Text;
                oBanco.PrestacionDet = tboxCualPrestacionMod.Text;
                oBanco.Monto = tboxMontoMod.Text;

                if (oBanco.ValidaExisteProyectoEnBanco())
                {
                    oMensajes.MuestraMensaje(this, "Informacion", "El proyecto que quieres agregar ya está en el banco de proyectos.", Mensajes.TipoMensaje.Informacion);
                    return;
                }

                oBanco.InsertaActualizaBancoProyecto();
                tboxNombreEmpresa_TextChanged(null, null);
                modAgregar.Hide();
                ViewState.Remove("IdBank");

                oMensajes.MuestraMensaje(this, "Correcto", "Proyecto agregado con éxito", Mensajes.TipoMensaje.Correcto);
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }
        #endregion

        #region Modal Procesar Excel
        protected void btnCancelarModPE_Click(object sender, EventArgs e)
        {
            modProcesarEx.Hide();
        }

        protected void btnAceptarModPE_Click(object sender, EventArgs e)
        {
            try
            {
                modProcesarEx.Hide();

                String sNombreArchivo = "";
                String sDestino ="BancoProyectos\\Archivos\\";

                if (fuArchivo.HasFile)
                {
                    String sCarpetaDestino = Server.MapPath(sDestino);

                    if (!(Directory.Exists(System.AppDomain.CurrentDomain.BaseDirectory + sDestino)))
                    {
                        Directory.CreateDirectory(System.AppDomain.CurrentDomain.BaseDirectory + sDestino);
                    }

                    sNombreArchivo = System.IO.Path.GetFileName(fuArchivo.PostedFile.FileName).Replace(System.IO.Path.GetExtension(fuArchivo.PostedFile.FileName), "_" + DateTime.Now.ToString("yyyy-MM-ddThh-mm-ss") + System.IO.Path.GetExtension(fuArchivo.PostedFile.FileName));

                    String SaveLocation = sCarpetaDestino + "\\" + sNombreArchivo;

                    fuArchivo.PostedFile.SaveAs(SaveLocation);
                    fuArchivo.Dispose();
                    
                    if (!ValidaArchivoEPPPlus(SaveLocation))
                    {
                        oMensajes.MuestraMensaje(this, "Error", "El archivo no tiene la estructura correcta", Mensajes.TipoMensaje.Error);
                    }
                    else
                    {
                        Boolean _bRegistroDuplicado = false;

                        ProcesaArchivoEPPPlus(SaveLocation, cboxPeriodo.SelectedValue, tboxAnio.Text, ref _bRegistroDuplicado);
                        tboxNombreEmpresa_TextChanged(null, null);

                        if (_bRegistroDuplicado)
                        {
                            oMensajes.MuestraMensaje(this, "Información", "Uno o más registros ya estaban registrados en el banco de proyectos, por lo que fueron omitidos.", Mensajes.TipoMensaje.Informacion);
                        }
                        else
                        {
                            oMensajes.MuestraMensaje(this, "Información", "Competencias cargados correctamente", Mensajes.TipoMensaje.Correcto);
                        }
                        
                    }
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }
        #endregion

        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("BancoProyectosAdministrador.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            ibtnRetroceder.ImageUrl = "~//Assets//Imagenes//Principal//FlechaRetroceder.png";
            ibtnRetroceder.Width = 40;
            ibtnRetroceder.CausesValidation = false;

            btnDescargarPlantilla.Text = oMensajes.TablaMensajes["btnDescargarPlantilla"];
            btnDescargarPlantilla.ForeColor = System.Drawing.Color.White;
            btnDescargarPlantilla.Font.Bold = true;
            btnDescargarPlantilla.CausesValidation = false;

            divTabla.Visible = false;
            divSinRegistros.Visible = true;

            lblSinRegistros.Text = oMensajes.TablaMensajes["lblSinRegistros"];

            lblNombreEmpresa.Text = oMensajes.TablaMensajes["lblNombreEmpresa"];
            lblNombreProyecto.Text = oMensajes.TablaMensajes["lblNombreProyecto"];
            lblNumeroRes.Text = oMensajes.TablaMensajes["lblNumeroRes"];
            lblTurno.Text = oMensajes.TablaMensajes["lblTurno"];
            lblCarrera.Text = oMensajes.TablaMensajes["lblCarrera"];
            lblPeriodo.Text = oMensajes.TablaMensajes["lblPeriodo"];
            lblAnio.Text = oMensajes.TablaMensajes["lblAnio"];
            lblEstatus.Text = oMensajes.TablaMensajes["lblEstatus"];

            ibtnAgregar.ImageUrl = "~//Assets//Imagenes//Principal//Agregar.png";
            ibtnAgregar.CausesValidation = false;
            ibtnAgregar.ToolTip = oMensajes.TablaMensajes["ibtnAgregar"];

            ibtnAgregarExcel.ImageUrl = "~//Assets//Imagenes//Principal//LogoExcel.png";
            ibtnAgregarExcel.CausesValidation = false;
            ibtnAgregarExcel.Width = 55;
            ibtnAgregarExcel.ToolTip = oMensajes.TablaMensajes["ibtnAgregar"];

            gvBanco.HeaderStyle.Wrap = true;
            gvBanco.RowStyle.Wrap = true;
            gvBanco.EmptyDataText = "No se encontraron resgistros";
            gvBanco.Columns[0].Visible = false;
            gvBanco.Columns[1].HeaderText = oMensajes.TablaMensajes["gvBanco_Numero"];
            gvBanco.Columns[2].HeaderText = oMensajes.TablaMensajes["gvBanco_NombreEmpresa"];
            gvBanco.Columns[3].HeaderText = oMensajes.TablaMensajes["gvBanco_Giro"];
            gvBanco.Columns[4].HeaderText = oMensajes.TablaMensajes["gvBanco_Domicilio"];
            gvBanco.Columns[5].HeaderText = oMensajes.TablaMensajes["gvBanco_NombreContacto"];
            gvBanco.Columns[6].HeaderText = oMensajes.TablaMensajes["gvBanco_AreaReceptora"];
            gvBanco.Columns[7].HeaderText = oMensajes.TablaMensajes["gvBanco_Puesto"];
            gvBanco.Columns[8].HeaderText = oMensajes.TablaMensajes["gvBanco_Email"];
            gvBanco.Columns[9].HeaderText = oMensajes.TablaMensajes["gvBanco_NombreProyecto"];
            gvBanco.Columns[10].HeaderText = oMensajes.TablaMensajes["gvBanco_Actividades"];
            gvBanco.Columns[11].HeaderText = oMensajes.TablaMensajes["gvBanco_Carrera"];
            gvBanco.Columns[12].HeaderText = oMensajes.TablaMensajes["gvBanco_Turno"];
            gvBanco.Columns[13].HeaderText = oMensajes.TablaMensajes["gvBanco_Horario"];
            gvBanco.Columns[14].HeaderText = oMensajes.TablaMensajes["gvBanco_DiasLab"];
            gvBanco.Columns[15].HeaderText = oMensajes.TablaMensajes["gvBanco_NumResidentes"];
            gvBanco.Columns[16].HeaderText = oMensajes.TablaMensajes["gvBanco_Capacitacion"];
            gvBanco.Columns[17].HeaderText = oMensajes.TablaMensajes["gvBanco_CapacitacionDet"];
            gvBanco.Columns[18].HeaderText = oMensajes.TablaMensajes["gvBanco_CapacitacionFecha"];
            gvBanco.Columns[19].HeaderText = oMensajes.TablaMensajes["gvBanco_Prestacion"];
            gvBanco.Columns[20].HeaderText = oMensajes.TablaMensajes["gvBanco_PrestacionDet"];
            gvBanco.Columns[21].HeaderText = oMensajes.TablaMensajes["gvBanco_Monto"];
            gvBanco.Columns[22].HeaderText = oMensajes.TablaMensajes["gvBanco_Estatus"];
            //gvBanco.Columns[23].HeaderText = oMensajes.TablaMensajes["gvBanco_Periodo"];
            gvBanco.Columns[23].HeaderText = oMensajes.TablaMensajes["gvBanco_Opciones"];

            for (int i = 0; i < gvBanco.Columns.Count; i++)
            {
                gvBanco.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvBanco.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }

            btnDescargar.Text = oMensajes.TablaMensajes["btnDescargar"];
            btnDescargar.ForeColor = System.Drawing.Color.White;
            btnDescargar.Font.Bold = true;
            btnDescargar.CausesValidation = false;

            #region Modal Agregar
            lblDescripcionModuloMod.Text = oMensajes.TablaMensajes["lblDescripcionModuloMod"];

            lblNoMod.Text = oMensajes.TablaMensajes["lblNoMod"];
            rfvNoMod.Text = "Campo Obligatorio";

            lblEstadoMod.Text = oMensajes.TablaMensajes["lblEstadoMod"];
            rfvEstadoMod.Text = "Campo Obligatorio";

            lblNombreEmpresaMod.Text = oMensajes.TablaMensajes["lblNombreEmpresaMod"];
            rfvNombreEmpresaMod.Text = "Campo Obligatorio";

            lblGiroMod.Text = oMensajes.TablaMensajes["lblGiroMod"];
            lblDomicilioMod.Text = oMensajes.TablaMensajes["lblDomicilioMod"];
            rfvDomicilioMod.Text = "Campo Obligatorio";

            lblNombreContactoMod.Text = oMensajes.TablaMensajes["lblNombreContactoMod"];
            rfvNombreContactoMod.Text = "Campo Obligatorio";

            lblAreaRecptoraMod.Text = oMensajes.TablaMensajes["lblAreaRecptoraMod"];
            rfvAreaRecptoraMod.Text = "Campo Obligatorio";

            lblPuestoMod.Text = oMensajes.TablaMensajes["lblPuestoMod"];
            rfvPuestoMod.Text = "Campo Obligatorio";

            lblEmailMod.Text = oMensajes.TablaMensajes["lblEmailMod"];
            rfvEmailMod.Text = "Campo Obligatorio";

            lblNombreProyectoMod.Text = oMensajes.TablaMensajes["lblNombreProyectoMod"];
            rfvNombreProyectoMod.Text = "Campo Obligatorio";

            lblActividadesMod.Text = oMensajes.TablaMensajes["lblActividadesMod"];
            rfvActividadesMod.Text = "Campo Obligatorio";

            lblCarreraMod.Text = oMensajes.TablaMensajes["lblCarreraMod"];
            rfvCarreraMod.Text = "Campo Obligatorio";

            lblTurnoMod.Text = oMensajes.TablaMensajes["lblTurnoMod"];
            rfvTurnoMod.Text = "Campo Obligatorio";

            divOtroTurno.Visible = false;
            lblOtroTurnoMod.Text = oMensajes.TablaMensajes["lblOtroTurnoMod"];
            rfvOtroTurnoMod.Text = "Campo Obligatorio";

            lblHorarioMod.Text = oMensajes.TablaMensajes["lblHorarioMod"];
            rfvHorarioMod.Text = "Campo Obligatorio";

            lblDiasLaboralesMod.Text = oMensajes.TablaMensajes["lblDiasLaboralesMod"];
            rfvDiasLaboralesMod.Text = "Campo Obligatorio";

            lblNumeroResidentesMod.Text = oMensajes.TablaMensajes["lblNumeroResidentesMod"];
            rfvNumeroResidentesMod.Text = "Campo Obligatorio";

            lblCapacitacionPrevMod.Text = oMensajes.TablaMensajes["lblCapacitacionPrevMod"];
            rfvCapacitacionPrevMod.Text = "Campo Obligatorio";

            lblEnQueConsisteMod.Text = oMensajes.TablaMensajes["lblEnQueConsisteMod"];
            lblFechaCapacitacionMod.Text = oMensajes.TablaMensajes["lblFechaCapacitacionMod"];
            lblOtorgaPrestacionMod.Text = oMensajes.TablaMensajes["lblOtorgaPrestacionMod"];
            rfvOtorgaPrestacionMod.Text = "Campo Obligatorio";

            lblCualPrestacionMod.Text = oMensajes.TablaMensajes["lblCualPrestacionMod"];
            lblMontoMod.Text = oMensajes.TablaMensajes["lblMontoMod"];

            btnCancelarMod.Text = oMensajes.TablaMensajes["btnCancelarMod"];
            btnCancelarMod.ForeColor = System.Drawing.Color.White;
            btnCancelarMod.Font.Bold = true;
            btnCancelarMod.CausesValidation = false;

            btnAceptarMod.Text = oMensajes.TablaMensajes["btnAceptarMod"];
            btnAceptarMod.ForeColor = System.Drawing.Color.White;
            btnAceptarMod.Font.Bold = true;
            #endregion

            #region Modal Procesar Excel
            lblDescripcionModuloModPE.Text = oMensajes.TablaMensajes["lblDescripcionModuloModPE"];

            fuArchivo.Attributes["onchange"] = "UploadFile(this)";
            fuArchivo.Attributes["accept"] = ".xls, .xlsx";

            btnSeleccionarArchivo.Attributes.Add("onclick", "document.getElementById('" + fuArchivo.ClientID + "').click(); return false;");
            btnSeleccionarArchivo.Text = oMensajes.TablaMensajes["btnSeleccionarArchivo"];
            btnSeleccionarArchivo.ForeColor = System.Drawing.Color.White;
            btnSeleccionarArchivo.Font.Bold = true;

            btnCancelarModPE.Text = oMensajes.TablaMensajes["btnCancelarModPE"];
            btnCancelarModPE.ForeColor = System.Drawing.Color.White;
            btnCancelarModPE.Font.Bold = true;
            btnCancelarModPE.CausesValidation = false;

            btnAceptarModPE.Text = oMensajes.TablaMensajes["btnAceptarModPE"];
            btnAceptarModPE.ForeColor = System.Drawing.Color.White;
            btnAceptarModPE.Font.Bold = true;
            btnAceptarModPE.Enabled = false;
            #endregion
        }

        private void ConfiguraGrid()
        {
            gvBanco.Columns[1].ControlStyle.Width = 50; //No.
            gvBanco.Columns[2].ControlStyle.Width = 150; //Nombre de la empresa
            gvBanco.Columns[3].ControlStyle.Width = 200; //Giro
            gvBanco.Columns[4].ControlStyle.Width = 250; //Domicilio
            gvBanco.Columns[5].ControlStyle.Width = 170; //Nombre Contacto
            gvBanco.Columns[6].ControlStyle.Width = 130; //Area receptora
            gvBanco.Columns[7].ControlStyle.Width = 100; //Puesto
            gvBanco.Columns[8].ControlStyle.Width = 150; //Email
            gvBanco.Columns[9].ControlStyle.Width = 130; //Nombre del proyecto
            gvBanco.Columns[10].ControlStyle.Width = 600; //Actividades
            gvBanco.Columns[11].ControlStyle.Width = 130; //Carrera
            gvBanco.Columns[12].ControlStyle.Width = 100; //Turno
            gvBanco.Columns[13].ControlStyle.Width = 170; //Horario
            gvBanco.Columns[14].ControlStyle.Width = 130; //Dias Laborales
            gvBanco.Columns[15].ControlStyle.Width = 130; //Numero de residentes
            gvBanco.Columns[16].ControlStyle.Width = 100; //Capacitacion
            gvBanco.Columns[17].ControlStyle.Width = 400; //Capacitacion detalle
            gvBanco.Columns[18].ControlStyle.Width = 130; //Capacitacion Fecha
            gvBanco.Columns[19].ControlStyle.Width = 130; //Prestacion
            gvBanco.Columns[20].ControlStyle.Width = 250; //Prestacon Detalle
            gvBanco.Columns[21].ControlStyle.Width = 100; //Monto
            gvBanco.Columns[22].ControlStyle.Width = 100; //Estatus
            gvBanco.Columns[23].ControlStyle.Width = 100; //Opciones
        }

        private void LlenarCombos()
        {
            cboxEstadoMod.DataTextField = "Name";
            cboxEstadoMod.DataValueField = "IdValueDetail";
            cboxEstadoMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("EstatusBancoProyectos");
            cboxEstadoMod.DataBind();
            cboxEstadoMod.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxEstadoMod.SelectedIndex = 0;

            cboxTurno.DataTextField = "Name";
            cboxTurno.DataValueField = "IdValueDetail";
            cboxTurno.DataSource = ValoresPorReferencia.RecuperaValorReferencia("TurnoBancoProyectos");
            cboxTurno.DataBind();
            cboxTurno.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxTurno.SelectedIndex = 0;

            cboxTurnoMod.DataTextField = "Name";
            cboxTurnoMod.DataValueField = "IdValueDetail";
            cboxTurnoMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("TurnoBancoProyectos");
            cboxTurnoMod.DataBind();
            cboxTurnoMod.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxTurnoMod.SelectedIndex = 0;

            cboxEstatus.DataTextField = "Name";
            cboxEstatus.DataValueField = "IdValueDetail";
            cboxEstatus.DataSource = ValoresPorReferencia.RecuperaValorReferencia("EstatusBancoProyectos");
            cboxEstatus.DataBind();
            cboxEstatus.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxEstatus.SelectedIndex = 0;

            cboxPeriodo.DataTextField = "Name";
            cboxPeriodo.DataValueField = "IdValueDetail";
            cboxPeriodo.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Periodo");
            cboxPeriodo.DataBind();
            cboxPeriodo.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxPeriodo.SelectedIndex = 0;

            cboxCarreraMod.DataTextField = "Name";
            cboxCarreraMod.DataValueField = "IdValueDetail";
            cboxCarreraMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Carreras");
            cboxCarreraMod.DataBind();
            cboxCarreraMod.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxCarreraMod.SelectedIndex = 0;

            cboxCarrera.DataTextField = "Name";
            cboxCarrera.DataValueField = "IdValueDetail";
            cboxCarrera.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Carreras");
            cboxCarrera.DataBind();
            cboxCarrera.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxCarrera.SelectedIndex = 0;
        }

        private void LimpiarFiltro()
        {
            tboxNombreEmpresa.Text = "";
            tboxNombreProyecto.Text = "";
            tboxNumeroResidentesMod.Text = "";
            cboxTurno.SelectedIndex = -1;
            cboxCarrera.SelectedIndex = -1;
            cboxEstatus.SelectedIndex = -1;
        }

        private void LlenarBancoProyectos(String _sIdPeriod, String _sYear, String _sEmpresa="", String _sProyecto="", String _sNumeroResidentes="",
            String _sTurno="", String _sCarrera="", String _sEstatus="")
        {
            DataTable dtBanco = BancoProyecto.ObtieneBancoProyectosAdministrador(_sIdPeriod, _sYear, _sEmpresa, _sProyecto, _sNumeroResidentes, _sTurno, _sCarrera, _sEstatus);
            ViewState["dtBanco"] = dtBanco;

            gvBanco.DataSource = dtBanco;
            gvBanco.DataBind();

            ViewState["dicOrdenacion"] = dicOrdenacion;
        }

        private void GeneraExcel(DataTable _dtDatos)
        {
            oMensajes.RecuperarTablaMensajes("BancoProyectosAdministrador.aspx");

            ExcelPackage ep = new ExcelPackage();
            ep.Workbook.Worksheets.Add("Hoja 1");
            ExcelWorksheet ew = ep.Workbook.Worksheets[0];

            //Titulo
            String sNombreReporte = oMensajes.TablaMensajes["lblTitulo"];
            ew.Cells["A1"].Value = sNombreReporte;
            ew.Cells["A1:W1"].Merge = true;
            ew.Cells["A1"].Style.Font.Bold = true;
            ew.Cells["A1"].Style.Font.Size = 16;
            ew.Cells["A1"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;

            //Encabezados
            Color cFondoTitulo = System.Drawing.ColorTranslator.FromHtml("#372d86");
            Color cLetraTitulo = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");

            ew.Cells["A3"].Value = oMensajes.TablaMensajes["gvBanco_Numero"];
            ew.Cells["A3"].Style.Font.Bold = true;
            ew.Cells["A3:W3"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
            ew.Cells["A3:W3"].Style.Fill.BackgroundColor.SetColor(cFondoTitulo);
            ew.Cells["A3:W3"].Style.Font.Bold = true;
            ew.Cells["A3:W3"].Style.Font.Size = 13;
            ew.Cells["A3:W3"].Style.Font.Color.SetColor(cLetraTitulo);
            ew.Cells["A3:W3"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;

            ew.Cells["B3"].Value = oMensajes.TablaMensajes["gvBanco_NombreEmpresa"];
            ew.Cells["C3"].Value = oMensajes.TablaMensajes["gvBanco_Giro"];
            ew.Cells["D3"].Value = oMensajes.TablaMensajes["gvBanco_Domicilio"];
            ew.Cells["E3"].Value = oMensajes.TablaMensajes["gvBanco_NombreContacto"];
            ew.Cells["F3"].Value = oMensajes.TablaMensajes["gvBanco_AreaReceptora"];
            ew.Cells["G3"].Value = oMensajes.TablaMensajes["gvBanco_Puesto"];
            ew.Cells["H3"].Value = oMensajes.TablaMensajes["gvBanco_Email"];
            ew.Cells["I3"].Value = oMensajes.TablaMensajes["gvBanco_NombreProyecto"];
            ew.Cells["J3"].Value = oMensajes.TablaMensajes["gvBanco_Actividades"];
            ew.Cells["K3"].Value = oMensajes.TablaMensajes["gvBanco_Carrera"];
            ew.Cells["L3"].Value = oMensajes.TablaMensajes["gvBanco_Turno"];
            ew.Cells["M3"].Value = oMensajes.TablaMensajes["gvBanco_Horario"];
            ew.Cells["N3"].Value = oMensajes.TablaMensajes["gvBanco_DiasLab"];
            ew.Cells["O3"].Value = oMensajes.TablaMensajes["gvBanco_NumResidentes"];
            ew.Cells["P3"].Value = oMensajes.TablaMensajes["gvBanco_Capacitacion"];
            ew.Cells["Q3"].Value = oMensajes.TablaMensajes["gvBanco_CapacitacionDet"];
            ew.Cells["R3"].Value = oMensajes.TablaMensajes["gvBanco_CapacitacionFecha"];
            ew.Cells["S3"].Value = oMensajes.TablaMensajes["gvBanco_Prestacion"];
            ew.Cells["T3"].Value = oMensajes.TablaMensajes["gvBanco_PrestacionDet"];
            ew.Cells["U3"].Value = oMensajes.TablaMensajes["gvBanco_Monto"];
            ew.Cells["V3"].Value = oMensajes.TablaMensajes["gvBanco_Estatus"];
            ew.Cells["W3"].Value = oMensajes.TablaMensajes["gvBanco_Periodo"];

            //Detalle            
            int i = 4;
            foreach (DataRow dr in _dtDatos.Rows)
            {
                ew.Cells["A" + i.ToString()].Value = dr["Numero"];
                ew.Cells["B" + i.ToString()].Value = dr["NombreEmpresa"];
                ew.Cells["C" + i.ToString()].Value = dr["Giro"];
                ew.Cells["D" + i.ToString()].Value = dr["Domicilio"];
                ew.Cells["E" + i.ToString()].Value = dr["NombreContacto"];
                ew.Cells["F" + i.ToString()].Value = dr["AreaReceptora"];
                ew.Cells["G" + i.ToString()].Value = dr["Puesto"];
                ew.Cells["H" + i.ToString()].Value = dr["Email"];
                ew.Cells["I" + i.ToString()].Value = dr["NombreProyecto"];
                ew.Cells["J" + i.ToString()].Value = dr["Actividades"];
                ew.Cells["K" + i.ToString()].Value = dr["Carrera"];
                ew.Cells["L" + i.ToString()].Value = dr["Turno"];
                ew.Cells["M" + i.ToString()].Value = dr["Horario"];
                ew.Cells["N" + i.ToString()].Value = dr["DiasLab"];
                ew.Cells["O" + i.ToString()].Value = dr["NumResidentes"];
                ew.Cells["P" + i.ToString()].Value = dr["Capacitacion"];
                ew.Cells["Q" + i.ToString()].Value = dr["CapacitacionDet"];
                ew.Cells["R" + i.ToString()].Value = dr["CapacitacionFecha"];
                ew.Cells["S" + i.ToString()].Value = dr["Prestacion"];
                ew.Cells["T" + i.ToString()].Value = dr["PrestacionDet"];
                ew.Cells["U" + i.ToString()].Value = dr["Monto"];
                ew.Cells["V" + i.ToString()].Value = dr["Estatus"];
                ew.Cells["W" + i.ToString()].Value = dr["Periodo"];

                i++;
            }
            ew.Cells[ew.Dimension.Address].AutoFitColumns();

            String sNombreArchivo = sNombreReporte + "(" + DateTime.Now.ToString("yyyy-MM-ddThh-mm-ss") + ").xlsx";
            String sCarpeta = System.AppDomain.CurrentDomain.BaseDirectory + "\\Reportes";
            String sPathReporte = sCarpeta + "\\" + sNombreArchivo;

            if (!Directory.Exists(sCarpeta))
            {
                Directory.CreateDirectory(sCarpeta);
            }

            ep.SaveAs(new FileInfo(sPathReporte));
            ep.Dispose();

            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AppendHeader("Content-Disposition", string.Format("attachment; filename={0}", sNombreArchivo));
            Response.TransmitFile(Server.MapPath("~/Reportes/" + sNombreArchivo));
            Response.End();
        }

        private void LimpiarModal()
        {
            tboxNoMod.Text = "";
            cboxEstadoMod.SelectedIndex = -1;
            tboxNombreEmpresaMod.Text = "";
            tboxGiroMod.Text = "";
            tboxDomicilioMod.Text = "";
            tboxNombreContactoMod.Text = "";
            tboxAreaRecptoraMod.Text = "";
            tboxPuestoMod.Text = "";
            tboxEmailMod.Text = "";
            tboxNombreProyectoMod.Text = "";
            tboxActividadesMod.Text = "";
            cboxCarreraMod.SelectedIndex = -1;
            cboxTurnoMod.SelectedIndex = -1;
            divOtroTurno.Visible = false;
            rfvOtroTurnoMod.Enabled = false;
            tboxOtroTurnoMod.Text = "";
            tboxHorarioMod.Text = "";
            tboxDiasLaboralesMod.Text = "";
            tboxNumeroResidentesMod.Text = "";
            tboxCapacitacionPrevMod.Text = "";
            tboxEnQueConsisteMod.Text = "";
            tboxFechaCapacitacionMod.Text = "";
            tboxOtorgaPrestacionMod.Text = "";
            tboxCualPrestacionMod.Text = "";
            tboxMontoMod.Text = "";
        }
        
        public static Boolean ValidaArchivoEPPPlus(String _sPathArchivo)
        {
            FileInfo existingFile = new FileInfo(_sPathArchivo);
            using (ExcelPackage package = new ExcelPackage(existingFile))
            {
                Boolean bExisteHoja = false;
                foreach (ExcelWorksheet sheet in package.Workbook.Worksheets)
                {
                    String sNombreHoja = QuitarAcentos(sheet.Name.ToUpper());
                    if (sNombreHoja == "SISTEMAS" || sNombreHoja == "ELECTROMECANICA" || sNombreHoja == "CIVIL" ||
                        sNombreHoja == "GESTION EMPRESARIAL" || sNombreHoja == "INDUSTRIAL" || sNombreHoja == "ELECTRONICA" ||
                        sNombreHoja == "GASTRONOMIA")
                    {
                        bExisteHoja = true;

                        if (QuitarAcentos(((String)sheet.Cells[3, 1].Value).ToUpper()).Replace(" ", "") != "NOMBREDELAEMPRESA")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 2].Value).ToUpper()).Replace(" ", "") != "GIRO")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 3].Value).ToUpper()).Replace(" ", "") != "DOMICILIO")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 4].Value).ToUpper()).Replace(" ", "") != "NOMBREDECONTACTO")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 5].Value).ToUpper()).Replace(" ", "") != "AREARECEPTORA")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 6].Value).ToUpper()).Replace(" ", "") != "PUESTO")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 7].Value).ToUpper()).Replace(" ", "") != "CORREOELECTRONICO")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 8].Value).ToUpper()).Replace(" ", "") != "NOMBREDELPROYECTO")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 9].Value).ToUpper()).Replace(" ", "") != "ACTIVIDADESAREALIZAR")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 10].Value).ToUpper()).Replace(" ", "") != "TURNO")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 11].Value).ToUpper()).Replace(" ", "") != "HORARIO")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 12].Value).ToUpper()).Replace(" ", "") != "DIASLABORALES")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 13].Value).ToUpper()).Replace(" ", "") != "NUMERODERESIDENTES")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 14].Value).ToUpper()).Replace(" ", "") != "CAPACITACIONPREVIA")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 15].Value).ToUpper()).Replace(" ", "") != "ENQUECONSISTE")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 16].Value).ToUpper()).Replace(" ", "") != "FECHADECAPACITACION")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 17].Value).ToUpper()).Replace(" ", "") != "OTORGAALGUNAPRESTACION")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 18].Value).ToUpper()).Replace(" ", "") != "CUAL?")
                        {
                            package.Dispose();
                            return false;
                        }

                        if (QuitarAcentos(((String)sheet.Cells[3, 19].Value).ToUpper()).Replace(" ", "") != "MONTO")
                        {
                            package.Dispose();
                            return false;
                        }
                    }
                }

                if (!bExisteHoja)
                {
                    package.Dispose();
                    return false;
                }

                package.Dispose();
                return true;
            }
        }

        public static void ProcesaArchivoEPPPlus(String _sPathArchivo, String _sIdPeriod, String _sYear, ref Boolean _bRegistroDuplicado)
        {
            StringBuilder sConsulta = new StringBuilder();

            FileInfo existingFile = new FileInfo(_sPathArchivo);
            using (ExcelPackage package = new ExcelPackage(existingFile))
            {
                Boolean bExisteHoja = false;
                foreach (ExcelWorksheet sheet in package.Workbook.Worksheets)
                {
                    String sNombreHoja = QuitarAcentos(sheet.Name.ToUpper());
                    if (sNombreHoja == "SISTEMAS" || sNombreHoja == "ELECTROMECANICA" || sNombreHoja == "CIVIL" ||
                        sNombreHoja == "GESTION EMPRESARIAL" || sNombreHoja == "INDUSTRIAL" || sNombreHoja == "ELECTRONICA" ||
                        sNombreHoja == "GASTRONOMIA")
                    {
                        bExisteHoja = true;
                        int colCount = sheet.Dimension.End.Column;
                        int rowCount = sheet.Dimension.End.Row;

                        for (int row = 4; row <= rowCount; row++)
                        {
                            String sNombreEmpresa = sheet.Cells[row, 1].Value?.ToString().Trim() ?? String.Empty;
                            String sGiro = sheet.Cells[row, 2].Value?.ToString().Trim() ?? String.Empty;
                            String sDomicilio = sheet.Cells[row, 3].Value?.ToString().Trim() ?? String.Empty;
                            String sNombreContacto = sheet.Cells[row, 4].Value?.ToString().Trim() ?? String.Empty;
                            String sAreaReceptora = sheet.Cells[row, 5].Value?.ToString().Trim() ?? String.Empty;
                            String sPuesto = sheet.Cells[row, 6].Value?.ToString().Trim() ?? String.Empty;
                            String sCorreoElectronico = sheet.Cells[row, 7].Value?.ToString().Trim() ?? String.Empty;
                            String sNombreProyecto = sheet.Cells[row, 8].Value?.ToString().Trim() ?? String.Empty;
                            String sActividades = sheet.Cells[row, 9].Value?.ToString().Trim() ?? String.Empty;
                            String sTurno = sheet.Cells[row, 10].Value?.ToString().Trim() ?? String.Empty;
                            String sHorario = sheet.Cells[row, 11].Value?.ToString().Trim() ?? String.Empty;
                            String sDiasLaborales = sheet.Cells[row, 12].Value?.ToString().Trim() ?? String.Empty;
                            String sNumeroResidentes = sheet.Cells[row, 13].Value?.ToString().Trim() ?? String.Empty;
                            String sCapacitacionPrevia = sheet.Cells[row, 14].Value?.ToString().Trim() ?? String.Empty;
                            String sCapacitacionDetalle = sheet.Cells[row, 15].Value?.ToString().Trim() ?? String.Empty;
                            String sFechaCapacitacion = sheet.Cells[row, 16].Value?.ToString().Trim() ?? String.Empty;
                            String sPrestacion = sheet.Cells[row, 17].Value?.ToString().Trim() ?? String.Empty;
                            String sPrestacionDetalle = sheet.Cells[row, 18].Value?.ToString().Trim() ?? String.Empty;
                            String sMonto = sheet.Cells[row, 19].Value?.ToString().Trim() ?? String.Empty;
                            
                            if (sNombreEmpresa != null)
                            {
                                BancoProyecto oBanco = new BancoProyecto();

                                switch(sNombreHoja)
                                {
                                    case "SISTEMAS":
                                        oBanco.IdCarrera = Enums.Carreras.SistemasComputacionales.ToString();
                                        break;
                                    case "CIVIL":
                                        oBanco.IdCarrera = Enums.Carreras.Civil.ToString();
                                        break;
                                    case "ELECTROMECANICA":
                                        oBanco.IdCarrera = Enums.Carreras.Electromecanica.ToString();
                                        break;
                                    case "GESTION EMPRESARIAL":
                                        oBanco.IdCarrera = Enums.Carreras.GestionEmpresarial.ToString();
                                        break;
                                    case "INDUSTRIAL":
                                        oBanco.IdCarrera = Enums.Carreras.Industrial.ToString();
                                        break;
                                    case "GASTRONOMIA":
                                        oBanco.IdCarrera = Enums.Carreras.Gastronomia.ToString();
                                        break;
                                    case "ELECTRONICA":
                                        oBanco.IdCarrera = Enums.Carreras.Electronica.ToString();
                                        break;
                                }

                                oBanco.Numero = BancoProyecto.ObtieneUltimoNumero(_sIdPeriod, _sYear, oBanco.IdCarrera).ToString();
                                oBanco.IdTypeState = "1";
                                oBanco.IdPeriod = _sIdPeriod;
                                oBanco.Anio = _sYear;
                                oBanco.NombreEmpresa = sNombreEmpresa;
                                oBanco.Giro = sGiro;
                                oBanco.Domicilio = sDomicilio;
                                oBanco.NombreContacto = sNombreContacto;
                                oBanco.AreaReceptora = sAreaReceptora;
                                oBanco.Puesto = sPuesto;
                                oBanco.Email = sCorreoElectronico;
                                oBanco.NombreProyecto = sNombreProyecto;
                                oBanco.Actividades = sActividades;
                                
                                switch (QuitarAcentos(sTurno).ToUpper().Replace(" ", ""))
                                {
                                    case "MATUTINO":
                                        oBanco.Turno = "1";
                                        oBanco.TurnoOtro = "";
                                        break;
                                    case "VESPERTINO":
                                        oBanco.Turno = "2";
                                        oBanco.TurnoOtro = "";
                                        break;
                                    case "HOMEOFFICE":
                                        oBanco.Turno = "3";
                                        oBanco.TurnoOtro = "";
                                        break;
                                    default:
                                        oBanco.Turno = "4";
                                        oBanco.TurnoOtro = sTurno;
                                        break;
                                }
                                oBanco.Horario = sHorario;
                                oBanco.DiasLaborales = sDiasLaborales;
                                oBanco.NumeroResidentes = sNumeroResidentes;
                                oBanco.Capacitacion = sCapacitacionPrevia;
                                oBanco.CapacitacionDet = sCapacitacionDetalle;
                                oBanco.CapacitacionFecha = sFechaCapacitacion;
                                oBanco.Prestacion = sPrestacion;
                                oBanco.PrestacionDet = sPrestacionDetalle;
                                oBanco.Monto = sMonto;

                                if (!oBanco.ValidaExisteProyectoEnBanco())
                                {
                                    oBanco.InsertaActualizaBancoProyecto();
                                }
                                else
                                {
                                    _bRegistroDuplicado = true;
                                }
                            }
                        }
                    }
                }

                package.Dispose();
            }
        }

        public static string QuitarAcentos(string input)
        {
            string normalizedString = input.Normalize(NormalizationForm.FormD);
            StringBuilder stringBuilder = new StringBuilder();

            foreach (var c in normalizedString)
            {
                UnicodeCategory unicodeCategory = CharUnicodeInfo.GetUnicodeCategory(c);
                if (unicodeCategory != UnicodeCategory.NonSpacingMark)
                {
                    stringBuilder.Append(c);
                }
            }

            return stringBuilder.ToString().Normalize(NormalizationForm.FormC);
        }

        [System.Web.Services.WebMethod]
        public static String EliminarProyecto(String parameter1)
        {
            String _sIdBank = parameter1;

            BancoProyecto.EliminarBancoProyectos(_sIdBank);

            return "BancoProyectosAdministrador.aspx";
        }
        #endregion
    }
}