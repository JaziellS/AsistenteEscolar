<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Anteproyectos.aspx.cs" Inherits="GestorResidencias.Anteproyectos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            <asp:Label ID="lblDescripcionModulo" runat="server" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. " CssClass="text-muted"></asp:Label>
        </div>
        <br />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="up1">
            <ContentTemplate>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                        <asp:Button runat="server" ID="btnAgregar" Text="btnAgregar" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnAgregar_Click"/>
                    </div>
                </div>
                <br />
                <%=sAnteproyectos.ToString() %>
                <br />
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
