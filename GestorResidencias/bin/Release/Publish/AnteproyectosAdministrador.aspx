<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AnteproyectosAdministrador.aspx.cs" Inherits="GestorResidencias.AnteproyectosAdministrador" %>
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
    </style>
    <style type="text/css">
        .background-titulo {
            background-image: url(Assets/Imagenes/Anteproyecto/FondoAdmin.png);
            color:white;
            background-position: 100% 100%;
            text-align:center;
            background-size: cover;
            background-repeat:no-repeat;
            padding-top: 12.5rem;
            padding-bottom: 2rem;
        }

        .contenedor-centrar {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            width: 100%;
        }

        .contenedor-centrar-centro {
            margin-left: auto;
            margin-right: auto;
        }

        @media screen and (min-width:992px) {
            .modal-responsivo {
                width: 900px;
            }
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
                    <asp:ImageButton ID="ibtnRetroceder" runat="server" CssClass="ibtn-hover-general" CausesValidation="false" OnClick="ibtnRetroceder_Click"/>
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
                        <div class="col-8 col-sm-6 col-md-4 col-lg-2">
                            <asp:Label runat="server" ID="lblPeriodo" Text="lblPeriodo" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxPeriodo" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="cboxPeriodo_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col-4 col-sm-3 col-md-2 col-lg-1">
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
                            <div class="row">
                                <div class="col-12 col-sm-4 col-md-4 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNoControl" Text="lblNoControl" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNoControl" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" AutoPostBack="true" OnTextChanged="btnBuscar_Click"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-8 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombre" Text="lblNombre" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxAlumno" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" AutoPostBack="true" OnTextChanged="btnBuscar_Click"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreProyecto" Text="lblNombreProyecto" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreProyecto" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" AutoPostBack="true" OnTextChanged="btnBuscar_Click"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-6 col-md-4 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEmpresa" Text="lblEmpresa" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxEmpresa" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" AutoPostBack="true" OnTextChanged="btnBuscar_Click"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-6 col-md-4 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEstatus" Text="lblEstatus" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxEstatus" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="btnBuscar_Click"></asp:DropDownList>
                                </div>
                            </div>
                            <asp:Button runat="server" ID="btnBuscar" Text="btnBuscar" BorderStyle="None" CssClass="form-control fontsizeh6" Visible="false" OnClick="btnBuscar_Click"/>
                            <div class="row" style="margin-bottom:10px;">
                                <div class="col-12 col-sm-6 col-md-4 col-lg-3 offset-sm-6 offset-md-8 offset-lg-9">
                                    <asp:Button runat="server" ID="btnNotificarTodos" Text="btnNotificarTodos" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnNotificarTodos_Click"/>
                                </div>
                            </div>
                            <div id="ScrollDiv" style="overflow-x:auto;">
                                <asp:GridView ID="gvAnteproyectos" runat="server" AllowPaging="True" PageSize="7" OnPageIndexChanging="gvAnteproyectos_PageIndexChanging" OnSorting="gvAnteproyectos_Sorting" OnRowCreated="gvAnteproyectos_RowCreated" OnRowCommand="gvAnteproyectos_RowCommand"
                                    CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6" AllowSorting="True" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="IdPreliminaryDraft, IdUser, IdTeachers, IdTypeState" style="word-wrap: break-word;">
                                <Columns>
                                    <asp:BoundField DataField="IdPreliminaryDraft" HeaderText="IdPreliminaryDraft"/>
                                    <asp:BoundField DataField="IdUser" HeaderText="IdUser"/>
                                    <asp:BoundField DataField="IdTeachers" HeaderText="IdTeachers"/>
                                    <asp:BoundField DataField="IdTypeState" HeaderText="IdTypeState"/>
                                    <asp:BoundField DataField="ObjetivoProyecto" HeaderText="ObjetivoProyecto"/>
                                    <asp:BoundField DataField="Justificacion" HeaderText="Justificacion"/>
                                    <asp:BoundField DataField="AlcanceProyecto" HeaderText="AlcanceProyecto"/>
                                    <asp:BoundField DataField="LocacionProyecto" HeaderText="LocacionProyecto"/>
                                    <asp:BoundField DataField="GiroEmpresa" HeaderText="GiroEmpresa"/>
                                    <asp:BoundField DataField="DepartamentoEmpresa" HeaderText="DepartamentoEmpresa"/>
                                    <asp:BoundField DataField="TelefonoEmpresa" HeaderText="TelefonoEmpresa"/>
                                    <asp:BoundField DataField="DirectorEmpresa" HeaderText="DirectorEmpresa"/>
                                    <asp:BoundField DataField="JefeDeArea" HeaderText="JefeDeArea"/>
                                    <asp:BoundField DataField="CalleEmpresa" HeaderText="CalleEmpresa"/>
                                    <asp:BoundField DataField="NumeroExterior" HeaderText="NumeroExterior"/>
                                    <asp:BoundField DataField="NumeroInterior" HeaderText="NumeroInterior"/>
                                    <asp:BoundField DataField="ColoniaEmpresa" HeaderText="ColoniaEmpresa"/>
                                    <asp:BoundField DataField="CiudadEmpresa" HeaderText="CiudadEmpresa"/>
                                    <asp:BoundField DataField="MunicipioEmpresa" HeaderText="MunicipioEmpresa"/>
                                    <asp:BoundField DataField="EstadoEmpresa" HeaderText="EstadoEmpresa"/>
                                    <asp:BoundField DataField="CodigoPostalEmpresa" HeaderText="CodigoPostalEmpresa"/>
                                    <asp:BoundField DataField="Carrera" HeaderText="Carrera"/>
                                    <asp:BoundField DataField="TelefonoUsuario" HeaderText="TelefonoUsuario"/>
                                    <asp:TemplateField HeaderText="NoControl" SortExpression="NoControl">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NoControl") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("NoControl") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Alumno" SortExpression="Alumno">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Alumno") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Alumno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
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
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("NombreEmpresa") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("NombreEmpresa") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                     
                                    <asp:TemplateField HeaderText="Periodo" SortExpression="Periodo">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Periodo") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Periodo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Estatus" SortExpression="Estatus">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Estatus") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Estatus") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Revisiones" SortExpression="Revisiones">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Revisiones") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Revisiones") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DescargarFicha" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" CssClass="ibtn-hover-general" ID="DescargarFicha" CommandArgument="<%# Container.DataItemIndex %>"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Evaluadores" ItemStyle-HorizontalAlign="Center"/>                       
                                    <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Comentar" ItemStyle-HorizontalAlign="Center"/>                       
                                    <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="VerConComentarios" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="NotificarAlumno" ItemStyle-HorizontalAlign="Center"/>
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
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 offset-sm-6 offset-md-8 offset-lg-9">
                    <asp:Button runat="server" ID="btnDescargar" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" Text="btnDescargar" OnClick="btnDescargar_Click"/>
                </div>
            </div>

            <asp:Button ID="Button1" runat="server" style="display:none"/> 
            <ajaxToolkit:ModalPopupExtender runat="server" ID="modEvaluadores" TargetControlID="Button1" BackgroundCssClass="modalBackground" PopupControlID="pEvaluadores"></ajaxToolkit:ModalPopupExtender>
            <asp:Panel runat="server" CssClass="modal-responsivo" ID="pEvaluadores" style="display:none; background-color:white;">
                <asp:UpdatePanel runat="server" ID="up2">
                    <ContentTemplate>
                        <div class="modal-headers text-center">
                            <div class="alineacion-vertical">
                                <div class="text-center container">
                                    <asp:Label ID="lblDescripcionModuloMod" runat="server" Text="lblDescripcionModuloMod" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                                </div>
                                <asp:ImageButton runat="server" CssClass="ibtn-hover-general" ID="ibtnCerrarMod" OnClick="ibtnCerrarMod_Click"/>
                            </div>
                        </div>
                        <div class="modal-bodys">
                            <div style="overflow-x:auto;">
                                <asp:GridView ID="gvEvaluadoresMod" runat="server" AllowPaging="True" PageSize="7" style="word-wrap: break-word;"
                                    CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="IdTeachers, IdTeachersDet, IdUser, IdTypeState">
                                    <Columns>
                                        <asp:BoundField DataField="IdTeachers" HeaderText="IdTeachers"/>
                                        <asp:BoundField DataField="IdTeachersDet" HeaderText="IdTeachersDet"/>
                                        <asp:BoundField DataField="IdUser" HeaderText="IdUser"/>
                                        <asp:BoundField DataField="IdTypeState" HeaderText="IdTypeState"/>
                                        <asp:TemplateField HeaderText="NoControl" SortExpression="NoControl">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1Mod" runat="server" Text='<%# Bind("NoControl") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1Mod" runat="server" Text='<%# Bind("NoControl") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="NombreMaestro" SortExpression="NombreMaestro">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2Mod" runat="server" Text='<%# Bind("NombreMaestro") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2Mod" runat="server" Text='<%# Bind("NombreMaestro") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3Mod" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3Mod" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Calificacion" SortExpression="Calificacion">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4Mod" runat="server" Text='<%# Bind("Calificacion") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4Mod" runat="server" Text='<%# Bind("Calificacion") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="modal-footers">
                            
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
