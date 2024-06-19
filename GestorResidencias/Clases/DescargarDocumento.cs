using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using packWord = DocumentFormat.OpenXml.Packaging;
using procWord = DocumentFormat.OpenXml.Wordprocessing;

namespace GestorResidencias.Clases
{
    public class DescargarDocumento
    {
        #region Funciones
        public static void GenerarWordAnteproyecto(String _sIdPreliminaryDraft, String _sIdUser, String _sFilePath)
        {
            Anteproyecto oAnteproyecto = new Anteproyecto(_sIdPreliminaryDraft, _sIdUser, true);

            using (packWord.WordprocessingDocument wordDoc = packWord.WordprocessingDocument.Open(_sFilePath, true))
            {
                var body = wordDoc.MainDocumentPart.Document.Body;

                foreach (var text in body.Descendants<procWord.Text>()) // Busca todos los elementos Text en el documento
                {
                    switch (text.Text)
                    {
                        case "EtiquetaNombreProyecto":

                            string[] sDelimitadoresNP = new string[] { "|r|" };
                            string[] sNombreProyecto = oAnteproyecto.Nombre.Split(sDelimitadoresNP, StringSplitOptions.None);

                            foreach (string sParrafo in sNombreProyecto)
                            {
                                procWord.RunProperties runPropiedades = new procWord.RunProperties(
                                    new procWord.RunFonts() { Ascii = "Arial" },
                                    new procWord.FontSize() { Val = "24" }
                                );

                                procWord.Run rRun = new procWord.Run(
                                    runPropiedades,
                                    new procWord.Text(sParrafo.ToString())
                                );

                                procWord.Paragraph oParagraph = new procWord.Paragraph(rRun);

                                text.InsertBeforeSelf(oParagraph);
                            }

                            text.Text = text.Text.Replace("EtiquetaNombreProyecto", "");
                            break;
                        case "EtiquetaObjetivoProyecto":
                            string[] sDelimitadoresOP = new string[] { "|r|" };
                            string[] sObjetivoProyecto = oAnteproyecto.Objetivo.Split(sDelimitadoresOP, StringSplitOptions.None);

                            foreach (string sParrafo in sObjetivoProyecto)
                            {
                                procWord.RunProperties runPropiedades = new procWord.RunProperties(
                                    new procWord.RunFonts() { Ascii = "Arial" },
                                    new procWord.FontSize() { Val = "24" }
                                );

                                procWord.Run rRun = new procWord.Run(
                                    runPropiedades,
                                    new procWord.Text(sParrafo.ToString())
                                );

                                procWord.Paragraph oParagraph = new procWord.Paragraph(rRun);

                                text.InsertBeforeSelf(oParagraph);
                            }


                            text.Text = text.Text.Replace("EtiquetaObjetivoProyecto", "");
                            break;
                        case "EtiquetaJustificacion":
                            string[] sDelimitadoresJ = new string[] { "|r|" };
                            string[] sJustificacion = oAnteproyecto.Justificacion.Split(sDelimitadoresJ, StringSplitOptions.None);

                            foreach (string sParrafo in sJustificacion)
                            {
                                procWord.RunProperties runPropiedades = new procWord.RunProperties(
                                    new procWord.RunFonts() { Ascii = "Arial" },
                                    new procWord.FontSize() { Val = "24" }
                                );

                                procWord.Run rRun = new procWord.Run(
                                    runPropiedades,
                                    new procWord.Text(sParrafo.ToString())
                                );

                                procWord.Paragraph oParagraph = new procWord.Paragraph(rRun);

                                text.InsertBeforeSelf(oParagraph);
                            }

                            text.Text = text.Text.Replace("EtiquetaJustificacion", "");
                            break;
                        case "EtiquetaCronograma":
                            procWord.Table table = new procWord.Table();

                            procWord.TableProperties tableProps = new procWord.TableProperties(
                                new procWord.TableBorders(
                                        new procWord.TopBorder { Val = procWord.BorderValues.Single, Size = 3 },
                                        new procWord.BottomBorder { Val = procWord.BorderValues.Single, Size = 3 },
                                        new procWord.LeftBorder { Val = procWord.BorderValues.Single, Size = 3 },
                                        new procWord.RightBorder { Val = procWord.BorderValues.Single, Size = 3 },
                                        new procWord.InsideHorizontalBorder { Val = procWord.BorderValues.Single, Size = 3 },
                                        new procWord.InsideVerticalBorder { Val = procWord.BorderValues.Single, Size = 3 }
                                    )
                                );

                            table.AppendChild(tableProps);

                            procWord.TableRow trEncabezadoTabla = new procWord.TableRow();

                            procWord.TableCell tcActividades = new procWord.TableCell();
                            tcActividades.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "4500" }));
                            tcActividades.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("Actividades"))));

                            procWord.TableCell tcWeek1 = new procWord.TableCell();
                            tcWeek1.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek1.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("1"))));

                            procWord.TableCell tcWeek2 = new procWord.TableCell();
                            tcWeek2.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek2.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("2"))));

                            procWord.TableCell tcWeek3 = new procWord.TableCell();
                            tcWeek3.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek3.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("3"))));

                            procWord.TableCell tcWeek4 = new procWord.TableCell();
                            tcWeek4.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek4.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("4"))));

                            procWord.TableCell tcWeek5 = new procWord.TableCell();
                            tcWeek5.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek5.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("5"))));

                            procWord.TableCell tcWeek6 = new procWord.TableCell();
                            tcWeek6.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek6.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("6"))));

                            procWord.TableCell tcWeek7 = new procWord.TableCell();
                            tcWeek7.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek7.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("7"))));

                            procWord.TableCell tcWeek8 = new procWord.TableCell();
                            tcWeek8.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek8.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("8"))));

                            procWord.TableCell tcWeek9 = new procWord.TableCell();
                            tcWeek9.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek9.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("9"))));

                            procWord.TableCell tcWeek10 = new procWord.TableCell();
                            tcWeek10.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek10.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("10"))));

                            procWord.TableCell tcWeek11 = new procWord.TableCell();
                            tcWeek11.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek11.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("11"))));

                            procWord.TableCell tcWeek12 = new procWord.TableCell();
                            tcWeek12.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek12.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("12"))));

                            procWord.TableCell tcWeek13 = new procWord.TableCell();
                            tcWeek13.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek13.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("13"))));

                            procWord.TableCell tcWeek14 = new procWord.TableCell();
                            tcWeek14.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek14.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("14"))));

                            procWord.TableCell tcWeek15 = new procWord.TableCell();
                            tcWeek15.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek15.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("15"))));

                            procWord.TableCell tcWeek16 = new procWord.TableCell();
                            tcWeek16.Append(new procWord.TableCellProperties(
                                new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" }));
                            tcWeek16.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text("16"))));

                            trEncabezadoTabla.Append(tcActividades);
                            trEncabezadoTabla.Append(tcWeek1);
                            trEncabezadoTabla.Append(tcWeek2);
                            trEncabezadoTabla.Append(tcWeek3);
                            trEncabezadoTabla.Append(tcWeek4);
                            trEncabezadoTabla.Append(tcWeek5);
                            trEncabezadoTabla.Append(tcWeek6);
                            trEncabezadoTabla.Append(tcWeek7);
                            trEncabezadoTabla.Append(tcWeek8);
                            trEncabezadoTabla.Append(tcWeek9);
                            trEncabezadoTabla.Append(tcWeek10);
                            trEncabezadoTabla.Append(tcWeek11);
                            trEncabezadoTabla.Append(tcWeek12);
                            trEncabezadoTabla.Append(tcWeek13);
                            trEncabezadoTabla.Append(tcWeek14);
                            trEncabezadoTabla.Append(tcWeek15);
                            trEncabezadoTabla.Append(tcWeek16);

                            table.Append(trEncabezadoTabla);



                            DataTable dtActividadesC = AnteproyectoCronograma.ObtieneMisActividades(_sIdPreliminaryDraft);

                            foreach (DataRow dr in dtActividadesC.Rows)
                            {
                                procWord.TableRow trAct = new procWord.TableRow();

                                procWord.TableCell tcNombreActividad = new procWord.TableCell();
                                tcNombreActividad.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "3500" }));
                                tcNombreActividad.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(dr["NombreActividad"].ToString()))));

                                procWord.TableCell tcSemana1 = new procWord.TableCell();
                                tcSemana1.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana1"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana1.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana2 = new procWord.TableCell();
                                tcSemana2.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana2"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana2.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana3 = new procWord.TableCell();
                                tcSemana3.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana3"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana3.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana4 = new procWord.TableCell();
                                tcSemana4.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana4"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana4.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana5 = new procWord.TableCell();
                                tcSemana5.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana5"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana5.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana6 = new procWord.TableCell();
                                tcSemana6.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana6"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana6.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana7 = new procWord.TableCell();
                                tcSemana7.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana7"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana7.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana8 = new procWord.TableCell();
                                tcSemana8.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana8"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana8.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana9 = new procWord.TableCell();
                                tcSemana9.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana9"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana9.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana10 = new procWord.TableCell();
                                tcSemana10.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana10"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana10.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana11 = new procWord.TableCell();
                                tcSemana11.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana11"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana11.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana12 = new procWord.TableCell();
                                tcSemana12.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana12"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana12.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana13 = new procWord.TableCell();
                                tcSemana13.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana13"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana13.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana14 = new procWord.TableCell();
                                tcSemana14.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana14"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana14.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana15 = new procWord.TableCell();
                                tcSemana15.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana15"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana15.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                procWord.TableCell tcSemana16 = new procWord.TableCell();
                                tcSemana16.Append(new procWord.TableCellProperties(
                                    new procWord.TableCellWidth { Type = procWord.TableWidthUnitValues.Dxa, Width = "200" },
                                    new procWord.Shading { Fill = (dr["Semana16"].ToString() == "False" ? "#FFFFFF" : "#000000"), Val = procWord.ShadingPatternValues.Clear }
                                ));
                                tcSemana16.Append(new procWord.Paragraph(new procWord.Run(new procWord.Text(""))));

                                trAct.Append(tcNombreActividad);
                                trAct.Append(tcSemana1);
                                trAct.Append(tcSemana2);
                                trAct.Append(tcSemana3);
                                trAct.Append(tcSemana4);
                                trAct.Append(tcSemana5);
                                trAct.Append(tcSemana6);
                                trAct.Append(tcSemana7);
                                trAct.Append(tcSemana8);
                                trAct.Append(tcSemana9);
                                trAct.Append(tcSemana10);
                                trAct.Append(tcSemana11);
                                trAct.Append(tcSemana12);
                                trAct.Append(tcSemana13);
                                trAct.Append(tcSemana14);
                                trAct.Append(tcSemana15);
                                trAct.Append(tcSemana16);

                                table.Append(trAct);
                            }

                            text.Text = text.Text.Replace("EtiquetaCronograma", "");
                            text.InsertAfterSelf(table);

                            break;
                        case "EtiquetaDescripcionActividades":
                            DataTable dtActividades = AnteproyectoCronograma.ObtieneMisActividades(_sIdPreliminaryDraft);

                            procWord.Paragraph oParagraphSalto = new procWord.Paragraph();
                            var rBreak = new procWord.Run(new procWord.Break());
                            text.InsertBeforeSelf(oParagraphSalto);

                            foreach (DataRow dr in dtActividades.Rows)
                            {
                                procWord.RunProperties runPropiedades = new procWord.RunProperties(
                                    new procWord.RunFonts() { Ascii="Arial"},
                                    new procWord.FontSize() { Val="24"}
                                );

                                procWord.Run rRun = new procWord.Run(
                                    runPropiedades,
                                    new procWord.Text(dr["NombreActividad"].ToString() + ": " + dr["Description"].ToString())
                                );

                                procWord.Paragraph oParagraph = new procWord.Paragraph(rRun);

                                var runForBreak = new procWord.Run(new procWord.Break());

                                oParagraph.Append(runForBreak);

                                text.InsertBeforeSelf(oParagraph);
                            }

                            text.Text = text.Text.Replace("EtiquetaDescripcionActividades", "");


                            break;
                        case "EtiquetaAlcanceProyecto":
                            string[] sDelimitadoresAP = new string[] { "|r|" };
                            string[] sAlcanceProyecto = oAnteproyecto.AlcanceProyecto.Split(sDelimitadoresAP, StringSplitOptions.None);

                            foreach (string sParrafo in sAlcanceProyecto)
                            {
                                procWord.RunProperties runPropiedades = new procWord.RunProperties(
                                    new procWord.RunFonts() { Ascii = "Arial" },
                                    new procWord.FontSize() { Val = "24" }
                                );

                                procWord.Run rRun = new procWord.Run(
                                    runPropiedades,
                                    new procWord.Text(sParrafo.ToString())
                                );

                                procWord.Paragraph oParagraph = new procWord.Paragraph(rRun);

                                text.InsertBeforeSelf(oParagraph);
                            }

                            text.Text = text.Text.Replace("EtiquetaAlcanceProyecto", "");
                            break;
                        case "EtiquetaLugarRealizaraProyecto":
                            text.Text = text.Text.Replace("EtiquetaLugarRealizaraProyecto", oAnteproyecto.Lugar);
                            break;
                        case "EtiquetaNombreEmpresa":
                            text.Text = text.Text.Replace("EtiquetaNombreEmpresa", oAnteproyecto.NombreEmpresa);
                            break;
                        case "EtiquetaDomicilio":
                            String sDomicilio = oAnteproyecto.CalleEmpresa + ", Ext." + oAnteproyecto.NumeroExteriorEmpresa + (oAnteproyecto.NumeroInteriorEmpresa != "" ? ", Int." + oAnteproyecto.NumeroInteriorEmpresa : "")
                                + ", " + oAnteproyecto.ColoniaEmpresa + ", C.P." + oAnteproyecto.CodigoPostaEmpresa + ", " + oAnteproyecto.CiudadEmpresa + ", " + oAnteproyecto.MunicipioEmpresa + ", " + oAnteproyecto.EstadoEmpresa + ".";

                            text.Text = text.Text.Replace("EtiquetaDomicilio", sDomicilio);
                            break;
                        case "EtiquetaCiudad":
                            text.Text = text.Text.Replace("EtiquetaCiudad", oAnteproyecto.CiudadEmpresa);
                            break;
                        case "EtiquetaCP":
                            text.Text = text.Text.Replace("EtiquetaCP", oAnteproyecto.CodigoPostaEmpresa);
                            break;
                        case "EtiquetaEstado":
                            text.Text = text.Text.Replace("EtiquetaEstado", oAnteproyecto.EstadoEmpresa);
                            break;
                        case "EtiquetaTelefono":
                            text.Text = text.Text.Replace("EtiquetaTelefono", oAnteproyecto.TelefonoOficinaEmpresa);
                            break;
                        case "EtiquetaGiroEmpresa":
                            text.Text = text.Text.Replace("EtiquetaGiroEmpresa", oAnteproyecto.GiroEmpresa);
                            break;
                        case "EtiquetaDepartamento":
                            text.Text = text.Text.Replace("EtiquetaDepartamento", oAnteproyecto.DepartamentoEmpresa);
                            break;
                        case "EtiquetaNombreGerente":
                            text.Text = text.Text.Replace("EtiquetaNombreGerente", oAnteproyecto.DuenioEmpresa);
                            break;
                        case "EtiquetaJefeArea":
                            text.Text = text.Text.Replace("EtiquetaJefeArea", oAnteproyecto.JefeAreaEmpresa);
                            break;
                        case "EtiquetaNumeroControl":
                            text.Text = text.Text.Replace("EtiquetaNumeroControl", oAnteproyecto.NumeroControlUsuario);
                            break;
                        case "EtiquetaCarrera":
                            text.Text = text.Text.Replace("EtiquetaCarrera", ValoresPorReferencia.ObtieneDatoValorPorReferencia("Carreras", oAnteproyecto.IdCareerUsuario));
                            break;
                        case "EtiquetaNombreResidente":
                            text.Text = text.Text.Replace("EtiquetaNombreResidente", oAnteproyecto.NombreUsuario);
                            break;
                        case "EtiquetaCorreo":
                            text.Text = text.Text.Replace("EtiquetaCorreo", oAnteproyecto.EmailUsuario);
                            break;
                        case "EtiquetaTelefonoResidente":
                            text.Text = text.Text.Replace("EtiquetaTelefonoResidente", oAnteproyecto.CelularUsuario);
                            break;
                    }
                }
                wordDoc.MainDocumentPart.Document.Save(); // Guarda los cambios en el documento
            }
        }

        public static void GenerarWordSolicitud(String _sIdRequest, String _sidUser, String _sFilePath)
        {
            Solicitud oSolicitud = new Solicitud(_sIdRequest, _sidUser);

            using (packWord.WordprocessingDocument wordDoc = packWord.WordprocessingDocument.Open(_sFilePath, true))
            {
                var body = wordDoc.MainDocumentPart.Document.Body;

                foreach (var text in body.Descendants<procWord.Text>()) // Busca todos los elementos Text en el documento
                {
                    switch (text.Text)
                    {
                        case "EtiquetaLugar":
                            text.Text = text.Text.Replace("EtiquetaLugar", oSolicitud.Lugar);
                            break;
                        case "EtiquetaFecha":
                            text.Text = text.Text.Replace("EtiquetaFecha", (oSolicitud.Fecha != "" ? DateTime.Parse(oSolicitud.Fecha).ToString("dd/MM/yyyy") : ""));
                            break;
                        case "EtiquetaNombreProyecto":
                            text.Text = text.Text.Replace("EtiquetaNombreProyecto", oSolicitud.NombreProyecto);
                            break;
                        case "BP1":
                            if (oSolicitud.IdProcedenciaProyecto == "1")
                            {
                                text.Text = text.Text.Replace("BP1", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("BP1", "");
                            }
                            break;
                        case "BP2":
                            if (oSolicitud.IdProcedenciaProyecto == "2")
                            {
                                text.Text = text.Text.Replace("BP2", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("BP2", "");
                            }
                            break;
                        case "BP3":
                            if (oSolicitud.IdProcedenciaProyecto == "3")
                            {
                                text.Text = text.Text.Replace("BP3", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("BP3", "");
                            }
                            break;
                        case "EtiquetaPeriodo":
                            text.Text = text.Text.Replace("EtiquetaPeriodo", ValoresPorReferencia.ObtieneDatoValorPorReferencia("Periodo", oSolicitud.IdPeriod) + " " + oSolicitud.Anio);
                            break;
                        case "EtiquetaNumeroRes":
                            text.Text = text.Text.Replace("EtiquetaNumeroRes", oSolicitud.NumeroResidentes);
                            break;
                        case "EtiquetaNombreFiscalE":
                            text.Text = text.Text.Replace("EtiquetaNombreFiscalE", oSolicitud.NombreEmpresa);
                            break;
                        case "R1":
                            if (oSolicitud.IdRamoEmpresa == "1")
                            {
                                text.Text = text.Text.Replace("R1", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("R1", "");
                            }
                            break;
                        case "R2":
                            if (oSolicitud.IdRamoEmpresa == "2")
                            {
                                text.Text = text.Text.Replace("R2", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("R2", "");
                            }
                            break;
                        case "R3":
                            if (oSolicitud.IdRamoEmpresa == "3")
                            {
                                text.Text = text.Text.Replace("R3", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("R3", "");
                            }
                            break;
                        case "S1":
                            if (oSolicitud.IdSectorEmpresa == "1")
                            {
                                text.Text = text.Text.Replace("S1", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("S1", "");
                            }
                            break;
                        case "S2":
                            if (oSolicitud.IdSectorEmpresa == "2")
                            {
                                text.Text = text.Text.Replace("S2", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("S2", "");
                            }
                            break;
                        case "S3":
                            if (oSolicitud.IdSectorEmpresa == "3")
                            {
                                text.Text = text.Text.Replace("S3", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("S3", "");
                            }
                            break;
                        case "S4":
                            if (oSolicitud.IdSectorEmpresa == "4")
                            {
                                text.Text = text.Text.Replace("S4", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("S4", "");
                            }
                            break;
                        case "EtiquetaRFC":
                            text.Text = text.Text.Replace("EtiquetaRFC", oSolicitud.RFCEmpresa);
                            break;
                        case "EtiquetaCallE":
                            text.Text = text.Text.Replace("EtiquetaCallE", oSolicitud.CalleEmpresa);
                            break;
                        case "EtiquetaNumExtE":
                            text.Text = text.Text.Replace("EtiquetaNumExtE", oSolicitud.NumExteriorEmpresa);
                            break;
                        case "EtiquetaNumIntN":
                            text.Text = text.Text.Replace("EtiquetaNumIntN", oSolicitud.NumInteriorEmpresa);
                            break;
                        case "EtiquetaColoniaE":
                            text.Text = text.Text.Replace("EtiquetaColoniaE", oSolicitud.ColoniaEmpresa);
                            break;
                        case "EtiquetaMunicipioE":
                            text.Text = text.Text.Replace("EtiquetaMunicipioE", oSolicitud.MunicipioEmpresa);
                            break;
                        case "EtiquetaCPE":
                            text.Text = text.Text.Replace("EtiquetaCPE", oSolicitud.CodigoPostalEmpresa);
                            break;
                        case "EtiquetaTelefonoE":
                            text.Text = text.Text.Replace("EtiquetaTelefonoE", oSolicitud.TelefonoOficEmpresa);
                            break;
                        case "EtiquetaFaxE":
                            text.Text = text.Text.Replace("EtiquetaFaxE", oSolicitud.FaxEmpresa);
                            break;
                        case "EtiquetaMisionE":
                            text.Text = text.Text.Replace("EtiquetaMisionE", oSolicitud.MisionEmpresa);
                            break;
                        case "TE1":
                            if (oSolicitud.IdTamanioEmpresa == "1")
                            {
                                text.Text = text.Text.Replace("TE1", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("TE1", "");
                            }
                            break;
                        case "TE2":
                            if (oSolicitud.IdTamanioEmpresa == "2")
                            {
                                text.Text = text.Text.Replace("TE2", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("TE2", "");
                            }
                            break;
                        case "TE3":
                            if (oSolicitud.IdTamanioEmpresa == "3")
                            {
                                text.Text = text.Text.Replace("TE3", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("TE3", "");
                            }
                            break;
                        case "TE4":
                            if (oSolicitud.IdTamanioEmpresa == "4")
                            {
                                text.Text = text.Text.Replace("TE4", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("TE4", "");
                            }
                            break;
                        case "EtiquetaNombreTitularE":
                            text.Text = text.Text.Replace("EtiquetaNombreTitularE", oSolicitud.NombreTitularEmpresa);
                            break;
                        case "EtiquetaNombreAsesorExt":
                            text.Text = text.Text.Replace("EtiquetaNombreAsesorExt", oSolicitud.NombreAsesorExterno);
                            break;
                        case "EtiquetaPuestoAsesorExt":
                            text.Text = text.Text.Replace("EtiquetaPuestoAsesorExt", oSolicitud.PuestoAsesorExterno);
                            break;
                        case "EtiquetaNombrePS":
                            text.Text = text.Text.Replace("EtiquetaNombrePS", oSolicitud.NombrePSeguimiento);
                            break;
                        case "EtiquetaPuestoPS":
                            text.Text = text.Text.Replace("EtiquetaPuestoPS", oSolicitud.PuestoPSeguimiento);
                            break;
                        case "EtiquetaEmailPS":
                            text.Text = text.Text.Replace("EtiquetaEmailPS", oSolicitud.EmailPSeguimiento);
                            break;
                        case "EtiquetaCelularPS":
                            text.Text = text.Text.Replace("EtiquetaCelularPS", oSolicitud.CelularPSeguimiento);
                            break;
                        case "EtiquetaTelefonoPS":
                            text.Text = text.Text.Replace("EtiquetaTelefonoPS", oSolicitud.TelefonoOficPSeguimiento);
                            break;
                        case "EtiquetaNombreR":
                            text.Text = text.Text.Replace("EtiquetaNombreR", oSolicitud.NombreUsuario);
                            break;
                        case "EtiquetaSemestreR":
                            text.Text = text.Text.Replace("EtiquetaSemestreR", oSolicitud.SemestreUsuario);
                            break;
                        case "EtiquetaCarreraR":
                            text.Text = text.Text.Replace("EtiquetaCarreraR", ValoresPorReferencia.ObtieneDatoValorPorReferencia("Carreras", oSolicitud.IdCarreraUsuario));
                            break;
                        case "EtiquetaNoControlR":
                            text.Text = text.Text.Replace("EtiquetaNoControlR", oSolicitud.NumeroControlUsuario);
                            break;
                        case "EtiquetaCalleR":
                            text.Text = text.Text.Replace("EtiquetaCalleR", oSolicitud.CalleUsuario);
                            break;
                        case "EtiquetaNumExtR":
                            text.Text = text.Text.Replace("EtiquetaNumExtR", oSolicitud.NumeroExteriorUsuario);
                            break;
                        case "EtiquetaNumIntR":
                            text.Text = text.Text.Replace("EtiquetaNumIntR", oSolicitud.NumeroInteriorUsuario);
                            break;
                        case "EtiquetaColoniaR":
                            text.Text = text.Text.Replace("EtiquetaColoniaR", oSolicitud.ColoniaUsuario);
                            break;
                        case "EtiquetaMunicipioR":
                            text.Text = text.Text.Replace("EtiquetaMunicipioR", oSolicitud.MunicipioUsuario);
                            break;
                        case "EtiquetaCPR":
                            text.Text = text.Text.Replace("EtiquetaCPR", oSolicitud.NumeroPostalUsuario);
                            break;
                        case "EtiquetaEmailR":
                            text.Text = text.Text.Replace("EtiquetaEmailR", oSolicitud.EmailUsuario);
                            break;
                        case "SS1":
                            if (oSolicitud.IdSeguroSocialUsuario == "2")
                            {
                                text.Text = text.Text.Replace("SS1", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("SS1", "");
                            }
                            break;
                        case "SS2":
                            if (oSolicitud.IdSeguroSocialUsuario == "3")
                            {
                                text.Text = text.Text.Replace("SS2", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("SS2", "");
                            }
                            break;
                        case "SS3":
                            if (oSolicitud.IdSeguroSocialUsuario == "1")
                            {
                                text.Text = text.Text.Replace("SS3", "X");
                            }
                            else
                            {
                                text.Text = text.Text.Replace("SS3", "");
                            }
                            break;
                        case "EtiquetaCualR":
                            text.Text = text.Text.Replace("EtiquetaCualR", oSolicitud.OtraSeguridadSocialUsuario);
                            break;
                        case "EtiquetaNSSR":
                            text.Text = text.Text.Replace("EtiquetaNSSR", oSolicitud.NSSUsuario);
                            break;
                        case "EtiquetaTelefonoR":
                            text.Text = text.Text.Replace("EtiquetaTelefonoR", oSolicitud.TelefonoUsuario);
                            break;
                        case "EtiquetaCelularR":
                            text.Text = text.Text.Replace("EtiquetaCelularR", oSolicitud.CelularUsuario);
                            break;
                    }
                }
                wordDoc.MainDocumentPart.Document.Save(); // Guarda los cambios en el documento
            }
        }
        #endregion
    }
}