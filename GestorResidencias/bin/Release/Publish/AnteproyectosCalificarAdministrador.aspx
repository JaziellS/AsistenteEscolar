<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AnteproyectosCalificarAdministrador.aspx.cs" Inherits="GestorResidencias.AnteproyectosCalificarAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            background-image: url(Assets/Imagenes/Fondos/Calificar.jpg);
            color:white;
            background-position: 100% 100%;
            text-align:center;
            background-size: cover;
            background-repeat:no-repeat;
            padding-top: 12.5rem;
            padding-bottom: 2rem;
        }

        .contenedor-anteproyecto-cal {
            background-color: #7A70C4;
            border-radius: 60px;
            padding: 15px;
            z-index:2;
            margin-top:45px;
            position:relative;
        }

        .contenedor-informacion-anteproyectos {
            background-color: #685EAF;
            border-radius: 20px;
            padding: 20px;
            word-wrap: break-word;
        }

        .centrar-imagen-anteproyectos {
            text-align:center;
            position:relative;
            margin-top:-72px;
            z-index: 3;
        }

        .background-estatus-calificacion {
            background-color:#E8E8E8;
            padding-top:20px;
            padding-left:20px;
            padding-right:20px;
            padding-bottom:10px;
        }
    </style>
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
                    <asp:ImageButton ID="ibtnRetroceder" CssClass="ibtn-hover-general" runat="server" CausesValidation="false" OnClick="ibtnRetroceder_Click"/>
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
                    <div class="background-estatus-calificacion">
                        <div class="row">
                            <div class="col-12 col-sm-6 col-md-6 col-lg-3" style="padding-bottom:10px;">
                                <div class="row alineacion-vertical">
                                    <div class="col-4 col-sm-4 col-md-4 col-lg-4" style="text-align:end">
                                        <asp:Image runat="server" ID="imgPendienteDes" />
                                    </div>
                                    <div class="col-8 col-sm-8 col-md-6 col-lg-6">
                                        <asp:Label runat="server" ID="lblPendienteDes" CssClass="text-muted" text="lblPendienteDes"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6 col-lg-3" style="padding-bottom:10px;">
                                <div class="row alineacion-vertical">
                                    <div class="col-4 col-sm-4 col-md-4 col-lg-4" style="text-align:end">
                                        <asp:Image runat="server" ID="imgAprobadoConComentariosDes" />
                                    </div>
                                    <div class="col-8 col-sm-8 col-md-6 col-lg-6">
                                        <asp:Label runat="server" ID="lblAprobadoConComentariosDes" CssClass="text-muted" text="lblAprobadoConComentariosDes"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6 col-lg-3" style="padding-bottom:10px;">
                                <div class="row alineacion-vertical">
                                    <div class="col-4 col-sm-4 col-md-4 col-lg-4" style="text-align:end">
                                        <asp:Image runat="server" ID="imgAprobadoDes" />
                                    </div>
                                    <div class="col-8 col-sm-8 col-md-6 col-lg-8">
                                        <asp:Label runat="server" ID="lblAprobadoDes" CssClass="text-muted" text="lblAprobadoDes"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6 col-lg-3" style="padding-bottom:10px;">
                                <div class="row alineacion-vertical">
                                    <div class="col-4 col-sm-4 col-md-4 col-lg-4" style="text-align:end">
                                        <asp:Image runat="server" ID="imgNoAprobadoDes" />
                                    </div>
                                    <div class="col-8 col-sm-8 col-md-6 col-lg-8">
                                        <asp:Label runat="server" ID="lblNoAprobadoDes" CssClass="text-muted" text="lblNoAprobadoDes"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row" style="margin-bottom:10px;">
                        <div class="col-7 col-sm-5 col-md-3 col-lg-2">
                            <asp:Label runat="server" ID="lblPeriodo" Text="lblPeriodo" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxPeriodo" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="cboxPeriodo_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col-5 col-sm-3 col-md-2 col-lg-1">
                            <asp:Label runat="server" ID="lblAnio" Text="lblAnio" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxAnio" CssClass="form-control fontsizeh6" AutoPostBack="true" OnTextChanged="tboxAnio_TextChanged"></asp:TextBox>
                            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server"
                                ErrorTooltipEnabled="true" 
                                InputDirection="RightToLeft" 
                                CultureName="es-ES" 
                                MaskType="Number" Mask="9999" TargetControlID="tboxAnio"/>
                        </div>
                    </div>
                    <br />
                    <div style="background-color:#E8E8E8; padding:30px;">
                        <div class="row">
                            <div class="col-12 col-sm-12 col-md-12 text-center">
                                <asp:Label runat="server" ID="lblPeriodoDes" CssClass="text-muted h3"></asp:Label>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <%=sAnteproyectos.ToString() %>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
