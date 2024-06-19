<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AnteproyectoResidenciaCalificar.aspx.cs" Inherits="GestorResidencias.AnteproyectoResidenciaCalificar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Assets/CSS/EstilosResponsivos.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">  
        .swal-overlay {
            z-index: 99999;
        }

        #ui-datepicker-div {
            z-index: 99999 !important;
        } 

        .multiselect-container {
            max-height:300px;
            max-width:350px;
            overflow-y:auto;
        }
    </style>
    <style type="text/css">
        input[type="checkbox"] {
            accent-color: black;
        }

        .img-interrogacion {
            width:20px;
            margin-left:5px;
        }

        .borde-datos-anteproyecto {
            border: #2a2a2a59 1px solid;
            padding:35px;
            margin:-35px;
            border-radius:10px;
            margin-top:0px;
            margin-bottom:0px;
        }
        .circulo img {   
            width: 130px;
            height:130px;
            object-fit: cover;
        }

        .circuloM img {   
            width: 100px;
            height:100px;
            object-fit: cover;
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
                width: 800px;
            }
        }
    </style>
    <script type="text/javascript">
        var xPos, yPos;
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(BeginRequestHandler);
        prm.add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
            xPos = $get('ScrollModalA').scrollLeft;
            yPos = $get('ScrollModalA').scrollTop;
        }

        function EndRequestHandler(sender, args) {
            $get('ScrollModalA').scrollLeft = xPos;
            $get('ScrollModalA').scrollTop = yPos;
        }
    </script>
    <script type="text/javascript">
        var xPosT, yPosT;
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(BeginRequestHandler);
        prm.add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
            xPosT = $get('ScrollTab').scrollLeft;
            yPosT = $get('ScrollTab').scrollTop;
        }

        function EndRequestHandler(sender, args) {
            $get('ScrollTab').scrollLeft = xPosT;
            $get('ScrollTab').scrollTop = yPosT;
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
                <div class="row">
                    <div class="col-9 col-sm-5 col-md-4 col-lg-2" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblPeriodo" CssClass="fontsizeh6" Text="lblPeriodo"></asp:Label>
                        <asp:DropDownList runat="server" ID="cboxPeriodo" CssClass="form-select fontsizeh6"></asp:DropDownList>
                    </div>
                    <div class="col-3 col-sm-3 col-md-2 col-lg-1" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblAnio" CssClass="fontsizeh6" Text="lblAnio"></asp:Label>
                        <asp:TextBox runat="server" ID="tboxAnio" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-8 col-lg-5" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblNombreP" Text="lblNombreP" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" ID="tboxNombreP" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblObjetivoP" Text="lblObjetivoP" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" ID="tboxObjetivoP" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="5"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblJustificacion" Text="lblJustificacion" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" ID="tboxJustificacion" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="5"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblCronograma" Text="lblCronograma" CssClass="fontsizeh6"></asp:Label>
                    </div>
                </div>
                <div style="overflow-x:auto;">
                    <asp:GridView ID="gvCronograma" runat="server" 
                        CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="IdPreliminaryDraft, IdSchedule, OrdenAcomodo">
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
                                <asp:CheckBox ID="chkSemana1" runat="server" Checked='<%# Bind("Semana1") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana2" SortExpression="Semana2">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana2" runat="server" Checked='<%# Bind("Semana2") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana3" SortExpression="Semana3">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana3" runat="server" Checked='<%# Bind("Semana3") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana4" SortExpression="Semana4">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana4" runat="server" Checked='<%# Bind("Semana4") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana5" SortExpression="Semana5">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana5" runat="server" Checked='<%# Bind("Semana5") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana6" SortExpression="Semana6">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana6" runat="server" Checked='<%# Bind("Semana6") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana7" SortExpression="Semana7">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana7" runat="server" Checked='<%# Bind("Semana7") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana8" SortExpression="Semana8">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana8" runat="server" Checked='<%# Bind("Semana8") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana9" SortExpression="Semana9">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana9" runat="server" Checked='<%# Bind("Semana9") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana10" SortExpression="Semana10">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana10" runat="server" Checked='<%# Bind("Semana10") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana11" SortExpression="Semana11">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana11" runat="server" Checked='<%# Bind("Semana11") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana12" SortExpression="Semana12">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana12" runat="server" Checked='<%# Bind("Semana12") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana13" SortExpression="Semana13">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana13" runat="server" Checked='<%# Bind("Semana13") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana14" SortExpression="Semana14">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana14" runat="server" Checked='<%# Bind("Semana14") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana15" SortExpression="Semana15">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana15" runat="server" Checked='<%# Bind("Semana15") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana16" SortExpression="Semana16">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana16" runat="server" Checked='<%# Bind("Semana16") %>' />
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:BoundField DataField="OrdenAcomodo" HeaderText="OrdenAcomodo"/>
                    </Columns>
                    </asp:GridView>
                </div>
                <br />
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12">
                        <asp:Label runat="server" ID="lblDescripcionDet" Text="lblDescripcionDet" CssClass="fontsizeh6"></asp:Label>
                    </div>
                </div>
                <%= sDetalleActividadCal.ToString() %>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblAlcanceP" Text="lblAlcanceP" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" ID="tboxAlcanceP" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="5"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblLugar" Text="lblLugar" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" ID="tboxLugarP" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:5px;">
                        <asp:Label runat="server" ID="lblInformacionEmpresa" Text="lblInformacionEmpresa" CssClass="fontsizeh6"></asp:Label>
                    </div>
                </div>
                <div class="borde-datos-anteproyecto">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-8 col-lg-5" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNombreE" Text="lblNombreE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxNombreE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblGiroE" Text="lblGiroE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxGiroE" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="4"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-4 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblDepartamentoE" Text="lblDepartamentoE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxDepartamentoE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblTelefonoE" Text="lblTelefonoE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxTelefonoE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:20px;">
                        <div class="col-12 col-sm-12 col-md-6 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNombreGerenteE" Text="lblNombreGerenteE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxNombreGerenteE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-12 col-md-5 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblJefeAreaE" Text="lblJefeAreaE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxJefeAreaE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                            <asp:Label ID="lblDomicilioE" runat="server" Text="lblDomicilioE" CssClass="h5"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-6 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblCalleE" Text="lblCalleE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxCalleE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-3 col-md-3 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNumExtE" Text="lblNumExtE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxNumExtE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-3 col-md-3 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNumIntE" Text="lblNumIntE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxNumIntE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-8 col-md-7 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblColoniaE" Text="lblColoniaE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxColoniaE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:20px;">
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblMunicipioE" Text="lblMunicipioE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxMunicipioE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblCiudadE" Text="lblCiudadE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxCiudadE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-5 col-md-3 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblCPE" Text="lblCPE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxCPE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblEstadoE" Text="lblEstadoE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxEstadoE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                            <asp:Label ID="lblDatosR" runat="server" Text="lblDatosR" CssClass="h5"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-5 col-md-3 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNumControlR" Text="lblNumControlR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxNumControlR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-7 col-md-5 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblCarreraR" Text="lblCarreraR" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxCarreraR" CssClass="form-select fontsizeh6"></asp:DropDownList>
                        </div>
                        <div class="col-12 col-sm-8 col-md-6 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNombreR" Text="lblNombreR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxNombreR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-4 col-md-3 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblTelefonoR" Text="lblTelefonoR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxTelefonoR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-8 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblEmailR" Text="lblEmailR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxEmailR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <br />
                <div id="divBotones" runat="server">
                    <div class="row alineacion-vertical">
                        <div class="col-12 col-md-6 col-sm-6 offset-md-3 offset-sm-3"> 
                            <asp:Button ID="btnCalificar" runat="server" Text="btnCalificar" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnCalificar_Click"/>           
                            <asp:Button ID="btnCalificarJefeC" runat="server" Text="btnCalificarJefeC" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnCalificarJefeC_Click"/>           
                        </div>
                    </div>
                    <br />
                </div>
                <%=sMisComentarios.ToString() %>
            </ContentTemplate>
        </asp:UpdatePanel>


        <asp:Button ID="Button1" runat="server" style="display:none"/> 
        <ajaxToolkit:ModalPopupExtender runat="server" ID="modAgregarComentario" TargetControlID="Button1" BackgroundCssClass="modalBackground" PopupControlID="PAgregarComentario"></ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" CssClass="modal-responsivo" ID="PAgregarComentario" style="display:none; background-color:white;">
            <asp:UpdatePanel runat="server" ID="up2">
                <ContentTemplate>
                    <div class="modal-headers text-center">
                        <asp:Label ID="lblDescripcionModuloModC" runat="server" Text="lblDescripcionModuloModC" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                    </div>
                    <div class="modal-bodys">
                        <div class="row" style="margin-bottom:10px;">
                            <div class="col-12 col-sm-8 col-md-4">
                                <asp:Label runat="server" ID="lblEstatusMod" Text="lblEstatusMod" CssClass="fontsizeh6"></asp:Label>
                                <asp:DropDownList runat="server" ID="cboxEstatusMod" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="cboxEstatusMod_SelectedIndexChanged"></asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvEstatusMod" CssClass="campo-obligatorio" ControlToValidate="cboxEstatusMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarComentario"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-md-12 col-sm-12">
                                <asp:Label runat="server" ID="lblComentarioMod" Text="lblComentarioMod" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" ID="tboxComentariosMod" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="6"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvComentariosMod" CssClass="campo-obligatorio" ControlToValidate="tboxComentariosMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarComentario"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footers">
                        <div class="row alineacion-vertical" >
                            <div class="col-6 col-sm-4 col-md-2 offset-md-8 offset-sm-4"> 
                                <asp:Button ID="btnCancelarMod" runat="server" Text="btnCancelarMod" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnCancelarMod_Click"/>                                                                                         
                            </div>
                            <div class="col-6 col-sm-4 col-md-2"> 
                                <asp:Button ID="btnAceptarMod" runat="server" Text="btnAceptarMod" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnAceptarMod_Click" ValidationGroup="AgregarComentario"/>           
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Button ID="Button2" runat="server" style="display:none"/> 
        <ajaxToolkit:ModalPopupExtender runat="server" ID="modAgregarComentarioJC" TargetControlID="Button2" BackgroundCssClass="modalBackground" PopupControlID="PAgregarComentarioJC"></ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" CssClass="modal-responsivo" ID="PAgregarComentarioJC" style="display:none; background-color:white;">
            <asp:UpdatePanel runat="server" ID="up3">
                <ContentTemplate>
                    <div class="modal-headers text-center">
                        <asp:Label ID="lblDescripcionModuloModJC" runat="server" Text="lblDescripcionModuloModJC" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                    </div>
                    <div id="ScrollModalA" class="modal-bodys" style="max-height:450px; overflow-y:auto;">
                        <div class="row" style="margin-bottom:10px;">
                            <div class="col-12 col-sm-6 col-md-4">
                                <asp:Label runat="server" ID="lblEstatusModJC" Text="lblEstatusModJC" CssClass="fontsizeh6"></asp:Label>
                                <asp:DropDownList runat="server" ID="cboxEstatusModJC" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="cboxEstatusModJC_SelectedIndexChanged"></asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvEstatusModJC" CssClass="campo-obligatorio" ControlToValidate="cboxEstatusModJC" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarComentarioJefeC"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div id="ScrollTab" style="overflow-x:auto;">
                            <asp:GridView ID="gvComentariosModJC" runat="server" OnRowCreated="gvComentariosModJC_RowCreated" OnRowCommand="gvComentariosModJC_RowCommand"
                                CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="Comentario">
                            <Columns>
                                <asp:BoundField DataField="IdTeachers" HeaderText="IdTeachers"/>
                                <asp:BoundField DataField="IdTeachersDet" HeaderText="IdTeachersDet"/>
                                <asp:BoundField DataField="IdPreliminaryDraft" HeaderText="IdPreliminaryDraft"/>
                                <asp:TemplateField HeaderText="NombreMaestro" SortExpression="NombreMaestro">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1JC" runat="server" Text='<%# Bind("NombreMaestro") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1JC" runat="server" Text='<%# Bind("NombreMaestro") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Comentario" SortExpression="Comentario">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2JC" runat="server" Text='<%# Bind("Comentario") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2JC" runat="server" Text='<%# Bind("Comentario") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EstadoAnteproyectoText" SortExpression="EstadoAnteproyectoText">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3JC" runat="server" Text='<%# Bind("EstadoAnteproyectoText") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3JC" runat="server" Text='<%# Bind("EstadoAnteproyectoText") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TranscribirTexto" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="TranscribirTexto" CssClass="ibtn-hover-general" CommandArgument="<%# Container.DataItemIndex %>"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>   
                            </asp:GridView>
                        </div>
                        <div class="row">
                            <div class="col-12 col-md-12 col-sm-12">
                                <asp:Label runat="server" ID="lblComentarioModJC" Text="lblComentarioModJC" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" ID="tboxComentariosModJC" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="6"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvComentariosModJC" CssClass="campo-obligatorio" ControlToValidate="tboxComentariosModJC" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarComentarioJefeC"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footers">
                        <div class="row alineacion-vertical" >
                            <div class="col-6 col-sm-4 col-md-2 offset-sm-4 offset-md-8"> 
                                <asp:Button ID="btnCancelarModJC" runat="server" Text="btnCancelarModJC" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnCancelarModJC_Click"/>                                                                                         
                            </div>
                            <div class="col-6 col-sm-4 col-md-2"> 
                                <asp:Button ID="btnAceptarModJC" runat="server" Text="btnAceptarModJC" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnAceptarModJC_Click" ValidationGroup="AgregarComentarioJefeC"/>           
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
</asp:Content>
