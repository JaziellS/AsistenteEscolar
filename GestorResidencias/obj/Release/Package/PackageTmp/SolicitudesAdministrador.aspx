<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="SolicitudesAdministrador.aspx.cs" Inherits="GestorResidencias.SolicitudesAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Assets/CSS/EstilosResponsivos.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        li.multiselect-selected a {
            background-color: none;
        }    
        
        .swal-overlay {
            z-index: 99999;
        }

        #ui-datepicker-div {
            z-index: 99999 !important;
        }

        @media screen and (min-width:993px) {
            .modal-responsivo {
                width: 900px;
            }
        }

        @media screen and (min-width:769px) {
            .modal-responsivo2 {
                width: 600px;
            }
        }
    </style>
    <style type="text/css">
        .background-titulo {
            background-image: url(Assets/Imagenes/Fondos/Solicitud.png);
            color:white;
            background-position: 100% 100%;
            text-align:center;
            background-size: cover;
            background-repeat:no-repeat;
            padding-top: 12.5rem;
            padding-bottom: 2rem;
        }
    </style>
    <script type="text/javascript">
        var xPos, yPos;

        function ScrollTab() {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(BeginRequestHandler);
            prm.add_endRequest(EndRequestHandler);
        }

        function BeginRequestHandler(sender, args) {
            try {
                xPos = $get('ScrollDiv').scrollLeft;
                yPos = $get('ScrollDiv').scrollTop;
            } catch {

            }
        }

        function EndRequestHandler(sender, args) {
            try {
                $get('ScrollDiv').scrollLeft = xPos;
                $get('ScrollDiv').scrollTop = yPos;
            } catch {

            }
        }
    </script>
    <script type="text/javascript">
        function iskeyPress(keyCode) {
            if (keyCode == 13) {
                document.getElementById("<%=btnBuscar.ClientID%>").focus();
                document.getElementById("<%=btnBuscar.ClientID%>").style.backgroundColor = "#AEB6BF"
            }
        }
    </script>
    <div class="contenidopagina">
        <div class="background-titulo">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <asp:Label ID="lblTitulo" runat="server" Text="lblTitulo" CssClass="fontbold" style="font-size:50px;"></asp:Label>
                    </div>
                </div>
                <br />
            </div>
        </div>
        <div class="container">
            <br />
            <div class="row">
                <div class="col-12 col-sm-12 col-md-12">
                    <asp:ImageButton ID="ibtnRetroceder" CssClass="ibtn-hover-general" runat="server" CausesValidation="false" OnClick="ibtnRetroceder_Click"/>
                </div>
            </div>
            <div class="container-fluid text-center">
                <asp:Label ID="lblDescripcionModulo" runat="server" Text="lblDescripcionModulo" CssClass="text-muted"></asp:Label>
            </div>
            <br />
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server" ID="up1">
                <ContentTemplate>
                    <div class="row" style="margin-bottom:20px;">
                        <div class="col-12 col-sm-12 col-md-4 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblPeriodo" Text="lblPeriodo" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxPeriodo" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="cboxPeriodo_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col-12 col-sm-12 col-md-2 col-lg-1" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblAnio" Text="lblAnio" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxAnio" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" AutoPostBack="true" OnTextChanged="cboxPeriodo_SelectedIndexChanged"></asp:TextBox>
                            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server"
                                ErrorTooltipEnabled="true" 
                                InputDirection="RightToLeft" 
                                CultureName="es-ES" 
                                MaskType="Number" Mask="9999" TargetControlID="tboxAnio"/>
                        </div>
                    </div>
                    <div style="background-color:#F4F4F4; padding:30px; border-radius:20px;">
                        <div id="divTabla" runat="server">
                            <div class="row" style="margin-bottom:30px;">
                                <div class="col-12 col-sm-12 col-md-12 text-center">
                                    <asp:Label runat="server" ID="lblPeriodoDes" CssClass="text-muted h3"></asp:Label>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom:20px;">
                                <div class="col-12 col-sm-12 col-md-2 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNoControl" Text="lblNoControl" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNoControl" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" OnTextChanged="tboxNoControl_TextChanged" AutoPostBack="true"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblAlumno" Text="lblAlumno" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxAlumno" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" OnTextChanged="tboxNoControl_TextChanged" AutoPostBack="true"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreProyecto" Text="lblNombreProyecto" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreProyecto" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" OnTextChanged="tboxNoControl_TextChanged" AutoPostBack="true"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEmpresa" Text="lblEmpresa" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxEmpresa" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" OnTextChanged="tboxNoControl_TextChanged" AutoPostBack="true"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEstatus" Text="lblEstatus" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxEstatus" CssClass="form-select fontsizeh6" OnSelectedIndexChanged="tboxNoControl_TextChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>
                            </div>
                            <asp:Button ID="btnBuscar" runat="server" style="display:none;" OnClick="tboxNoControl_TextChanged"/>
                            <div class="row" style="margin-bottom:20px;">
                                <div class="col-12 col-sm-4 col-md-3 offset-sm-8 offset-md-9">
                                    <asp:Button runat="server" ID="btnNotificarTodos" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" Text="btnNotificarTodos" OnClick="btnNotificarTodos_Click"/>
                                </div>
                            </div>
                            <div id="ScrollDiv" style="overflow-x:auto;">
                                <asp:GridView ID="gvSolicitudes" runat="server" AllowPaging="True" PageSize="7" OnPageIndexChanging="gvSolicitudes_PageIndexChanging" OnSorting="gvSolicitudes_Sorting" OnRowCreated="gvSolicitudes_RowCreated" OnRowCommand="gvSolicitudes_RowCommand"
                                    CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6" style="word-wrap: break-word;" AllowSorting="True" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="IdRequest, IdUser, IdTypeState, EstatusCalificacion">
                                <Columns>
                                    <asp:BoundField DataField="IdRequest" HeaderText="IdRequest"/>
                                    <asp:BoundField DataField="IdUser" HeaderText="IdUser"/>
                                    <asp:BoundField DataField="Lugar" HeaderText="Lugar"/>
                                    <asp:BoundField DataField="Fecha" HeaderText="Fecha"/>
                                    <asp:BoundField DataField="ProcedenciaDelProyecto" HeaderText="ProcedenciaDelProyecto"/>
                                    <asp:BoundField DataField="NumeroResidentes" HeaderText="NumeroResidentes"/>
                                    <asp:BoundField DataField="PeriodoProyectado" HeaderText="PeriodoProyectado"/>
                                    <asp:BoundField DataField="Anio" HeaderText="Anio"/>
                                    <asp:BoundField DataField="RamoEmpresa" HeaderText="RamoEmpresa"/>
                                    <asp:BoundField DataField="SectorEmpresa" HeaderText="SectorEmpresa"/>
                                    <asp:BoundField DataField="RFCEmpresa" HeaderText="RFCEmpresa"/>
                                    <asp:BoundField DataField="TelefonoOficina" HeaderText="TelefonoOficina"/>
                                    <asp:BoundField DataField="FaxEmpresa" HeaderText="FaxEmpresa"/>
                                    <asp:BoundField DataField="TamanioEmpresa" HeaderText="TamanioEmpresa"/>
                                    <asp:BoundField DataField="MisionEmpresa" HeaderText="MisionEmpresa"/>
                                    <asp:BoundField DataField="NombreTitular" HeaderText="NombreTitular"/>
                                    <asp:BoundField DataField="NombreAsesorExterno" HeaderText="NombreAsesorExterno"/>
                                    <asp:BoundField DataField="PuestoAsesorExterno" HeaderText="PuestoAsesorExterno"/>
                                    <asp:BoundField DataField="CalleEmpresa" HeaderText="CalleEmpresa"/>
                                    <asp:BoundField DataField="NumeroExteriorEmpresa" HeaderText="NumeroExteriorEmpresa"/>
                                    <asp:BoundField DataField="NumeroInteriorEmpresa" HeaderText="NumeroInteriorEmpresa"/>
                                    <asp:BoundField DataField="ColoniaEmpresa" HeaderText="ColoniaEmpresa"/>
                                    <asp:BoundField DataField="MunicipioEmpresa" HeaderText="MunicipioEmpresa"/>
                                    <asp:BoundField DataField="NumeroPostalEmpresa" HeaderText="NumeroPostalEmpresa"/>
                                    <asp:BoundField DataField="NombrePSeguimiento" HeaderText="NombrePSeguimiento"/>
                                    <asp:BoundField DataField="PuestoPSeguimiento" HeaderText="PuestoPSeguimiento"/>
                                    <asp:BoundField DataField="EmailPSeguimiento" HeaderText="EmailPSeguimiento"/>
                                    <asp:BoundField DataField="CelularPSeguimiento" HeaderText="CelularPSeguimiento"/>
                                    <asp:BoundField DataField="TelefonoPSeguimiento" HeaderText="TelefonoPSeguimiento"/>
                                    <asp:BoundField DataField="SemestreResidente" HeaderText="SemestreResidente"/>
                                    <asp:BoundField DataField="CarreraResidente" HeaderText="CarreraResidente"/>
                                    <asp:BoundField DataField="SeguridadSocialResidente" HeaderText="SeguridadSocialResidente"/>
                                    <asp:BoundField DataField="OtraSeguridadSocialResidente" HeaderText="OtraSeguridadSocialResidente"/>
                                    <asp:BoundField DataField="NSSResidente" HeaderText="NSSResidente"/>
                                    <asp:BoundField DataField="TelefonoResidente" HeaderText="TelefonoResidente"/>
                                    <asp:BoundField DataField="CelularResidente" HeaderText="CelularResidente"/>
                                    <asp:BoundField DataField="CalleResidente" HeaderText="CalleResidente"/>
                                    <asp:BoundField DataField="NumeroExteriorResidente" HeaderText="NumeroExteriorResidente"/>
                                    <asp:BoundField DataField="NumeroInteriorResidente" HeaderText="NumeroInteriorResidente"/>
                                    <asp:BoundField DataField="ColoniaResidente" HeaderText="ColoniaResidente"/>
                                    <asp:BoundField DataField="MunicipioResidente" HeaderText="MunicipioResidente"/>
                                    <asp:BoundField DataField="NumeroPostalResidente" HeaderText="NumeroPostalResidente"/>
                                    <asp:BoundField DataField="IdTypeState" HeaderText="IdTypeState"/>
                                    <asp:BoundField DataField="EstatusCalificacion" HeaderText="EstatusCalificacion"/>
                                    <asp:TemplateField HeaderText="NumeroControResidente" SortExpression="NumeroControResidente">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NumeroControResidente") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("NumeroControResidente") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="NombreResidente" SortExpression="NombreResidente">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NombreResidente") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("NombreResidente") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="EmailResidente" SortExpression="EmailResidente">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("EmailResidente") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("EmailResidente") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                        
                                    <asp:TemplateField HeaderText="NombreProyecto" SortExpression="NombreProyecto">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("NombreProyecto") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("NombreProyecto") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                      
                                    <asp:TemplateField HeaderText="NombreEmpresa" SortExpression="NombreEmpresa">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox41" runat="server" Text='<%# Bind("NombreEmpresa") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label41" runat="server" Text='<%# Bind("NombreEmpresa") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="EstatusSolicitud" SortExpression="EstatusSolicitud">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox42" runat="server" Text='<%# Bind("EstatusSolicitud") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label42" runat="server" Text='<%# Bind("EstatusSolicitud") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ComentarioCancelacion" SortExpression="ComentarioCancelacion">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox43" runat="server" Text='<%# Bind("ComentarioCancelacion") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label43" runat="server" Text='<%# Bind("ComentarioCancelacion") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DescargarFicha" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ID="DescargarFicha" CssClass="ibtn-hover-general" CommandArgument="<%# Container.DataItemIndex %>"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Ver" ItemStyle-HorizontalAlign="Center"/>                      
                                    <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Calificar" ItemStyle-HorizontalAlign="Center"/>                      
                                    <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Eliminar calificacion" ItemStyle-HorizontalAlign="Center"/>                        
                                    <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Notificar alumno" ItemStyle-HorizontalAlign="Center"/>                        
                                </Columns>   
                                     <PagerSettings FirstPageText="&amp;lt; &amp;lt;" LastPageText="&amp;gt; &amp;gt;" Mode="NumericFirstLast" PageButtonCount="5" PreviousPageText="&amp;lt; " />
                                     <PagerStyle CssClass="pager-row"/>
                                </asp:GridView>
                            </div>
                        </div>
                        <div id="divSinRegistros" runat="server">
                            <div class="row text-center">
                                <div class="col-12 col-sm-12 col-md-12">
                                    <asp:Label ID="lblSinRegistros" runat="server" Text="lblSinRegistros" CssClass="text-muted"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
            <div class="row">
                <div class="col-12 col-md-2 col-sm-3 offset-md-10 offset-sm-9">
                    <asp:Button runat="server" ID="btnDescargar" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" Text="btnDescargar" OnClick="btnDescargar_Click"/>
                </div>
            </div>

            <asp:Button ID="Button1" runat="server" style="display:none"/> 
            <ajaxToolkit:ModalPopupExtender runat="server" ID="modCancelarSolicitud" TargetControlID="Button1" BackgroundCssClass="modalBackground" PopupControlID="pCancelarSolicitud"></ajaxToolkit:ModalPopupExtender>
            <asp:Panel runat="server" ID="pCancelarSolicitud" CssClass="modal-responsivo2" style="display:none; background-color:white;">
                <asp:UpdatePanel runat="server" ID="up2">
                    <ContentTemplate>
                        <div class="modal-headers">
                            <div class="alineacion-vertical">
                                <div class="text-center container">
                                    <asp:Label ID="lblDescripcionModuloMod" runat="server" Text="lblDescripcionModuloMod" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                                </div>
                                <asp:ImageButton runat="server" CssClass="ibtn-hover-general" ID="ibtnCerrarMod" OnClick="ibtnCerrarMod_Click"/>
                            </div>
                        </div>
                        <div class="modal-bodys">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12">
                                    <asp:Label runat="server" ID="lblComentarioMod" Text="lblComentarioMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxComentarioMod" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="6"></asp:TextBox> 
                                    <asp:RequiredFieldValidator runat="server" ID="rfvComentarioMod" CssClass="campo-obligatorio" ControlToValidate="tboxComentarioMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarComentarioCancelado"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footers">
                            <div class="row">
                                <div class="col-12 col-sm-4 col-md-3 offset-sm-8 offset-md-9">
                                    <asp:Button runat="server" ID="btnNotificarMod" Text="btnNotificarMod" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnNotificarMod_Click" ValidationGroup="AgregarComentarioCancelado"/>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>


            <asp:Button ID="Button2" runat="server" style="display:none"/> 
            <ajaxToolkit:ModalPopupExtender runat="server" ID="modSolicitud" TargetControlID="Button2" BackgroundCssClass="modalBackground" PopupControlID="PSolicitud"></ajaxToolkit:ModalPopupExtender>
            <asp:Panel runat="server" ID="PSolicitud" CssClass="modal-responsivo" style="display:none; background-color:white;">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <div class="modal-headers text-center">
                            <div class="alineacion-vertical">
                                <div class="text-center container">
                                    <asp:Label ID="lblDescripcionModuloModS" runat="server" Text="lblDescripcionModuloModS" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                                </div>
                                <asp:ImageButton runat="server" CssClass="ibtn-hover-general" ID="ibtnCerrarModS" OnClick="ibtnCerrarModS_Click"/>
                            </div>
                        </div>
                        <div class="modal-bodys" style="max-height:450px; overflow-y:auto">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-7 col-lg-6" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblLugarModS" Text="lblLugarModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxLugarS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-5 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblFechaModS" Text="lblFechaModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxFechaModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreProyectoModS" Text="lblNombreProyectoModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreProyectoModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-6 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblProcedenciaProyectoModS" Text="lblProcedenciaProyectoModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxProcedenciaProyectoModS" CssClass="form-control fontsizeh6"></asp:DropDownList>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNumeroResidentesModS" Text="lblNumeroResidentesModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNumeroResidentesModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom:20px;">
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblPeriodoModS" Text="lblPeriodoModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxPeriodoModS" CssClass="form-control fontsizeh6"></asp:DropDownList>
                                </div>
                                <div class="col-12 col-sm-12 col-md-2 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblAnioModS" Text="lblAnioModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxAnioModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row text-center">
                                <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                                    <asp:Label ID="lblDatosEmpresaEModS" runat="server" Text="lblDatosEmpresaEModS" CssClass="h4 fontbold"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreFiscalEModS" Text="lblNombreFiscalEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreFiscalEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblRamoEModS" Text="lblRamoEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxRamoEModS" CssClass="form-select fontsizeh6"></asp:DropDownList>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblSectorEModS" Text="lblSectorEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxSectorEModS" CssClass="form-select fontsizeh6"></asp:DropDownList>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblRFCEModS" Text="lblRFCEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxRFCEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblTelefonoEModS" Text="lblTelefonoEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxTelefonoEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblFaxEModS" Text="lblFaxEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxFaxEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblTamanioEmpresaEModS" Text="lblTamanioEmpresaEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxTamanioEmpresaEModS" CssClass="form-select fontsizeh6"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblMisionEModS" Text="lblMisionEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxMisionEModS" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom:20px;">
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreTitularEModS" Text="lblNombreTitularEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreTitularEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreAseExtEModS" Text="lblNombreAseExtEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreAseExtEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblPuestoAseExtEModS" Text="lblPuestoAseExtEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxPuestoAseExtEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                                    <asp:Label ID="lblDomicilioEModS" runat="server" Text="lblDomicilioEModS" CssClass="h5"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCalleEModS" Text="lblCalleEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxCalleEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNumExtEModS" Text="lblNumExtEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNumExtEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNumIntEModS" Text="lblNumIntEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNumIntEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom:20px;">
                                <div class="col-12 col-sm-12 col-md-5 col-lg-5" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblColoniaEModS" Text="lblColoniaEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxColoniaEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblMunicipioEModS" Text="lblMunicipioEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxMunicipioEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCPEModS" Text="lblCPEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxCPEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row text-center">
                                <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                                    <asp:Label ID="lblDatosSEModS" runat="server" Text="lblDatosSEModS" CssClass="h4 fontbold"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-5 col-lg-5" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreSEModS" Text="lblNombreSEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreSEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-7 col-lg-5" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblPuestoSEModS" Text="lblPuestoSEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxPuestoSEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom:20px;">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-6" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEmailSEModS" Text="lblEmailSEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxEmailSEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCelularSEModS" Text="lblCelularSEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxCelularSEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblTelefonoOficSEModS" Text="lblTelefonoOficSEModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxTelefonoOficSEModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row text-center">
                                <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                                    <asp:Label ID="lblDatosRModS" runat="server" Text="lblDatosRModS" CssClass="h4 fontbold"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-8 col-lg-5" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreRModS" Text="lblNombreRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreRModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblSemestreRModS" Text="lblSemestreRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxSemestreRModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-8 col-lg-5" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCarreraRModS" Text="lblCarreraRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxCarreraRModS" CssClass="form-select fontsizeh6"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNoControlRModS" Text="lblNoControlRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNoControlRModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-9 col-lg-7" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEmailRModS" Text="lblEmailRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxEmailRModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-5 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblSeguridadSocialRModS" Text="lblSeguridadSocialRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxSeguridadSocialRModS" CssClass="form-select fontsizeh6"></asp:DropDownList>
                                </div>
                                <div class="col-12 col-sm-12 col-md-7 col-lg-5" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCualRModS" Text="lblCualRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxCualRModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNSSRModS" Text="lblNSSRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNSSRModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom:20px;">
                                <div class="col-12 col-sm-12 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblTelefonoRModS" Text="lblTelefonoRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxTelefonoRModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCelularRModS" Text="lblCelularRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxCelularRModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                                    <asp:Label ID="lblDomicilioRModS" runat="server" Text="lblDomicilioRModS" CssClass="h5"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-6 col-lg-6" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCalleRModS" Text="lblCalleRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxCalleRModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNumExtRModS" Text="lblNumExtRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNumExtRModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNumIntRModS" Text="lblNumIntRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNumIntRModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-5 col-lg-5" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblColoniaRModS" Text="lblColoniaRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxColoniaRModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblMunicipioRModS" Text="lblMunicipioRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxMunicipioRModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCPRModS" Text="lblCPRModS" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxCPRModS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footers">
                            <div id="divBotonesCalificarModS" runat="server" class="row text-center">
                                <div class="col-6 col-sm-2 col-md-1 offset-sm-8 offset-md-10">
                                    <asp:ImageButton runat="server" CssClass="ibtn-hover-general" ID="ibtnAprobarModS" OnClick="ibtnAprobarModS_Click"/>
                                </div>
                                <div class="col-6 col-sm-2 col-md-1">
                                    <asp:ImageButton runat="server" CssClass="ibtn-hover-general" ID="ibtnCancelarModS" OnClick="ibtnCancelarModS_Click"/>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
