using GestorResidencias.Clases;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorResidencias
{
    public partial class EmpresasAdministrador : System.Web.UI.Page
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
                        LlenarEmpresas();
                        LlenarCombos();
                        LlenarUniversidad();
                    }
                    ConfiguraGrid();

                    if (Empresa.ExisteUniversidad())
                    {
                        ibtnAgregarUniversidad.Visible = false;
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

        protected void tboxNombreEmpresa_TextChanged(object sender, EventArgs e)
        {
            LlenarEmpresas(tboxNombreEmpresa.Text, tboxDomicilio.Text, cboxRamo.SelectedValue, cboxSector.SelectedValue, cboxEstatus.SelectedValue);
        }

        protected void ibtnAgregar_Click(object sender, ImageClickEventArgs e)
        {
            LimpiarModalAgregar();
            DeshabilitarCamposObligatorios();
            modAgregar.Show();
        }

        protected void gvEmpresas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dicOrdenacion = new Dictionary<string, string>((Dictionary<string, string>)ViewState["dicOrdenacion"]);

            DataView m_DataView = new DataView((DataTable)ViewState["dtEmpresas"]);
            if (ViewState["ultOrdenacion"] != null)
            {
                m_DataView.Sort = ViewState["ultOrdenacion"].ToString() + " " + dicOrdenacion[ViewState["ultOrdenacion"].ToString()];
            }

            gvEmpresas.DataSource = m_DataView;
            gvEmpresas.PageIndex = e.NewPageIndex;
            gvEmpresas.DataBind();
        }

        protected void gvEmpresas_Sorting(object sender, GridViewSortEventArgs e)
        {
            gvEmpresas.PageIndex = 0;

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

            if (ViewState["dtEmpresas"] != null)
            {
                DataView m_DataView = new DataView((DataTable)ViewState["dtEmpresas"]);
                m_DataView.Sort = e.SortExpression + " " + dicOrdenacion[e.SortExpression];

                gvEmpresas.DataSource = m_DataView;
                gvEmpresas.DataBind();
            }
        }

        protected void gvEmpresas_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[22].ColumnSpan = 3;
                e.Row.Cells.RemoveAt(23);
                e.Row.Cells.RemoveAt(23);
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btnEditar = (Button)e.Row.Cells[22].Controls[0];
                btnEditar.ID = "btnEditar";
                btnEditar.CommandName = "btnEditar";
                btnEditar.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnEditar.Text = "Editar";
                btnEditar.ForeColor = System.Drawing.Color.White;
                btnEditar.Font.Bold = true;

                Button btnVer = (Button)e.Row.Cells[23].Controls[0];
                btnVer.ID = "btnVer";
                btnVer.CommandName = "btnVer";
                btnVer.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnVer.Text = "Ver";
                btnVer.ForeColor = System.Drawing.Color.White;
                btnVer.Font.Bold = true;

                Button btnEliminar = (Button)e.Row.Cells[24].Controls[0];
                btnEliminar.ID = "btnEliminar";
                btnEliminar.CommandName = "btnEliminar";
                btnEliminar.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnEliminar.Text = "Eliminar";
                btnEliminar.ForeColor = System.Drawing.Color.White;
                btnEliminar.Font.Bold = true;
            }
        }

        protected void gvEmpresas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "btnEditar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvEmpresas.Rows[index];

                    String _sIdCompany = gvEmpresas.DataKeys[index].Values[0].ToString();
                    ViewState["IdCompany"] = _sIdCompany;

                    ConfiguraEdicionModalAgregar(_sIdCompany);
                    modAgregar.Show();
                    DeshabilitarCamposObligatorios();
                }
                else if (e.CommandName == "btnVer")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvEmpresas.Rows[index];

                    String _sIdCompany = gvEmpresas.DataKeys[index].Values[0].ToString();

                    ConfiguraEdicionModalAgregar(_sIdCompany);
                    DeshabilitarComponentesModalAgregar();
                    modAgregar.Show();
                }
                else if (e.CommandName == "btnEliminar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvEmpresas.Rows[index];

                    String _sIdCompany = gvEmpresas.DataKeys[index].Values[0].ToString();

                    oMensajes.MuestraMensajeConRespuesta(this, "Información", "Seguro que deseas eliminar esta empresa?, los cambios realizados no se pueden revertir.", Mensajes.TipoMensaje.Precaucion, "EliminarEmpresa", _sIdCompany);

                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        protected void ibtnAgregarUniversidad_Click(object sender, ImageClickEventArgs e)
        {
            if (Empresa.ExisteUniversidad())
            {
                ibtnAgregarUniversidad.Visible = false;
                return;
            }

            ViewState["IdCompany"] = "3861cc5a-5d36-4391-b904-855bb1d15242";
            LimpiarModalAgregar();
            DeshabilitarCamposObligatorios();
            modAgregar.Show();
        }

        protected void gvUniversidad_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[22].ColumnSpan = 2;
                e.Row.Cells.RemoveAt(23);
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btnEditar = (Button)e.Row.Cells[22].Controls[0];
                btnEditar.ID = "btnEditar";
                btnEditar.CommandName = "btnEditar";
                btnEditar.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnEditar.Text = "Editar";
                btnEditar.ForeColor = System.Drawing.Color.White;
                btnEditar.Font.Bold = true;

                Button btnVer = (Button)e.Row.Cells[23].Controls[0];
                btnVer.ID = "btnVer";
                btnVer.CommandName = "btnVer";
                btnVer.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnVer.Text = "Ver";
                btnVer.ForeColor = System.Drawing.Color.White;
                btnVer.Font.Bold = true;
            }
        }

        protected void gvUniversidad_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "btnEditar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvUniversidad.Rows[index];

                    String _sIdCompany = gvUniversidad.DataKeys[index].Values[0].ToString();
                    ViewState["IdCompany"] = _sIdCompany;

                    ConfiguraEdicionModalAgregar(_sIdCompany);
                    modAgregar.Show();

                    DeshabilitarCamposObligatorios();
                }
                else if (e.CommandName == "btnVer")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvUniversidad.Rows[index];

                    String _sIdCompany = gvUniversidad.DataKeys[index].Values[0].ToString();

                    ConfiguraEdicionModalAgregar(_sIdCompany);
                    DeshabilitarComponentesModalAgregar();
                    modAgregar.Show();
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }
        }

        protected void btnDescargar_Click(object sender, EventArgs e)
        {
            DataTable dtDatos = (DataTable)ViewState["dtEmpresas"];
            DataTable dtDatosUni = (DataTable)ViewState["dtUniversidad"];

            if (dtDatos.Rows.Count > 0)
            {
                GeneraExcel(dtDatos, dtDatosUni);
            }
            else
            {
                oMensajes.MuestraMensaje(this, "Info", "No exite información para descargar", Mensajes.TipoMensaje.Informacion);
            }
        }

        #region Modal Agregar Empresas
        protected void btnCancelarMod_Click(object sender, EventArgs e)
        {
            HabilitarComponentesModalAgregar();
            ViewState.Remove("IdCompany");
            LimpiarModalAgregar();
            modAgregar.Hide();
        }

        protected void btnAceptarMod_Click(object sender, EventArgs e)
        {
            try
            {
                Empresa oEmpresa;
                if (ViewState["IdCompany"] != null)
                {
                    oEmpresa = new Empresa(ViewState["IdCompany"].ToString());
                }
                else
                {
                    oEmpresa = new Empresa();
                }
                

                oEmpresa.Nombre = tboxNombreMod.Text;
                oEmpresa.IdTypeState = cboxEstatusMod.SelectedValue;
                oEmpresa.IdSector = cboxSectorMod.SelectedValue;
                oEmpresa.IdRamo = cboxRamoMod.SelectedValue;
                oEmpresa.RFC = tboxRFCMod.Text;
                oEmpresa.TelefonoOficina = tboxTelefonoOficinaMod.Text;
                oEmpresa.Fax = tboxFaxMod.Text;
                oEmpresa.IdTamanioCompania = cboxTamanioEmpMod.SelectedValue;
                oEmpresa.NombreDuenio = tboxNombreTitularMod.Text;
                oEmpresa.MisionEmpresa = tboxMisionMod.Text;
                oEmpresa.Giro = tboxGiroMod.Text;
                oEmpresa.NombreCalle = tboxCalleMod.Text;
                oEmpresa.NumeriorExterior = tboxNumExteriorMod.Text;
                oEmpresa.NumeroInterior = tboxNumInteriorMod.Text;
                oEmpresa.Colonia = tboxColoniaMod.Text;
                oEmpresa.Municipio = tboxMunicipioMod.Text;
                oEmpresa.NumeroPostal = tboxCPMod.Text;
                oEmpresa.Ciudad = tboxCiudadMod.Text;
                oEmpresa.Estado = tboxEstadoMod.Text;

                oEmpresa.InsertaActualizaEmpresa();

                LlenarEmpresas();
                LlenarUniversidad();
                modAgregar.Hide();
                HabilitarComponentesModalAgregar();
                ViewState.Remove("IdCompany");
                LimpiarModalAgregar();
                oMensajes.MuestraMensaje(this, "Correcto", "Empresa agregada con exito", Mensajes.TipoMensaje.Correcto);

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
            oMensajes.RecuperarTablaMensajes("EmpresasAdministrador.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            ibtnRetroceder.ImageUrl = "~//Assets//Imagenes//Principal//FlechaRetroceder.png";
            ibtnRetroceder.Width = 40;
            ibtnRetroceder.CausesValidation = false;

            lblNombreEmpresa.Text = oMensajes.TablaMensajes["lblNombreEmpresa"];
            lblDomicilio.Text = oMensajes.TablaMensajes["gvEmpresas_Domicilio"];
            lblSector.Text = oMensajes.TablaMensajes["lblSector"];
            lblRamo.Text = oMensajes.TablaMensajes["lblRamo"];
            lblEstatus.Text = oMensajes.TablaMensajes["lblEstatus"];
            
            btnBuscar.Text = oMensajes.TablaMensajes["btnBuscar"];
            btnBuscar.BackColor = System.Drawing.ColorTranslator.FromHtml("#372d86");
            btnBuscar.ForeColor = System.Drawing.Color.White;
            btnBuscar.Font.Bold = true;
            btnBuscar.CausesValidation = false;
            
            ibtnAgregar.ImageUrl = "~//Assets//Imagenes//Principal//Agregar.png";
            ibtnAgregar.CausesValidation = false;
            ibtnAgregar.ToolTip = oMensajes.TablaMensajes["ibtnAgregar"];

            gvEmpresas.HeaderStyle.Wrap = true;
            gvEmpresas.RowStyle.Wrap = true;
            gvEmpresas.EmptyDataText = "No se encontraron resgistros";
            gvEmpresas.Columns[0].Visible = false; //IdCompany
            gvEmpresas.Columns[1].Visible = false; //IdTypeState
            gvEmpresas.Columns[2].Visible = false; //Fax
            gvEmpresas.Columns[3].Visible = false; //TamanioEmpresa
            gvEmpresas.Columns[4].Visible = false; //Mision
            gvEmpresas.Columns[5].Visible = false; //Giro
            gvEmpresas.Columns[6].Visible = false; //Calle
            gvEmpresas.Columns[7].Visible = false; //NumeroExterior
            gvEmpresas.Columns[8].Visible = false; //NumeroInterior
            gvEmpresas.Columns[9].Visible = false; //Colonia
            gvEmpresas.Columns[10].Visible = false; //Municipio
            gvEmpresas.Columns[11].Visible = false; //NumeroPostal
            gvEmpresas.Columns[12].Visible = false; //Ciudad
            gvEmpresas.Columns[13].Visible = false; //Estado
            gvEmpresas.Columns[14].HeaderText = oMensajes.TablaMensajes["gvEmpresas_Nombre"];
            gvEmpresas.Columns[15].HeaderText = oMensajes.TablaMensajes["gvEmpresas_Domicilio"];
            gvEmpresas.Columns[16].HeaderText = oMensajes.TablaMensajes["gvEmpresas_TelefonoOficina"];
            gvEmpresas.Columns[17].HeaderText = oMensajes.TablaMensajes["gvEmpresas_NombreDuenio"];
            gvEmpresas.Columns[18].HeaderText = oMensajes.TablaMensajes["gvEmpresas_Sector"];
            gvEmpresas.Columns[19].HeaderText = oMensajes.TablaMensajes["gvEmpresas_Ramo"];
            gvEmpresas.Columns[20].HeaderText = oMensajes.TablaMensajes["gvEmpresas_RFC"];
            gvEmpresas.Columns[21].HeaderText = oMensajes.TablaMensajes["gvEmpresas_Estatus"];
            gvEmpresas.Columns[22].HeaderText = oMensajes.TablaMensajes["gvEmpresas_Opciones"];

            for (int i = 0; i < gvEmpresas.Columns.Count; i++)
            {
                gvEmpresas.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvEmpresas.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }

            ibtnAgregarUniversidad.ImageUrl = "~//Assets//Imagenes//Principal//Agregar.png";
            ibtnAgregarUniversidad.CausesValidation = false;
            ibtnAgregarUniversidad.ToolTip = oMensajes.TablaMensajes["ibtnAgregar"];

            gvUniversidad.HeaderStyle.Wrap = true;
            gvUniversidad.RowStyle.Wrap = true;
            gvUniversidad.EmptyDataText = "No se encontraron resgistros";
            gvUniversidad.Columns[0].Visible = false; //IdCompany
            gvUniversidad.Columns[1].Visible = false; //IdTypeState
            gvUniversidad.Columns[2].Visible = false; //Fax
            gvUniversidad.Columns[3].Visible = false; //TamanioEmpresa
            gvUniversidad.Columns[4].Visible = false; //Mision
            gvUniversidad.Columns[5].Visible = false; //Giro
            gvUniversidad.Columns[6].Visible = false; //Calle
            gvUniversidad.Columns[7].Visible = false; //NumeroExterior
            gvUniversidad.Columns[8].Visible = false; //NumeroInterior
            gvUniversidad.Columns[9].Visible = false; //Colonia
            gvUniversidad.Columns[10].Visible = false; //Municipio
            gvUniversidad.Columns[11].Visible = false; //NumeroPostal
            gvUniversidad.Columns[12].Visible = false; //Ciudad
            gvUniversidad.Columns[13].Visible = false; //Estado
            gvUniversidad.Columns[14].HeaderText = oMensajes.TablaMensajes["gvEmpresas_Nombre"];
            gvUniversidad.Columns[15].HeaderText = oMensajes.TablaMensajes["gvEmpresas_Domicilio"];
            gvUniversidad.Columns[16].HeaderText = oMensajes.TablaMensajes["gvEmpresas_TelefonoOficina"];
            gvUniversidad.Columns[17].HeaderText = oMensajes.TablaMensajes["gvEmpresas_NombreDuenio"];
            gvUniversidad.Columns[18].HeaderText = oMensajes.TablaMensajes["gvEmpresas_Sector"];
            gvUniversidad.Columns[19].HeaderText = oMensajes.TablaMensajes["gvEmpresas_Ramo"];
            gvUniversidad.Columns[20].HeaderText = oMensajes.TablaMensajes["gvEmpresas_RFC"];
            gvUniversidad.Columns[21].HeaderText = oMensajes.TablaMensajes["gvEmpresas_Estatus"];
            gvUniversidad.Columns[22].HeaderText = oMensajes.TablaMensajes["gvEmpresas_Opciones"];

            for (int i = 0; i < gvUniversidad.Columns.Count; i++)
            {
                gvUniversidad.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvUniversidad.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }

            btnDescargar.Text = oMensajes.TablaMensajes["btnDescargar"];
            btnDescargar.ForeColor = System.Drawing.Color.White;
            btnDescargar.Font.Bold = true;
            btnDescargar.CausesValidation = false;

            #region Modal Agregar Empresa
            lblDescripcionModuloMod.Text = oMensajes.TablaMensajes["lblDescripcionModuloMod"];

            lblNombreMod.Text = oMensajes.TablaMensajes["lblNombreMod"];
            rfvNombreMod.Text = "Campo Obligatorio";

            lblEstatusMod.Text = oMensajes.TablaMensajes["lblEstatusMod"];
            rfvEstatusMod.Text = "Campo Obligatorio";

            lblSectorMod.Text = oMensajes.TablaMensajes["lblSectorMod"];
            rfvSectorMod.Text = "Campo Obligatorio";

            lblRamoMod.Text = oMensajes.TablaMensajes["lblRamoMod"];
            rfvRamoMod.Text = "Campo Obligatorio";

            lblRFCMod.Text = oMensajes.TablaMensajes["lblRFCMod"];
            lblTelefonoOficinaMod.Text = oMensajes.TablaMensajes["lblTelefonoOficinaMod"];
            rfvTelefonoOficinaMod.Text = "Campo Obligatorio";

            lblFaxMod.Text = oMensajes.TablaMensajes["lblFaxMod"];
            rfvFaxMod.Text = "Campo Obligatorio";

            lblTamanioEmpMod.Text = oMensajes.TablaMensajes["lblTamanioEmpMod"];
            rfvTamanioEmpMod.Text = "Campo Obligatorio";

            lblNombreTitularMod.Text = oMensajes.TablaMensajes["lblNombreTitularMod"];
            rfvNombreTitularMod.Text = "Campo Obligatorio";

            lblMisionMod.Text = oMensajes.TablaMensajes["lblMisionMod"];
            rfvMisionMod.Text = "Campo Obligatorio";

            lblGiroMod.Text = oMensajes.TablaMensajes["lblGiroMod"];
            rfvGiroMod.Text = "Campo Obligatorio";

            lblDomicilioMod.Text = oMensajes.TablaMensajes["lblDomicilioMod"];
            lblCalleMod.Text = oMensajes.TablaMensajes["lblCalleMod"];
            rfvCalleMod.Text = "Campo Obligatorio";

            lblNumExteriorMod.Text = oMensajes.TablaMensajes["lblNumExteriorMod"];
            rfvNumExteriorMod.Text = "Campo Obligatorio";

            lblNumInteriorMod.Text = oMensajes.TablaMensajes["lblNumInteriorMod"];
            rfvNumInteriorMod.Text = "Campo Obligatorio";

            lblColoniaMod.Text = oMensajes.TablaMensajes["lblColoniaMod"];
            rfvColoniaMod.Text = "Campo Obligatorio";

            lblMunicipioMod.Text = oMensajes.TablaMensajes["lblMunicipioMod"];
            rfvMunicipioMod.Text = "Campo Obligatorio";

            lblCPMod.Text = oMensajes.TablaMensajes["lblCPMod"];
            rfvCPMod.Text = "Campo Obligatorio";

            lblCiudadMod.Text = oMensajes.TablaMensajes["lblCiudadMod"];
            rfvCiudadMod.Text = "Campo Obligatorio";

            lblEstadoMod.Text = oMensajes.TablaMensajes["lblEstadoMod"];
            rfvEstadoMod.Text = "Campo Obligatorio";

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
            gvEmpresas.Columns[14].ControlStyle.Width = 250; //Nombre
            gvEmpresas.Columns[15].ControlStyle.Width = 300; //Domicilio
            gvEmpresas.Columns[16].ControlStyle.Width = 150; //TelefonoOficina
            gvEmpresas.Columns[17].ControlStyle.Width = 250; //NombreDuenio
            gvEmpresas.Columns[18].ControlStyle.Width = 130; //Sector
            gvEmpresas.Columns[19].ControlStyle.Width = 130; //Ramo
            gvEmpresas.Columns[20].ControlStyle.Width = 130; //RFC
            gvEmpresas.Columns[21].ControlStyle.Width = 170; //Estatus

            gvUniversidad.Columns[14].ControlStyle.Width = 250; //Nombre
            gvUniversidad.Columns[15].ControlStyle.Width = 300; //Domicilio
            gvUniversidad.Columns[16].ControlStyle.Width = 150; //TelefonoOficina
            gvUniversidad.Columns[17].ControlStyle.Width = 250; //NombreDuenio
            gvUniversidad.Columns[18].ControlStyle.Width = 130; //Sector
            gvUniversidad.Columns[19].ControlStyle.Width = 130; //Ramo
            gvUniversidad.Columns[20].ControlStyle.Width = 130; //RFC
            gvUniversidad.Columns[21].ControlStyle.Width = 170; //Estatus
        }

        private void LlenarCombos()
        {
            cboxSector.DataTextField = "Name";
            cboxSector.DataValueField = "IdValueDetail";
            cboxSector.DataSource = ValoresPorReferencia.RecuperaValorReferencia("SectorProyecto");
            cboxSector.DataBind();
            cboxSector.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxSector.SelectedIndex = 0;

            cboxRamo.DataTextField = "Name";
            cboxRamo.DataValueField = "IdValueDetail";
            cboxRamo.DataSource = ValoresPorReferencia.RecuperaValorReferencia("RamoProyecto");
            cboxRamo.DataBind();
            cboxRamo.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxRamo.SelectedIndex = 0;

            cboxEstatus.DataTextField = "Name";
            cboxEstatus.DataValueField = "IdValueDetail";
            cboxEstatus.DataSource = ValoresPorReferencia.RecuperaValorReferencia("EstatusCompania");
            cboxEstatus.DataBind();
            cboxEstatus.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxEstatus.SelectedIndex = 0;

            cboxEstatusMod.DataTextField = "Name";
            cboxEstatusMod.DataValueField = "IdValueDetail";
            cboxEstatusMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("EstatusCompania");
            cboxEstatusMod.DataBind();
            cboxEstatusMod.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxEstatusMod.SelectedIndex = 0;

            cboxSectorMod.DataTextField = "Name";
            cboxSectorMod.DataValueField = "IdValueDetail";
            cboxSectorMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("SectorProyecto");
            cboxSectorMod.DataBind();
            cboxSectorMod.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxSectorMod.SelectedIndex = 0;

            cboxRamoMod.DataTextField = "Name";
            cboxRamoMod.DataValueField = "IdValueDetail";
            cboxRamoMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("RamoProyecto");
            cboxRamoMod.DataBind();
            cboxRamoMod.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxRamoMod.SelectedIndex = 0;

            cboxTamanioEmpMod.DataTextField = "Name";
            cboxTamanioEmpMod.DataValueField = "IdValueDetail";
            cboxTamanioEmpMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("TamanoEmpresa");
            cboxTamanioEmpMod.DataBind();
            cboxTamanioEmpMod.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxTamanioEmpMod.SelectedIndex = 0;
        }

        private void LlenarEmpresas(String _sNombreEmpresa = "", String _sDomicile = "", String _sIdBranch = "", String _sIdSector = "", String _sIdTypeState = "")
        {
            DataTable dtEmpresas = Empresa.ObtieneEmpresasAdministrador(_sNombreEmpresa, _sDomicile, _sIdBranch, _sIdSector, _sIdTypeState);
            ViewState["dtEmpresas"] = dtEmpresas;

            gvEmpresas.DataSource = dtEmpresas;
            gvEmpresas.DataBind();

            ViewState["dicOrdenacion"] = dicOrdenacion;
        }

        private void LlenarUniversidad()
        {
            DataTable dtUniversidad = Empresa.ObtieneEmpresasUniversidadAdministrador();
            ViewState["dtUniversidad"] = dtUniversidad;

            gvUniversidad.DataSource = dtUniversidad;
            gvUniversidad.DataBind();
        }

        private void DeshabilitarCamposObligatorios()
        {
            rfvFaxMod.Enabled = false;
            rfvGiroMod.Enabled = false;
            rfvNumInteriorMod.Enabled = false;
        }

        private void GeneraExcel(DataTable _dtDatos, DataTable _dtDatosUni)
        {
            oMensajes.RecuperarTablaMensajes("EmpresasAdministrador.aspx");

            ExcelPackage ep = new ExcelPackage();
            ep.Workbook.Worksheets.Add("Hoja 1");
            ExcelWorksheet ew = ep.Workbook.Worksheets[0];

            //Titulo
            String sNombreReporte = oMensajes.TablaMensajes["lblTitulo"];
            ew.Cells["A1"].Value = sNombreReporte;
            ew.Cells["A1:T1"].Merge = true;
            ew.Cells["A1"].Style.Font.Bold = true;
            ew.Cells["A1"].Style.Font.Size = 16;
            ew.Cells["A1"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;

            //Encabezados
            Color cFondoTitulo = System.Drawing.ColorTranslator.FromHtml("#003A63");
            Color cLetraTitulo = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");

            ew.Cells["A3"].Value = oMensajes.TablaMensajes["lblNombreMod"];
            ew.Cells["A3"].Style.Font.Bold = true;
            ew.Cells["A3:T3"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
            ew.Cells["A3:T3"].Style.Fill.BackgroundColor.SetColor(cFondoTitulo);
            ew.Cells["A3:T3"].Style.Font.Bold = true;
            ew.Cells["A3:T3"].Style.Font.Size = 13;
            ew.Cells["A3:T3"].Style.Font.Color.SetColor(cLetraTitulo);
            ew.Cells["A3:T3"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            
            ew.Cells["B3"].Value = oMensajes.TablaMensajes["gvEmpresas_Domicilio"];
            ew.Cells["C3"].Value = oMensajes.TablaMensajes["lblSectorMod"];
            ew.Cells["D3"].Value = oMensajes.TablaMensajes["lblRamoMod"];
            ew.Cells["E3"].Value = oMensajes.TablaMensajes["lblRFCMod"];
            ew.Cells["F3"].Value = oMensajes.TablaMensajes["lblTelefonoOficinaMod"];
            ew.Cells["G3"].Value = oMensajes.TablaMensajes["lblFaxMod"];
            ew.Cells["H3"].Value = oMensajes.TablaMensajes["lblTamanioEmpMod"];
            ew.Cells["I3"].Value = oMensajes.TablaMensajes["lblNombreTitularMod"];
            ew.Cells["J3"].Value = oMensajes.TablaMensajes["lblMisionMod"];
            ew.Cells["K3"].Value = oMensajes.TablaMensajes["lblGiroMod"];
            ew.Cells["L3"].Value = oMensajes.TablaMensajes["lblCalleMod"];
            ew.Cells["M3"].Value = oMensajes.TablaMensajes["lblNumExteriorMod"];
            ew.Cells["N3"].Value = oMensajes.TablaMensajes["lblNumInteriorMod"];
            ew.Cells["O3"].Value = oMensajes.TablaMensajes["lblColoniaMod"];
            ew.Cells["P3"].Value = oMensajes.TablaMensajes["lblMunicipioMod"];
            ew.Cells["Q3"].Value = oMensajes.TablaMensajes["lblCPMod"];
            ew.Cells["R3"].Value = oMensajes.TablaMensajes["lblCiudadMod"];
            ew.Cells["S3"].Value = oMensajes.TablaMensajes["lblEstadoMod"];
            ew.Cells["T3"].Value = oMensajes.TablaMensajes["lblEstatusMod"];

            //Detalle            
            int i = 4;

            foreach (DataRow dr in _dtDatosUni.Rows)
            {
                ew.Cells["A" + i.ToString()].Value = dr["Nombre"];
                ew.Cells["B" + i.ToString()].Value = dr["Domicilio"];
                ew.Cells["C" + i.ToString()].Value = dr["Sector"];
                ew.Cells["D" + i.ToString()].Value = dr["Ramo"];
                ew.Cells["E" + i.ToString()].Value = dr["RFC"];
                ew.Cells["F" + i.ToString()].Value = dr["TelefonoOficina"];
                ew.Cells["G" + i.ToString()].Value = dr["Fax"];
                ew.Cells["H" + i.ToString()].Value = dr["TamanioEmpresa"];
                ew.Cells["I" + i.ToString()].Value = dr["NombreDuenio"];
                ew.Cells["J" + i.ToString()].Value = dr["Mision"];
                ew.Cells["K" + i.ToString()].Value = dr["Giro"];
                ew.Cells["L" + i.ToString()].Value = dr["Calle"];
                ew.Cells["M" + i.ToString()].Value = dr["NumeroExterior"];
                ew.Cells["N" + i.ToString()].Value = dr["NumeroInterior"];
                ew.Cells["O" + i.ToString()].Value = dr["Colonia"];
                ew.Cells["P" + i.ToString()].Value = dr["Municipio"];
                ew.Cells["Q" + i.ToString()].Value = dr["NumeroPostal"];
                ew.Cells["R" + i.ToString()].Value = dr["Ciudad"];
                ew.Cells["S" + i.ToString()].Value = dr["Estado"];
                ew.Cells["T" + i.ToString()].Value = dr["Estatus"];

                i++;
            }

            foreach (DataRow dr in _dtDatos.Rows)
            {
                ew.Cells["A" + i.ToString()].Value = dr["Nombre"];
                ew.Cells["B" + i.ToString()].Value = dr["Domicilio"];
                ew.Cells["C" + i.ToString()].Value = dr["Sector"];
                ew.Cells["D" + i.ToString()].Value = dr["Ramo"];
                ew.Cells["E" + i.ToString()].Value = dr["RFC"];
                ew.Cells["F" + i.ToString()].Value = dr["TelefonoOficina"];
                ew.Cells["G" + i.ToString()].Value = dr["Fax"];
                ew.Cells["H" + i.ToString()].Value = dr["TamanioEmpresa"];
                ew.Cells["I" + i.ToString()].Value = dr["NombreDuenio"];
                ew.Cells["J" + i.ToString()].Value = dr["Mision"];
                ew.Cells["K" + i.ToString()].Value = dr["Giro"];
                ew.Cells["L" + i.ToString()].Value = dr["Calle"];
                ew.Cells["M" + i.ToString()].Value = dr["NumeroExterior"];
                ew.Cells["N" + i.ToString()].Value = dr["NumeroInterior"];
                ew.Cells["O" + i.ToString()].Value = dr["Colonia"];
                ew.Cells["P" + i.ToString()].Value = dr["Municipio"];
                ew.Cells["Q" + i.ToString()].Value = dr["NumeroPostal"];
                ew.Cells["R" + i.ToString()].Value = dr["Ciudad"];
                ew.Cells["S" + i.ToString()].Value = dr["Estado"];
                ew.Cells["T" + i.ToString()].Value = dr["Estatus"];

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

        private void DeshabilitarComponentesModalAgregar()
        {
            tboxNombreMod.Enabled = false;
            cboxEstatusMod.Enabled = false;
            cboxSectorMod.Enabled = false;
            cboxRamoMod.Enabled = false;
            tboxRFCMod.Enabled = false;
            tboxTelefonoOficinaMod.Enabled = false;
            tboxFaxMod.Enabled = false;
            cboxTamanioEmpMod.Enabled = false;
            tboxNombreTitularMod.Enabled = false;
            tboxMisionMod.Enabled = false;
            tboxGiroMod.Enabled = false;
            tboxCalleMod.Enabled = false;
            tboxNumExteriorMod.Enabled = false;
            tboxNumInteriorMod.Enabled = false;
            tboxColoniaMod.Enabled = false;
            tboxMunicipioMod.Enabled = false;
            tboxCPMod.Enabled = false;
            tboxCiudadMod.Enabled = false;
            tboxEstadoMod.Enabled = false;
        }

        private void HabilitarComponentesModalAgregar()
        {
            tboxNombreMod.Enabled = true;
            cboxEstatusMod.Enabled = true;
            cboxSectorMod.Enabled = true;
            cboxRamoMod.Enabled = true;
            tboxRFCMod.Enabled = true;
            tboxTelefonoOficinaMod.Enabled = true;
            tboxFaxMod.Enabled = true;
            cboxTamanioEmpMod.Enabled = true;
            tboxNombreTitularMod.Enabled = true;
            tboxMisionMod.Enabled = true;
            tboxGiroMod.Enabled = true;
            tboxCalleMod.Enabled = true;
            tboxNumExteriorMod.Enabled = true;
            tboxNumInteriorMod.Enabled = true;
            tboxColoniaMod.Enabled = true;
            tboxMunicipioMod.Enabled = true;
            tboxCPMod.Enabled = true;
            tboxCiudadMod.Enabled = true;
            tboxEstadoMod.Enabled = true;
        }

        private void ConfiguraEdicionModalAgregar(String _sidCompany)
        {
            Empresa oEmpresa = new Empresa(_sidCompany);

            tboxNombreMod.Text = oEmpresa.Nombre;
            cboxEstatusMod.SelectedValue = oEmpresa.IdTypeState;
            cboxSectorMod.SelectedValue = oEmpresa.IdSector;
            cboxRamoMod.SelectedValue = oEmpresa.IdRamo;
            tboxRFCMod.Text = oEmpresa.RFC;
            tboxTelefonoOficinaMod.Text = oEmpresa.TelefonoOficina;
            tboxFaxMod.Text = oEmpresa.Fax;
            cboxTamanioEmpMod.SelectedValue = oEmpresa.IdTamanioCompania;
            tboxNombreTitularMod.Text = oEmpresa.NombreDuenio;
            tboxMisionMod.Text = oEmpresa.MisionEmpresa;
            tboxGiroMod.Text = oEmpresa.Giro;
            tboxCalleMod.Text = oEmpresa.NombreCalle;
            tboxNumExteriorMod.Text = oEmpresa.NumeriorExterior;
            tboxNumInteriorMod.Text = oEmpresa.NumeroInterior;
            tboxColoniaMod.Text = oEmpresa.Colonia;
            tboxMunicipioMod.Text = oEmpresa.Municipio;
            tboxCPMod.Text = oEmpresa.NumeroPostal;
            tboxCiudadMod.Text = oEmpresa.Ciudad;
            tboxEstadoMod.Text = oEmpresa.Estado;
        }

        private void LimpiarModalAgregar()
        {
            tboxNombreMod.Text = "";
            cboxEstatusMod.SelectedIndex = -1;
            cboxSectorMod.SelectedIndex = -1;
            cboxRamoMod.SelectedIndex = -1;
            tboxRFCMod.Text = "";
            tboxTelefonoOficinaMod.Text = "";
            tboxFaxMod.Text = "";
            cboxTamanioEmpMod.SelectedIndex = -1;
            tboxNombreTitularMod.Text = "";
            tboxMisionMod.Text = "";
            tboxGiroMod.Text = "";
            tboxCalleMod.Text = "";
            tboxNumExteriorMod.Text = "";
            tboxNumInteriorMod.Text = "";
            tboxColoniaMod.Text = "";
            tboxMunicipioMod.Text = "";
            tboxCPMod.Text = "";
            tboxCiudadMod.Text = "";
            tboxEstadoMod.Text = "";
        }

        [System.Web.Services.WebMethod]
        public static String EliminarEmpresa(String parameter1)
        {
            String _sIdCompany = parameter1;

            Empresa.EliminarEmpresa(_sIdCompany);

            return "EmpresasAdministrador.aspx";
        }
        #endregion
    }
}