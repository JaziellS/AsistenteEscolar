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
    public partial class BancoProyectos : System.Web.UI.Page
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
                if (IsPostBack == false)
                {
                    ConfiguraPagina();
                    LlenarCombos();
                    LlenarBancoProyectos("", "", "");
                }
                ConfiguraGrid();
            }
        }

        protected void ibtnRetroceder_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void cboxCarrera_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboxPeriodo.SelectedValue != "" && tboxAnio.Text != "" && cboxCarrera.SelectedValue != "")
            {
                LimpiarFiltro();
                divTabla.Visible = true;
                divSinRegistros.Visible = false;
                lblPeriodoDes.Text = cboxCarrera.SelectedItem.Text + ": " + cboxPeriodo.SelectedItem.Text + " " + tboxAnio.Text;

                LlenarBancoProyectos(cboxPeriodo.SelectedValue, tboxAnio.Text, cboxCarrera.SelectedValue);
            }
            else
            {
                LlenarBancoProyectos("", "", "");
                divTabla.Visible = false;
                divSinRegistros.Visible = true;
                lblPeriodoDes.Text = "";
            }
        }

        protected void tboxNombreEmpresa_TextChanged(object sender, EventArgs e)
        {
            LlenarBancoProyectos(cboxPeriodo.SelectedValue, tboxAnio.Text, cboxCarrera.SelectedValue, tboxNombreEmpresa.Text, tboxNombreProyecto.Text, tboxNumeroRes.Text, cboxTurno.SelectedValue, tboxHorario.Text);
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

        }

        protected void gvBanco_RowCommand(object sender, GridViewCommandEventArgs e)
        {

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
        #endregion

        #region Funciones
        private void ConfiguraPagina()
        {
            oMensajes.RecuperarTablaMensajes("BancoProyectos.aspx");
            
            lblTitulo.Text = oMensajes.TablaMensajes["lblTitulo"];
            lblDescripcionModulo.Text = oMensajes.TablaMensajes["lblDescripcionModulo"];

            ibtnRetroceder.ImageUrl = "~//Assets//Imagenes//Principal//FlechaRetroceder.png";
            ibtnRetroceder.Width = 40;
            ibtnRetroceder.CausesValidation = false;

            lblCarrera.Text = oMensajes.TablaMensajes["lblCarrera"];
            lblPeriodo.Text = oMensajes.TablaMensajes["lblPeriodo"];
            lblAnio.Text = oMensajes.TablaMensajes["lblAnio"];

            lblNombreEmpresa.Text = oMensajes.TablaMensajes["lblNombreEmpresa"];
            lblNombreProyecto.Text = oMensajes.TablaMensajes["lblNombreProyecto"];
            lblNumeroRes.Text = oMensajes.TablaMensajes["lblNumeroRes"];
            lblTurno.Text = oMensajes.TablaMensajes["lblTurno"];
            lblHorario.Text = oMensajes.TablaMensajes["lblHorario"];

            divTabla.Visible = false;
            divSinRegistros.Visible = true;

            lblSinRegistros.Text = oMensajes.TablaMensajes["lblSinRegistros"];

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
            gvBanco.Columns[11].HeaderText = oMensajes.TablaMensajes["gvBanco_Turno"];
            gvBanco.Columns[12].HeaderText = oMensajes.TablaMensajes["gvBanco_Horario"];
            gvBanco.Columns[13].HeaderText = oMensajes.TablaMensajes["gvBanco_DiasLab"];
            gvBanco.Columns[14].HeaderText = oMensajes.TablaMensajes["gvBanco_NumResidentes"];
            gvBanco.Columns[15].HeaderText = oMensajes.TablaMensajes["gvBanco_Capacitacion"];
            gvBanco.Columns[16].HeaderText = oMensajes.TablaMensajes["gvBanco_CapacitacionDet"];
            gvBanco.Columns[17].HeaderText = oMensajes.TablaMensajes["gvBanco_CapacitacionFecha"];
            gvBanco.Columns[18].HeaderText = oMensajes.TablaMensajes["gvBanco_Prestacion"];
            gvBanco.Columns[19].HeaderText = oMensajes.TablaMensajes["gvBanco_PrestacionDet"];
            gvBanco.Columns[20].HeaderText = oMensajes.TablaMensajes["gvBanco_Monto"];

            for (int i = 0; i < gvBanco.Columns.Count; i++)
            {
                gvBanco.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                gvBanco.Columns[i].HeaderStyle.CssClass = "text-center tabla-encabezado";
            }

            btnDescargar.Text = oMensajes.TablaMensajes["btnDescargar"];
            btnDescargar.ForeColor = System.Drawing.Color.White;
            btnDescargar.Font.Bold = true;
            btnDescargar.CausesValidation = false;
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
            gvBanco.Columns[11].ControlStyle.Width = 100; //Turno
            gvBanco.Columns[12].ControlStyle.Width = 170; //Horario
            gvBanco.Columns[13].ControlStyle.Width = 130; //Dias Laborales
            gvBanco.Columns[14].ControlStyle.Width = 130; //Numero de residentes
            gvBanco.Columns[15].ControlStyle.Width = 100; //Capacitacion
            gvBanco.Columns[16].ControlStyle.Width = 400; //Capacitacion detalle
            gvBanco.Columns[17].ControlStyle.Width = 130; //Capacitacion Fecha
            gvBanco.Columns[18].ControlStyle.Width = 130; //Prestacion
            gvBanco.Columns[19].ControlStyle.Width = 250; //Prestacon Detalle
            gvBanco.Columns[20].ControlStyle.Width = 100; //Monto
        }

        private void LlenarCombos()
        {
            cboxPeriodo.DataTextField = "Name";
            cboxPeriodo.DataValueField = "IdValueDetail";
            cboxPeriodo.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Periodo");
            cboxPeriodo.DataBind();
            cboxPeriodo.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxPeriodo.SelectedIndex = 0;

            cboxCarrera.DataTextField = "Name";
            cboxCarrera.DataValueField = "IdValueDetail";
            cboxCarrera.DataSource = ValoresPorReferencia.RecuperaValorReferencia("Carreras");
            cboxCarrera.DataBind();
            cboxCarrera.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxCarrera.SelectedIndex = 0;

            cboxTurno.DataTextField = "Name";
            cboxTurno.DataValueField = "IdValueDetail";
            cboxTurno.DataSource = ValoresPorReferencia.RecuperaValorReferencia("TurnoBancoProyectos");
            cboxTurno.DataBind();
            cboxTurno.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            cboxTurno.SelectedIndex = 0;
        }

        private void LlenarBancoProyectos(String _sIdPeriod, String _sYear, String _sIdCareer, String _sNombreEmpresa = "", String _sNombreProyecto = "", String _sNumeroResidentes = "",
            String _sTurno = "", String _sHorario = "")
        {
            DataTable dtBanco = BancoProyecto.ObtieneBancoProyectos(_sIdPeriod, _sYear, _sIdCareer, _sNombreEmpresa, _sNombreProyecto, _sNumeroResidentes, _sTurno, _sHorario);
            ViewState["dtBanco"] = dtBanco;

            gvBanco.DataSource = dtBanco;
            gvBanco.DataBind();

            ViewState["dicOrdenacion"] = dicOrdenacion;
        }

        private void LimpiarFiltro()
        {
            tboxNombreEmpresa.Text = "";
            tboxNombreProyecto.Text = "";
            tboxNumeroRes.Text = "";
            cboxTurno.SelectedIndex = -1;
            tboxHorario.Text = "";
        }

        private void GeneraExcel(DataTable _dtDatos)
        {
            oMensajes.RecuperarTablaMensajes("BancoProyectos.aspx");

            ExcelPackage ep = new ExcelPackage();
            ep.Workbook.Worksheets.Add("Hoja 1");
            ExcelWorksheet ew = ep.Workbook.Worksheets[0];

            //Titulo
            String sNombreReporte = oMensajes.TablaMensajes["lblTitulo"];
            ew.Cells["A1"].Value = sNombreReporte;
            ew.Cells["A1:U1"].Merge = true;
            ew.Cells["A1"].Style.Font.Bold = true;
            ew.Cells["A1"].Style.Font.Size = 16;
            ew.Cells["A1"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;

            //Encabezados
            Color cFondoTitulo = System.Drawing.ColorTranslator.FromHtml("#372d86");
            Color cLetraTitulo = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");

            ew.Cells["A3"].Value = oMensajes.TablaMensajes["gvBanco_Numero"];
            ew.Cells["A3"].Style.Font.Bold = true;
            ew.Cells["A3:U3"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
            ew.Cells["A3:U3"].Style.Fill.BackgroundColor.SetColor(cFondoTitulo);
            ew.Cells["A3:U3"].Style.Font.Bold = true;
            ew.Cells["A3:U3"].Style.Font.Size = 13;
            ew.Cells["A3:U3"].Style.Font.Color.SetColor(cLetraTitulo);
            ew.Cells["A3:U3"].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;

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
        #endregion
    }
}