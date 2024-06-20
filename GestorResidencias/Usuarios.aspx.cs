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
    public partial class Usuarios : System.Web.UI.Page
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
                if (Generales.glsUsuarioSession.IdTipoUsuario==Enums.TipoUsuario.Administrador.ToString() || Generales.glsUsuarioSession.IdTipoUsuario == Enums.TipoUsuario.JefeCarrera.ToString())
                {
                    if (IsPostBack == false)
                    {
                        ConfiguraPagina();
                        LlenarCombos();
                        tboxNumeroControl_TextChanged(null, null);
                    }
                    ConfiguraGrid();

                    ScriptManager.RegisterStartupScript(this, GetType(), "Script1", "Scrolls();", true);
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
        
        protected void tboxNumeroControl_TextChanged(object sender, EventArgs e)
        {
            LlenarUsuarios(tboxNumeroControl.Text, tboxNombre.Text, cboxTipoUsuario.SelectedValue, cboxCarrera.SelectedValue, cboxEstatus.SelectedValue);
        }

        protected void ibtnAgregar_Click(object sender, ImageClickEventArgs e)
        {
            LimpiarModalAgregar();
            HabilitarComponentes();
            
            ViewState["IdUser"] = Generales.ObtieneNuevoID();
            modAgregar.Show();
        }

        protected void gvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dicOrdenacion = new Dictionary<string, string>((Dictionary<string, string>)ViewState["dicOrdenacion"]);

            DataView m_DataView = new DataView((DataTable)ViewState["dtUsuarios"]);
            if (ViewState["ultOrdenacion"] != null)
            {
                m_DataView.Sort = ViewState["ultOrdenacion"].ToString() + " " + dicOrdenacion[ViewState["ultOrdenacion"].ToString()];
            }

            gvUsuarios.DataSource = m_DataView;
            gvUsuarios.PageIndex = e.NewPageIndex;
            gvUsuarios.DataBind();
        }

        protected void gvUsuarios_Sorting(object sender, GridViewSortEventArgs e)
        {
            gvUsuarios.PageIndex = 0;

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

            if (ViewState["dtUsuarios"] != null)
            {
                DataView m_DataView = new DataView((DataTable)ViewState["dtUsuarios"]);
                m_DataView.Sort = e.SortExpression + " " + dicOrdenacion[e.SortExpression];

                gvUsuarios.DataSource = m_DataView;
                gvUsuarios.DataBind();
            }
        }

        protected void gvUsuarios_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[23].ColumnSpan = 2;
                e.Row.Cells.RemoveAt(24);

                e.Row.Cells[24].ColumnSpan = 4;
                e.Row.Cells.RemoveAt(25);
                e.Row.Cells.RemoveAt(25);
                e.Row.Cells.RemoveAt(25);
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                String _sIdTypeUser = gvUsuarios.DataKeys[e.Row.RowIndex].Values[1].ToString();
                String _sIdTypeState = gvUsuarios.DataKeys[e.Row.RowIndex].Values[2].ToString();

                ImageButton ibtnAceptarSol = (ImageButton)e.Row.Cells[23].Controls[1];
                ibtnAceptarSol.ID = "ibtnAceptarSol";
                ibtnAceptarSol.CommandName = "ibtnAceptarSol";
                ibtnAceptarSol.ImageUrl = "~//Assets//Imagenes//Principal//Aprobar.png";
                ibtnAceptarSol.Width = 30;
                ibtnAceptarSol.Visible = false;
                if (_sIdTypeState == Enums.EstatusUsuario.SolictudDeAcceso.ToString())
                {
                    ibtnAceptarSol.Visible = true;
                }

                ImageButton ibtnDenegarSol = (ImageButton)e.Row.Cells[24].Controls[1];
                ibtnDenegarSol.ID = "ibtnDenegarSol";
                ibtnDenegarSol.CommandName = "ibtnDenegarSol";
                ibtnDenegarSol.ImageUrl = "~//Assets//Imagenes//Principal//Cancelar.png";
                ibtnDenegarSol.Width = 30;
                ibtnDenegarSol.Visible = false;
                if (_sIdTypeState == Enums.EstatusUsuario.SolictudDeAcceso.ToString())
                {
                    ibtnDenegarSol.Visible = true;
                }

                Button btnVer = (Button)e.Row.Cells[25].Controls[0];
                btnVer.ID = "btnVer";
                btnVer.CommandName = "btnVer";
                btnVer.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnVer.Text = "Ver";
                btnVer.ForeColor = System.Drawing.Color.White;
                btnVer.Font.Bold = true;
                btnVer.Visible = false;
                if (_sIdTypeState == Enums.EstatusUsuario.SolictudDeAcceso.ToString())
                {
                    btnVer.Visible = true;
                }

                Button btnEditar = (Button)e.Row.Cells[26].Controls[0];
                btnEditar.ID = "btnEditar";
                btnEditar.CommandName = "btnEditar";
                btnEditar.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnEditar.Text = "Editar";
                btnEditar.ForeColor = System.Drawing.Color.White;
                btnEditar.Font.Bold = true;
                btnEditar.Visible = false;
                if (_sIdTypeState == Enums.EstatusUsuario.Activo.ToString() || _sIdTypeState == Enums.EstatusUsuario.Inactivo.ToString())
                {
                    btnEditar.Visible = true;
                }

                Button btnEliminar = (Button)e.Row.Cells[27].Controls[0];
                btnEliminar.ID = "btnEliminar";
                btnEliminar.CommandName = "btnEliminar";
                btnEliminar.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnEliminar.Text = "Eliminar";
                btnEliminar.ForeColor = System.Drawing.Color.White;
                btnEliminar.Font.Bold = true;
                btnEliminar.Visible = false;
                if (_sIdTypeState == Enums.EstatusUsuario.Activo.ToString() || _sIdTypeState == Enums.EstatusUsuario.Inactivo.ToString())
                {
                    btnEliminar.Visible = true;
                }

                Button btnCuentaSecundaria = (Button)e.Row.Cells[28].Controls[0];
                btnCuentaSecundaria.ID = "btnCuentaSecundaria";
                btnCuentaSecundaria.CommandName = "btnCuentaSecundaria";
                btnCuentaSecundaria.CssClass = "form-control fontsizeh6 btn-hover-general";
                btnCuentaSecundaria.Text = "Agregar cuenta secundaria";
                btnCuentaSecundaria.ForeColor = System.Drawing.Color.White;
                btnCuentaSecundaria.Font.Bold = true;
                btnCuentaSecundaria.Visible = false;
                if ((_sIdTypeState == Enums.EstatusUsuario.Activo.ToString() || _sIdTypeState == Enums.EstatusUsuario.Inactivo.ToString())
                    && _sIdTypeUser != Enums.TipoUsuario.Alumno.ToString())
                {
                    btnCuentaSecundaria.Visible = true;
                }

                if (_sIdTypeState == Enums.EstatusUsuario.SolictudDeAcceso.ToString())
                {
                    e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#F5F6AB");
                }
            }
        }

        protected void gvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "ibtnAceptarSol")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvUsuarios.Rows[index];

                    String _sIdUser = gvUsuarios.DataKeys[index].Values[0].ToString();
                    String _sIdTypeUser = gvUsuarios.DataKeys[index].Values[1].ToString();
                    String _sIdTypeState = gvUsuarios.DataKeys[index].Values[2].ToString();

                    Usuario.AceptarSolicitudDeAcceso(_sIdUser);
                    tboxNumeroControl_TextChanged(null, null);
                }
                else if (e.CommandName == "ibtnDenegarSol")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvUsuarios.Rows[index];

                    String _sIdUser = gvUsuarios.DataKeys[index].Values[0].ToString();
                    String _sIdTypeUser = gvUsuarios.DataKeys[index].Values[1].ToString();
                    String _sIdTypeState = gvUsuarios.DataKeys[index].Values[2].ToString();

                    Usuario.EliminarUsuario(_sIdUser);
                    tboxNumeroControl_TextChanged(null, null);
                }
                else if (e.CommandName == "btnVer")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvUsuarios.Rows[index];

                    String _sIdUser = gvUsuarios.DataKeys[index].Values[0].ToString();
                    String _sIdTypeUser = gvUsuarios.DataKeys[index].Values[1].ToString();
                    String _sIdTypeState = gvUsuarios.DataKeys[index].Values[2].ToString();

                    LimpiarModalAgregar();
                    DeshabilitarComponentes();
                    ObtieneUsuario(_sIdUser);

                    modAgregar.Show();
                }
                else if (e.CommandName == "btnEditar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvUsuarios.Rows[index];

                    String _sIdUser = gvUsuarios.DataKeys[index].Values[0].ToString();
                    String _sIdTypeUser = gvUsuarios.DataKeys[index].Values[1].ToString();
                    String _sIdTypeState = gvUsuarios.DataKeys[index].Values[2].ToString();
                    ViewState["IdUser"] = _sIdUser;

                    LimpiarModalAgregar();
                    HabilitarComponentes();
                    ObtieneUsuario(_sIdUser);
                    
                    cboxTipoUsuarioMod.Enabled = false;
                    tboxNumeroControlMod.Enabled = false;
                    tboxNumeroEmpleadoMod.Enabled = false;
                    modAgregar.Show();
                }
                else if (e.CommandName == "btnEliminar")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvUsuarios.Rows[index];

                    String _sIdUser = gvUsuarios.DataKeys[index].Values[0].ToString();

                    if(_sIdUser == Generales.glsUsuarioSession.IdUsuario)
                    {
                        oMensajes.MuestraMensaje(this, "Advertencia", "No puedes eliminar tu propio usuario/perfil con el que estas en sesion.", Mensajes.TipoMensaje.Error);
                        return;
                    }

                    Session["sIdUser"] = _sIdUser;

                    oMensajes.MuestraMensajeConRespuesta(this, "Advertencia", "Seguro que deseas eliminar este usuario?, los cambios realizados no se pueden revertir.", Mensajes.TipoMensaje.Precaucion, "EliminarUsuario");
                }
                else if (e.CommandName == "btnCuentaSecundaria")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvUsuarios.Rows[index];

                    String _sIdUser = gvUsuarios.DataKeys[index].Values[0].ToString();
                    String _sIdTypeUser = gvUsuarios.DataKeys[index].Values[1].ToString();
                    String _sIdTypeState = gvUsuarios.DataKeys[index].Values[2].ToString();
                    String _sNoEmpleado = gvUsuarios.DataKeys[index].Values[3].ToString();

                    tboxNumeroEmpleadoModCS.Enabled = false;
                    tboxNumeroEmpleadoModCS.Text = _sNoEmpleado;
                    cboxTipoUsuarioModCS.SelectedIndex = -1;
                    
                    modCuentaSecundaria.Show();
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
                tboxNumeroControl_TextChanged(null, null);
            }
        }

        protected void btnDescargar_Click(object sender, EventArgs e)
        {
            DataTable dtDatos = (DataTable)ViewState["dtUsuarios"];

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
        protected void ibtnCerrarMod_Click(object sender, ImageClickEventArgs e)
        {
            ViewState.Remove("IdUser");
            modAgregar.Hide();
        }

        protected void tboxNumeroControlMod_TextChanged(object sender, EventArgs e)
        {
            tboxNumeroEmpleadoMod.Text = tboxNumeroEmpleadoMod.Text.ToUpper();
            if (Usuario.ValidaExisteNumeroControl(tboxNumeroControlMod.Text) || Usuario.ValidaExisteNumeroControl(tboxNumeroEmpleadoMod.Text))
            {
                tboxNumeroControlMod.Text = "";
                tboxNumeroEmpleadoMod.Text = "";
                oMensajes.MuestraMensaje(this, "Error", "El numero de control/empleado escrito ya esta registrado para otro usuario", Mensajes.TipoMensaje.Error);
            }
        }

        protected void cboxTipoUsuarioMod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboxTipoUsuarioMod.SelectedValue == Enums.TipoUsuario.Alumno.ToString())
            {
                divNumeroControlMod.Visible = true;
                rfvNumeroControlMod.Enabled = true;
                rfvSemestreMod.Enabled = true;

                divNumeroEmpleadoMod.Visible = false;
                rfvNumeroEmpleadoMod.Enabled = false;
                
                tboxNumeroEmpleadoMod.Text = "";
            }
            else
            {
                divNumeroControlMod.Visible = false;
                rfvNumeroControlMod.Enabled = false;
                rfvSemestreMod.Enabled = false;

                divNumeroEmpleadoMod.Visible = true;
                rfvNumeroEmpleadoMod.Enabled = true;

                tboxNumeroControlMod.Text = "";
            }

            if(cboxTipoUsuarioMod.SelectedValue == Enums.TipoUsuario.Administrador.ToString() || cboxTipoUsuarioMod.SelectedValue == Enums.TipoUsuario.Alumno.ToString())
            {
                divCamposExtrasMod.Visible = true;
                divCamposExtrasTelMod.Visible = true;
            }
            else
            {
                divCamposExtrasMod.Visible = false;
                divCamposExtrasTelMod.Visible = false;
            }
        }

        protected void tboxContrasenaMod_TextChanged(object sender, EventArgs e)
        {
            if (tboxContrasenaMod.Text != tboxRepiteContrasenaMod.Text)
            {
                lblContreseniasNoCoincidenMod.Text = "Las contras no coinciden";
                tboxContrasenaMod.Attributes.Add("style", "border-color:red");
                tboxRepiteContrasenaMod.Attributes.Add("style", "border-color:red");
            }
            else if (tboxContrasenaMod.Text == "" && tboxRepiteContrasenaMod.Text == "")
            {
                lblContreseniasNoCoincidenMod.Text = "Las contraseñas no deben ser vacias";
                tboxContrasenaMod.Attributes.Add("style", "border-color:red");
                tboxRepiteContrasenaMod.Attributes.Add("style", "border-color:red");
            }
            else
            {
                lblContreseniasNoCoincidenMod.Text = "";
                tboxContrasenaMod.Attributes.Add("style", "border-color:lime");
                tboxRepiteContrasenaMod.Attributes.Add("style", "border-color:lime");
            }
        }

        protected void cboxSeguridadSocialMod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboxSeguridadSocialMod.SelectedValue == "1")
            {
                tboxOtraSeguridadSocialMod.Text = "";
                divOtraSSMod.Visible = true;
            }
            else
            {
                tboxOtraSeguridadSocialMod.Text = "";
                divOtraSSMod.Visible = false;
            }
        }

        protected void btnAceptarMod_Click(object sender, EventArgs e)
        {
            try
            {
                if (tboxContrasenaMod.Text == tboxRepiteContrasenaMod.Text)
                {
                    Usuario oUsuario = new Usuario(ViewState["IdUser"].ToString());

                    if (cboxTipoUsuarioMod.SelectedValue == Enums.TipoUsuario.Alumno.ToString())
                    {
                        oUsuario.NoControl = tboxNumeroControlMod.Text;
                    }
                    else
                    {
                        oUsuario.NoControl = tboxNumeroEmpleadoMod.Text;
                    }
                    
                    oUsuario.IdTipoUsuario = cboxTipoUsuarioMod.SelectedValue;
                    oUsuario.IdTipoEstado = cboxEstatusMod.SelectedValue;
                    oUsuario.Nombre = tboxNombreMod.Text;
                    oUsuario.ApellidoPaterno = tboxApellidoPatMod.Text;
                    oUsuario.ApellidoMaterno = tboxApellidoMatMod.Text;
                    oUsuario.Email = tboxEmailMod.Text.ToLower();
                    oUsuario.IdDominio = cboxDominioMod.SelectedValue;
                    oUsuario.Contrasena = tboxContrasenaMod.Text;
                    oUsuario.TelefonoCelular = tboxCelularMod.Text;
                    oUsuario.IdCarrera = cboxCarreraMod.SelectedValue;
                    
                    if(cboxTipoUsuarioMod.Text == Enums.TipoUsuario.Administrador.ToString() || cboxTipoUsuarioMod.Text == Enums.TipoUsuario.Alumno.ToString())
                    {
                        oUsuario.Telefono = tboxTelefonoMod.Text;
                        oUsuario.Semestre = tboxSemestreMod.Text;
                        oUsuario.IdSeguridadSocial = cboxSeguridadSocialMod.SelectedValue;
                        if(cboxSeguridadSocialMod.SelectedValue == "1")
                        {
                            oUsuario.OtraSeguridadSocial = tboxOtraSeguridadSocialMod.Text;
                        }
                        else
                        {
                            oUsuario.OtraSeguridadSocial = "";
                        }
                        oUsuario.NSS = tboxNSSMod.Text;
                        oUsuario.Calle = tboxCalleMod.Text;
                        oUsuario.NumeroExterior = tboxNumeroExteriorMod.Text;
                        oUsuario.NumeroInterior = tboxNumeroInteriorMod.Text;
                        oUsuario.Colonia = tboxColoniaMod.Text;
                        oUsuario.Ciudad = tboxCiudadMod.Text;
                        oUsuario.Municipio = tboxMunicipioMod.Text;
                        oUsuario.Estado = tboxEstadoMod.Text;
                        oUsuario.NumeroPostal = tboxCPMod.Text;
                    }
                    else
                    {
                        oUsuario.Telefono = "";
                        oUsuario.Semestre = "";
                        oUsuario.IdSeguridadSocial = "";
                        oUsuario.OtraSeguridadSocial = "";
                        oUsuario.NSS = "";
                        oUsuario.Calle = "";
                        oUsuario.NumeroExterior = "";
                        oUsuario.NumeroInterior = "";
                        oUsuario.Colonia = "";
                        oUsuario.Ciudad = "";
                        oUsuario.Municipio = "";
                        oUsuario.Estado = "";
                        oUsuario.NumeroPostal = "";
                    }

                    oUsuario.InsertaActualizaUsuario();

                    ViewState.Remove("IdUser");
                    modAgregar.Hide();
                    tboxNumeroControl_TextChanged(null, null);
                    tboxRepiteContrasenaMod.Style["border-color"] = "#ccc";

                    oMensajes.MuestraMensaje(this, "Correcto", "Usuario agregado con éxito", Mensajes.TipoMensaje.Correcto);
                }
                else
                {
                    tboxContrasenaMod.Focus();
                }
            }
            catch (Exception ex)
            {
                oMensajes.MuestraMensaje(this, "Error", ex.Message + ". Favor de intentarlo de nuevo", Mensajes.TipoMensaje.Error);
            }

        }

        #endregion

        #region Modal Agregar Cuenta Secundaria
        protected void ibtnCerrarModCS_Click(object sender, ImageClickEventArgs e)
        {
            modCuentaSecundaria.Hide();
        }

        protected void btnAceptarModCS_Click(object sender, EventArgs e)
        {
            try
            {
                if(Usuario.ValidaExisteNumeroEmpleadoConTipoUsuario(tboxNumeroEmpleadoModCS.Text, cboxTipoUsuarioModCS.SelectedValue))
                {
                    oMensajes.MuestraMensaje(this, "Error", "Ya existe la cuenta secundaria con el rol creado.", Mensajes.TipoMensaje.Error);
                    cboxTipoUsuarioModCS.SelectedIndex = -1;
                    return;
                }

                Usuario oUsuario = new Usuario("", tboxNumeroEmpleadoModCS.Text);
                Usuario oCuentaSecundaria = new Usuario();

                oCuentaSecundaria.NoControl = tboxNumeroEmpleadoModCS.Text;
                oCuentaSecundaria.IdTipoUsuario = cboxTipoUsuarioModCS.SelectedValue;
                oCuentaSecundaria.IdTipoEstado = Enums.EstatusUsuario.Activo.ToString();
                oCuentaSecundaria.Nombre = oUsuario.Nombre;
                oCuentaSecundaria.ApellidoPaterno = oUsuario.ApellidoPaterno;
                oCuentaSecundaria.ApellidoMaterno = oUsuario.ApellidoMaterno;
                oCuentaSecundaria.Email = oUsuario.Email;
                oCuentaSecundaria.IdDominio = oUsuario.IdDominio;
                oCuentaSecundaria.Contrasena = oUsuario.Contrasena;
                oCuentaSecundaria.TelefonoCelular = oUsuario.TelefonoCelular;
                oCuentaSecundaria.IdCarrera = oUsuario.IdCarrera;
                oCuentaSecundaria.Telefono = "";
                oCuentaSecundaria.Semestre = "";
                oCuentaSecundaria.IdSeguridadSocial = "";
                oCuentaSecundaria.OtraSeguridadSocial = "";
                oCuentaSecundaria.NSS = "";
                oCuentaSecundaria.Calle = "";
                oCuentaSecundaria.NumeroExterior = "";
                oCuentaSecundaria.NumeroInterior = "";
                oCuentaSecundaria.Colonia = "";
                oCuentaSecundaria.Ciudad = "";
                oCuentaSecundaria.Municipio = "";
                oCuentaSecundaria.Estado = "";
                oCuentaSecundaria.NumeroPostal = "";

                oCuentaSecundaria.InsertaActualizaUsuario();

                tboxNumeroControl_TextChanged(null, null);
                modCuentaSecundaria.Hide();
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
            oMensajes.RecuperarTablaMensajes("Usuarios.aspx");

            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            ibtnRetroceder.ImageUrl = "~//Assets//Imagenes//Principal//FlechaRetroceder.png";
            ibtnRetroceder.Width = 40;
            ibtnRetroceder.CausesValidation = false;

            lblNumeroControl.Text = oMensajes.TablaMensajes["lblNumeroControl"];
            lblNombre.Text = oMensajes.TablaMensajes["lblNombre"];
            lblTipoUsuario.Text = oMensajes.TablaMensajes["lblTipoUsuario"];
            lblCarrera.Text = oMensajes.TablaMensajes["lblCarrera"];
            lblEstatus.Text = oMensajes.TablaMensajes["lblEstatus"];

            btnBuscar.Text = oMensajes.TablaMensajes["btnBuscar"];
            btnBuscar.BackColor = System.Drawing.ColorTranslator.FromHtml("#372d86");
            btnBuscar.ForeColor = System.Drawing.Color.White;
            btnBuscar.Font.Bold = true;
            btnBuscar.CausesValidation = false;

            ibtnAgregar.ImageUrl = "~//Assets//Imagenes//Principal//Agregar.png";
            ibtnAgregar.CausesValidation = false;
            ibtnAgregar.ToolTip = oMensajes.TablaMensajes["ibtnAgregar"];

            gvUsuarios.HeaderStyle.Wrap = true;
            gvUsuarios.RowStyle.Wrap = true;
            gvUsuarios.EmptyDataText = "No se encontraron resgistros";
            gvUsuarios.Columns[0].Visible = false; //IdUser
            gvUsuarios.Columns[1].Visible = false; //IdTypeUser
            gvUsuarios.Columns[2].Visible = false; //IdTypeState
            gvUsuarios.Columns[3].Visible = false; //Celular
            gvUsuarios.Columns[4].Visible = false; //Semestre
            gvUsuarios.Columns[5].Visible = false; //SeguridadSocial
            gvUsuarios.Columns[6].Visible = false; //OtraSeguridadSocial
            gvUsuarios.Columns[7].Visible = false; //NSS
            gvUsuarios.Columns[8].Visible = false; //Calle
            gvUsuarios.Columns[9].Visible = false; //NumExterior
            gvUsuarios.Columns[10].Visible = false; //NumInterior
            gvUsuarios.Columns[11].Visible = false; //Colonia
            gvUsuarios.Columns[12].Visible = false; //Estado
            gvUsuarios.Columns[13].Visible = false; //Municipio
            gvUsuarios.Columns[14].Visible = false; //Ciudad
            gvUsuarios.Columns[15].Visible = false; //NumeroPostal
            gvUsuarios.Columns[16].HeaderText = oMensajes.TablaMensajes["gvUsuarios_NoControl"];
            gvUsuarios.Columns[17].HeaderText = oMensajes.TablaMensajes["gvUsuarios_NombreCompleto"];
            gvUsuarios.Columns[18].HeaderText = oMensajes.TablaMensajes["gvUsuarios_Email"];
            gvUsuarios.Columns[19].HeaderText = oMensajes.TablaMensajes["gvUsuarios_TipoUsuario"];
            gvUsuarios.Columns[20].HeaderText = oMensajes.TablaMensajes["gvUsuarios_Carrera"];
            gvUsuarios.Columns[21].HeaderText = oMensajes.TablaMensajes["gvUsuarios_Telefono"];
            gvUsuarios.Columns[22].HeaderText = oMensajes.TablaMensajes["gvUsuarios_TipoEstado"];
            gvUsuarios.Columns[23].HeaderText = oMensajes.TablaMensajes["gvUsuarios_SolicitudAcceso"];
            gvUsuarios.Columns[25].HeaderText = oMensajes.TablaMensajes["gvUsuarios_Opciones"];

            for (int i = 0; i < gvUsuarios.Columns.Count; i++)
            {
                gvUsuarios.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvUsuarios.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }

            btnDescargar.Text = oMensajes.TablaMensajes["btnDescargar"];
            btnDescargar.ForeColor = System.Drawing.Color.White;
            btnDescargar.Font.Bold = true;
            btnDescargar.CausesValidation = false;

            #region Modal Agregar
            lblDescripcionModuloMod.Text = oMensajes.TablaMensajes["lblDescripcionModuloMod"];

            ibtnCerrarMod.ImageUrl = "~//Assets//Imagenes//Principal//Cerrar Negro.png";
            ibtnCerrarMod.Width = 30;
            ibtnCerrarMod.CausesValidation = false;

            lblNumeroControlMod.Text = oMensajes.TablaMensajes["lblNumeroControlMod"];
            rfvNumeroControlMod.Text = "*Campo Obligatorio";

            lblNumeroEmpleadoMod.Text = oMensajes.TablaMensajes["lblNumeroEmpleadoMod"];
            rfvNumeroEmpleadoMod.Text = "Campo Obligatorio";

            lblEstatusMod.Text = oMensajes.TablaMensajes["lblEstatusMod"];
            lblNombreMod.Text = oMensajes.TablaMensajes["lblNombreMod"];
            rfvNombreMod.Text = "*Campo Obligatorio";

            lblApellidoPatMod.Text = oMensajes.TablaMensajes["lblApellidoPatMod"];
            rfvApellidoPatMod.Text = "*Campo Obligatorio";

            lblApellidoMatMod.Text = oMensajes.TablaMensajes["lblApellidoMatMod"];
            rfvApellidoMatMod.Text = "*Campo Obligatorio";

            lblEmailMod.Text = oMensajes.TablaMensajes["lblEmailMod"];
            rfvEmailMod.Text = "*Campo Obligatorio";

            lblContrasenaMod.Text = oMensajes.TablaMensajes["lblContrasenaMod"];
            rfvContrasenaMod.Text = "Campo Obligatorio";
            tboxContrasenaMod.Attributes["type"] = "password";

            lblRepiteContrasenaMod.Text = oMensajes.TablaMensajes["lblRepiteContraMod"];
            rfvRepiteContrasenaMod.Text = "Campo Obligatorio";
            tboxRepiteContrasenaMod.Attributes["type"] = "password";

            lblTelefonoMod.Text = oMensajes.TablaMensajes["lblTelefonoMod"];
            lblCelularMod.Text = oMensajes.TablaMensajes["lblCelularMod"];

            lblCarreraMod.Text = oMensajes.TablaMensajes["lblCarreraMod"];
            rfvCarreraMod.Text = "Campo Obligatorio";

            lblTipoUsuarioMod.Text = oMensajes.TablaMensajes["lblTipoUsuarioMod"];
            rfvTipoUsuarioMod.Text = "*Campo Obligatorio";

            lblSemestreMod.Text = oMensajes.TablaMensajes["lblSemestreMod"];
            rfvSemestreMod.Text = "*Campo Obligatorio";

            lblDatosSeguridadSocialMod.Text = oMensajes.TablaMensajes["lblDatosSeguridadSocialMod"];

            lblSeguridadSocialMod.Text = oMensajes.TablaMensajes["lblSeguridadSocialMod"];

            divOtraSSMod.Visible = false;
            lblOtraSeguridadSocialMod.Text = oMensajes.TablaMensajes["lblOtraSeguridadSocialMod"];
            lblNSSMod.Text = oMensajes.TablaMensajes["lblNSSMod"];

            lblDatosDomicilioMod.Text = oMensajes.TablaMensajes["lblDatosDomicilioMod"];

            lblCalleMod.Text = oMensajes.TablaMensajes["lblCalleMod"];
            lblNumeroExteriorMod.Text = oMensajes.TablaMensajes["lblNumeroExteriorMod"];
            lblNumeroInteriorMod.Text = oMensajes.TablaMensajes["lblNumeroInteriorMod"];
            lblColoniaMod.Text = oMensajes.TablaMensajes["lblColoniaMod"];
            lblCiudadMod.Text = oMensajes.TablaMensajes["lblCiudadMod"];
            lblMunicipioMod.Text = oMensajes.TablaMensajes["lblMunicipioMod"];
            lblEstadoMod.Text = oMensajes.TablaMensajes["lblEstadoMod"];
            lblCPMod.Text = oMensajes.TablaMensajes["lblCPMod"];

            btnAceptarMod.Text = oMensajes.TablaMensajes["btnAceptarMod"];
            btnAceptarMod.ForeColor = System.Drawing.Color.White;
            btnAceptarMod.Font.Bold = true;
            #endregion

            #region Modal Agregar Cuenta Secundaria
            ibtnCerrarModCS.ImageUrl = "~//Assets//Imagenes//Principal//Cerrar Negro.png";
            ibtnCerrarModCS.Width = 30;
            ibtnCerrarModCS.CausesValidation = false;

            lblNumeroEmpleadoModCS.Text = oMensajes.TablaMensajes["lblNumeroEmpleadoMod"];
            rfvNumeroEmpleadoModCS.Text = "Campo Obligatorio";

            lblTipoUsuarioModCS.Text = oMensajes.TablaMensajes["lblTipoUsuarioMod"];
            rfvTipoUsuarioModCS.Text = "*Campo Obligatorio";

            btnAceptarModCS.Text = oMensajes.TablaMensajes["btnAceptarMod"];
            btnAceptarModCS.ForeColor = System.Drawing.Color.White;
            btnAceptarModCS.Font.Bold = true;
            #endregion
        }

        private void ConfiguraGrid()
        {
            gvUsuarios.Columns[16].ControlStyle.Width = 80; //
            gvUsuarios.Columns[17].ControlStyle.Width = 200; //
            gvUsuarios.Columns[18].ControlStyle.Width = 250; //
            gvUsuarios.Columns[19].ControlStyle.Width = 80; //
            gvUsuarios.Columns[20].ControlStyle.Width = 100; //
            gvUsuarios.Columns[21].ControlStyle.Width = 80; //
            gvUsuarios.Columns[22].ControlStyle.Width = 100; //
        }

        private void LlenarCombos()
        {
            cboxTipoUsuario.DataTextField = "Name";
            cboxTipoUsuario.DataValueField = "IdValueDetail";
            cboxTipoUsuario.DataSource = ValoresPorReferencia.RecuperaValorReferencia("TipoUsuario");
            cboxTipoUsuario.DataBind();
            cboxTipoUsuario.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxTipoUsuario.SelectedIndex = 0;

            cboxCarrera.DataTextField = "Name";
            cboxCarrera.DataValueField = "IdValueDetail";
            cboxCarrera.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Carreras");
            cboxCarrera.DataBind();
            cboxCarrera.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxCarrera.SelectedIndex = 0;

            cboxEstatus.DataTextField = "Name";
            cboxEstatus.DataValueField = "IdValueDetail";
            cboxEstatus.DataSource = ValoresPorReferencia.RecuperaValorReferencia("EstadoUsuario");
            cboxEstatus.DataBind();
            cboxEstatus.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxEstatus.SelectedIndex = 0;

            cboxEstatusMod.DataTextField = "Name";
            cboxEstatusMod.DataValueField = "IdValueDetail";
            cboxEstatusMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("EstadoUsuario");
            cboxEstatusMod.DataBind();

            cboxCarreraMod.DataTextField = "Name";
            cboxCarreraMod.DataValueField = "IdValueDetail";
            cboxCarreraMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Carreras");
            cboxCarreraMod.DataBind();
            cboxCarreraMod.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxCarreraMod.SelectedIndex = 0;

            cboxTipoUsuarioMod.DataTextField = "Name";
            cboxTipoUsuarioMod.DataValueField = "IdValueDetail";
            cboxTipoUsuarioMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("TipoUsuario");
            cboxTipoUsuarioMod.DataBind();
            cboxTipoUsuarioMod.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxTipoUsuarioMod.SelectedIndex = 0;

            cboxTipoUsuarioModCS.DataTextField = "Name";
            cboxTipoUsuarioModCS.DataValueField = "IdValueDetail";
            cboxTipoUsuarioModCS.DataSource = ValoresPorReferencia.RecuperaValorReferenciaOmitiendoDato("TipoUsuario", Enums.TipoUsuario.Alumno.ToString());
            cboxTipoUsuarioModCS.DataBind();
            cboxTipoUsuarioModCS.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxTipoUsuarioModCS.SelectedIndex = 0;

            cboxSeguridadSocialMod.DataTextField = "Name";
            cboxSeguridadSocialMod.DataValueField = "IdValueDetail";
            cboxSeguridadSocialMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("SeguridadSocial");
            cboxSeguridadSocialMod.DataBind();
            cboxSeguridadSocialMod.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxSeguridadSocialMod.SelectedIndex = 0;

            cboxDominioMod.DataTextField = "Name";
            cboxDominioMod.DataValueField = "IdValueDetail";
            cboxDominioMod.DataSource = ValoresPorReferencia.RecuperaValorReferencia("DominioCorreo");
            cboxDominioMod.DataBind();
        }

        private void DeshabilitarComponentes()
        {
            cboxEstatusMod.Enabled = false;
            tboxNumeroControlMod.Enabled = false;
            tboxNumeroEmpleadoMod.Enabled = false;
            tboxNombreMod.Enabled = false;
            tboxApellidoPatMod.Enabled = false;
            tboxApellidoMatMod.Enabled = false;
            tboxEmailMod.Enabled = false;
            cboxDominioMod.Enabled = false;
            tboxContrasenaMod.Enabled = false;
            tboxRepiteContrasenaMod.Enabled = false;
            lblContreseniasNoCoincidenMod.Enabled = false;
            tboxTelefonoMod.Enabled = false;
            tboxCelularMod.Enabled = false;
            cboxCarreraMod.Enabled = false;
            cboxTipoUsuarioMod.Enabled = false;
            tboxSemestreMod.Enabled = false;

            cboxSeguridadSocialMod.Enabled = false;
            tboxOtraSeguridadSocialMod.Enabled = false;
            tboxNSSMod.Enabled = false;

            tboxCalleMod.Enabled = false;
            tboxNumeroExteriorMod.Enabled = false;
            tboxNumeroInteriorMod.Enabled = false;
            tboxColoniaMod.Enabled = false;
            tboxCiudadMod.Enabled = false;
            tboxMunicipioMod.Enabled = false;
            tboxEstadoMod.Enabled = false;
            tboxCPMod.Enabled = false;

            divBotonesMod.Visible = false;
        }

        private void HabilitarComponentes()
        {
            cboxEstatusMod.Enabled = true;
            tboxNumeroControlMod.Enabled = true;
            tboxNumeroEmpleadoMod.Enabled = true;
            tboxNombreMod.Enabled = true;
            tboxApellidoPatMod.Enabled = true;
            tboxApellidoMatMod.Enabled = true;
            tboxEmailMod.Enabled = true;
            cboxDominioMod.Enabled = true;
            tboxContrasenaMod.Enabled = true;
            tboxRepiteContrasenaMod.Enabled = true;
            lblContreseniasNoCoincidenMod.Enabled = true;
            tboxTelefonoMod.Enabled = true;
            tboxCelularMod.Enabled = true;
            cboxCarreraMod.Enabled = true;
            cboxTipoUsuarioMod.Enabled = true;
            tboxSemestreMod.Enabled = true;

            cboxSeguridadSocialMod.Enabled = true;
            tboxOtraSeguridadSocialMod.Enabled = true;
            tboxNSSMod.Enabled = true;

            tboxCalleMod.Enabled = true;
            tboxNumeroExteriorMod.Enabled = true;
            tboxNumeroInteriorMod.Enabled = true;
            tboxColoniaMod.Enabled = true;
            tboxCiudadMod.Enabled = true;
            tboxMunicipioMod.Enabled = true;
            tboxEstadoMod.Enabled = true;
            tboxCPMod.Enabled = true;

            divBotonesMod.Visible = true;
        }

        private void LlenarUsuarios(String _sNoControl = "", String _sNombreCompleto = "", String _sIdTypeUser = "", String _sidCareer = "", String _sidTypeState = "")
        {
            DataTable dtUsuarios = Usuario.ObtieneUsuarios(_sNoControl, _sNombreCompleto, _sIdTypeUser, _sidCareer, _sidTypeState);
            ViewState["dtUsuarios"] = dtUsuarios;

            gvUsuarios.DataSource = dtUsuarios;
            gvUsuarios.DataBind();

            ViewState["dicOrdenacion"] = dicOrdenacion;
        }

        private void LimpiarModalAgregar()
        {
            tboxNumeroControlMod.Text = "";
            tboxNumeroEmpleadoMod.Text = "";
            tboxNombreMod.Text = "";
            tboxApellidoPatMod.Text = "";
            tboxApellidoMatMod.Text = "";
            tboxEmailMod.Text = "";
            cboxDominioMod.SelectedIndex = -1;
            tboxContrasenaMod.Text = "";
            tboxRepiteContrasenaMod.Text = "";
            tboxContrasenaMod.Style.Remove("border-color");
            tboxRepiteContrasenaMod.Style.Remove("border-color");
            lblContreseniasNoCoincidenMod.Text = "";
            tboxCelularMod.Text = "";
            tboxTelefonoMod.Text = "";
            cboxCarreraMod.SelectedIndex = -1;
            cboxTipoUsuarioMod.SelectedIndex = -1;
            cboxTipoUsuarioMod_SelectedIndexChanged(null, null);
            cboxEstatusMod.SelectedValue = "1";
            tboxSemestreMod.Text = "";

            cboxSeguridadSocialMod.SelectedIndex = -1;
            cboxSeguridadSocialMod_SelectedIndexChanged(null, null);
            tboxOtraSeguridadSocialMod.Text = "";
            tboxNSSMod.Text = "";

            tboxCalleMod.Text = "";
            tboxNumeroExteriorMod.Text = "";
            tboxNumeroInteriorMod.Text = "";
            tboxColoniaMod.Text = "";
            tboxCiudadMod.Text = "";
            tboxMunicipioMod.Text = "";
            tboxEstadoMod.Text = "";
            tboxCPMod.Text = "";
        }

        private void ObtieneUsuario(String _sIdUser)
        {

            Usuario oUsuario = new Usuario(_sIdUser);

            if(oUsuario.IdTipoUsuario == Enums.TipoUsuario.Alumno.ToString())
            {
                tboxNumeroControlMod.Text = oUsuario.NoControl;
            }
            else
            {
                tboxNumeroEmpleadoMod.Text = oUsuario.NoControl;
            }
            
            cboxTipoUsuarioMod.SelectedValue = oUsuario.IdTipoUsuario;
            cboxTipoUsuarioMod_SelectedIndexChanged(null, null);
            cboxEstatusMod.SelectedValue = oUsuario.IdTipoEstado;
            tboxNombreMod.Text = oUsuario.Nombre;
            tboxApellidoPatMod.Text = oUsuario.ApellidoPaterno;
            tboxApellidoMatMod.Text = oUsuario.ApellidoMaterno;
            tboxEmailMod.Text = oUsuario.Email;
            cboxDominioMod.SelectedValue = oUsuario.IdDominio;
            tboxContrasenaMod.Text = oUsuario.Contrasena;
            tboxRepiteContrasenaMod.Text = oUsuario.Contrasena;
            tboxTelefonoMod.Text = oUsuario.Telefono;
            tboxCelularMod.Text = oUsuario.TelefonoCelular;
            cboxCarreraMod.SelectedValue = oUsuario.IdCarrera;
            tboxSemestreMod.Text = oUsuario.Semestre;

            cboxSeguridadSocialMod.SelectedValue = oUsuario.IdSeguridadSocial;
            cboxSeguridadSocialMod_SelectedIndexChanged(null, null);
            if(cboxSeguridadSocialMod.SelectedValue == "1")
            {
                tboxOtraSeguridadSocialMod.Text = oUsuario.OtraSeguridadSocial;
            }
            else
            {
                tboxOtraSeguridadSocialMod.Text = "";
            }
            tboxNSSMod.Text = oUsuario.NSS;

            tboxCalleMod.Text = oUsuario.Calle;
            tboxNumeroExteriorMod.Text = oUsuario.NumeroExterior;
            tboxNumeroInteriorMod.Text = oUsuario.NumeroInterior;
            tboxColoniaMod.Text = oUsuario.Colonia;
            tboxCiudadMod.Text = oUsuario.Ciudad;
            tboxMunicipioMod.Text = oUsuario.Municipio;
            tboxEstadoMod.Text = oUsuario.Estado;
            tboxCPMod.Text = oUsuario.NumeroPostal;

        }

        private void GeneraExcel(DataTable _dtDatos)
        {
            oMensajes.RecuperarTablaMensajes("Usuarios.aspx");

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

            ew.Cells["A3"].Value = oMensajes.TablaMensajes["gvUsuarios_NoControl"];
            ew.Cells["A3"].Style.Font.Bold = true;
            ew.Cells["A3:T3"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
            ew.Cells["A3:T3"].Style.Fill.BackgroundColor.SetColor(cFondoTitulo);
            ew.Cells["A3:T3"].Style.Font.Bold = true;
            ew.Cells["A3:T3"].Style.Font.Size = 13;
            ew.Cells["A3:T3"].Style.Font.Color.SetColor(cLetraTitulo);
            ew.Cells["A3:T3"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;

            ew.Cells["B3"].Value = oMensajes.TablaMensajes["gvUsuarios_NombreCompleto"];
            ew.Cells["C3"].Value = oMensajes.TablaMensajes["gvUsuarios_Email"];
            ew.Cells["D3"].Value = oMensajes.TablaMensajes["lblTelefonoMod"];
            ew.Cells["E3"].Value = oMensajes.TablaMensajes["gvUsuarios_Telefono"];
            ew.Cells["F3"].Value = oMensajes.TablaMensajes["lblSemestreMod"];
            ew.Cells["G3"].Value = oMensajes.TablaMensajes["gvUsuarios_Carrera"];
            ew.Cells["H3"].Value = oMensajes.TablaMensajes["gvUsuarios_TipoUsuario"];
            ew.Cells["I3"].Value = oMensajes.TablaMensajes["gvUsuarios_TipoEstado"];
            ew.Cells["J3"].Value = oMensajes.TablaMensajes["lblSeguridadSocialMod"];
            ew.Cells["K3"].Value = oMensajes.TablaMensajes["lblOtraSeguridadSocialMod"];
            ew.Cells["L3"].Value = oMensajes.TablaMensajes["lblNSSMod"];
            ew.Cells["M3"].Value = oMensajes.TablaMensajes["lblCalleMod"];
            ew.Cells["N3"].Value = oMensajes.TablaMensajes["lblNumeroExteriorMod"];
            ew.Cells["O3"].Value = oMensajes.TablaMensajes["lblNumeroInteriorMod"];
            ew.Cells["P3"].Value = oMensajes.TablaMensajes["lblColoniaMod"];
            ew.Cells["Q3"].Value = oMensajes.TablaMensajes["lblCiudadMod"];
            ew.Cells["R3"].Value = oMensajes.TablaMensajes["lblMunicipioMod"];
            ew.Cells["S3"].Value = oMensajes.TablaMensajes["lblEstadoMod"];
            ew.Cells["T3"].Value = oMensajes.TablaMensajes["lblCPMod"];

            //Detalle            
            int i = 4;
            foreach (DataRow dr in _dtDatos.Rows)
            {   
                ew.Cells["A" + i.ToString()].Value = dr["NoControl"];
                ew.Cells["B" + i.ToString()].Value = dr["NombreCompleto"];
                ew.Cells["C" + i.ToString()].Value = dr["Email"];
                ew.Cells["D" + i.ToString()].Value = dr["Telefono"];
                ew.Cells["E" + i.ToString()].Value = dr["Celular"];
                ew.Cells["F" + i.ToString()].Value = dr["Semestre"];
                ew.Cells["G" + i.ToString()].Value = dr["Carrera"];
                ew.Cells["H" + i.ToString()].Value = dr["TipoUsuario"];
                ew.Cells["I" + i.ToString()].Value = dr["TipoEstado"];
                ew.Cells["J" + i.ToString()].Value = dr["SeguridadSocial"];
                ew.Cells["K" + i.ToString()].Value = dr["OtraSeguridadSocial"];
                ew.Cells["L" + i.ToString()].Value = dr["NSS"];
                ew.Cells["M" + i.ToString()].Value = dr["Calle"];
                ew.Cells["N" + i.ToString()].Value = dr["NumExterior"];
                ew.Cells["O" + i.ToString()].Value = dr["NumInterior"];
                ew.Cells["P" + i.ToString()].Value = dr["Colonia"];
                ew.Cells["Q" + i.ToString()].Value = dr["Ciudad"];
                ew.Cells["R" + i.ToString()].Value = dr["Municipio"];
                ew.Cells["S" + i.ToString()].Value = dr["Estado"];
                ew.Cells["T" + i.ToString()].Value = dr["NumeroPostal"];

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

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string EliminarUsuario()
        {
            String sIdUsuario = (String)HttpContext.Current.Session["sIdUser"];

            Usuario.EliminarUsuario(sIdUsuario);

            return "Usuarios.aspx";
        }

        #endregion
    }
}