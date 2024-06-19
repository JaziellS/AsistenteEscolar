<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Solicitudes.aspx.cs" Inherits="GestorResidencias.Solicitudes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Assets/CSS/EstilosResponsivos.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .contenedor-solicitud {
            background-color: #7A70C4;
            border-radius: 10px;
            padding: 30px;
        }
        .contenedor-estatus {
            background-color: #372d86;
            border-radius: 10px;
        }

        .forma-informacion-solicitud {
            background-color: #685EAF;
            border-radius: 20px;
            padding:10px;
            word-wrap: break-word;
            margin:1px;
        }

        @media screen and (min-width:769px) {
            .modal-responsivo {
                width: 600px;
            }
        }
    </style>
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
            <asp:Label ID="lblDescripcionModulo" runat="server" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." CssClass="text-muted"></asp:Label>
        </div>
        <br />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="up1">
            <ContentTemplate>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-3 col-lg-2">
                        <asp:Button runat="server" ID="btnAgregar" Text="btnAgregar" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnAgregar_Click"/>
                    </div>
                </div>
                <br />
                <%=sSolicitudes.ToString() %>
                <br />
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:Button ID="Button1" runat="server" style="display:none;"/> 
        <ajaxToolkit:ModalPopupExtender runat="server" ID="modCancelarSolicitud" TargetControlID="Button1" BackgroundCssClass="modalBackground" PopupControlID="pCancelarSolicitud"></ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pCancelarSolicitud" CssClass="modal-responsivo" style="display:none; background-color:white;">
            <asp:UpdatePanel runat="server" ID="up2">
                <ContentTemplate>
                    <div class="modal-headers">
                        <div class="alineacion-vertical">
                            <div class="text-center container">
                                <asp:Label ID="lblDescripcionModuloMod" runat="server" Text="lblDescripcionModuloMod" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                            </div>
                            <asp:ImageButton runat="server" ID="ibtnCerrarMod" CssClass="ibtn-hover-general" OnClick="ibtnCerrarMod_Click"/>
                        </div>
                    </div>
                    <div class="modal-bodys">
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-12">
                                <asp:Label runat="server" ID="lblComentarioMod" Text="lblComentarioMod" CssClass="fontsizeh6"></asp:Label>
                                <asp:TextBox runat="server" ID="tboxComentarioMod" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="6"></asp:TextBox> 
                            </div>
                        </div>
                    </div>
                    <div class="modal-footers">
                            
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
</asp:Content>
