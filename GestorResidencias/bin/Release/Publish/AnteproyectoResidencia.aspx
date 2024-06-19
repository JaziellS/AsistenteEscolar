<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AnteproyectoResidencia.aspx.cs" Inherits="GestorResidencias.AnteproyectoResidencia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Assets/CSS/fontawesome-free-5.13.0-web/css/all.css"/>
    <link rel="stylesheet" href="Assets/CSS/jquery-datecustom.css"/>
    <link rel="stylesheet" href="Assets/CSS/jquery-ui.css"/>
    <link rel="stylesheet" href="Assets/CSS/jquery.dropdown.css"/>
    <link rel="stylesheet" href="Assets/CSS/bootstrap-multiselect.css"/>
    <script src="Assets/Scripts/jquery.timepicker.js"></script>
    <script src="Assets/Scripts/bootstrap-multiselect.js"></script>
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
        .justificar-img-label {
            display:inline-flex;
            align-items:center;
            margin-bottom:5px;
        }

        input[type="checkbox"] {
            accent-color: black;
        }

        /*input[type="checkbox"] + label {
            display: inline-block;
            padding-left: 25px;
            position: relative;
            cursor: pointer;
        }

        input[type="checkbox"] + label::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            width: 50px;
            height: 20px;
            border-radius: 3px;
        }

        input[type="checkbox"]:checked + label::before {
            background-color: black;
            border-color: black;
        }*/
        

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

        @media screen and (min-width:769px) {
            .modal-responsivo {
                width: 750px;
            }
        }
        /*.xa > tbody > tr > td > input[type="checkbox" i] {
            accent-color: black;
        }*/
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            InicializarComponentes();
        })

        function InicializarComponentes() {
            InicializarCombos();
            ActualizaActividad();
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

        function ActualizaActividad() {
            $(document).ready(function() {
                $('.cambio-texto').on('blur', function() {
                    var sName = $(this).attr('name');
                    var sValorTexto = $(this).val();
        
                    $.ajax({
                        type: "POST",
                        url: "AnteproyectoResidencia.aspx/ActualizaCambiosDetActividades",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ sName: sName, sValorTexto: sValorTexto }),
                        dataType: "json",
                        success: function(response) {
                            console.log(response.d);
                        },
                        error: function(err) {
                            console.error(err);
                        }
                    });
                });
            });
        }

        function iskeyPressActividad(keyCode) {
            if (keyCode == 13) {
                document.getElementById("<%=btnAceptarMod.ClientID%>").focus();
                document.getElementById("<%=btnAceptarMod.ClientID%>").style.backgroundColor = "#AEB6BF"
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
            <asp:Label ID="lblDescripcionModulo" runat="server" Text="lblDescripcionModulo" CssClass="text-muted"></asp:Label>
        </div>
        <br />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="up1">
            <ContentTemplate>
                <div id="divRecuperarInfo" runat="server" class="row" style="margin-bottom:20px;">
                    <div class="col-12 col-md-12 col-sm-12 col-lg-12">
                        <asp:LinkButton ID="lbtnRecuperaInfo" runat="server" Text="Recuperar informacion de tu anteproyecto anterior." BorderStyle="None" cssclass="lbtn-general" OnClick="lbtnRecuperaInfo_Click" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-9 col-sm-5 col-md-4 col-lg-2" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblPeriodo" CssClass="fontsizeh6" Text="lblPeriodo"></asp:Label>
                        <asp:DropDownList runat="server" ID="cboxPeriodo" CssClass="form-select fontsizeh6" OnSelectedIndexChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvPeriodo" CssClass="campo-obligatorio" ControlToValidate="cboxPeriodo" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-3 col-sm-3 col-md-2 col-lg-1" style="margin-bottom:10px;">
                        <asp:Label runat="server" ID="lblAnio" CssClass="fontsizeh6" Text="lblAnio"></asp:Label>
                        <asp:TextBox runat="server" ID="tboxAnio" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                        <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server"
                            ErrorTooltipEnabled="true" 
                            InputDirection="RightToLeft" 
                            CultureName="es-ES" 
                            MaskType="Number" Mask="9999" TargetControlID="tboxAnio"/>   
                        <asp:RequiredFieldValidator runat="server" ID="rfvAnio" CssClass="campo-obligatorio" ControlToValidate="tboxAnio" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-8 col-lg-5" style="margin-bottom:10px;">
                        <div class="justificar-img-label">
                            <asp:Label runat="server" ID="lblNombreP" Text="lblNombreP" CssClass="fontsizeh6"></asp:Label>
                            <asp:ImageButton runat="server" ID="ibtnNombreP" CssClass="img-interrogacion ibtn-hover-general" OnClick="ibtnNombreP_Click"/>
                        </div>
                        <asp:TextBox runat="server" MaxLength="150" ID="tboxNombreP" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvNombreP" CssClass="campo-obligatorio" ControlToValidate="tboxNombreP" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                        <div class="justificar-img-label">
                            <asp:Label runat="server" ID="lblObjetivoP" Text="lblObjetivoP" CssClass="fontsizeh6"></asp:Label>
                            <asp:ImageButton runat="server" ID="ibtnObjetivoP" CssClass="img-interrogacion ibtn-hover-general" OnClick="ibtnObjetivoP_Click"/>
                        </div>
                        <asp:TextBox runat="server" ID="tboxObjetivoP" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="6" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvObjetivoP" CssClass="campo-obligatorio" ControlToValidate="tboxObjetivoP" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                        <div class="justificar-img-label">
                            <asp:Label runat="server" ID="lblJustificacion" Text="lblJustificacion" CssClass="fontsizeh6"></asp:Label>
                            <asp:ImageButton runat="server" ID="ibtnJustificacion" CssClass="img-interrogacion ibtn-hover-general" OnClick="ibtnJustificacion_Click" />
                        </div>
                        <asp:TextBox runat="server" ID="tboxJustificacion" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="5" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvJustificacion" CssClass="campo-obligatorio" ControlToValidate="tboxJustificacion" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12">
                        <div class="justificar-img-label">
                            <asp:Label runat="server" ID="lblCronograma" Text="lblCronograma" CssClass="fontsizeh6"></asp:Label>
                            <asp:ImageButton runat="server" ID="ibtnCronograma" CssClass="img-interrogacion ibtn-hover-general" OnClick="ibtnCronograma_Click" />
                        </div>
                    </div>
                </div>
                <asp:ImageButton runat="server" ID="ibtnAgregar" CssClass="ibtn-hover-general" OnClick="ibtnAgregar_Click"/>
                <div style="overflow-x:auto;">
                    <asp:GridView ID="gvCronograma" runat="server" OnRowCreated="gvCronograma_RowCreated" OnRowCommand="gvCronograma_RowCommand"
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
                                <asp:CheckBox ID="chkSemana1" runat="server" Checked='<%# Bind("Semana1") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                                <%--<label for="chkSemana1"></label>--%>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana2" SortExpression="Semana2">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana2" runat="server" Checked='<%# Bind("Semana2") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana3" SortExpression="Semana3">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana3" runat="server" Checked='<%# Bind("Semana3") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana4" SortExpression="Semana4">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana4" runat="server" Checked='<%# Bind("Semana4") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana5" SortExpression="Semana5">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana5" runat="server" Checked='<%# Bind("Semana5") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana6" SortExpression="Semana6">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana6" runat="server" Checked='<%# Bind("Semana6") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana7" SortExpression="Semana7">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana7" runat="server" Checked='<%# Bind("Semana7") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana8" SortExpression="Semana8">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana8" runat="server" Checked='<%# Bind("Semana8") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana9" SortExpression="Semana9">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana9" runat="server" Checked='<%# Bind("Semana9") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana10" SortExpression="Semana10">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana10" runat="server" Checked='<%# Bind("Semana10") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana11" SortExpression="Semana11">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana11" runat="server" Checked='<%# Bind("Semana11") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana12" SortExpression="Semana12">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana12" runat="server" Checked='<%# Bind("Semana12") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana13" SortExpression="Semana13">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana13" runat="server" Checked='<%# Bind("Semana13") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana14" SortExpression="Semana14">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana14" runat="server" Checked='<%# Bind("Semana14") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana15" SortExpression="Semana15">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana15" runat="server" Checked='<%# Bind("Semana15") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Semana16" SortExpression="Semana16">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSemana16" runat="server" Checked='<%# Bind("Semana16") %>' Enabled="true"  OnCheckedChanged="chkSemana1_CheckedChanged" AutoPostBack="true"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:BoundField DataField="OrdenAcomodo" HeaderText="OrdenAcomodo"/>
                        <asp:TemplateField HeaderText="Orden" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ID="ibtnFlechaArriba" CssClass="ibtn-hover-general"/>
                                <asp:ImageButton runat="server" ID="ibtnFlechaAbajo" CssClass="ibtn-hover-general" style="margin-left:7px;"/>
                            </ItemTemplate>                            
                        </asp:TemplateField>
                        <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Eliminar" ItemStyle-HorizontalAlign="Center"/>                        
                    </Columns>
                    </asp:GridView>
                </div>
                <br />
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12">
                        <div class="justificar-img-label">
                            <asp:Label runat="server" ID="lblDescripcionDet" Text="lblDescripcionDet" CssClass="fontsizeh6"></asp:Label>
                            <asp:ImageButton runat="server" ID="ibtnDescripcionDet" CssClass="img-interrogacion ibtn-hover-general" OnClick="ibtnDescripcionDet_Click" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" ID="upDetalle" UpdateMode="Conditional">
            <ContentTemplate>
                <%= sDetalleActividad.ToString() %>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" ID="upp2">
            <ContentTemplate>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                        <div class="justificar-img-label">
                            <asp:Label runat="server" ID="lblAlcanceP" Text="lblAlcanceP" CssClass="fontsizeh6"></asp:Label>
                            <asp:ImageButton runat="server" ID="ibtnAlcanceP" CssClass="img-interrogacion ibtn-hover-general" OnClick="ibtnAlcanceP_Click" />
                        </div>
                        <asp:TextBox runat="server" ID="tboxAlcanceP" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="5" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvAlcanceP" CssClass="campo-obligatorio" ControlToValidate="tboxAlcanceP" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                        <div class="justificar-img-label">
                            <asp:Label runat="server" ID="lblLugar" Text="lblLugar" CssClass="fontsizeh6"></asp:Label>
                            <asp:ImageButton runat="server" ID="ibtnLugar" CssClass="img-interrogacion ibtn-hover-general" OnClick="ibtnLugar_Click"/>
                        </div>
                        <asp:TextBox runat="server" MaxLength="250" ID="tboxLugarP" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvLugarP" CssClass="campo-obligatorio" ControlToValidate="tboxLugarP" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:5px;">
                        <asp:Label runat="server" ID="lblInformacionEmpresa" Text="lblInformacionEmpresa" CssClass="fontsizeh6"></asp:Label>
                    </div>
                </div>
                <div class="borde-datos-anteproyecto">
                    <div id="divBusquedaE" runat="server" class="row">
                        <div class="col-12 col-sm-12 col-md-8 col-lg-6">
                            <asp:Label runat="server" ID="lblBusquedaEmpresa" Text="lblBusquedaEmpresa" CssClass="fontsizeh6"></asp:Label>
                            <asp:ListBox runat="server" ID="lboxBusquedaEmpresa" SelectionMode="Multiple" CssClass="form-control fontsizeh6" OnSelectedIndexChanged="lboxBusquedaEmpresa_SelectedIndexChanged" AutoPostBack="true"></asp:ListBox>
                        </div>
                        <div class="col-12 col-sm-12 col-md-8 col-lg-6" style="margin-top:35px; margin-bottom:10px;">
                            <asp:CheckBox runat="server" ID="chkITSJ" CssClass="form-check fontsizeh6" TextAlign="Right" Text="chkITSJ" OnCheckedChanged="chkITSJ_CheckedChanged" AutoPostBack="true"></asp:CheckBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-8 col-lg-5" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNombreE" Text="lblNombreE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="250" ID="tboxNombreE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvNombreE" CssClass="campo-obligatorio" ControlToValidate="tboxNombreE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblGiroE" Text="lblGiroE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxGiroE" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="4" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvGiroE" CssClass="campo-obligatorio" ControlToValidate="tboxGiroE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-4 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblDepartamentoE" Text="lblDepartamentoE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="100" ID="tboxDepartamentoE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvDepartamentoE" CssClass="campo-obligatorio" ControlToValidate="tboxDepartamentoE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblTelefonoE" Text="lblTelefonoE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="10" ID="tboxTelefonoE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revTelefonoE" runat="server" CssClass="campo-obligatorio"
                                ControlToValidate="tboxTelefonoE" SetFocusOnError="true" Display="Dynamic"
                                ErrorMessage="Deben ser 10 caracteres."
                                ValidationExpression="^\d{10}$" ValidationGroup="AgregarAnteproyecto"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvTelefonoE" CssClass="campo-obligatorio" ControlToValidate="tboxTelefonoE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:20px;">
                        <div class="col-12 col-sm-12 col-md-6 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNombreGerenteE" Text="lblNombreGerenteE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="250" ID="tboxNombreGerenteE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvNombreGerenteE" CssClass="campo-obligatorio" ControlToValidate="tboxNombreGerenteE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-12 col-md-5 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblJefeAreaE" Text="lblJefeAreaE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="150" ID="tboxJefeAreaE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvJefeAreaE" CssClass="campo-obligatorio" ControlToValidate="tboxJefeAreaE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
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
                            <asp:TextBox runat="server" MaxLength="150" ID="tboxCalleE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCalleE" CssClass="campo-obligatorio" ControlToValidate="tboxCalleE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-3 col-md-3 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNumExtE" Text="lblNumExtE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="35" ID="tboxNumExtE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvNumExtE" CssClass="campo-obligatorio" ControlToValidate="tboxNumExtE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-3 col-md-3 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNumIntE" Text="lblNumIntE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="35" ID="tboxNumIntE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-8 col-md-7 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblColoniaE" Text="lblColoniaE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="150" ID="tboxColoniaE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvColoniaE" CssClass="campo-obligatorio" ControlToValidate="tboxColoniaE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:20px;">
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblMunicipioE" Text="lblMunicipioE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="100" ID="tboxMunicipioE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvMunicipioE" CssClass="campo-obligatorio" ControlToValidate="tboxMunicipioE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblCiudadE" Text="lblCiudadE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="100" ID="tboxCiudadE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCiudadE" CssClass="campo-obligatorio" ControlToValidate="tboxCiudadE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-5 col-md-3 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblCPE" Text="lblCPE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="5" ID="tboxCPE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                FilterType="Numbers"
                                TargetControlID="tboxCPE"/>
                            <asp:RegularExpressionValidator ID="revCPE" runat="server" CssClass="campo-obligatorio"
                                ControlToValidate="tboxCPE" SetFocusOnError="true" Display="Dynamic"
                                ErrorMessage="Deben ser 5 caracteres."
                                ValidationExpression="^\d{5}$" ValidationGroup="AgregarAnteproyecto"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCPE" CssClass="campo-obligatorio" ControlToValidate="tboxCPE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblEstadoE" Text="lblEstadoE" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="100" ID="tboxEstadoE" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvEstadoE" CssClass="campo-obligatorio" ControlToValidate="tboxEstadoE" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
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
                            <asp:TextBox runat="server" MaxLength="8" ID="tboxNumControlR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                FilterType="Numbers"
                                TargetControlID="tboxNumControlR"/>
                            <asp:RegularExpressionValidator ID="revNumControlR" runat="server" CssClass="campo-obligatorio"
                                ControlToValidate="tboxNumControlR" SetFocusOnError="true" Display="Dynamic"
                                ErrorMessage="Deben ser 8 caracteres."
                                ValidationExpression="^\d{8}$" ValidationGroup="AgregarAnteproyecto"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvNumControlR" CssClass="campo-obligatorio" ControlToValidate="tboxNumControlR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-7 col-md-5 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblCarreraR" Text="lblCarreraR" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxCarreraR" CssClass="form-select fontsizeh6" OnSelectedIndexChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ID="rfvCarreraR" CssClass="campo-obligatorio" ControlToValidate="cboxCarreraR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-8 col-md-6 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNombreR" Text="lblNombreR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="250" ID="tboxNombreR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvNombreR" CssClass="campo-obligatorio" ControlToValidate="tboxNombreR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-12 col-sm-4 col-md-3 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblTelefonoR" Text="lblTelefonoR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="10" ID="tboxTelefonoR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="fteTelefonoR" runat="server"
                                FilterType="Numbers"
                                TargetControlID="tboxTelefonoR"/>
                            <asp:RegularExpressionValidator ID="revTelefonoR" runat="server" CssClass="campo-obligatorio"
                                ControlToValidate="tboxTelefonoR" SetFocusOnError="true" Display="Dynamic"
                                ErrorMessage="Deben ser 10 caracteres."
                                ValidationExpression="^\d{10}$" ValidationGroup="AgregarAnteproyecto"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvTelefonoR" CssClass="campo-obligatorio" ControlToValidate="tboxTelefonoR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-8 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblEmailR" Text="lblEmailR" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" MaxLength="100" ID="tboxEmailR" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" OnTextChanged="cboxPeriodo_SelectedIndexChanged" AutoPostBack="true"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revEmailR" runat="server" CssClass="campo-obligatorio"
                                ControlToValidate="tboxEmailR" SetFocusOnError="true" Display="Dynamic"
                                ErrorMessage="Estructura de correo incorrecta."
                                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ValidationGroup="AgregarAnteproyecto"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator runat="server" ID="rfvEmailR" CssClass="campo-obligatorio" ControlToValidate="tboxEmailR" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarAnteproyecto"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <br />
                <div id="divBotones" runat="server">
                    <div class="row alineacion-vertical">
                        <div class="col-6 col-sm-4 col-md-3 col-lg-2 offset-sm-4 offset-md-6 offset-lg-8"> 
                            <asp:Button ID="btnGuardar" runat="server" Text="btnGuardar" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnGuardar_Click"/>           
                        </div>
                        <div class="col-6 col-sm-4 col-md-3 col-lg-2"> 
                            <asp:Button ID="btnEnviar" runat="server" Text="btnEnviar" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnEnviar_Click" ValidationGroup="AgregarAnteproyecto"/>           
                        </div>
                    </div>
                    <br />
                </div>
                <%=sCalificacion.ToString() %>
            </ContentTemplate>
        </asp:UpdatePanel>

        

        <asp:Button ID="Button1" runat="server" Text="btnAgregar" style="display:none"/> 
        <ajaxToolkit:ModalPopupExtender runat="server" ID="modAgregar" TargetControlID="Button1" BackgroundCssClass="modalBackground" PopupControlID="PAgregar"></ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" CssClass="modal-responsivo" ID="PAgregar" style="display:none; background-color:white;">
            <asp:UpdatePanel runat="server" ID="up2">
                <ContentTemplate>
                    <div class="modal-headers text-center">
                        <asp:Label ID="lblDescripcionModuloMod" runat="server" Text="lblDescripcionModuloMod" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                    </div>
                    <div class="modal-bodys">
                        <div class="row">
                            <div class="col-12 col-sm-2 col-md-1 col-lg-1">
                                <asp:Label runat="server" ID="lblNombreActividadMod" Text="lblNombreActividadMod" CssClass="fontsizeh6"></asp:Label>
                            </div>
                            <div class="col-12 col-sm-10 col-md-11 col-lg-11">
                                <asp:TextBox runat="server" MaxLength="500" ID="tboxNombreActividadMod" CssClass="form-control fontsizeh6" onkeydown="iskeyPressActividad(event.keyCode);"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="rfvNombreActividadMod" CssClass="campo-obligatorio" ControlToValidate="tboxNombreActividadMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarActividad"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footers">
                        <div class="row alineacion-vertical" >
                            <div class="col-6 col-md-2 col-sm-3 col-lg-2 offset-sm-6 offset-md-8 offset-lg-8"> 
                                <asp:Button ID="btnCancelarMod" runat="server" Text="btnCancelarMod" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnCancelarMod_Click"/>                                                                                         
                            </div>
                            <div class="col-6 col-md-2 col-sm-3 col-lg-2"> 
                                <asp:Button ID="btnAceptarMod" runat="server" Text="btnAceptarMod" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnAceptarMod_Click" ValidationGroup="AgregarActividad"/>           
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
</asp:Content>
