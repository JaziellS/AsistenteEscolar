<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="MaestrosResidenciasAdministrador.aspx.cs" Inherits="GestorResidencias.MaestrosResidenciasAdministrador" %>
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
            background-image: url(Assets/Imagenes/Fondos/MaestrosResidencia.jpg);
            color:white;
            background-position: 100% 100%;
            text-align:center;
            background-size: cover;
            background-repeat:no-repeat;
            padding-top: 12.5rem;
            padding-bottom: 2rem;
            width:100%;
        }
        .cuadro-con-desenfoque {
            backdrop-filter: blur(10px);
            padding: 20px;
            box-sizing: border-box;
            background-color: rgba(255, 255, 255, 0.1); /* Semi-transparente */
          }

        @media screen and (min-width:992px) {
            .modal-responsivo {
                width: 900px;
            }
        }
    </style>
    <script type="text/javascript">
        var xPosT, yPosT;
        var xPosAM, yPosAM;
        var xPosM, yPosM;
        var xPosMAA, yPosMAA;
        var xPosTAA, yPosTAA;

        function Scrolls() {
            ScrollTablaPrincipal();
            ScrollModalAM();
            ScrollTabM();
            ScrollModAA();
            ScrollTabAA();
        }

        function ScrollTablaPrincipal() {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(BeginRequestHandlerTabPrincipal);
            prm.add_endRequest(EndRequestHandlerTabPrincipal);
        }

        function BeginRequestHandlerTabPrincipal(sender, args) {
            try {
                xPosT = $get('ScrollTabPrincipal').scrollLeft;
                yPosT = $get('ScrollTabPrincipal').scrollTop;
            } catch{

            }
        }

        function EndRequestHandlerTabPrincipal(sender, args) {
            try {
                $get('ScrollTabPrincipal').scrollLeft = xPosT;
                $get('ScrollTabPrincipal').scrollTop = yPosT;
            } catch {

            }
        }

        function ScrollModalAM() {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(BeginRequestHandlerModAM);
            prm.add_endRequest(EndRequestHandlerModAM);
        }

        function BeginRequestHandlerModAM(sender, args) {
            try {
                xPosAM = $get('ScrollModalAM').scrollLeft;
                yPosAM = $get('ScrollModalAM').scrollTop;
            } catch{

            }
        }

        function EndRequestHandlerModAM(sender, args) {
            try {
                $get('ScrollModalAM').scrollLeft = xPosAM;
                $get('ScrollModalAM').scrollTop = yPosAM;
            } catch {

            }
        }

        function ScrollTabM() {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(BeginRequestHandlerTabM);
            prm.add_endRequest(EndRequestHandlerTabM);
        }

        function BeginRequestHandlerTabM(sender, args) {
            try {
                xPosM = $get('ScrollTabM').scrollLeft;
                yPosM = $get('ScrollTabM').scrollTop;
            } catch{

            }
        }

        function EndRequestHandlerTabM(sender, args) {
            try {
                $get('ScrollTabM').scrollLeft = xPosM;
                $get('ScrollTabM').scrollTop = yPosM;
            } catch {

            }
        }

        function ScrollModAA() {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(BeginRequestHandlerModAA);
            prm.add_endRequest(EndRequestHandlerModAA);
        }

        function BeginRequestHandlerModAA(sender, args) {
            try {
                xPosMAA = $get('ScrollModAA').scrollLeft;
                yPosMAA = $get('ScrollModAA').scrollTop;
            } catch{

            }
        }

        function EndRequestHandlerModAA(sender, args) {
            try {
                $get('ScrollModAA').scrollLeft = xPosMAA;
                $get('ScrollModAA').scrollTop = yPosMAA;
            } catch {

            }
        }

        function ScrollTabAA() {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(BeginRequestHandlerTabAA);
            prm.add_endRequest(EndRequestHandlerTabAA);
        }

        function BeginRequestHandlerTabAA(sender, args) {
            try {
                xPosTAA = $get('ScrollTabAA').scrollLeft;
                yPosTAA = $get('ScrollTabAA').scrollTop;
            } catch{

            }
        }

        function EndRequestHandlerTabAA(sender, args) {
            try {
                $get('ScrollTabAA').scrollLeft = xPosTAA;
                $get('ScrollTabAA').scrollTop = yPosTAA;
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

        function iskeyPressModAA(keyCode) {
            if (keyCode == 13) {
                document.getElementById("<%=btnBuscarModAA.ClientID%>").focus();
                document.getElementById("<%=btnBuscarModAA.ClientID%>").style.backgroundColor = "#AEB6BF"
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
                    <div class="row">
                        <div class="col-7 col-sm-4 col-md-3 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblPeriodo" Text="lblPeriodo" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxPeriodo" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="btnBuscar_Click"></asp:DropDownList>
                        </div>
                        <div class="col-5 col-sm-3 col-md-2 col-lg-1" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblAnio" Text="lblAnio" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxAnio" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode);" AutoPostBack="true" OnTextChanged="btnBuscar_Click"></asp:TextBox>
                            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender2" runat="server"
                                ErrorTooltipEnabled="true" 
                                InputDirection="RightToLeft" 
                                CultureName="es-ES" 
                                MaskType="Number" Mask="9999" TargetControlID="tboxAnio"/>
                        </div>
                        <div class="col-12 col-sm-5 col-md-3 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNoEmpleado" Text="lblNoControl" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxNoEmpleado" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode);" AutoPostBack="true" OnTextChanged="btnBuscar_Click"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNombreMaestro" Text="lblNombre" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxNombreMaestro" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode);" AutoPostBack="true" OnTextChanged="btnBuscar_Click"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-6 col-md-3 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblProyectosAsignados" Text="lblProyectosAsignados" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxProyectosAsignados" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode);" AutoPostBack="true" OnTextChanged="btnBuscar_Click"></asp:TextBox>
                        </div>
                    </div>
                    <asp:Button runat="server" Visible="false" ID="btnBuscar" Text="btnBuscar" CausesValidation="false" BorderStyle="None" CssClass="form-control fontsizeh6" OnClick="btnBuscar_Click"/>
                    <div class="row">
                        <div class="col-6 col-md-2 col-sm-3">
                            <asp:ImageButton runat="server" CssClass="ibtn-hover-general" ID="ibtnAgregar" OnClick="ibtnAgregar_Click"/>
                        </div>
                    </div>
                    <div id="ScrollTabPrincipal" style="overflow-x:auto;">
                        <asp:GridView ID="gvMaestrosResidencia" runat="server" AllowPaging="True" PageSize="7" OnPageIndexChanging="gvMaestrosResidencia_PageIndexChanging" OnSorting="gvMaestrosResidencia_Sorting" OnRowCreated="gvMaestrosResidencia_RowCreated" OnRowCommand="gvMaestrosResidencia_RowCommand"
                            CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6" style="word-wrap: break-word;" AllowSorting="True" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="IdTeachers, IdTeachersDet, IdUser, IdPeriod, IdTypeState, Year, NombreMaestro, HorasAsignadas">
                        <Columns>
                            <asp:BoundField DataField="IdTeachers" HeaderText="IdTeachers"/>
                            <asp:BoundField DataField="IdTeachersDet" HeaderText="IdTeachersDet"/>
                            <asp:BoundField DataField="IdUser" HeaderText="IdUser"/>
                            <asp:BoundField DataField="IdPeriod" HeaderText="IdPeriod"/>
                            <asp:BoundField DataField="IdTypeState" HeaderText="IdTypeState"/>
                            <asp:BoundField DataField="Year" HeaderText="Year"/>
                            <asp:TemplateField HeaderText="NoControl" SortExpression="NoControl">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NoControl") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("NoControl") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NombreMaestro" SortExpression="NombreMaestro">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NombreMaestro") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("NombreMaestro") %>'></asp:Label>
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
                            <asp:TemplateField HeaderText="ProyectosAsignados" SortExpression="ProyectosAsignados">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ProyectosAsignados") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ProyectosAsignados") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ProyectosAsignados" SortExpression="ProyectosAsignados">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("HorasAsignadas") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("HorasAsignadas") %>'></asp:Label>
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
                            <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="AsignarAnteproyecto" ItemStyle-HorizontalAlign="Center"/>
                            <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="VerAnteproyectos" ItemStyle-HorizontalAlign="Center"/>
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
                <div class="col-12 col-sm-6 col-md-4 col-lg-3 offset-sm-6 offset-md-8 offset-lg-9">
                    <asp:Button runat="server" ID="btnDescargar" CssClass="form-control fontsizeh6 btn-hover-general" Text="btnDescargar" OnClick="btnDescargar_Click"/>
                </div>
            </div>
            <br />
            <br />


            <asp:Button ID="Button1" runat="server" style="display:none"/> 
            <ajaxToolkit:ModalPopupExtender runat="server" ID="modAsignarMaestros" TargetControlID="Button1" BackgroundCssClass="modalBackground" PopupControlID="PAsignarMaestros"></ajaxToolkit:ModalPopupExtender>
            <asp:Panel runat="server" CssClass="modal-responsivo" ID="PAsignarMaestros" style="display:none; background-color:white;">
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
                        <div id="ScrollModalAM" class="modal-bodys" style="max-height:450px; overflow-y:auto;">
                            <div class="row">
                                <div class="col-7 col-sm-5 col-md-4 col-lg-3">
                                    <asp:Label runat="server" ID="lblPeriodoMod" Text="lblPeriodoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxPeriodoMod" CssClass="form-select fontsizeh6"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvPeriodoMod" CssClass="campo-obligatorio" ControlToValidate="cboxPeriodoMod" Display="Dynamic" ValidationGroup="AsignarMaestros"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-5 col-sm-3 col-md-2 col-lg-2">
                                    <asp:Label runat="server" ID="lblAnioMod" Text="lblAnioMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxAnioMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server"
                                        ErrorTooltipEnabled="true" 
                                        InputDirection="RightToLeft" 
                                        CultureName="es-ES" 
                                        MaskType="Number" Mask="9999" TargetControlID="tboxAnioMod"/>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvAnioMod" CssClass="campo-obligatorio" ControlToValidate="tboxAnioMod" Display="Dynamic" ValidationGroup="AsignarMaestros"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-3 col-md-3 col-lg-2" style="padding-top:23px;">
                                    <asp:Button runat="server" ID="btnCargarMod" CssClass="form-control fontsizeh6 btn-hover-general" Text="btnCargarMod" OnClick="btnCargarMod_Click" ValidationGroup="AsignarMaestros"/>
                                </div>
                            </div>
                            <br />
                            <div id="divTablaMaestrosMod" runat="server">
                                <br />
                                <div class="text-center" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblTituloPeriodoMod" CssClass="h5" Text=""></asp:Label>
                                </div>
                                <div id="ScrollTabM" style="overflow-x:auto;">
                                    <asp:GridView ID="gvMaestros" runat="server" AllowPaging="True" PageSize="7" OnPageIndexChanging="gvMaestros_PageIndexChanging" OnSorting="gvMaestros_Sorting"
                                        CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6" AllowSorting="True" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="IdUser, IdTeachers, IdTeachersDet, IdPeriod, Year">
                                    <Columns>
                                        <asp:BoundField DataField="IdUser" HeaderText="IdUser"/>
                                        <asp:BoundField DataField="IdTeachers" HeaderText="IdTeachers"/>
                                        <asp:BoundField DataField="IdTeachersDet" HeaderText="IdTeachersDet"/>
                                        <asp:BoundField DataField="IdPeriod" HeaderText="IdPeriod"/>
                                        <asp:BoundField DataField="Year" HeaderText="Year"/>
                                        <asp:TemplateField HeaderText="NoControl" SortExpression="NoControl">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NoControl") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("NoControl") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="NombreMaestro" SortExpression="NombreMaestro">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NombreMaestro") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("NombreMaestro") %>'></asp:Label>
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
                                        <asp:TemplateField HeaderText="Asignar" SortExpression="Asignar">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkAsignar" runat="server" Checked='<%# Bind("Asignar") %>' Enabled="true" OnCheckedChanged="chkAsignar_CheckedChanged" AutoPostBack="true"/>
                                            </ItemTemplate>                            
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CantidadHoras" SortExpression="CantidadHoras">
                                            <ItemTemplate>
                                                <asp:TextBox ID="tboxCantidadHoras" MaxLength="1" runat="server" Text='<%# Bind("CantidadHoras") %>' OnTextChanged="tboxCantidadHoras_TextChanged" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" AutoPostBack="true"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                                    FilterType="Numbers"
                                                    TargetControlID="tboxCantidadHoras"/>
                                            </ItemTemplate>                            
                                        </asp:TemplateField>
                                    </Columns>   
                                         <PagerSettings FirstPageText="&amp;lt; &amp;lt;" LastPageText="&amp;gt; &amp;gt;" Mode="NumericFirstLast" PageButtonCount="5" PreviousPageText="&amp;lt; " />
                                         <PagerStyle CssClass="pager-row"/>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footers">
                            
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>

            <asp:Button ID="Button2" runat="server" style="display:none"/> 
            <ajaxToolkit:ModalPopupExtender runat="server" ID="modAsignarAnteproyectos" TargetControlID="Button2" BackgroundCssClass="modalBackground" PopupControlID="PAsignarAnteproyectos"></ajaxToolkit:ModalPopupExtender>
            <asp:Panel runat="server" CssClass="modal-responsivo" ID="PAsignarAnteproyectos" style="display:none; background-color:white;">
                <asp:UpdatePanel runat="server" ID="up3">
                    <ContentTemplate>
                        <div class="modal-headers text-center">
                            <div class="alineacion-vertical">
                                <div class="text-center container">
                                    <asp:Label ID="lblDescripcionModuloModAA" runat="server" Text="lblDescripcionModuloModAA" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                                </div>
                                <asp:ImageButton runat="server" CssClass="ibtn-hover-general" ID="ibtnCerrarModAA" OnClick="ibtnCerrarModAA_Click"/>
                            </div>
                        </div>
                        <div id="ScrollModAA" class="modal-bodys" style="max-height:450px; overflow-y:auto;">
                            <div class="text-center" style="margin-bottom:5px;">
                                <asp:Label runat="server" ID="lblNombreMaestroAA" CssClass="h5" Text=""></asp:Label>
                            </div>
                            <div class="text-center">
                                <asp:Label runat="server" ID="lblHorasAsignarAA" CssClass="fontsizeh6 text-muted" Text=""></asp:Label>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-7 col-sm-6 col-md-5 col-lg-4">
                                    <asp:Label runat="server" ID="lblNombreModAA" Text="lblNombreModAA" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreModAA" CssClass="form-control fontsizeh6" onkeydown="iskeyPressModAA(event.keyCode);" AutoPostBack="true" OnTextChanged="btnBuscarModAA_Click"></asp:TextBox>
                                </div>
                                <div class="col-5 col-sm-4 col-md-3 col-lg-2">
                                    <asp:Label runat="server" ID="lblMaestrosAsigModAA" Text="lblMaestrosAsigModAA" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxMaestrosAsigModAA" CssClass="form-control fontsizeh6" onkeydown="iskeyPressModAA(event.keyCode);" AutoPostBack="true" OnTextChanged="btnBuscarModAA_Click"></asp:TextBox>
                                </div>
                            </div>
                            <asp:Button runat="server" Visible="false" ID="btnBuscarModAA" CausesValidation="false" CssClass="form-control fontsizeh6" OnClick="btnBuscarModAA_Click"/>
                            <br />
                            <div id="ScrollTabAA" style="overflow-x:auto;">
                                <asp:GridView ID="gvAnteproyectosModAA" runat="server" AllowPaging="True" PageSize="7" OnPageIndexChanging="gvAnteproyectosModAA_PageIndexChanging" OnSorting="gvAnteproyectosModAA_Sorting"
                                    CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6" AllowSorting="True" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="IdPreliminaryDraft, MaestrosAsignados, IdUser, NombreAnteproyecto">
                                <Columns>
                                    <asp:BoundField DataField="IdPreliminaryDraft" HeaderText="IdPreliminaryDraft"/>
                                    <asp:BoundField DataField="IdUser" HeaderText="IdUser"/>
                                    <asp:TemplateField HeaderText="NombreAnteproyecto" SortExpression="NombreAnteproyecto">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1AA" runat="server" Text='<%# Bind("NombreAnteproyecto") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1AA" runat="server" Text='<%# Bind("NombreAnteproyecto") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MaestrosAsignados" SortExpression="MaestrosAsignados">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2AA" runat="server" Text='<%# Bind("MaestrosAsignados") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2AA" runat="server" Text='<%# Bind("MaestrosAsignados") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="AsignarAnteproyecto" SortExpression="AsignarAnteproyecto">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkAsignarAnteproyecto" runat="server" Checked='<%# Bind("AsignarAnteproyecto") %>' Enabled="true" OnCheckedChanged="chkAsignarAnteproyecto_CheckedChanged" AutoPostBack="true"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                </Columns>   
                                        <PagerSettings FirstPageText="&amp;lt; &amp;lt;" LastPageText="&amp;gt; &amp;gt;" Mode="NumericFirstLast" PageButtonCount="5" PreviousPageText="&amp;lt; " />
                                        <PagerStyle CssClass="pager-row"/>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="modal-footers">
                            
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>

            <asp:Button ID="Button3" runat="server" style="display:none"/> 
            <ajaxToolkit:ModalPopupExtender runat="server" ID="modVerAnteproyectos" TargetControlID="Button3" BackgroundCssClass="modalBackground" PopupControlID="PVerAnteproyectos"></ajaxToolkit:ModalPopupExtender>
            <asp:Panel runat="server" CssClass="modal-responsivo" ID="PVerAnteproyectos" style="display:none; background-color:white;">
                <asp:UpdatePanel runat="server" ID="up4">
                    <ContentTemplate>
                        <div class="modal-headers text-center">
                            <div class="alineacion-vertical">
                                <div class="text-center container">
                                    <asp:Label ID="lblDescripcionModuloModVA" runat="server" Text="lblDescripcionModuloModVA" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                                </div>
                                <asp:ImageButton runat="server" CssClass="ibtn-hover-general" ID="ibtnCerrarModVA" OnClick="ibtnCerrarModVA_Click"/>
                            </div>
                        </div>
                        <div class="modal-bodys" style="max-height:450px; overflow-y:auto;">
                            <br />
                            <div style="overflow-x:auto;">
                                <asp:GridView ID="gvAnteproyectosModVA" runat="server" CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" 
                                    DataKeyNames="IdTeachers, IdTeachersDet, IdPreliminaryDraft">
                                <Columns>
                                    <asp:BoundField DataField="IdTeachers" HeaderText="IdTeachers"/>
                                    <asp:BoundField DataField="IdTeachersDet" HeaderText="IdTeachersDet"/>
                                    <asp:BoundField DataField="IdPreliminaryDraft" HeaderText="IdPreliminaryDraft"/>
                                    <asp:TemplateField HeaderText="NombreAnteproyecto" SortExpression="NombreAnteproyecto">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1AA" runat="server" Text='<%# Bind("NombreAnteproyecto") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1AA" runat="server" Text='<%# Bind("NombreAnteproyecto") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Calificacion" SortExpression="Calificacion">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1AA" runat="server" Text='<%# Bind("Calificacion") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1AA" runat="server" Text='<%# Bind("Calificacion") %>'></asp:Label>
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
