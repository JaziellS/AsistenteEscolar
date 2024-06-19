<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="GestorResidencias.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .background-titulo {
            background-image: url(Assets/Imagenes/Index/Fondo.png);
            color:white;
            background-position: center center;
            text-align:center;
            background-size: cover;
            background-repeat:no-repeat;
            padding-top: 15.5rem;
            padding-bottom: 11rem;
        }

        .btn-conocemas {
            background-color: #7A70C4;
            padding-top: 15px;
            padding-bottom: 15px;
        }

        .contenedor-imagen-circulo {
            background-color: #7A70C4;
            display: inline-block;
            border-radius: 150px;
        }
    </style>
    <div class="background-titulo">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="lblTitulo" runat="server" Text="lblTitulo" CssClass="h1 fontbold"></asp:Label>
                </div>
            </div>
            <br />
            <br />
            <div class="offset-md-5 col-md-2">
                <asp:Button runat="server" ID="btnConoceMas" BorderStyle="None" CssClass="form-control btn-conocemas" Text="btnConoceMas" OnClick="btnConoceMas_Click"/>
            </div>
        </div>
    </div>
    <div class="container contenidopagina">
        <br />
        <div class="text-center">
            <asp:Label ID="lblPrimerosPasos" runat="server" Text="lblPrimerosPasos" CssClass="h1 fontbold"></asp:Label>
        </div>
        <br />
        <br />
        <div class="container-fluid text-center">
            <asp:Label ID="lblDescripcionModulo" runat="server" Text="lblDescripcionModulo" CssClass="text-muted"></asp:Label>
        </div>
        <br />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="row text-center">
            <div class="col-12 col-sm-6 col-md-6 col-lg-4">
                <div class="contenedor-imagen-circulo ibtn-hover-modulos" style="margin-bottom:10px;">
                    <asp:ImageButton runat="server" CssClass="img-backgroun-circular" ID="ibtnBancoP" OnClick="ibtnBancoP_Click"/>
                </div>
                <br />
                <asp:Label runat="server" CssClass="h4 fontbold" ID="lblBancoP" Text="lblBancoP"></asp:Label>
                <br />
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 lineheight25">
                        <asp:Label runat="server" CssClass="text-muted fontsizeh6" ID="lblBancoPDes" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 col-sm-10 col-md-6 offset-3 offset-sm-1 offset-md-3">
                        <asp:Button runat="server" ID="btnBancoP" Text="btnBancoP" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnBancoP_Click" />
                    </div>
                </div>
                <br />
            </div>
            <div id="divSolicitud" runat="server" class="col-12 col-sm-6 col-md-6 col-lg-4">
                <div class="contenedor-imagen-circulo ibtn-hover-modulos" style="margin-bottom:10px;">
                    <asp:ImageButton runat="server" CssClass="img-backgroun-circular" ID="ibtnSolicitud" OnClick="ibtnSolicitud_Click"/>
                </div>
                <br />
                <asp:Label runat="server" CssClass="h4 fontbold" ID="lblSolicitud" Text="lblSolicitud"></asp:Label>
                <br />
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 lineheight25">
                        <asp:Label runat="server" CssClass="text-muted fontsizeh6" ID="lblSolicitudDes" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 col-sm-10 col-md-6 offset-3 offset-sm-1 offset-md-3">
                        <asp:Button runat="server" ID="btnSolicitudes" Text="btnSolicitudes" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnSolicitudes_Click" />
                    </div>
                </div>
                <br />
            </div>
            <div id="divAnteproyecto" runat="server" class="col-12 col-sm-6 col-md-6 col-lg-4">
                <div class="contenedor-imagen-circulo ibtn-hover-modulos" style="margin-bottom:10px;">
                    <asp:ImageButton runat="server" CssClass="img-backgroun-circular" ID="ibtnAnteproyecto" OnClick="ibtnAnteproyecto_Click"/>
                </div>
                <br />
                <asp:Label runat="server" CssClass="h4 fontbold" ID="lblAnteproyecto" Text="lblAnteproyecto"></asp:Label>
                <br />
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 lineheight25">
                        <asp:Label runat="server" CssClass="text-muted fontsizeh6" ID="lblAnteproyectoDes" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 col-sm-10 col-md-6 offset-3 offset-sm-1 offset-md-3">
                        <asp:Button runat="server" ID="btnAnteproyectos" Text="btnAnteproyectos" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnAnteproyectos_Click" />
                    </div>
                </div>
                <br />
            </div>
            <div id="divModuloAdministrador" runat="server" class="col-12 col-sm-6 col-md-6 col-lg-4">
                <div class="contenedor-imagen-circulo ibtn-hover-modulos" style="margin-bottom:10px;">
                    <asp:ImageButton runat="server" CssClass="img-backgroun-circular" ID="ibtnModuloAdministrador" OnClick="ibtnModuloAdministrador_Click"/>
                </div>
                <br />
                <asp:Label runat="server" CssClass="h4 fontbold" ID="lblModuloAdministrador" Text="lblModuloAdministrador"></asp:Label>
                <br />
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 lineheight25">
                        <asp:Label runat="server" CssClass="text-muted fontsizeh6" ID="lblModuloAdministradorDes" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 col-sm-10 col-md-6 offset-3 offset-sm-1 offset-md-3">
                        <asp:Button runat="server" ID="btnModuloAdministrador" Text="btnModuloAdministrador" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnModuloAdministrador_Click" />
                    </div>
                </div>
                <br />
            </div>
        </div>
        <br />
        <br />
    </div>
</asp:Content>
