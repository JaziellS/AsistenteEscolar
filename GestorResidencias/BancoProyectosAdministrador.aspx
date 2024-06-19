<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="BancoProyectosAdministrador.aspx.cs" Inherits="GestorResidencias.BancoProyectosAdministrador" %>
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
            background-image: url(Assets/Imagenes/Fondos/BancoProyectos.jpg);
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

        @media screen and (min-width:992px) {
            .modal-responsivo2 {
                width: 700px;
            }
        }
    </style>
    <script type="text/javascript">
        var xPos, yPos;
        var xPosT, yPosT;

        function Scrolls() {
            ScrollMod();
            ScrollTab();
        }

        function ScrollMod() {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(BeginRequestHandler);
            prm.add_endRequest(EndRequestHandler);
        }

        function ScrollTab() {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(BeginRequestHandlerTab);
            prm.add_endRequest(EndRequestHandlerTab);
        }

        function BeginRequestHandlerTab(sender, args) {
            try {
                xPosT = $get('ScrollTab').scrollLeft;
                yPosT = $get('ScrollTab').scrollTop;
            } catch{

            }
        }

        function EndRequestHandlerTab(sender, args) {
            try {
                $get('ScrollTab').scrollLeft = xPosT;
                $get('ScrollTab').scrollTop = yPosT;
            } catch {

            }
        }

        function BeginRequestHandler(sender, args) {
            try {
                xPos = $get('ScrollModalA').scrollLeft;
                yPos = $get('ScrollModalA').scrollTop;
            } catch {

            }
        }

        function EndRequestHandler(sender, args) {
            try {
                $get('ScrollModalA').scrollLeft = xPos;
                $get('ScrollModalA').scrollTop = yPos;
            } catch {

            }
        }
    </script>
    <script type="text/javascript">             
        $(document).ready(function () {
           
        });

        function UploadFile(fileUpload) {
            var filePath = fileUpload.value;

            if (fileUpload.value != '') {
                document.getElementById('<%= lblArchivoModPE.ClientID %>').innerHTML = document.getElementById('<%= fuArchivo.ClientID %>').value;
                document.getElementById('<%= btnAceptarModPE.ClientID %>').disabled = false;
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
        <br />
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-12">
                    <asp:ImageButton ID="ibtnRetroceder" runat="server" CssClass="ibtn-hover-general" CausesValidation="false" OnClick="ibtnRetroceder_Click"/>
                </div>
            </div>
            <br />
            <br />
            <div class="container-fluid text-center">
                <asp:Label ID="lblDescripcionModulo" runat="server" Text="lblDescripcionModulo" CssClass="text-muted"></asp:Label>
            </div>
            <br />
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="row">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-4 col-lg-2" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblPeriodo" Text="lblPeriodo" CssClass="fontsizeh6"></asp:Label>
                                <asp:DropDownList runat="server" ID="cboxPeriodo" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="cboxPeriodo_SelectedIndexChanged"></asp:DropDownList>
                            </div>
                            <div class="col-12 col-sm-12 col-md-2 col-lg-1" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblAnio" Text="lblAnio" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" ID="tboxAnio" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" AutoPostBack="true" OnTextChanged="cboxPeriodo_SelectedIndexChanged"></asp:TextBox>
                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server"
                                    ErrorTooltipEnabled="true" 
                                    InputDirection="RightToLeft" 
                                    CultureName="es-ES" 
                                    MaskType="Number" Mask="9999" TargetControlID="tboxAnio"/>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="row" style="margin-bottom:20px;">
                <div class="col-12 col-sm-12 col-md-3 col-lg-3 offset-md-9 offset-lg-9" style="margin-bottom:10px;">
                    <asp:Button ID="btnDescargarPlantilla" runat="server" Text="btnDescargarPlantilla" CssClass="fontsizeh6 form-control btn-hover-general" OnClick="btnDescargarPlantilla_Click"/>
                </div>
            </div>
            <asp:UpdatePanel runat="server" ID="up1">
                <ContentTemplate>
                    <div style="background-color:#F4F4F4; padding:30px; border-radius:20px;">
                        <div id="divTabla" runat="server">
                            <div class="row" style="margin-bottom:30px;">
                                <div class="col-12 col-sm-12 col-md-12 text-center">
                                    <asp:Label runat="server" ID="lblPeriodoDes" CssClass="text-muted h3"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-6 col-md-4 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreEmpresa" Text="lblNombreEmpresa" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreEmpresa" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" AutoPostBack="true" OnTextChanged="tboxNombreEmpresa_TextChanged"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreProyecto" Text="lblNombreProyecto" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreProyecto" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" AutoPostBack="true" OnTextChanged="tboxNombreEmpresa_TextChanged"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-5 col-md-4 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNumeroRes" Text="lblNumeroRes" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNumeroRes" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" AutoPostBack="true" OnTextChanged="tboxNombreEmpresa_TextChanged"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-5 col-md-3 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblTurno" Text="lblTurno" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxTurno" CssClass="form-select fontsizeh6" AutoPostBack="true" OnTextChanged="tboxNombreEmpresa_TextChanged"></asp:DropDownList>
                                </div>
                                <div class="col-12 col-sm-10 col-md-6 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCarrera" Text="lblCarrera" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxCarrera" CssClass="form-select fontsizeh6" AutoPostBack="true" OnTextChanged="tboxNombreEmpresa_TextChanged"></asp:DropDownList>
                                </div>
                                <div class="col-12 col-sm-5 col-md-3 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEstatus" Text="lblEstatus" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxEstatus" CssClass="form-select fontsizeh6" AutoPostBack="true" OnTextChanged="tboxNombreEmpresa_TextChanged"></asp:DropDownList>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-6" style="align-content:end;">
                                    <asp:ImageButton runat="server" ID="ibtnAgregar" CssClass="ibtn-hover-general" OnClick="ibtnAgregar_Click"/>
                                </div>
                                <div class="col-6" style="text-align:right;">
                                    <asp:ImageButton runat="server" ID="ibtnAgregarExcel" CssClass="ibtn-hover-general" OnClick="ibtnAgregarExcel_Click"/>
                                </div>
                            </div>
                            <div id="ScrollTab" style="overflow-x:auto;">
                                <asp:GridView ID="gvBanco" runat="server" style="word-wrap:break-word;" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvBanco_PageIndexChanging" OnSorting="gvBanco_Sorting" OnRowCreated="gvBanco_RowCreated" OnRowCommand="gvBanco_RowCommand"
                                    CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6" AllowSorting="True" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="IdBank">
                                <Columns>
                                    <asp:BoundField DataField="IdBank" HeaderText="IdBank"/>
                                    <asp:TemplateField HeaderText="Numero" SortExpression="Numero">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Numero") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Numero") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="NombreEmpresa" SortExpression="NombreEmpresa">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NombreEmpresa") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("NombreEmpresa") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Giro" SortExpression="Giro">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Giro") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div style="overflow-y:auto; max-height:100px; padding-right:20px; overflow-x:hidden;">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Giro") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>                        
                                    <asp:TemplateField HeaderText="Domicilio" SortExpression="Domicilio">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Domicilio") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Domicilio") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                      
                                    <asp:TemplateField HeaderText="NombreContacto" SortExpression="NombreContacto">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox41" runat="server" Text='<%# Bind("NombreContacto") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label41" runat="server" Text='<%# Bind("NombreContacto") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                     
                                    <asp:TemplateField HeaderText="AreaReceptora" SortExpression="AreaReceptora">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox42" runat="server" Text='<%# Bind("AreaReceptora") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label42" runat="server" Text='<%# Bind("AreaReceptora") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>   
                                    <asp:TemplateField HeaderText="Puesto" SortExpression="Puesto">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Puesto") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Puesto") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="NombreProyecto" SortExpression="NombreProyecto">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("NombreProyecto") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div style="overflow-y:auto; max-height:100px; padding-right:20px; overflow-x:hidden;">
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("NombreProyecto") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Actividades" SortExpression="Actividades">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Actividades") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div style="overflow-y:auto; max-height:100px; padding-right:20px; overflow-x:hidden;">
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Actividades") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Carrera" SortExpression="Carrera">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Carrera") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Carrera") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Turno" SortExpression="Turno">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Turno") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Turno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Horario" SortExpression="Horario">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Horario") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("Horario") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="DiasLab" SortExpression="DiasLab">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("DiasLab") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("DiasLab") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="NumResidentes" SortExpression="NumResidentes">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("NumResidentes") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("NumResidentes") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Capacitacion" SortExpression="Capacitacion">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Capacitacion") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("Capacitacion") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="CapacitacionDet" SortExpression="CapacitacionDet">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("CapacitacionDet") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div style="overflow-y:auto; max-height:100px; padding-right:20px; overflow-x:hidden;">
                                                <asp:Label ID="Label15" runat="server" Text='<%# Bind("CapacitacionDet") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="CapacitacionFecha" SortExpression="CapacitacionFecha">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("CapacitacionFecha") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label16" runat="server" Text='<%# Bind("CapacitacionFecha") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Prestacion" SortExpression="Prestacion">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("Prestacion") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label17" runat="server" Text='<%# Bind("Prestacion") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="PrestacionDet" SortExpression="PrestacionDet">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("PrestacionDet") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div style="overflow-y:auto; max-height:100px; padding-right:20px; overflow-x:hidden;">
                                                <asp:Label ID="Label18" runat="server" Text='<%# Bind("PrestacionDet") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="Monto" SortExpression="Monto">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("Monto") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div style="overflow-y:auto; max-height:100px; padding-right:20px; overflow-x:hidden;">
                                                <asp:Label ID="Label19" runat="server" Text='<%# Bind("Monto") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="Estatus" SortExpression="Estatus">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("Estatus") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label20" runat="server" Text='<%# Bind("Estatus") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Editar" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Eliminar" ItemStyle-HorizontalAlign="Center"/>
                                </Columns>   
                                     <PagerSettings FirstPageText="&amp;lt; &amp;lt;" LastPageText="&amp;gt; &amp;gt;" Mode="NumericFirstLast" PageButtonCount="5" PreviousPageText="&amp;lt; " />
                                     <PagerStyle CssClass="pager-row"/>
                                </asp:GridView>
                            </div>
                            <br />
                            <br />
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
            <br />
            <br />

            <asp:Button ID="Button1" runat="server" Text="btnAgregar" style="display:none"/> 
            <ajaxToolkit:ModalPopupExtender runat="server" ID="modAgregar" TargetControlID="Button1" BackgroundCssClass="modalBackground" PopupControlID="PAgregar"></ajaxToolkit:ModalPopupExtender>
            <asp:Panel runat="server" CssClass="modal-responsivo" ID="PAgregar" style="display:none; background-color:white;">
                <asp:UpdatePanel runat="server" ID="up2">
                    <ContentTemplate>
                        <div class="modal-headers text-center">
                            <asp:Label ID="lblDescripcionModuloMod" runat="server" Text="lblDescripcionModuloMod" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                        </div>
                        <div class="modal-bodys" style="max-height:450px; overflow-y:auto;" id="ScrollModalA">
                            <div class="row">
                                <div class="col-5 col-sm-2 col-md-2 col-lg-1" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNoMod" Text="lblNoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="10" ID="tboxNoMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                        FilterType="Numbers"
                                        TargetControlID="tboxNoMod"/>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvNoMod" CssClass="campo-obligatorio" ControlToValidate="tboxNoMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-6 col-md-6 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCarreraMod" Text="lblCarreraMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxCarreraMod" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="cboxCarreraMod_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvCarreraMod" CssClass="campo-obligatorio" ControlToValidate="cboxCarreraMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-3 col-md-3 col-lg-3 offset-sm-1 offset-md-1 offset-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEstadoMod" Text="lblEstadoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxEstadoMod" CssClass="form-select fontsizeh6"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvEstadoMod" CssClass="campo-obligatorio" ControlToValidate="cboxEstadoMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-5" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreEmpresaMod" Text="lblNombreEmpresaMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="200" ID="tboxNombreEmpresaMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvNombreEmpresaMod" CssClass="campo-obligatorio" ControlToValidate="tboxNombreEmpresaMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblGiroMod" Text="lblGiroMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxGiroMod" TextMode="MultiLine" Rows="3" CssClass="form-control fontsizeh6" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblDomicilioMod" Text="lblDomicilioMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="350" ID="tboxDomicilioMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvDomicilioMod" CssClass="campo-obligatorio" ControlToValidate="tboxDomicilioMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-7 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreContactoMod" Text="lblNombreContactoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="250" ID="tboxNombreContactoMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvNombreContactoMod" CssClass="campo-obligatorio" ControlToValidate="tboxNombreContactoMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-4 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblAreaRecptoraMod" Text="lblAreaRecptoraMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="150" ID="tboxAreaRecptoraMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvAreaRecptoraMod" CssClass="campo-obligatorio" ControlToValidate="tboxAreaRecptoraMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-6 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblPuestoMod" Text="lblPuestoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="200" ID="tboxPuestoMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvPuestoMod" CssClass="campo-obligatorio" ControlToValidate="tboxPuestoMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-10 col-md-5 col-lg-5" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEmailMod" Text="lblEmailMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="200" ID="tboxEmailMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvEmailMod" CssClass="campo-obligatorio" ControlToValidate="tboxEmailMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-10 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreProyectoMod" Text="lblNombreProyectoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="200" ID="tboxNombreProyectoMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvNombreProyectoMod" CssClass="campo-obligatorio" ControlToValidate="tboxNombreProyectoMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblActividadesMod" Text="lblActividadesMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxActividadesMod" TextMode="MultiLine" Rows="6" CssClass="form-control fontsizeh6" ></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvActividadesMod" CssClass="campo-obligatorio" ControlToValidate="tboxActividadesMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-4 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblTurnoMod" Text="lblTurnoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxTurnoMod" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="cboxTurnoMod_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvTurnoMod" CssClass="campo-obligatorio" ControlToValidate="cboxTurnoMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-8 col-md-8 col-lg-5" id="divOtroTurno" runat="server" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblOtroTurnoMod" Text="lblOtroTurnoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="250" ID="tboxOtroTurnoMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvOtroTurnoMod" CssClass="campo-obligatorio" ControlToValidate="tboxOtroTurnoMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-4 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblHorarioMod" Text="lblHorarioMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="150" ID="tboxHorarioMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvHorarioMod" CssClass="campo-obligatorio" ControlToValidate="tboxHorarioMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-4 col-md-4 col-lg-5" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblDiasLaboralesMod" Text="lblDiasLaboralesMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="150" ID="tboxDiasLaboralesMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvDiasLaboralesMod" CssClass="campo-obligatorio" ControlToValidate="tboxDiasLaboralesMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-4 col-md-4 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNumeroResidentesMod" Text="lblNumeroResidentesMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="150" ID="tboxNumeroResidentesMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvNumeroResidentesMod" CssClass="campo-obligatorio" ControlToValidate="tboxNumeroResidentesMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-3 col-md-3 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCapacitacionPrevMod" Text="lblCapacitacionPrevMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxCapacitacionPrevMod" MaxLength="100" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvCapacitacionPrevMod" CssClass="campo-obligatorio" ControlToValidate="tboxCapacitacionPrevMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-9 col-md-9 col-lg-10" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEnQueConsisteMod" Text="lblEnQueConsisteMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxEnQueConsisteMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-4 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblFechaCapacitacionMod" Text="lblFechaCapacitacionMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="100" ID="tboxFechaCapacitacionMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-4 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblOtorgaPrestacionMod" Text="lblOtorgaPrestacionMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxOtorgaPrestacionMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvOtorgaPrestacionMod" CssClass="campo-obligatorio" ControlToValidate="tboxOtorgaPrestacionMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarProyecto"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-5" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCualPrestacionMod" Text="lblCualPrestacionMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxCualPrestacionMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-6 col-md-6 col-lg-6" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblMontoMod" Text="lblMontoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxMontoMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footers">
                            <div class="row alineacion-vertical" >
                                <div class="col-6 col-md-3 col-sm-3 col-lg-2 offset-md-6 offset-sm-6 offset-lg-8"> 
                                    <asp:Button ID="btnCancelarMod" runat="server" Text="btnCancelarMod" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnCancelarMod_Click"/>                                                                                         
                                </div>
                                <div class="col-6 col-md-3 col-sm-3 col-lg-2"> 
                                    <asp:Button ID="btnAceptarMod" runat="server" Text="btnAceptarMod" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnAceptarMod_Click" ValidationGroup="AgregarProyecto"/>           
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>


            <asp:Button ID="Button2" runat="server" Text="btnAgregar" style="display:none"/> 
            <ajaxToolkit:ModalPopupExtender runat="server" ID="modProcesarEx" TargetControlID="Button2" BackgroundCssClass="modalBackground" PopupControlID="PProcesarEx"></ajaxToolkit:ModalPopupExtender>
            <asp:Panel runat="server" CssClass="modal-responsivo2" ID="PProcesarEx" style="display:none; background-color:white;">
                <asp:UpdatePanel runat="server" ID="upProcesarEx">
                    <ContentTemplate>
                        <div class="modal-headers text-center">
                            <asp:Label ID="lblDescripcionModuloModPE" runat="server" Text="lblDescripcionModuloMod" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                        </div>
                        <div class="modal-bodys" style="max-height:450px; overflow-y:auto;">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:FileUpload ID="fuArchivo" runat="server" style="display: none;"/>
                                    <asp:Button ID="btnSeleccionarArchivo" runat="server" Text="btnSeleccionarArchivo" CssClass="form-control fontsizeh6 btn-hover-general"/>
                                </div>
                                <div class="col-12 col-sm-12 col-md-8 col-lg-8" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblArchivoModPE" CssClass="fontsizeh6"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footers">
                            <div class="row alineacion-vertical" >
                                <div class="col-6 col-md-3 col-sm-5 col-lg-3 offset-md-6 offset-sm-2 offset-lg-6"> 
                                    <asp:Button ID="btnCancelarModPE" runat="server" Text="btnCancelarMod" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnCancelarModPE_Click"/>                                                                                         
                                </div>
                                <div class="col-6 col-md-3 col-sm-5 col-lg-3"> 
                                    <asp:Button ID="btnAceptarModPE" runat="server" Text="btnAceptarMod" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnAceptarModPE_Click" ValidationGroup="AgregarExcel"/>           
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>        
                        <asp:PostBackTrigger ControlID="btnAceptarModPE" />
                    </Triggers>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
