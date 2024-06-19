<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="GestorResidencias.Usuarios" %>
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

        @media screen and (min-width:992px) {
            .modal-responsivo {
                width: 900px;
            }
        }

        @media screen and (min-width:992px) {
            .modal-responsivo2 {
                width: 750px;
            }
        }
    </style>
    <script type="text/javascript">
        var xPos, yPos;
        var xPosT, yPosT;

        function Scrolls() {
            ScrollModTab();
            ScrollMod();
        }

        function ScrollModTab() {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(BeginRequestHandlerTab);
            prm.add_endRequest(EndRequestHandlerTab);
        }

        function BeginRequestHandlerTab(sender, args) {
            try {
                xPosT = $get('scrollDiv').scrollLeft;
                yPosT = $get('scrollDiv').scrollTop;
            } catch {

            }
        }

        function EndRequestHandlerTab(sender, args) {
            try {
                $get('scrollDiv').scrollLeft = xPosT;
                $get('scrollDiv').scrollTop = yPosT;
            } catch{

            }
        }

        function ScrollMod() {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(BeginRequestHandler);
            prm.add_endRequest(EndRequestHandler);
        }

        function BeginRequestHandler(sender, args) {
            try {
                xPos = $get('ScrollModal').scrollLeft;
                yPos = $get('ScrollModal').scrollTop;
            } catch {

            }
        }

        function EndRequestHandler(sender, args) {
            try {
                $get('ScrollModal').scrollLeft = xPos;
                $get('ScrollModal').scrollTop = yPos;
            } catch{

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
    <div class="container contenidopagina">
        <br />
        <div class="alineacion-vertical">
            <asp:ImageButton ID="ibtnRetroceder" runat="server" CssClass="ibtn-hover-general" CausesValidation="false" OnClick="ibtnRetroceder_Click"/>
            <div class="container-fluid text-center">
                <asp:Label ID="lblTitulo" runat="server" Text="lblTitulo" CssClass="h1 fontbold"></asp:Label>
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
        <asp:UpdatePanel runat="server" ID="up1">
            <ContentTemplate>
                <div class="row" style="margin-bottom:20px;">
                    <div class="col-12 col-sm-4 col-md-3 col-lg-2" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblNumeroControl" Text="lblNumeroControl" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" ID="tboxNumeroControl" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" AutoPostBack="true" OnTextChanged="tboxNumeroControl_TextChanged"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-8 col-md-5 col-lg-3" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblNombre" Text="lblNombre" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" ID="tboxNombre" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" AutoPostBack="true" OnTextChanged="tboxNumeroControl_TextChanged"></asp:TextBox>
                    </div>
                    <div class="col-12 col-sm-5 col-md-4 col-lg-2" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblTipoUsuario" Text="lblTipoUsuario" CssClass="fontsizeh6"></asp:Label>
                        <asp:DropDownList runat="server" ID="cboxTipoUsuario" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="tboxNumeroControl_TextChanged"></asp:DropDownList>
                    </div>
                    <div class="col-12 col-sm-7 col-md-6 col-lg-3" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblCarrera" Text="lblCarrera" CssClass="fontsizeh6"></asp:Label>
                        <asp:DropDownList runat="server" ID="cboxCarrera" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="tboxNumeroControl_TextChanged"></asp:DropDownList>
                    </div>
                    <div class="col-12 col-sm-5 col-md-3 col-lg-2" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblEstatus" Text="lblEstatus" CssClass="fontsizeh6"></asp:Label>
                        <asp:DropDownList runat="server" ID="cboxEstatus" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="tboxNumeroControl_TextChanged"></asp:DropDownList>
                    </div>
                </div>
                 <asp:Button runat="server" ID="btnBuscar" style="display:none;" OnClick="tboxNumeroControl_TextChanged"/>    
                <div class="row">
                    <div class="col-6 col-md-2 col-sm-3">
                        <asp:ImageButton runat="server" ID="ibtnAgregar" CssClass="ibtn-hover-general" OnClick="ibtnAgregar_Click"/>
                    </div>
                </div>
                <div id="scrollDiv" style="overflow-x:auto;">
                    <asp:GridView ID="gvUsuarios" runat="server" AllowPaging="True" PageSize="7" OnPageIndexChanging="gvUsuarios_PageIndexChanging" OnSorting="gvUsuarios_Sorting" OnRowCreated="gvUsuarios_RowCreated" OnRowCommand="gvUsuarios_RowCommand"
                        CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6" style="word-wrap: break-word;" AllowSorting="True" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="IdUser, IdTypeUser, IdTypeState, NoControl">
                    <Columns>
                        <asp:BoundField DataField="IdUser" HeaderText="IdUser"/>
                        <asp:BoundField DataField="IdTypeUser" HeaderText="IdTypeUser"/>
                        <asp:BoundField DataField="IdTypeState" HeaderText="IdTypeState"/>
                        <asp:BoundField DataField="Telefono" HeaderText="Telefono"/>
                        <asp:BoundField DataField="Semestre" HeaderText="Semestre"/>
                        <asp:BoundField DataField="SeguridadSocial" HeaderText="SeguridadSocial"/>
                        <asp:BoundField DataField="OtraSeguridadSocial" HeaderText="OtraSeguridadSocial"/>
                        <asp:BoundField DataField="NSS" HeaderText="NSS"/>
                        <asp:BoundField DataField="Calle" HeaderText="Calle"/>
                        <asp:BoundField DataField="NumExterior" HeaderText="NumExterior"/>
                        <asp:BoundField DataField="NumInterior" HeaderText="NumInterior"/>
                        <asp:BoundField DataField="Colonia" HeaderText="Colonia"/>
                        <asp:BoundField DataField="Estado" HeaderText="Estado"/>
                        <asp:BoundField DataField="Municipio" HeaderText="Municipio"/>
                        <asp:BoundField DataField="Ciudad" HeaderText="Ciudad"/>
                        <asp:BoundField DataField="NumeroPostal" HeaderText="NumeroPostal"/>
                        <asp:TemplateField HeaderText="NoControl" SortExpression="NoControl">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NoControl") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("NoControl") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="NombreCompleto" SortExpression="NombreCompleto">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NombreCompleto") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("NombreCompleto") %>'></asp:Label>
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
                        <asp:TemplateField HeaderText="TipoUsuario" SortExpression="TipoUsuario">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("TipoUsuario") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("TipoUsuario") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                      
                        <asp:TemplateField HeaderText="Carrera" SortExpression="Carrera">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox41" runat="server" Text='<%# Bind("Carrera") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label41" runat="server" Text='<%# Bind("Carrera") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                     
                        <asp:TemplateField HeaderText="Celular" SortExpression="Celular">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox42" runat="server" Text='<%# Bind("Celular") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label42" runat="server" Text='<%# Bind("Celular") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>   
                        <asp:TemplateField HeaderText="TipoEstado" SortExpression="TipoEstado">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox43" runat="server" Text='<%# Bind("TipoEstado") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label43" runat="server" Text='<%# Bind("TipoEstado") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AceptarAcceso" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ID="AceptarAcceso" CssClass="ibtn-hover-general" CommandArgument="<%# Container.DataItemIndex %>"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DenegarAceptar" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ID="DenegarAceptar" CssClass="ibtn-hover-general" CommandArgument="<%# Container.DataItemIndex %>"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Ver" ItemStyle-HorizontalAlign="Center"/>                      
                        <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Editar" ItemStyle-HorizontalAlign="Center"/>                      
                        <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Eliminar" ItemStyle-HorizontalAlign="Center"/>                        
                        <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="AgregarCuentaSecundaria" ItemStyle-HorizontalAlign="Center"/>                        
                    </Columns>   
                         <PagerSettings FirstPageText="&amp;lt; &amp;lt;" LastPageText="&amp;gt; &amp;gt;" Mode="NumericFirstLast" PageButtonCount="5" PreviousPageText="&amp;lt; " />
                         <PagerStyle CssClass="pager-row"/>
                    </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <br />
        <div class="row">
            <div class="col-12 col-md-2 col-sm-3 offset-md-10 offset-sm-9">
                <asp:Button runat="server" ID="btnDescargar" CssClass="form-control fontsizeh6 btn-hover-general" Text="btnDescargar" OnClick="btnDescargar_Click"/>
            </div>
        </div>
        <br />
        <br />


        <asp:Button ID="Button1" runat="server" Text="btnAgregar" style="display:none"/> 
        <ajaxToolkit:ModalPopupExtender runat="server" ID="modAgregar" TargetControlID="Button1" BackgroundCssClass="modalBackground" PopupControlID="PAgregar"></ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="PAgregar" CssClass="modal-responsivo" style="display:none; background-color:white;">
            <asp:UpdatePanel runat="server" ID="up2">
                <ContentTemplate>
                    <div class="modal-headers text-center">
                        <div class="alineacion-vertical">
                            <div class="text-center container">
                                <asp:Label ID="lblDescripcionModuloMod" runat="server" Text="lblDescripcionModuloMod" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                            </div>
                            <asp:ImageButton runat="server" ID="ibtnCerrarMod" CssClass="ibtn-hover-general" OnClick="ibtnCerrarMod_Click"/>
                        </div>
                    </div>
                    <div id="ScrollModal" class="modal-bodys" style="max-height:450px; overflow-y:auto;">
                        <div class="row">
                            <div class="col-12 col-sm-4 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                <div id="divNumeroControlMod" runat="server">
                                    <asp:Label runat="server" ID="lblNumeroControlMod" Text="lblNumeroControlMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="8" ID="tboxNumeroControlMod" CssClass="form-control fontsizeh6" AutoPostBack="true" OnTextChanged="tboxNumeroControlMod_TextChanged" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                        FilterType="Numbers"
                                        TargetControlID="tboxNumeroControlMod"/>
                                    <asp:RegularExpressionValidator ID="revNumeroControlMod" runat="server" CssClass="campo-obligatorio"
                                        ControlToValidate="tboxNumeroControlMod" SetFocusOnError="true" Display="Dynamic"
                                        ErrorMessage="Deben ser 8 caracteres."
                                        ValidationExpression="^\d{8}$" ValidationGroup="AgregarUsuario"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvNumeroControlMod" CssClass="campo-obligatorio" ControlToValidate="tboxNumeroControlMod" SetFocusOnError="true" Display="Dynamic" ValidationGroup="AgregarUsuario"></asp:RequiredFieldValidator>
                                </div>
                                <div id="divNumeroEmpleadoMod" runat="server">
                                    <asp:Label runat="server" ID="lblNumeroEmpleadoMod" Text="lblNumeroEmpleadoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="7" ID="tboxNumeroEmpleadoMod" CssClass="form-control fontsizeh6" AutoPostBack="true" OnTextChanged="tboxNumeroControlMod_TextChanged" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revNumeroEmpleadoMod" runat="server" CssClass="campo-obligatorio"
                                        ControlToValidate="tboxNumeroEmpleadoMod" SetFocusOnError="true" Display="Dynamic"
                                        ErrorMessage="Deben ser 3 letras mayusculas y 4 numeros."
                                        ValidationExpression="^[A-Z]{3}\d{4}$" ValidationGroup="AgregarUsuario"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvNumeroEmpleadoMod" CssClass="campo-obligatorio" ControlToValidate="tboxNumeroEmpleadoMod" SetFocusOnError="true" Display="Dynamic" ValidationGroup="AgregarUsuario"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-12 col-sm-4 col-md-4 col-lg-3 offset-lg-2" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblTipoUsuarioMod" Text="lblTipoUsuarioMod" CssClass="fontsizeh6"></asp:Label>
                                <asp:DropDownList runat="server" ID="cboxTipoUsuarioMod" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="cboxTipoUsuarioMod_SelectedIndexChanged"></asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvTipoUsuarioMod" CssClass="campo-obligatorio" ControlToValidate="cboxTipoUsuarioMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarUsuario"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-4 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblEstatusMod" Text="lblEstatusMod" CssClass="fontsizeh6"></asp:Label>
                                <asp:DropDownList runat="server" ID="cboxEstatusMod" CssClass="form-select fontsizeh6"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-6 col-lg-6" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblNombreMod" Text="lblNombreMod" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" ID="tboxNombreMod" MaxLength="150" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvNombreMod" CssClass="campo-obligatorio" ControlToValidate="tboxNombreMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarUsuario"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblApellidoPatMod" Text="lblApellidoPatMod" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="50" ID="tboxApellidoPatMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvApellidoPatMod" CssClass="campo-obligatorio" ControlToValidate="tboxApellidoPatMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarUsuario"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblApellidoMatMod" Text="lblApellidoMatMod" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="50" ID="tboxApellidoMatMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvApellidoMatMod" CssClass="campo-obligatorio" ControlToValidate="tboxApellidoMatMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarUsuario"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-5 col-sm-6 col-md-6 col-lg-4" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblEmailMod" Text="lblEmailMod" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="100" ID="tboxEmailMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="revEmailMod" runat="server" CssClass="campo-obligatorio"
                                    ControlToValidate="tboxEmailMod" SetFocusOnError="true" Display="Dynamic"
                                    ErrorMessage="Estructura de correo incorrecta."
                                    ValidationExpression="^[a-zA-Z0-9._%+-]{2,}$" ValidationGroup="AgregarUsuario"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator runat="server" ID="rfvEmailMod" CssClass="campo-obligatorio" ControlToValidate="tboxEmailMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarUsuario"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-7 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px; padding-top:23px;">
                                <asp:DropDownList runat="server" ID="cboxDominioMod" CssClass="form-select fontsizeh6"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-6 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                <asp:Label ID="lblContrasenaMod" runat="server" Text="lblContrasenaMod" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="100" ID="tboxContrasenaMod" CssClass="form-control fontsizeh6" AutoPostBack="true" OnTextChanged="tboxContrasenaMod_TextChanged"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvContrasenaMod" CssClass="campo-obligatorio" ControlToValidate="tboxContrasenaMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarUsuario"></asp:RequiredFieldValidator>
                                <asp:Label runat="server" ID="lblContreseniasNoCoincidenMod" CssClass="campo-obligatorio"></asp:Label>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                <asp:Label ID="lblRepiteContrasenaMod" runat="server" Text="lblRepiteContrasenaMod" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="100" ID="tboxRepiteContrasenaMod" CssClass="form-control fontsizeh6" AutoPostBack="true" OnTextChanged="tboxContrasenaMod_TextChanged"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvRepiteContrasenaMod" CssClass="campo-obligatorio" ControlToValidate="tboxRepiteContrasenaMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarUsuario"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div id="divCamposExtrasTelMod" runat="server" class="col-12 col-sm-5 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblTelefonoMod" Text="lblTelefonoMod" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="10" ID="tboxTelefonoMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                    FilterType="Numbers"
                                    TargetControlID="tboxTelefonoMod"/>
                                <asp:RegularExpressionValidator ID="revTelefonoMod" runat="server" CssClass="campo-obligatorio"
                                    ControlToValidate="tboxTelefonoMod" SetFocusOnError="true" Display="Dynamic"
                                    ErrorMessage="Deben ser 10 caracteres."
                                    ValidationExpression="^\d{10}$" ValidationGroup="AgregarUsuario"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-12 col-sm-5 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblCelularMod" Text="lblCelularMod" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="10" ID="tboxCelularMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                    FilterType="Numbers"
                                    TargetControlID="tboxCelularMod"/>
                                <asp:RegularExpressionValidator ID="revCelularMod" runat="server" CssClass="campo-obligatorio"
                                    ControlToValidate="tboxCelularMod" SetFocusOnError="true" Display="Dynamic"
                                    ErrorMessage="Deben ser 10 caracteres."
                                    ValidationExpression="^\d{10}$" ValidationGroup="AgregarUsuario"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-12 col-sm-8 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblCarreraMod" Text="lblCarreraMod" CssClass="fontsizeh6"></asp:Label>
                                <asp:DropDownList runat="server" ID="cboxCarreraMod" CssClass="form-select fontsizeh6"></asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCarreraMod" CssClass="campo-obligatorio" ControlToValidate="cboxCarreraMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarUsuario"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div id="divCamposExtrasMod" runat="server">
                            <div class="row" style="margin-bottom:20px;">
                                <div class="col-12 col-sm-3 col-md-3 col-lg-3">
                                    <asp:Label runat="server" ID="lblSemestreMod" Text="lblSemestreMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="2" ID="tboxSemestreMod" CssClass="form-control fontsizeh6"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server"
                                        FilterType="Numbers"
                                        TargetControlID="tboxSemestreMod"/>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvSemestreMod" CssClass="campo-obligatorio" ControlToValidate="tboxSemestreMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarUsuario"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                                    <asp:Label ID="lblDatosSeguridadSocialMod" runat="server" Text="lblDatosSeguridadSocialMod" CssClass="h5"></asp:Label>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom:20px;">
                                <div class="col-12 col-sm-5 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label ID="lblSeguridadSocialMod" runat="server" Text="lblSeguridadSocialMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxSeguridadSocialMod" CssClass="form-select fontsizeh6" OnSelectedIndexChanged="cboxSeguridadSocialMod_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>
                                <div id="divOtraSSMod" runat="server" class="col-12 col-sm-7 col-md-5 col-lg-5" style="margin-bottom:10px;">
                                    <asp:Label ID="lblOtraSeguridadSocialMod" runat="server" Text="lblOtraSeguridadSocialMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="150" ID="tboxOtraSeguridadSocialMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-6 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label ID="lblNSSMod" runat="server" Text="lblNSSMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="11" ID="tboxNSSMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server"
                                        FilterType="Numbers"
                                        TargetControlID="tboxNSSMod"/>
                                    <asp:RegularExpressionValidator ID="revNSSMod" runat="server" CssClass="campo-obligatorio"
                                        ControlToValidate="tboxNSSMod" SetFocusOnError="true" Display="Dynamic"
                                        ErrorMessage="Deben ser 11 caracteres."
                                        ValidationExpression="^\d{11}$" ValidationGroup="AgregarUsuario"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                                    <asp:Label ID="lblDatosDomicilioMod" runat="server" Text="lblDatosDomicilioMod" CssClass="h5"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-6 col-md-6 col-lg-6" style="margin-bottom:10px;">
                                    <asp:Label ID="lblCalleMod" runat="server" Text="lblCalleMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="150" ID="tboxCalleMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-3 col-md-3 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label ID="lblNumeroExteriorMod" runat="server" Text="lblNumeroExteriorMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="35" ID="tboxNumeroExteriorMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-3 col-md-3 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label ID="lblNumeroInteriorMod" runat="server" Text="lblNumeroInteriorMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="35" ID="tboxNumeroInteriorMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-4 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label ID="lblColoniaMod" runat="server" Text="lblColoniaMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="150" ID="tboxColoniaMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-4 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label ID="lblCiudadMod" runat="server" Text="lblCiudadMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="100" ID="tboxCiudadMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-4 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label ID="lblMunicipioMod" runat="server" Text="lblMunicipioMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="100" ID="tboxMunicipioMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-4 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label ID="lblEstadoMod" runat="server" Text="lblEstadoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="100" ID="tboxEstadoMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-4 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label ID="lblCPMod" runat="server" Text="lblCPMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="5" ID="tboxCPMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                                        FilterType="Numbers"
                                        TargetControlID="tboxCPMod"/>
                                    <asp:RegularExpressionValidator ID="revCPMod" runat="server" CssClass="campo-obligatorio"
                                        ControlToValidate="tboxCPMod" SetFocusOnError="true" Display="Dynamic"
                                        ErrorMessage="Deben ser 5 caracteres."
                                        ValidationExpression="^\d{5}$" ValidationGroup="AgregarUsuario"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footers">
                        <div id="divBotonesMod" runat="server" class="row alineacion-vertical" >
                            <div class="col-12 col-sm-6 col-md-4 col-lg-3 offset-sm-6 offset-md-8 offset-lg-9"> 
                                <asp:Button ID="btnAceptarMod" runat="server" Text="btnAceptarMod" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnAceptarMod_Click" ValidationGroup="AgregarUsuario"/>           
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Button ID="Button2" runat="server" Text="btnAgregarCuentaSecundaria" style="display:none"/> 
        <ajaxToolkit:ModalPopupExtender runat="server" ID="modCuentaSecundaria" TargetControlID="Button2" BackgroundCssClass="modalBackground" PopupControlID="PCuentaSecundaria"></ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="PCuentaSecundaria" CssClass="modal-responsivo2" style="display:none; background-color:white;">
            <asp:UpdatePanel runat="server" ID="up3">
                <ContentTemplate>
                    <div class="modal-headers text-center">
                        <div class="alineacion-vertical">
                            <div class="text-center container">
                                <asp:Label ID="lblDescripcionModuloModCS" runat="server" Text="lblDescripcionModuloModCS" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                            </div>
                            <asp:ImageButton runat="server" ID="ibtnCerrarModCS" CssClass="ibtn-hover-general" OnClick="ibtnCerrarModCS_Click"/>
                        </div>
                    </div>
                    <div class="modal-bodys">
                        <div class="row">
                            <div class="col-12 col-sm-4 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblNumeroEmpleadoModCS" Text="lblNumeroEmpleadoModCS" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="7" ID="tboxNumeroEmpleadoModCS" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="revNumeroEmpleadoModCS" runat="server" CssClass="campo-obligatorio"
                                    ControlToValidate="tboxNumeroEmpleadoModCS" SetFocusOnError="true" Display="Dynamic"
                                    ErrorMessage="Deben ser 3 letras mayusculas y 4 numeros."
                                    ValidationExpression="^[A-Z]{3}\d{4}$" ValidationGroup="AgregarCuentaSecundaria"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator runat="server" ID="rfvNumeroEmpleadoModCS" CssClass="campo-obligatorio" ControlToValidate="tboxNumeroEmpleadoModCS" SetFocusOnError="true" Display="Dynamic" ValidationGroup="AgregarCuentaSecundaria"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-8 col-md-5 col-lg-4" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblTipoUsuarioModCS" Text="lblTipoUsuarioModCS" CssClass="fontsizeh6"></asp:Label>
                                <asp:DropDownList runat="server" ID="cboxTipoUsuarioModCS" CssClass="form-select fontsizeh6"></asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvTipoUsuarioModCS" CssClass="campo-obligatorio" ControlToValidate="cboxTipoUsuarioModCS" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarCuentaSecundaria"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footers">
                        <div runat="server" class="row alineacion-vertical" >
                            <div class="col-12 col-sm-6 col-md-4 col-lg-3 offset-sm-6 offset-md-8 offset-lg-9"> 
                                <asp:Button ID="btnAceptarModCS" runat="server" Text="btnAceptarModCS" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnAceptarModCS_Click" ValidationGroup="AgregarCuentaSecundaria"/>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
</asp:Content>
