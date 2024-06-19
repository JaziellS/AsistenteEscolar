<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acceso.aspx.cs" Inherits="GestorResidencias.Acceso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="Assets/CSS/bootstrap.min.css" rel="stylesheet"/>
    <link href="Assets/CSS/General.css" rel="stylesheet"/>
    <link rel="stylesheet" href="Assets/CSS/EstilosResponsivos.css"/>

    <script src="Assets/Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="Assets/Scripts/jquery-ui.min.js" type="text/javascript"></script>
    <script src="Assets/Scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="Assets/Scripts/bootstrap-table.js" type="text/javascript"></script>
    <script src="Assets/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="Assets/Scripts/light-bootstrap-dashboard.js" type="text/javascript"></script>
    <script src="Assets/Scripts/moment.min.js" type="text/javascript"></script>
    <script src="Assets/Scripts/bootstrap-datetimepicker.js" type="text/javascript"></script>
    <script src="Assets/Scripts/sweetalert.min.js" type="text/javascript"></script>
    <title></title>
</head>
<body>
    <style type="text/css">
        .background-card-login {
            background:rgba(122, 112, 196, .4); 
            position:relative; 
            z-index:2; 
            padding-bottom:25px; 
            padding-top:50px; 
            padding-left:4vw; 
            padding-right:4vw;
        }

        .background-login {
            background-image: url(Assets/Imagenes/Acceso/Fondo.png);
            position:absolute;
            z-index:1;
            height:100%;
            width:100%;
            top:0;
            left:0;
            background-size:cover;
            background-position:center center;
        }

        .centrar-contenido{
            align-items:center;
            display:flex;
            justify-content:center;

        }

        .image-login {
            width:130px;
            border-radius:50%;
        }

        .centrar-imagen-login {
            text-align:center;
            margin-bottom:-85px;
            position:relative;
            z-index: 3
        }

        @media screen and (min-width:992px) {
            .modal-responsivo {
                width: 800px;
            }
        }

        @media screen and (min-width:992px) {
            .modal-responsivo2 {
                width: 900px;
            }
        }

        .linea-horizontal {
          margin-top: 1rem;
          margin-bottom: 1rem;
          border: 0;
          border-top: 1px solid #FFFFFF;
          opacity: 0.73;
        }

        .lbtn-solicitaracceso {
            color:white; 
            text-decoration:none;
            transition: color 0.3s;
        }

        .lbtn-solicitaracceso:hover {
            color: #C9C9C9;
        }

    </style>
    <script type="text/javascript">
        var xPos, yPos;
        var xPosT, yPosT;

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
    <div class="centrar-contenido background-login">
        <div class="container">
            <div class="row">
                <div class="col-10 col-sm-10 col-md-8 col-lg-6 offset-1 offset-sm-1 offset-md-2 offset-lg-3">
                    <form id="form1" runat="server">
                        <div class="row text-center">
                            <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                <asp:Label runat="server" ID="lblTitulo" Text="lblTitulo" CssClass="h1" style="color:white;"></asp:Label>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="centrar-imagen-login">
                            <asp:Image runat="server" ID="imgLogin" CssClass="image-login"/>
                            <br />
                            <br />
                        </div>
                        <div class="card background-card-login" style="">
                            <div class="card-body">
                                <div class="row" style="margin-bottom:15px;">
                                    <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:5px;">
                                        <asp:Label runat="server" ID="lblUsuario" Text="lblUsuario" style="color:white;"></asp:Label>
                                    </div>
                                    <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                        <asp:TextBox runat="server" ID="tboxUsuario" autocomplete="off" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvUsuario" SetFocusOnError="true" CssClass="campo-obligatorio" ControlToValidate="tboxUsuario" runat="server" Display="Dynamic" ValidationGroup="Ingresar"/>
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom:20px;">
                                    <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:5px;">
                                        <asp:Label runat="server" ID="lblContrasena" Text="lblContrasena" style="color:white;"></asp:Label>
                                    </div>
                                    <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                        <asp:TextBox runat="server" ID="tboxContrasena" autocomplete="off" CssClass="form-control" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvContrasena" SetFocusOnError="true" CssClass="campo-obligatorio" ControlToValidate="tboxContrasena" runat="server" Display="Dynamic" ValidationGroup="Ingresar"/>
                                    </div>
                                </div>
                                <div class="row text-center" style="margin-bottom:15px;">
                                    <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                        <asp:Button runat="server" ID="btnIngresar" CssClass="form-control btn-hover-general" BorderStyle="None" Text="btnIngresar" OnClick="btnIngresar_Click" ValidationGroup="Ingresar"></asp:Button>
                                    </div>
                                </div>
                                <div class="row text-center">
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3">
                                        <hr class="linea-horizontal" />
                                    </div>
                                    <div class="col-6 col-sm-6 col-md-6 col-lg-6">
                                        <asp:LinkButton runat="server" ID="lbtnSolicitarAcceso" CssClass="lbtn-solicitaracceso" BorderStyle="None" Text="Solicitar Acceso" OnClick="btnSolicitarAcceso_Click"></asp:LinkButton>
                                    </div>
                                    <div class="col-3 col-sm-3 col-md-3 col-lg-3">
                                        <hr class="linea-horizontal" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:Button ID="Button1" runat="server" style="display:none"/> 
                        <ajaxToolkit:ModalPopupExtender runat="server" ID="modSolicitar" TargetControlID="Button1" BackgroundCssClass="modalBackground" PopupControlID="PSolicitar"></ajaxToolkit:ModalPopupExtender>
                        <asp:Panel runat="server" CssClass="modal-responsivo" ID="PSolicitar" style="display:none; background-color:white;">
                            <asp:UpdatePanel runat="server" ID="up2">
                                <ContentTemplate>
                                    <div class="modal-headers text-center">
                                        <div class="alineacion-vertical">
                                            <div class="text-center container">
                                                <asp:Label ID="lblDescripcionModuloMod" runat="server" Text="lblDescripcionModuloMod" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                                            </div>
                                            <asp:ImageButton runat="server" ID="ibtnCerrarMod" OnClick="ibtnCerrarMod_Click"/>
                                        </div>
                                    </div>
                                    <div id="ScrollModal" class="modal-bodys" style="max-height:450px; overflow-y:auto;">
                                        <div class="row text-center">
                                            <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                                                <asp:Label ID="lblDatosPersonalesMod" runat="server" Text="lblDatosPersonalesMod" CssClass="h4 fontbold"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-sm-5 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                                <asp:Label runat="server" ID="lblNoControlMod" Text="lblNoControlMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" autocomplete="off" MaxLength="8" ID="tboxNoControlMod" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="tboxNoControlMod_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                                    FilterType="Numbers"
                                                    TargetControlID="tboxNoControlMod"/>
                                                <asp:RegularExpressionValidator ID="revNoControlMod" runat="server" CssClass="campo-obligatorio"
                                                    ControlToValidate="tboxNoControlMod" SetFocusOnError="true" Display="Dynamic"
                                                    ErrorMessage="Deben ser 8 caracteres."
                                                    ValidationExpression="^\d{8}$" ValidationGroup="SolicitarAcceso"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvNoControlMod" CssClass="campo-obligatorio" ControlToValidate="tboxNoControlMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-sm-12 col-md-6 col-lg-6" style="margin-bottom:10px;">
                                                <asp:Label runat="server" ID="lblNombreMod" Text="lblNombreMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxNombreMod" autocomplete="off" MaxLength="150" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvNombreMod" CssClass="campo-obligatorio" ControlToValidate="tboxNombreMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-12 col-sm-6 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                                <asp:Label runat="server" ID="lblApellidoPatMod" Text="lblApellidoPatMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxApellidoPatMod" autocomplete="off" MaxLength="50" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvApellidoPatMod" CssClass="campo-obligatorio" ControlToValidate="tboxApellidoPatMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-12 col-sm-6 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                                <asp:Label runat="server" ID="lblApellidoMatMod" Text="lblApellidoMatMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxApellidoMatMod" autocomplete="off" MaxLength="50" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvApellidoMatMod" CssClass="campo-obligatorio" ControlToValidate="tboxApellidoMatMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-5 col-sm-6 col-md-6 col-lg-4" style="margin-bottom:10px;">
                                                <asp:Label runat="server" ID="lblEmailMod" Text="lblEmailMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxEmailMod" autocomplete="off" MaxLength="100" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="revEmailMod" runat="server" CssClass="campo-obligatorio"
                                                    ControlToValidate="tboxEmailMod" SetFocusOnError="true" Display="Dynamic"
                                                    ErrorMessage="Estructura de correo incorrecta."
                                                    ValidationExpression="^[a-zA-Z0-9._%+-]{2,}$" ValidationGroup="SolicitarAcceso"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvEmailMod" CssClass="campo-obligatorio" ControlToValidate="tboxEmailMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-7 col-sm-6 col-md-4 col-lg-4" style="margin-bottom:10px; padding-top:23px;">
                                                <asp:DropDownList runat="server" ID="cboxDominioMod" CssClass="form-select fontsizeh6"></asp:DropDownList>
                                            </div>
                                            <div class="col-12 col-sm-3 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                                <asp:Label runat="server" ID="lblSemestreMod" Text="lblSemestreMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxSemestreMod" MaxLength="2" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                                    FilterType="Numbers"
                                                    TargetControlID="tboxSemestreMod"/>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvSemestreMod" CssClass="campo-obligatorio" ControlToValidate="tboxSemestreMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-sm-5 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                                <asp:Label runat="server" ID="lblTelefonoMod" Text="lblTelefonoMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxTelefonoMod" autocomplete="off" MaxLength="10" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                                    FilterType="Numbers"
                                                    TargetControlID="tboxTelefonoMod"/>
                                                <asp:RegularExpressionValidator ID="revTelefonoMod" runat="server" CssClass="campo-obligatorio"
                                                    ControlToValidate="tboxTelefonoMod" SetFocusOnError="true" Display="Dynamic"
                                                    ErrorMessage="Deben ser 10 caracteres."
                                                    ValidationExpression="^\d{10}$" ValidationGroup="SolicitarAcceso"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvTelefonoMod" CssClass="campo-obligatorio" ControlToValidate="tboxTelefonoMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-12 col-sm-5 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                                <asp:Label runat="server" ID="lblCelularMod" Text="lblCelularMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxCelularMod" autocomplete="off" MaxLength="10" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                                    FilterType="Numbers"
                                                    TargetControlID="tboxCelularMod"/>
                                                <asp:RegularExpressionValidator ID="revCelularMod" runat="server" CssClass="campo-obligatorio"
                                                    ControlToValidate="tboxCelularMod" SetFocusOnError="true" Display="Dynamic"
                                                    ErrorMessage="Deben ser 10 caracteres."
                                                    ValidationExpression="^\d{10}$" ValidationGroup="SolicitarAcceso"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvCelularMod" CssClass="campo-obligatorio" ControlToValidate="tboxCelularMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-12 col-sm-8 col-md-6 col-lg-6" style="margin-bottom:10px;">
                                                <asp:Label runat="server" ID="lblCarreraMod" Text="lblCarreraMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:DropDownList runat="server" ID="cboxCarreraMod" CssClass="form-select fontsizeh6"></asp:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvCarreraMod" CssClass="campo-obligatorio" ControlToValidate="cboxCarreraMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-bottom:20px;">
                                            <div class="col-12 col-sm-5 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                                <asp:Label ID="lblContrasenaMod" runat="server" Text="lblContrasenaMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxContrasenaMod" autocomplete="off" MaxLength="100" CssClass="form-control fontsizeh6" AutoPostBack="true" OnTextChanged="tboxContrasenaMod_TextChanged"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvContrasenaMod" CssClass="campo-obligatorio" ControlToValidate="tboxContrasenaMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                                <asp:Label runat="server" ID="lblContreseniasNoCoincidenMod" CssClass="campo-obligatorio"></asp:Label>
                                            </div>
                                            <div class="col-12 col-sm-5 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                                <asp:Label ID="lblRepiteContrasenaMod" runat="server" Text="lblRepiteContrasenaMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxRepiteContrasenaMod" autocomplete="off" MaxLength="100" CssClass="form-control fontsizeh6" AutoPostBack="true" OnTextChanged="tboxContrasenaMod_TextChanged"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvRepiteContrasenaMod" CssClass="campo-obligatorio" ControlToValidate="tboxRepiteContrasenaMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                                                <asp:Label ID="lblDatosSeguridadSocialMod" runat="server" Text="lblDatosSeguridadSocialMod" CssClass="h5"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row" style="margin-bottom:20px;">
                                            <div class="col-12 col-sm-4 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                                <asp:Label ID="lblSeguridadSocialMod" runat="server" Text="lblSeguridadSocialMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:DropDownList runat="server" ID="cboxSeguridadSocialMod" CssClass="form-select fontsizeh6" OnSelectedIndexChanged="cboxSeguridadSocialMod_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvSeguridadSocialMod" CssClass="campo-obligatorio" ControlToValidate="cboxSeguridadSocialMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                            <div id="divOtraSSMod" runat="server" class="col-12 col-sm-8 col-md-5 col-lg-5" style="margin-bottom:10px;">
                                                <asp:Label ID="lblOtraSeguridadSocialMod" runat="server" Text="lblOtraSeguridadSocialMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxOtraSeguridadSocialMod" autocomplete="off" MaxLength="150" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvOtraSeguridadSocialMod" CssClass="campo-obligatorio" ControlToValidate="tboxOtraSeguridadSocialMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-12 col-sm-5 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                                <asp:Label ID="lblNSSMod" runat="server" Text="lblNSSMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxNSSMod" autocomplete="off" MaxLength="11" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server"
                                                    FilterType="Numbers"
                                                    TargetControlID="tboxNSSMod"/>
                                                <asp:RegularExpressionValidator ID="revNSSMod" runat="server" CssClass="campo-obligatorio"
                                                    ControlToValidate="tboxNSSMod" SetFocusOnError="true" Display="Dynamic"
                                                    ErrorMessage="Deben ser 11 caracteres."
                                                    ValidationExpression="^\d{11}$" ValidationGroup="SolicitarAcceso"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvNSSMod" CssClass="campo-obligatorio" ControlToValidate="tboxNSSMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
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
                                                <asp:TextBox runat="server" ID="tboxCalleMod" autocomplete="off" MaxLength="150" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvCalleMod" CssClass="campo-obligatorio" ControlToValidate="tboxCalleMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-12 col-sm-3 col-md-2 col-lg-2" style="margin-bottom:10px;">
                                                <asp:Label ID="lblNumeroExteriorMod" runat="server" Text="lblNumeroExteriorMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxNumeroExteriorMod" autocomplete="off" MaxLength="35" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvNumeroExteriorMod" CssClass="campo-obligatorio" ControlToValidate="tboxNumeroExteriorMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-12 col-sm-3 col-md-2 col-lg-2" style="margin-bottom:10px;">
                                                <asp:Label ID="lblNumeroInteriorMod" runat="server" Text="lblNumeroInteriorMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxNumeroInteriorMod" autocomplete="off" MaxLength="35" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-sm-7 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                                <asp:Label ID="lblColoniaMod" runat="server" Text="lblColoniaMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxColoniaMod" autocomplete="off" MaxLength="150" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvColoniaMod" CssClass="campo-obligatorio" ControlToValidate="tboxColoniaMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-12 col-sm-4 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                                <asp:Label ID="lblCiudadMod" runat="server" Text="lblCiudadMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxCiudadMod" autocomplete="off" MaxLength="100" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvCiudadMod" CssClass="campo-obligatorio" ControlToValidate="tboxCiudadMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-12 col-sm-4 col-md-4 col-lg-4" style="margin-bottom:10px;">
                                                <asp:Label ID="lblMunicipioMod" runat="server" Text="lblMunicipioMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxMunicipioMod" autocomplete="off" MaxLength="100" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvMunicipioMod" CssClass="campo-obligatorio" ControlToValidate="tboxMunicipioMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-12 col-sm-4 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                                <asp:Label ID="lblEstadoMod" runat="server" Text="lblEstadoMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxEstadoMod" autocomplete="off"  MaxLength="100" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvEstadoMod" CssClass="campo-obligatorio" ControlToValidate="tboxEstadoMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-12 col-sm-4 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                                <asp:Label ID="lblCPMod" runat="server" Text="lblCPMod" CssClass="fontsizeh6"></asp:Label>
                                                <asp:TextBox runat="server" ID="tboxCPMod" autocomplete="off" MaxLength="5" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                                                    FilterType="Numbers"
                                                    TargetControlID="tboxCPMod"/>
                                                <asp:RegularExpressionValidator ID="revCPMod" runat="server" CssClass="campo-obligatorio"
                                                    ControlToValidate="tboxCPMod" SetFocusOnError="true" Display="Dynamic"
                                                    ErrorMessage="Deben ser 5 caracteres."
                                                    ValidationExpression="^\d{5}$" ValidationGroup="SolicitarAcceso"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator runat="server" ID="rfvCPMod" CssClass="campo-obligatorio" ControlToValidate="tboxCPMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="SolicitarAcceso"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footers">
                                        <div class="row">
                                            <div class="col-12 col-sm-6 col-md-4 col-lg-3 offset-sm-6 offset-md-8 offset-lg-9">
                                                <asp:Button runat="server" ID="btnSolicitarMod" CssClass="form-control btn-hover-general" BorderStyle="None" Text="Solicitar Acceso" OnClick="btnSolicitarMod_Click" ValidationGroup="SolicitarAcceso"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tboxContrasenaMod" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </asp:Panel>

                        <asp:Button ID="Button2" runat="server" style="display:none"/> 
                        <ajaxToolkit:ModalPopupExtender runat="server" ID="modCuentaSecundaria" TargetControlID="Button2" BackgroundCssClass="modalBackground" PopupControlID="PCuentaSecundaria"></ajaxToolkit:ModalPopupExtender>
                        <asp:Panel runat="server" CssClass="modal-responsivo2" ID="PCuentaSecundaria" style="display:none; background-color:white;">
                            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                <ContentTemplate>
                                    <div class="modal-headers text-center">
                                        <div class="alineacion-vertical">
                                            <div class="text-center container">
                                                <asp:Label ID="lblDescripcionModuloModCS" runat="server" Text="lblDescripcionModuloModCS" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                                            </div>
                                            <asp:ImageButton runat="server" ID="ibtnCerrarModCS" OnClick="ibtnCerrarModCS_Click"/>
                                        </div>
                                    </div>
                                    <div class="modal-bodys" style="max-height:450px; overflow-y:auto;">
                                        <div class="row">
                                            <div id="divAdministrador" runat="server" class="col-12 col-sm-6 col-md-4 col-lg-3 text-center">
                                                <asp:ImageButton runat="server" CssClass="ibtn-hover-modulos" ID="ibtnAdministradorModCS" OnClick="ibtnAdministradorModCS_Click"/>
                                                <br />
                                                <asp:Label runat="server" CssClass="h6 fontbold" ID="lblAdministradorModCS" Text="lblAdministradorModCS"></asp:Label>
                                            </div>
                                            <div id="divJefeCarrera" runat="server" class="col-12 col-sm-6 col-md-4 col-lg-3 text-center">
                                                <asp:ImageButton runat="server" CssClass="ibtn-hover-modulos" ID="ibtnJefeCarreraModCS" OnClick="ibtnJefeCarreraModCS_Click"/>
                                                <br />
                                                <asp:Label runat="server" CssClass="h6 fontbold" ID="lblJefeCarreraModCS" Text="lblJefeCarreraModCS"></asp:Label>
                                            </div>
                                            <div id="divEncargadoResidencias" runat="server" class="col-12 col-sm-6 col-md-4 col-lg-3 text-center">
                                                <asp:ImageButton runat="server" CssClass="ibtn-hover-modulos" ID="ibtnEncargadoResidenciaModCS" OnClick="ibtnEncargadoResidenciaModCS_Click"/>
                                                <br />
                                                <asp:Label runat="server" CssClass="h6 fontbold" ID="lblEncargadoResidenciaModCS" Text="lblEncargadoResidenciaModCS"></asp:Label>
                                            </div>
                                            <div id="divMaestro" runat="server" class="col-12 col-sm-6 col-md-4 col-lg-3 text-center">
                                                <asp:ImageButton runat="server" CssClass="ibtn-hover-modulos" ID="ibtnMaestroModCS" OnClick="ibtnMaestroModCS_Click"/>
                                                <br />
                                                <asp:Label runat="server" CssClass="h6 fontbold" ID="lblMaestroModCS" Text="lblMaestroModCS"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footers">
                                        
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
