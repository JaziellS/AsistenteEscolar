<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ModuloAdministrador.aspx.cs" Inherits="GestorResidencias.ModuloAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container contenidopagina">
        <br />
        <div class="text-center">
            <asp:Label ID="lblTitulo" runat="server" Text="lblTitulo" CssClass="h1 fontbold"></asp:Label>
        </div>
        <br />
        <br />
        <div class="container-fluid text-center">
            <asp:Label ID="lblDescripcionModulo" runat="server" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." CssClass="text-muted"></asp:Label>
        </div>
        <br />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="row text-center">
            <div id="divUsuarios" runat="server" class="col-12 col-sm-6 col-md-6 col-lg-4">
                <div class="contenedor-imagen-circulo ibtn-hover-modulos" style="margin-bottom:10px;">
                    <asp:ImageButton runat="server" CssClass="img-backgroun-circular" ID="ibtnUsuario" OnClick="ibtnUsuario_Click"/>
                </div>
                <br />
                <asp:Label runat="server" CssClass="h4 fontbold" ID="lblUsuario" Text="lblUsuario"></asp:Label>
                <br />
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 lineheight25">
                        <asp:Label runat="server" CssClass="text-muted fontsizeh6" ID="lblUsuarioDes" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 col-sm-10 col-md-6 offset-3 offset-sm-1 offset-md-3">
                        <asp:Button runat="server" ID="btnUsuario" Text="btnUsuario" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnUsuario_Click" />
                    </div>
                </div>
                <br />
            </div>
            <div id="divSolicitudes" runat="server" class="col-12 col-sm-6 col-md-6 col-lg-4">
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
            <div id="divAnteproyectos" runat="server" class="col-12 col-sm-6 col-md-6 col-lg-4">
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
            <div id="divBancoProyectos" runat="server" class="col-12 col-sm-6 col-md-6 col-lg-4">
                <div class="contenedor-imagen-circulo ibtn-hover-modulos" style="margin-bottom:10px;">
                    <asp:ImageButton runat="server" CssClass="img-backgroun-circular" ID="ibtnBancoProyectos" OnClick="ibtnBancoProyectos_Click"/>
                </div>
                <br />
                <asp:Label runat="server" CssClass="h4 fontbold" ID="lblBancoProyectos" Text="lblBancoProyectos"></asp:Label>
                <br />
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 lineheight25">
                        <asp:Label runat="server" CssClass="text-muted fontsizeh6" ID="lblBancoProyectosDes" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 col-sm-10 col-md-6 offset-3 offset-sm-1 offset-md-3">
                        <asp:Button runat="server" ID="btnBancoProyectos" Text="btnBancoProyectos" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnBancoProyectos_Click" />
                    </div>
                </div>
                <br />
            </div>
            <div id="divEmpresas" runat="server" class="col-12 col-sm-6 col-md-6 col-lg-4">
                <div class="contenedor-imagen-circulo ibtn-hover-modulos" style="margin-bottom:10px;">
                    <asp:ImageButton runat="server" CssClass="img-backgroun-circular" ID="ibtnEmpresas" OnClick="ibtnEmpresas_Click"/>
                </div>
                <br />
                <asp:Label runat="server" CssClass="h4 fontbold" ID="lblEmpresas" Text="lblEmpresas"></asp:Label>
                <br />
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 lineheight25">
                        <asp:Label runat="server" CssClass="text-muted fontsizeh6" ID="lblEmpresasDes" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 col-sm-10 col-md-6 offset-3 offset-sm-1 offset-md-3">
                        <asp:Button runat="server" ID="btnEmpresas" Text="btnEmpresas" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnEmpresas_Click" />
                    </div>
                </div>
                <br />
            </div>
            <div id="divMaestrosResidentes" runat="server" class="col-12 col-sm-6 col-md-6 col-lg-4">
                <div class="contenedor-imagen-circulo ibtn-hover-modulos" style="margin-bottom:10px;">
                    <asp:ImageButton runat="server" CssClass="img-backgroun-circular" ID="ibtnMaestrosResidentes" OnClick="ibtnMaestrosResidentes_Click"/>
                </div>
                <br />
                <asp:Label runat="server" CssClass="h4 fontbold" ID="lblMaestrosResidentes" Text="lblMaestrosResidentes"></asp:Label>
                <br />
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 lineheight25">
                        <asp:Label runat="server" CssClass="text-muted fontsizeh6" ID="lblMaestrosResidentesDes" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 col-sm-10 col-md-6 offset-3 offset-sm-1 offset-md-3">
                        <asp:Button runat="server" ID="btnMaestrosResidentes" Text="btnMaestrosResidentes" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnMaestrosResidentes_Click" />
                    </div>
                </div>
                <br />
            </div>
            <div id="divCalificarAnteproyectos" runat="server" class="col-12 col-sm-6 col-md-6 col-lg-4">
                <div class="contenedor-imagen-circulo ibtn-hover-modulos" style="margin-bottom:10px;">
                    <asp:ImageButton runat="server" CssClass="img-backgroun-circular" ID="ibtnCalificarAnteproyectos" OnClick="ibtnCalificarAnteproyectos_Click"/>
                </div>
                <br />
                <asp:Label runat="server" CssClass="h4 fontbold" ID="lblCalificarAnteproyecto" Text="lblCalificarAnteproyecto"></asp:Label>
                <br />
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 lineheight25">
                        <asp:Label runat="server" CssClass="text-muted fontsizeh6" ID="lblCalificarAnteproyectoDet" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 col-sm-10 col-md-6 offset-3 offset-sm-1 offset-md-3">
                        <asp:Button runat="server" ID="btnCalificarAnteproyectos" Text="btnCalificarAnteproyectosDet" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnCalificarAnteproyectos_Click" />
                    </div>
                </div>
                <br />
            </div>
            <div id="divSeleccionarAnte" runat="server" class="col-12 col-sm-6 col-md-6 col-lg-4">
                <div class="contenedor-imagen-circulo ibtn-hover-modulos" style="margin-bottom:10px;">
                    <asp:ImageButton runat="server" CssClass="img-backgroun-circular" ID="ibtnSeleccionarAnte" OnClick="ibtnSeleccionarAnte_Click"/>
                </div>
                <br />
                <asp:Label runat="server" CssClass="h4 fontbold" ID="lblSeleccionarAnte" Text="lblSeleccionarAnte"></asp:Label>
                <br />
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12 lineheight25">
                        <asp:Label runat="server" CssClass="text-muted fontsizeh6" ID="lblSeleccionarAnteDes" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 col-sm-10 col-md-6 offset-3 offset-sm-1 offset-md-3">
                        <asp:Button runat="server" ID="btnSeleccionarAnte" Text="btnSeleccionarAnte" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" OnClick="btnSeleccionarAnte_Click" />
                    </div>
                </div>
                <br />
            </div>
        </div>
        <br />
        <br />
    </div>
</asp:Content>
