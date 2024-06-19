<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EditarPerfil.aspx.cs" Inherits="GestorResidencias.EditarPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .circulo img {   
            width: 200px;
            height:200px;
            object-fit: cover;
        }

        @media screen and (max-width:992px) {
            .fondo-editarperfil {
                background-color:#372D86; 
                border-radius:30px 30px 0 0;
                padding-bottom:40px;
                padding-top:40px;
                word-wrap: break-word;
            }
        }

        @media screen and (min-width:993px){
            .fondo-editarperfil {
                background-color:#372D86; 
                border-radius:30px 0 0 30px;
                word-wrap: break-word;
                padding-bottom:40px;
                padding-top:40px;
            }
        }
    </style>
    <script type="text/javascript">
        function UploadFileFotoPerfil(fileUpload) {
            var maxFileSize = 5242880;
            var allowedExtensions = /(.jpg|.jpeg|.png|.PNG|.JPG)$/i;
     
            if (!allowedExtensions.exec(fileUpload.value)) {
                swal("Error", "Solo se permiten archivos Imagen", "error");
                fileUpload.value = '';
                return false;
            } else {
                if (fileUpload.value != '') {
                    if (fileUpload.files[0].size < maxFileSize) {

                        var preview = document.querySelector('#<%=imgFotoDePerfil.ClientID %>');
                        var reader = new FileReader();

                        reader.onloadend = function () {
                            preview.src = reader.result;
                            document.getElementById('<%=hfImage.ClientID %>').value = reader.result;
                        }

                        reader.readAsDataURL(fileUpload.files[0]);
                        document.getElementById('<%=btnHacerElCambio.ClientID %>').click();
                        return true;

                    } else {
                        swal("Error", "El Tamaño del archivo excede los 5 MB", "error");
                        return false;
                    }
                }
            }
        }
    </script>
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
            <asp:Label ID="lblDescripcionModulo" runat="server" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. " CssClass="text-muted"></asp:Label>
        </div>
        <br />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="row" style="background-color:#F4F4F4; border-radius:30px;">
            <div class="col-12 col-sm-12 col-md-12 col-lg-5 fondo-editarperfil">
                <div class="row">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12" style="padding-bottom:20px;">
                            <div class="circulo text-center">
                                <asp:Image ID="imgFotoDePerfil" runat="server" style="border-radius:50%;"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-6 offset-sm-3 offset-md-3" style="padding-bottom:30px;">
                            <asp:FileUpload ID="fuArchivoDO" runat="server" style="display: none;"/>
                            <asp:HiddenField ID="hfImage" runat="server" Value="" />
                            <asp:Button runat="server" ID="btnCambiarFoto" BorderStyle="None" Text="btnCambiarFoto" CssClass="fontsizeh6 form-control btn-hover-lila"/>
                            <asp:Button runat="server" ID="btnHacerElCambio" style="display:none;" OnClick="btnHacerElCambio_Click"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 text-center">
                            <asp:Label runat="server" ID="lblNombre" Text="lblNombre" style="color:white; font-weight:bold; font-size:23px;"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 text-center">
                            <asp:Label runat="server" ID="lblNoControl" Text="lblNoControl" style="color:white; font-size:20px;"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 text-center">
                            <asp:Label runat="server" ID="lblCorreo" Text="lblCorreo" style="color:white; font-size:20px;"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-sm-12 col-md-12 col-lg-7" style="padding:20px;">
                <asp:UpdatePanel runat="server" ID="up1">
                    <ContentTemplate>
                    <div class="row">
                        <div class="col-12 col-md-12 col-sm-12 text-center">
                            <asp:Label ID="lblMiPerfil" runat="server" Text="lblMiPerfil" CssClass="h2 fontbold"></asp:Label>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6" style="padding-bottom:10px;">
                            <asp:Label ID="lblNombreE" runat="server" Text="lblNombreE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="150" ID="tboxNombreE" CssClass="form-control fontsizeh6"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvNombreE" CssClass="campo-obligatorio" ControlToValidate="tboxNombreE" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-6 col-md-3 col-lg-3" style="padding-bottom:10px;">
                            <asp:Label ID="lblApellidoPat" runat="server" Text="lblApellidoPat" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="50" ID="tboxApellidoPat" CssClass="form-control fontsizeh6"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvApellidoPat" CssClass="campo-obligatorio" ControlToValidate="tboxApellidoPat" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-6 col-md-3 col-lg-3" style="padding-bottom:10px;">
                            <asp:Label ID="lblApellidoMat" runat="server" Text="lblApellidoMat" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="50" ID="tboxApellidoMat" CssClass="form-control fontsizeh6"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvApellidoMat" CssClass="campo-obligatorio" ControlToValidate="tboxApellidoMat" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-8 col-md-6 col-lg-7" style="padding-bottom:10px;">
                            <asp:Label ID="lblCarrera" runat="server" Text="lblCarrera" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxCarrera" CssClass="form-select fontsizeh6"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCarrera" CssClass="campo-obligatorio" ControlToValidate="cboxCarrera" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-5 col-md-4 col-lg-4" style="padding-bottom:10px;">
                            <asp:Label ID="lblTelefonoCelular" runat="server" Text="lblTelefonoCelular" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="10" ID="tboxTelefonoCelular" CssClass="form-control fontsizeh6"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                FilterType="Numbers"
                                TargetControlID="tboxTelefonoCelular"/>
                            <asp:RegularExpressionValidator ID="revTelefonoCelular" runat="server" CssClass="campo-obligatorio"
                                ControlToValidate="tboxTelefonoCelular" SetFocusOnError="true" Display="Dynamic"
                                ErrorMessage="Deben ser 10 caracteres."
                                ValidationExpression="^\d{10}$" ValidationGroup="EditarUsuario"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvTelefonoCelular" CssClass="campo-obligatorio" ControlToValidate="tboxTelefonoCelular" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                        </div>
                        <div id="divTelefonoFijo" runat="server" class="col-12 col-sm-5 col-md-4 col-lg-4" style="padding-bottom:10px;">
                            <asp:Label ID="lblTelefonoFijo" runat="server" Text="lblTelefonoFijo" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="10" ID="tboxTelefonoFijo" CssClass="form-control fontsizeh6"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                FilterType="Numbers"
                                TargetControlID="tboxTelefonoFijo"/>
                            <asp:RegularExpressionValidator ID="revTelefonoFijo" runat="server" CssClass="campo-obligatorio"
                                ControlToValidate="tboxTelefonoFijo" SetFocusOnError="true" Display="Dynamic"
                                ErrorMessage="Deben ser 10 caracteres."
                                ValidationExpression="^\d{10}$" ValidationGroup="EditarUsuario"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvTelefonoFijo" CssClass="campo-obligatorio" ControlToValidate="tboxTelefonoFijo" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                        </div>
                        <div id="divSemestre" runat="server" class="col-12 col-sm-3 col-md-3 col-lg-3" style="padding-bottom:10px;">
                            <asp:Label ID="lblSemestre" runat="server" Text="lblSemestre" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="2" ID="tboxSemestres" CssClass="form-control fontsizeh6"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                FilterType="Numbers"
                                TargetControlID="tboxSemestres"/>
                            <asp:RequiredFieldValidator runat="server" ID="rfvSemestres" CssClass="campo-obligatorio" ControlToValidate="tboxSemestres" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row" style="padding-bottom:25px;">
                        <div class="col-12 col-sm-5 col-md-4 col-lg-4" style="padding-bottom:10px;">
                            <asp:Label ID="lblContrasena" runat="server" Text="lblContrasena" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="100" ID="tboxContrasena" CssClass="form-control fontsizeh6" AutoPostBack="true" OnTextChanged="tboxContrasena_TextChanged"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvContrasena" CssClass="campo-obligatorio" ControlToValidate="tboxContrasena" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                            <asp:Label runat="server" ID="lblContreseniasNoCoinciden" CssClass="campo-obligatorio"></asp:Label>
                        </div>
                        <div class="col-12 col-sm-5 col-md-4 col-lg-4" style="padding-bottom:10px;">
                            <asp:Label ID="lblRepiteContrasena" runat="server" Text="lblSemestre" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="100" ID="tboxRepiteContrasena" CssClass="form-control fontsizeh6" AutoPostBack="true" OnTextChanged="tboxContrasena_TextChanged"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvRepiteContrasena" CssClass="campo-obligatorio" ControlToValidate="tboxRepiteContrasena" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div id="divCamposExtras" runat="server">
                        <div class="row" style="padding-bottom:10px;">
                            <div class="col-12 col-sm-12 col-md-12 text-center">
                                <asp:Label ID="lblSeguroSocial" runat="server" Text="lblSeguroSocial" CssClass="h4"></asp:Label>
                            </div>
                        </div>
                        <div class="row" style="padding-bottom:25px;">
                            <div class="col-12 col-sm-5 col-md-3 col-lg-4" style="padding-bottom:10px;">
                                <asp:Label ID="lblNSS" runat="server" Text="lblNSS" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="11" ID="tboxNSS" CssClass="form-control fontsizeh6"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                    FilterType="Numbers"
                                    TargetControlID="tboxNSS"/>
                                <asp:RegularExpressionValidator ID="revNSS" runat="server" CssClass="campo-obligatorio"
                                    ControlToValidate="tboxNSS" SetFocusOnError="true" Display="Dynamic"
                                    ErrorMessage="Deben ser 11 caracteres."
                                    ValidationExpression="^\d{11}$" ValidationGroup="EditarUsuario"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator runat="server" ID="rfvNSS" CssClass="campo-obligatorio" ControlToValidate="tboxNSS" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-4 col-md-3 col-lg-4" style="padding-bottom:10px;">
                                <asp:Label ID="lblAcudir" runat="server" Text="lblAcudir" CssClass="fontsizeh6"></asp:Label>
                                <asp:DropDownList runat="server" ID="cboxAcudir" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="cboxAcudir_SelectedIndexChanged"></asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="rfvAcudir" CssClass="campo-obligatorio" ControlToValidate="cboxAcudir" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                            </div>
                            <div runat="server" class="col-12 col-sm-12 col-md-6 col-lg-12" id="divOtro" style="padding-bottom:10px;">
                                <asp:Label ID="lblCual" runat="server" Text="lblCual" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="150" ID="tboxCual" CssClass="form-control fontsizeh6"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCual" CssClass="campo-obligatorio" ControlToValidate="tboxCual" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row" style="padding-bottom:10px;">
                            <div class="col-12 col-sm-12 col-md-12 text-center">
                                <asp:Label ID="lblDomicilio" runat="server" Text="lblDomicilio" CssClass="h4"></asp:Label>
                            </div>
                        </div>
                        <div class="row" style="padding-bottom:20px;">
                            <div class="col-12 col-sm-6 col-md-6 col-lg-6" style="padding-bottom:10px;">
                                <asp:Label ID="lblCalle" runat="server" Text="lblCalle" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="150" ID="tboxCalle" CssClass="form-control fontsizeh6"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCalle" CssClass="campo-obligatorio" ControlToValidate="tboxCalle" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-3 col-md-3 col-lg-3" style="padding-bottom:10px;">
                                <asp:Label ID="lblNumExterior" runat="server" Text="lblNumExterior" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="35" ID="tboxNumExterior" CssClass="form-control fontsizeh6"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvNumExterior" CssClass="campo-obligatorio" ControlToValidate="tboxNumExterior" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-3 col-md-3 col-lg-3" style="padding-bottom:10px;">
                                <asp:Label ID="lblNumInterior" runat="server" Text="lblNumInterior" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="35" ID="tboxNumInterior" CssClass="form-control fontsizeh6"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvNumInterior" CssClass="campo-obligatorio" ControlToValidate="tboxNumInterior" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-7 col-md-7 col-lg-4" style="padding-bottom:10px;">
                                <asp:Label ID="lblColonia" runat="server" Text="lblColonia" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="150" ID="tboxColonia" CssClass="form-control fontsizeh6"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvColonia" CssClass="campo-obligatorio" ControlToValidate="tboxColonia" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-4 col-md-4 col-lg-4" style="padding-bottom:10px;">
                                <asp:Label ID="lblEstado" runat="server" Text="lblEstado" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="100" ID="tboxEstado" CssClass="form-control fontsizeh6"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvEstado" CssClass="campo-obligatorio" ControlToValidate="tboxEstado" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-4 col-md-4 col-lg-4" style="padding-bottom:10px;">
                                <asp:Label ID="lblMunicipio" runat="server" Text="lblMunicipio" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="100" ID="tboxMunicipio" CssClass="form-control fontsizeh6"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvMunicipio" CssClass="campo-obligatorio" ControlToValidate="tboxMunicipio" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-4 col-md-4 col-lg-4" style="padding-bottom:10px;">
                                <asp:Label ID="lblCiudad" runat="server" Text="lblCiudad" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="100" ID="tboxCiudad" CssClass="form-control fontsizeh6"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCiudad" CssClass="campo-obligatorio" ControlToValidate="tboxCiudad" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-12 col-sm-4 col-md-4 col-lg-3" style="padding-bottom:10px;">
                                <asp:Label ID="lblCP" runat="server" Text="lblCP" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" MaxLength="5" ID="tboxCP" CssClass="form-control fontsizeh6"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                                    FilterType="Numbers"
                                    TargetControlID="tboxCP"/>
                                <asp:RegularExpressionValidator ID="revCP" runat="server" CssClass="campo-obligatorio"
                                    ControlToValidate="tboxCP" SetFocusOnError="true" Display="Dynamic"
                                    ErrorMessage="Deben ser 5 caracteres."
                                    ValidationExpression="^\d{5}$" ValidationGroup="EditarUsuario"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator runat="server" ID="rfvCP" CssClass="campo-obligatorio" ControlToValidate="tboxCP" Display="Dynamic" ValidationGroup="EditarUsuario"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-4 col-lg-4 offset-sm-6 offset-md-8 offset-lg-8">
                            <asp:Button runat="server" ID="btnGuardar" Text="btnGuardar" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnGuardar_Click" ValidationGroup="EditarUsuario"/>
                        </div>
                    </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
