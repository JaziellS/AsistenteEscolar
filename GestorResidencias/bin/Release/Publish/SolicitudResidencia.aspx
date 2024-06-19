<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="SolicitudResidencia.aspx.cs" Inherits="GestorResidencias.SolicitudResidencia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Assets/CSS/fontawesome-free-5.13.0-web/css/all.css"/>
    <link rel="stylesheet" href="Assets/CSS/jquery-datecustom.css"/>
    <link rel="stylesheet" href="Assets/CSS/jquery-ui.css"/>
    <link rel="stylesheet" href="Assets/CSS/jquery.dropdown.css"/>
    <link rel="stylesheet" href="Assets/CSS/bootstrap-multiselect.css"/>
    <script src="Assets/Scripts/jquery.dropdown.js"></script>
    <script src="Assets/Scripts/jquery.timepicker.js"></script>
    <script src="Assets/Scripts/bootstrap-datetimepicker.js"></script>
    <script src="Assets/Scripts/bootstrap-multiselect.js"></script>
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
    <script type="text/javascript">
        $(document).ready(function () {
            InicializarComponentes();
        });

        function InicializarComponentes() {
            InicializarFecha();
            InicializarCombos();
        }

        function InicializarCombos() {
            $('#<%=lboxBusquedaEmpresa.ClientID%>').multiselect({
                selectAllNumber: false,
                buttonWidth: '100%',
                nonSelectedText: 'Seleccionar',
                selectedClass: 'multiselect-selected',
                nSelectedText: ' - Seleccionados'
            });
        }

        function InicializarFecha() {
            $('.mi_calendario').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                //minDate: "0D",
                numberOfMonths: 1,
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo',
                    'Junio', 'Julio', 'Agosto', 'Septiembre',
                    'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr',
                    'May', 'Jun', 'Jul', 'Ago',
                    'Sep', 'Oct', 'Nov', 'Dic']

            });
        }
    </script>
    <style>
    </style>
    <div class="container contenidopagina">
        <br />
        <div class="alineacion-vertical">
            <asp:ImageButton ID="ibtnRetroceder" CssClass="ibtn-hover-general" runat="server" CausesValidation="false" OnClick="ibtnRetroceder_Click"/>
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
                <div id="divRecuperarInfo" runat="server" class="row" style="margin-bottom:20px;">
                    <div class="col-12 col-md-12 col-sm-12 col-lg-12">
                        <asp:LinkButton ID="lbtnRecuperaInfo" runat="server" Text="Recuperar informacion de la anterior solicitud." BorderStyle="None" cssclass="lbtn-general" OnClick="lbtnRecuperaInfo_Click" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-5 col-lg-4" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblLugar" Text="lblLugar" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" MaxLength="150" ID="tboxLugar" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvLugar" CssClass="campo-obligatorio" ControlToValidate="tboxLugar" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-12 col-sm-12 col-md-3 col-lg-2" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblFecha" Text="lblFecha" CssClass="fontsizeh6"></asp:Label>
                        <div class="input-group date h6 fechaicongrp">
                            <asp:TextBox runat="server" ID="tboxFecha" CssClass="form-control mi_calendario fontsizeh6" ClientIDMode="Static" AutoComplete="off" onblur="$(this).trigger('change')" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxFecha_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:Label runat="server" AssociatedControlID="tboxFecha" CssClass="input-group-text generi_btn">
                                <i class="fas fa-calendar-alt " aria-hidden="true"></i>
                            </asp:Label>
                        </div>
                        <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server"
                            ErrorTooltipEnabled="true" 
                            InputDirection="RightToLeft" 
                            CultureName="es-ES" 
                            MaskType="Date" Mask="99/99/9999" TargetControlID="tboxFecha"/>    
                        <asp:RequiredFieldValidator runat="server" ID="rfvFecha" CssClass="campo-obligatorio" ControlToValidate="tboxFecha" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row" style="margin-bottom:20px;">
                    <div class="col-12 col-sm-12 col-md-7 col-lg-3" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblNombreProyecto" Text="lblNombreProyecto" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" MaxLength="200" ID="tboxNombreProyecto" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvNombreProyecto" CssClass="campo-obligatorio" ControlToValidate="tboxNombreProyecto" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-12 col-sm-12 col-md-5 col-lg-2" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblProcedenciaProyecto" Text="lblProcedenciaProyecto" CssClass="fontsizeh6"></asp:Label>
                        <asp:DropDownList runat="server" ID="cboxProcedenciaProyecto" CssClass="form-select fontsizeh6" OnSelectedIndexChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvProcedenciaProyecto" CssClass="campo-obligatorio" ControlToValidate="cboxProcedenciaProyecto" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-12 col-sm-4 col-md-3 col-lg-2" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblNumeroResidentes" Text="lblNumeroResidentes" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" MaxLength="2" ID="tboxNumeroResidentes" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server"
                                FilterType="Numbers"
                                TargetControlID="tboxNumeroResidentes"/>
                        <asp:RequiredFieldValidator runat="server" ID="rfvNumeroResidentes" CssClass="campo-obligatorio" ControlToValidate="tboxNumeroResidentes" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-12 col-sm-8 col-md-3 col-lg-3" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblPeriodo" Text="lblPeriodo" CssClass="fontsizeh6"></asp:Label>
                        <asp:DropDownList runat="server" ID="cboxPeriodo" CssClass="form-select fontsizeh6" OnSelectedIndexChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvPeriodo" CssClass="campo-obligatorio" ControlToValidate="cboxPeriodo" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-12 col-sm-4 col-md-2 col-lg-2" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblAnio" Text="lblAnio" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" ID="tboxAnio" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender2" runat="server"
                            ErrorTooltipEnabled="true" 
                            InputDirection="RightToLeft" 
                            CultureName="es-ES" 
                            MaskType="Number" Mask="9999" TargetControlID="tboxAnio"/>   
                        <asp:RequiredFieldValidator runat="server" ID="rfvAnio" CssClass="campo-obligatorio" ControlToValidate="tboxAnio" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div id="divDatosEmpresa" style="background-color:#F4F4F4; margin-left:-30px; margin-right:-30px; padding:30px;padding-bottom:0px;">
                    <div class="row text-center">
                        <div class="col-12 col-sm-12 col-md-12">
                            <asp:Label ID="lblDatosEmpresaE" runat="server" Text="lblDatosEmpresaE" CssClass="h4 fontbold"></asp:Label>
                        </div>
                    </div>
                    <br />
                    <div id="divBusquedaE" runat="server" class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-5">
                            <asp:Label runat="server" ID="lblBusquedaEmpresa" Text="lblBusquedaEmpresa" CssClass="fontsizeh6"></asp:Label>
                            <asp:ListBox runat="server" ID="lboxBusquedaEmpresa" SelectionMode="Multiple" CssClass="form-control fontsizeh6" OnSelectedIndexChanged="lboxBusquedaEmpresa_SelectedIndexChanged" AutoPostBack="true"></asp:ListBox>
                        </div>
                        <div class="col-12 col-sm-12 col-md-12 col-lg-7" style="margin-top:35px; margin-bottom:10px;">
                            <asp:CheckBox runat="server" ID="chkITSJ" CssClass="form-check fontsizeh6" TextAlign="Right" Text="chkITSJ" OnCheckedChanged="chkITSJ_CheckedChanged" AutoPostBack="true"></asp:CheckBox>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNombreFiscalE" Text="lblNombreFiscalE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="250" ID="tboxNombreFiscalE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvNombreFiscalE" CssClass="campo-obligatorio" ControlToValidate="tboxNombreFiscalE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-4 col-md-4 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblRamoE" Text="lblRamoE" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxRamoE" CssClass="form-select fontsizeh6" OnSelectedIndexChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvRamoE" CssClass="campo-obligatorio" ControlToValidate="cboxRamoE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-4 col-md-4 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblSectorE" Text="lblSectorE" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxSectorE" CssClass="form-select fontsizeh6" OnSelectedIndexChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvSectorE" CssClass="campo-obligatorio" ControlToValidate="cboxSectorE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-4 col-md-4 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblRFCE" Text="lblRFCE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="50" ID="tboxRFCE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvRFCE" CssClass="campo-obligatorio" ControlToValidate="tboxRFCE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-7 col-md-5 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblTelefonoE" Text="lblTelefonoE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="10" ID="tboxTelefonoE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="fteTelefonoE" runat="server"
                                FilterType="Numbers"
                                TargetControlID="tboxTelefonoE"/>
                            <asp:RegularExpressionValidator ID="revTelefonoE" runat="server" CssClass="campo-obligatorio"
                                ControlToValidate="tboxTelefonoE" SetFocusOnError="true" Display="Dynamic"
                                ErrorMessage="Deben ser 10 caracteres."
                                ValidationExpression="^\d{10}$" ValidationGroup="AgregarSolicitud"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvTelefonoE" CssClass="campo-obligatorio" ControlToValidate="tboxTelefonoE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-5 col-md-3 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblFaxE" Text="lblFaxE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="30" ID="tboxFaxE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-7 col-md-5 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblTamanoEmpresaE" Text="lblTamanoEmpresaE" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxTamanoEmpresaE" CssClass="form-select fontsizeh6" OnSelectedIndexChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvTamanoEmpresaE" CssClass="campo-obligatorio" ControlToValidate="cboxTamanoEmpresaE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblMisionE" Text="lblMisionE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxMisionE" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="5" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvMisionE" CssClass="campo-obligatorio" ControlToValidate="tboxMisionE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:20px;">
                        <div class="col-12 col-sm-6 col-md-4 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNombreTitularE" Text="lblNombreTitularE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="250" ID="tboxNombreTitularE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvNombreTitularE" CssClass="campo-obligatorio" ControlToValidate="tboxNombreTitularE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNombreAseExtE" Text="lblNombreAseExtE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="250" ID="tboxNombreAseExtE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvNombreAseExtE" CssClass="campo-obligatorio" ControlToValidate="tboxNombreAseExtE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblPuestoAseExtE" Text="lblPuestoAseExtE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="250" ID="tboxPuestoAseExtE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvPuestoAseExtE" CssClass="campo-obligatorio" ControlToValidate="tboxPuestoAseExtE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div id="divDomicilioEmpresa" style="background-color:#E8E8E8; margin-left:-30px; margin-right:-30px; padding:30px;">
                        <div class="row" style="margin-bottom:20px;">
                            <div class="col-12 col-sm-12 col-md-12">
                                <asp:Label ID="lblDomicilioE" runat="server" Text="lblDomicilioE" CssClass="h5"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-6 col-md-5 col-lg-5" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblCalleE" Text="lblCalleE" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="150" ID="tboxCalleE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCalleE" CssClass="campo-obligatorio" ControlToValidate="tboxCalleE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-3 col-md-2 col-lg-"2 style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblNumExtE" Text="lblNumExtE" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="35" ID="tboxNumExtE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvNumExtE" CssClass="campo-obligatorio" ControlToValidate="tboxNumExtE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-3 col-md-2 col-lg-2" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblNumIntE" Text="lblNumIntE" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="35" ID="tboxNumIntE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            </div>
                            <div class="col-12 col-sm-7 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblColoniaE" Text="lblColoniaE" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="150" ID="tboxColoniaE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvColoniaE" CssClass="campo-obligatorio" ControlToValidate="tboxColoniaE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-5 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblMunicipioE" Text="lblMunicipioE" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="100" ID="tboxMunicipioE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvMunicipioE" CssClass="campo-obligatorio" ControlToValidate="tboxMunicipioE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-5 col-md-2 col-lg-2" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblCPE" Text="lblCPE" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="5" ID="tboxCPE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                    FilterType="Numbers"
                                    TargetControlID="tboxCPE"/>
                                <asp:RegularExpressionValidator ID="revCP" runat="server" CssClass="campo-obligatorio"
                                    ControlToValidate="tboxCPE" SetFocusOnError="true" Display="Dynamic"
                                    ErrorMessage="Deben ser 5 caracteres."
                                    ValidationExpression="^\d{5}$" ValidationGroup="AgregarSolicitud"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCPE" CssClass="campo-obligatorio" ControlToValidate="tboxCPE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row text-center">
                    <div class="col-12 col-sm-12 col-md-12">
                        <asp:Label ID="lblDatosSE" runat="server" Text="lblDatosSE" CssClass="h4 fontbold"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-4" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblNombreSE" Text="lblNombreSE" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" MaxLength="250" ID="tboxNombreSE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvNombreSE" CssClass="campo-obligatorio" ControlToValidate="tboxNombreSE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-12 col-sm-6 col-md-3 col-lg-3" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblPuestoSE" Text="lblPuestoSE" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" MaxLength="250" ID="tboxPuestoSE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvPuestoSE" CssClass="campo-obligatorio" ControlToValidate="tboxPuestoSE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-12 col-sm-12 col-md-5 col-lg-4" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblEmailSE" Text="lblEmailSE" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" MaxLength="100" ID="tboxEmailSE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revEmailSE" runat="server" CssClass="campo-obligatorio"
                                ControlToValidate="tboxEmailSE" SetFocusOnError="true" Display="Dynamic"
                                ErrorMessage="Estructura de correo incorrecta."
                                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ValidationGroup="AgregarSolicitud"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator runat="server" ID="rfvEmailSE" CssClass="campo-obligatorio" ControlToValidate="tboxEmailSE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-5 col-md-3 col-lg-2" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblCelularSE" Text="lblCelularSE" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" MaxLength="10" ID="tboxCelularSE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                            FilterType="Numbers"
                            TargetControlID="tboxCelularSE"/>
                        <asp:RegularExpressionValidator ID="revCelularSE" runat="server" CssClass="campo-obligatorio"
                            ControlToValidate="tboxCelularSE" SetFocusOnError="true" Display="Dynamic"
                            ErrorMessage="Deben ser 10 caracteres."
                            ValidationExpression="^\d{10}$" ValidationGroup="AgregarSolicitud"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator runat="server" ID="rfvCelularSE" CssClass="campo-obligatorio" ControlToValidate="tboxCelularSE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-12 col-sm-7 col-md-4 col-lg-3" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblTelefonoOficSE" Text="lblTelefonoOficSE" CssClass="fontsizeh6"></asp:Label>
                        <asp:TextBox runat="server" MaxLength="50" ID="tboxTelefonoOficSE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvTelefonoOficSE" CssClass="campo-obligatorio" ControlToValidate="tboxTelefonoOficSE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <div id="divDatosResidente" style="background-color:#F4F4F4; margin-left:-30px; margin-right:-30px; padding:30px;padding-bottom:0px;">
                    <div class="row text-center">
                        <div class="col-12 col-sm-12 col-md-12">
                            <asp:Label ID="lblDatosR" runat="server" Text="lblDatosR" CssClass="h4 fontbold"></asp:Label>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-12 col-sm-7 col-md-6 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNombreR" Text="lblNombreR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="250" ID="tboxNombreR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvNombreR" CssClass="campo-obligatorio" ControlToValidate="tboxNombreR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-4 col-md-3 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblSemestreR" Text="lblSemestreR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="2" ID="tboxSemestreR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                            FilterType="Numbers"
                            TargetControlID="tboxSemestreR"/>
                            <asp:RequiredFieldValidator runat="server" ID="rfvSemestreR" CssClass="campo-obligatorio" ControlToValidate="tboxSemestreR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-8 col-md-7 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblCarreraR" Text="lblCarreraR" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxCarreraR" CssClass="form-select fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCarreraR" CssClass="campo-obligatorio" ControlToValidate="cboxCarreraR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-4 col-md-3 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNoControlR" Text="lblNoControlR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="8" ID="tboxNoControlR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                                FilterType="Numbers"
                                TargetControlID="tboxNoControlR"/>
                            <asp:RegularExpressionValidator ID="revNoControlR" runat="server" CssClass="campo-obligatorio"
                                ControlToValidate="tboxNoControlR" SetFocusOnError="true" Display="Dynamic"
                                ErrorMessage="Deben ser 8 caracteres."
                                ValidationExpression="^\d{8}$" ValidationGroup="AgregarSolicitud"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvNoControlR" CssClass="campo-obligatorio" ControlToValidate="tboxNoControlR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-9 col-md-9 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblEmailR" Text="lblEmailR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="100" ID="tboxEmailR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revEmailR" runat="server" CssClass="campo-obligatorio"
                                ControlToValidate="tboxEmailR" SetFocusOnError="true" Display="Dynamic"
                                ErrorMessage="Estructura de correo incorrecta."
                                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ValidationGroup="AgregarSolicitud"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvEmailR" CssClass="campo-obligatorio" ControlToValidate="tboxEmailR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-4 col-md-4 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblSeguridadSocialR" Text="lblSeguridadSocialR" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxSeguridadSocialR" CssClass="form-select fontsizeh6" OnSelectedIndexChanged="cboxSeguridadSocialR_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvSeguridadSocialR" CssClass="campo-obligatorio" ControlToValidate="cboxSeguridadSocialR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                        <div id="divSSCual" runat="server" class="col-12 col-sm-8 col-md-4 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblCualR" Text="lblCualR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="150" ID="tboxCualR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCualR" CssClass="campo-obligatorio" ControlToValidate="tboxCualR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-5 col-md-4 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNSSR" Text="lblNSSR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="11" ID="tboxNSSR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server"
                                FilterType="Numbers"
                                TargetControlID="tboxNSSR"/>
                            <asp:RegularExpressionValidator ID="revNSSR" runat="server" CssClass="campo-obligatorio"
                                ControlToValidate="tboxNSSR" SetFocusOnError="true" Display="Dynamic"
                                ErrorMessage="Deben ser 11 caracteres."
                                ValidationExpression="^\d{11}$" ValidationGroup="AgregarSolicitud"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvNSSR" CssClass="campo-obligatorio" ControlToValidate="tboxNSSR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:20px;">
                        <div class="col-12 col-sm-6 col-md-3 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblTelefonoR" Text="lblTelefonoR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="10" ID="tboxTelefonoR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server"
                                FilterType="Numbers"
                                TargetControlID="tboxTelefonoR"/>
                            <asp:RegularExpressionValidator ID="revTelefonoR" runat="server" CssClass="campo-obligatorio"
                                ControlToValidate="tboxTelefonoR" SetFocusOnError="true" Display="Dynamic"
                                ErrorMessage="Deben ser 10 caracteres."
                                ValidationExpression="^\d{10}$" ValidationGroup="AgregarSolicitud"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvTelefonoR" CssClass="campo-obligatorio" ControlToValidate="tboxTelefonoR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-6 col-md-3 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblCelularR" Text="lblCelularR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="10" ID="tboxCelularR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server"
                                FilterType="Numbers"
                                TargetControlID="tboxCelularR"/>
                            <asp:RegularExpressionValidator ID="revCelularR" runat="server" CssClass="campo-obligatorio"
                                ControlToValidate="tboxCelularR" SetFocusOnError="true" Display="Dynamic"
                                ErrorMessage="Deben ser 10 caracteres."
                                ValidationExpression="^\d{10}$" ValidationGroup="AgregarSolicitud"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCelularR" CssClass="campo-obligatorio" ControlToValidate="tboxCelularR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div id="divDomicilioResidente" style="background-color:#E8E8E8; margin-left:-30px; margin-right:-30px; padding:30px;">
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-12">
                                <asp:Label ID="lblDomicilioR" runat="server" Text="lblDomicilioR" CssClass="h5"></asp:Label>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-12 col-sm-6 col-md-5" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblCalleR" Text="lblCalleR" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="150" ID="tboxCalleR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCalleR" CssClass="campo-obligatorio" ControlToValidate="tboxCalleR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-3 col-md-2" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblNumExtR" Text="lblNumExtR" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="35" ID="tboxNumExtR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvNumExtR" CssClass="campo-obligatorio" ControlToValidate="tboxNumExtR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-3 col-md-2" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblNumIntR" Text="lblNumIntR" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="35" ID="tboxNumIntR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                            </div>
                            <div class="col-12 col-sm-7 col-md-3" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblColoniaR" Text="lblColoniaR" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="150" ID="tboxColoniaR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvColoniaR" CssClass="campo-obligatorio" ControlToValidate="tboxColoniaR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-5 col-md-3" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblMunicipioR" Text="lblMunicipioR" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="100" ID="tboxMunicipioR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvMunicipioR" CssClass="campo-obligatorio" ControlToValidate="tboxMunicipioR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-5 col-md-2" style="margin-bottom:10px;">
                                <asp:Label runat="server" ID="lblCPR" Text="lblCPR" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="5" ID="tboxCPR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13)" OnTextChanged="tboxLugar_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server"
                                    FilterType="Numbers"
                                    TargetControlID="tboxCPR"/>
                                <asp:RegularExpressionValidator ID="revCPR" runat="server" CssClass="campo-obligatorio"
                                    ControlToValidate="tboxCPR" SetFocusOnError="true" Display="Dynamic"
                                    ErrorMessage="Deben ser 5 caracteres."
                                    ValidationExpression="^\d{5}$" ValidationGroup="AgregarSolicitud"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCPR" CssClass="campo-obligatorio" ControlToValidate="tboxCPR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarSolicitud"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <div id="divBotones" runat="server">
                    <div class="row alineacion-vertical">
                        <div class="col-5 col-md-3 col-sm-3 col-lg-2 offset-2 offset-md-6 offset-sm-6 offset-lg-8"> 
                            <asp:Button ID="btnGuardar" runat="server" Text="btnGuardar" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnGuardar_Click"/>           
                        </div>
                        <div class="col-5 col-md-3 col-sm-3 col-lg-2"> 
                            <asp:Button ID="btnEnviar" runat="server" Text="btnEnviar" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnEnviar_Click" ValidationGroup="AgregarSolicitud"/>           
                        </div>
                    </div>
                    <br />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
