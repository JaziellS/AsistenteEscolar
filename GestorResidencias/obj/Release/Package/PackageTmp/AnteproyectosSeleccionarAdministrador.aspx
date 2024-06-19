<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AnteproyectosSeleccionarAdministrador.aspx.cs" Inherits="GestorResidencias.AnteproyectosSeleccionarAdministrador" %>
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
            background-image: url(Assets/Imagenes/Fondos/Seleccionar.png);
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
        var xPosT, yPosT;

        function ScrollTab() {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(BeginRequestHandlerTab);
            prm.add_endRequest(EndRequestHandlerTab);
        }

        function BeginRequestHandlerTab(sender, args) {
            try {
                xPosT = $get('ScrollDiv').scrollLeft;
                yPosT = $get('ScrollDiv').scrollTop;
            } catch{

            }
        }

        function EndRequestHandlerTab(sender, args) {
            try {
                $get('ScrollDiv').scrollLeft = xPosT;
                $get('ScrollDiv').scrollTop = yPosT;
            } catch {

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
                            <div class="row" style="margin-bottom:10px;">
                                <div class="col-12 col-sm-12 col-md-12 text-center">
                                    <asp:Label runat="server" ID="lblPeriodoDes" CssClass="text-muted h3"></asp:Label>
                                </div>
                            </div>
                            <div class="text-center" style="margin-bottom:30px;">
                                <asp:Label runat="server" ID="lblHorasAsignar" CssClass="fontsizeh6 text-muted" Text=""></asp:Label>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-4 col-md-4 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNoControl" Text="lblNoControl" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNoControl" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" AutoPostBack="true" OnTextChanged="btnBuscar_Click"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-8 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombre" Text="lblNombre" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombre" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" AutoPostBack="true" OnTextChanged="btnBuscar_Click"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreProyecto" Text="lblNombreProyecto" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreProyecto" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" AutoPostBack="true" OnTextChanged="btnBuscar_Click"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-6 col-md-4 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEmpresa" Text="lblEmpresa" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxEmpresa" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" AutoPostBack="true" OnTextChanged="btnBuscar_Click"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-4 col-md-3 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblRevisores" Text="lblRevisores" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxRevisores" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" AutoPostBack="true" OnTextChanged="btnBuscar_Click"></asp:TextBox>
                                </div>
                            </div>
                            <asp:Button runat="server" ID="btnBuscar" Text="btnBuscar" BorderStyle="None" CssClass="form-control fontsizeh6" Visible="false" OnClick="btnBuscar_Click"/>
                            <div id="ScrollDiv" style="overflow-x:auto;">
                                <asp:GridView ID="gvAnteproyectos" runat="server" OnRowCreated="gvAnteproyectos_RowCreated" OnRowCommand="gvAnteproyectos_RowCommand" CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6"
                                    AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="IdPreliminaryDraft, IdUser, IdTeachersDet, IdTypeState" style="word-wrap: break-word;">
                                    <Columns>
                                        <asp:BoundField DataField="IdPreliminaryDraft" HeaderText="IdPreliminaryDraft"/>
                                        <asp:BoundField DataField="IdTeachersDet" HeaderText="IdTeachersDet"/>
                                        <asp:BoundField DataField="IdUser" HeaderText="IdUser"/>
                                        <asp:BoundField DataField="IdTypeState" HeaderText="IdTypeState"/>
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
                                        <asp:TemplateField HeaderText="Revisores" SortExpression="Revisores">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Revisores") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Revisores") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Seleccionar" SortExpression="Seleccionar">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSeleccionar" runat="server" Checked='<%# Bind("Seleccionar") %>' AutoPostBack="true" OnCheckedChanged="chkSeleccionar_CheckedChanged"/>
                                            </ItemTemplate>                            
                                        </asp:TemplateField>
                                        <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Ver" ItemStyle-HorizontalAlign="Center"/>
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

            <asp:Button ID="Button1" runat="server" style="display:none"/> 
            <ajaxToolkit:ModalPopupExtender runat="server" ID="modVerAnteproyecto" TargetControlID="Button1" BackgroundCssClass="modalBackground" PopupControlID="pVerAnteproyecto"></ajaxToolkit:ModalPopupExtender>
            <asp:Panel runat="server" CssClass="modal-responsivo" ID="pVerAnteproyecto" style="display:none; background-color:white;">
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
                        <div class="modal-bodys"  style="max-height:450px; overflow-y:auto;">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-9 col-lg-7" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreProyectoMod" Text="lblNombreProyectoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreProyectoMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblObjetivoProyectoMod" Text="lblObjetivoProyectoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxObjetivoProyectoMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblJustificacionMod" Text="lblJustificacionMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxJustificacionMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCronogramaMod" Text="lblCronogramaMod" CssClass="fontsizeh6"></asp:Label>
                                </div>
                            </div>
                            <div id="ScrollTab" style="overflow-x:auto;">
                                <asp:GridView ID="gvCronograma" runat="server" CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6"
                                    AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="IdPreliminaryDraft, IdSchedule, OrdenAcomodo">
                                <Columns>
                                    <asp:BoundField DataField="IdPreliminaryDraft" HeaderText="IdPreliminaryDraft"/>
                                    <asp:BoundField DataField="IdSchedule" HeaderText="IdSchedule"/>
                                    <asp:TemplateField HeaderText="NombreActividad" SortExpression="NombreActividad">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NombreActividad") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("NombreActividad") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana1" SortExpression="Semana1">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana1" runat="server" Checked='<%# Bind("Semana1") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana2" SortExpression="Semana2">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana2" runat="server" Checked='<%# Bind("Semana2") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana3" SortExpression="Semana3">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana3" runat="server" Checked='<%# Bind("Semana3") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana4" SortExpression="Semana4">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana4" runat="server" Checked='<%# Bind("Semana4") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana5" SortExpression="Semana5">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana5" runat="server" Checked='<%# Bind("Semana5") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana6" SortExpression="Semana6">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana6" runat="server" Checked='<%# Bind("Semana6") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana7" SortExpression="Semana7">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana7" runat="server" Checked='<%# Bind("Semana7") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana8" SortExpression="Semana8">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana8" runat="server" Checked='<%# Bind("Semana8") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana9" SortExpression="Semana9">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana9" runat="server" Checked='<%# Bind("Semana9") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana10" SortExpression="Semana10">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana10" runat="server" Checked='<%# Bind("Semana10") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana11" SortExpression="Semana11">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana11" runat="server" Checked='<%# Bind("Semana11") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana12" SortExpression="Semana12">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana12" runat="server" Checked='<%# Bind("Semana12") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana13" SortExpression="Semana13">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana13" runat="server" Checked='<%# Bind("Semana13") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana14" SortExpression="Semana14">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana14" runat="server" Checked='<%# Bind("Semana14") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana15" SortExpression="Semana15">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana15" runat="server" Checked='<%# Bind("Semana15") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Semana16" SortExpression="Semana16">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSemana16" runat="server" Checked='<%# Bind("Semana16") %>' Enabled="false"/>
                                        </ItemTemplate>                            
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="OrdenAcomodo" HeaderText="OrdenAcomodo"/>
                                </Columns>
                                </asp:GridView>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCronogramaDesMod" Text="lblCronogramaDesMod" CssClass="fontsizeh6"></asp:Label>
                                </div>
                            </div>
                            <%= sDetalleActividad.ToString() %>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblAlcanceMod" Text="lblAlcanceMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxAlcanceMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblLugarMod" Text="lblLugarMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxLugarMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                            </div>
                                
                            <div class="row" style="margin-bottom:20px;">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreEMod" Text="lblNombreEMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreEMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblGiroEMod" Text="lblGiroEMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxGiroEMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblDepartamentoEMod" Text="lblDepartamentoEMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxDepartamentoEMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblTelefonoEMod" Text="lblTelefonoEMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxTelefonoEMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreGerenteEMod" Text="lblNombreGerenteEMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreGerenteEMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreJefeAreaEMod" Text="lblNombreJefeAreaEMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreJefeAreaEMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                                    <asp:Label ID="lblDomicilioEMod" runat="server" Text="lblDomicilioE" CssClass="h5"></asp:Label>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom:20px;">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCalleEMod" Text="lblCalleEMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxCalleEMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNumExtEMod" Text="lblNumExtEMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNumExtEMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNumIntEMod" Text="lblNumIntEMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNumIntEMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblColoniaEMod" Text="lblColoniaEMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxColoniaEMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblMunicipioEMod" Text="lblMunicipioEMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxMunicipioEMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCiudadEMod" Text="lblCiudadEMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxCiudadEMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCPEMod" Text="lblCPEMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxCPEMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEstadoEMod" Text="lblEstadoEMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxEstadoEMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                                    <asp:Label ID="lblDatosRMod" runat="server" Text="lblDatosRMod" CssClass="h5"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNoControlRMod" Text="lblNoControlRMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNoControlRMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCarreraRMod" Text="lblCarreraRMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxCarreraRMod" CssClass="form-select fontsizeh6"></asp:DropDownList>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreRMod" Text="lblNombreRMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreRMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblTelefonoRMod" Text="lblTelefonoRMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxTelefonoRMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEmailRMod" Text="lblEmailRMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxEmailRMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
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
