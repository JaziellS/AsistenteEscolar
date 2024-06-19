<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="BancoProyectos.aspx.cs" Inherits="GestorResidencias.BancoProyectos" %>
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
            background-image: url(Assets/Imagenes/Fondos/BancoProyectos.jpg);
            color:white;
            background-position: 100% 100%;
            text-align:center;
            background-size: cover;
            background-repeat:no-repeat;
            padding-top: 12.5rem;
            padding-bottom: 2rem;
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
                    <asp:ImageButton ID="ibtnRetroceder" runat="server" CssClass="ibtn-hover-general" CausesValidation="false" OnClick="ibtnRetroceder_Click"/>
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
                    <div class="row" style="margin-bottom:20px;">
                        <div class="col-12 col-sm-12 col-md-5 col-lg-3" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblCarrera" Text="lblPeriodo" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxCarrera" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="cboxCarrera_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col-12 col-sm-12 col-md-3 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblPeriodo" Text="lblPeriodo" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxPeriodo" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="cboxCarrera_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col-12 col-sm-12 col-md-2 col-lg-1" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblAnio" Text="lblAnio" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxAnio" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" AutoPostBack="true" OnTextChanged="cboxCarrera_SelectedIndexChanged"></asp:TextBox>
                            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server"
                                ErrorTooltipEnabled="true" 
                                InputDirection="RightToLeft" 
                                CultureName="es-ES" 
                                MaskType="Number" Mask="9999" TargetControlID="tboxAnio"/>
                        </div>
                    </div>
                    <div style="background-color:#F4F4F4; padding:30px; border-radius:20px;">
                        <div id="divTabla" runat="server">
                            <div class="row" style="margin-bottom:30px;">
                                <div class="col-12 col-sm-12 col-md-12 text-center">
                                    <asp:Label runat="server" ID="lblPeriodoDes" CssClass="text-muted h3"></asp:Label>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom:20px;">
                                <div class="col-12 col-sm-5 col-md-4 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreEmpresa" Text="lblNombreEmpresa" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreEmpresa" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" AutoPostBack="true" OnTextChanged="tboxNombreEmpresa_TextChanged"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-7 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreProyecto" Text="lblNombreProyecto" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNombreProyecto" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" AutoPostBack="true" OnTextChanged="tboxNombreEmpresa_TextChanged"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-4 col-md-4 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNumeroRes" Text="lblNumeroRes" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxNumeroRes" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" AutoPostBack="true" OnTextChanged="tboxNombreEmpresa_TextChanged"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-4 col-md-4 col-lg-2" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblTurno" Text="lblTurno" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxTurno" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="tboxNombreEmpresa_TextChanged"></asp:DropDownList>
                                </div>
                                <div class="col-12 col-sm-4 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblHorario" Text="lblHorario" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxHorario" CssClass="form-control fontsizeh6" onkeydown="return (event.keyCode!=13);" AutoPostBack="true" OnTextChanged="tboxNombreEmpresa_TextChanged"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div style="overflow-x:auto;">
                                <asp:GridView ID="gvBanco" runat="server" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvBanco_PageIndexChanging" OnSorting="gvBanco_Sorting" OnRowCreated="gvBanco_RowCreated" OnRowCommand="gvBanco_RowCommand"
                                    CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6" AllowSorting="True" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="IdBank">
                                <Columns>
                                    <asp:BoundField DataField="IdBank" HeaderText="IdBank"/>
                                    <asp:TemplateField HeaderText="Numero" SortExpression="Numero">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Numero") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Numero") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="NombreEmpresa" SortExpression="NombreEmpresa">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NombreEmpresa") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("NombreEmpresa") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Giro" SortExpression="Giro">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Giro") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div style="overflow-y:auto; max-height:100px; padding-right:20px; overflow-x:hidden;">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Giro") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>                        
                                    <asp:TemplateField HeaderText="Domicilio" SortExpression="Domicilio">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Domicilio") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Domicilio") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                      
                                    <asp:TemplateField HeaderText="NombreContacto" SortExpression="NombreContacto">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox41" runat="server" Text='<%# Bind("NombreContacto") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label41" runat="server" Text='<%# Bind("NombreContacto") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                     
                                    <asp:TemplateField HeaderText="AreaReceptora" SortExpression="AreaReceptora">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox42" runat="server" Text='<%# Bind("AreaReceptora") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label42" runat="server" Text='<%# Bind("AreaReceptora") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>   
                                    <asp:TemplateField HeaderText="Puesto" SortExpression="Puesto">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Puesto") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Puesto") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="NombreProyecto" SortExpression="NombreProyecto">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("NombreProyecto") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div style="overflow-y:auto; max-height:100px; padding-right:20px; overflow-x:hidden;">
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("NombreProyecto") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Actividades" SortExpression="Actividades">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Actividades") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div style="overflow-y:auto; max-height:100px; padding-right:20px; overflow-x:hidden;">
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Actividades") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Turno" SortExpression="Turno">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Turno") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Turno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Horario" SortExpression="Horario">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Horario") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("Horario") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="DiasLab" SortExpression="DiasLab">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("DiasLab") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("DiasLab") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="NumResidentes" SortExpression="NumResidentes">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("NumResidentes") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("NumResidentes") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Capacitacion" SortExpression="Capacitacion">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Capacitacion") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label14" runat="server" Text='<%# Bind("Capacitacion") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="CapacitacionDet" SortExpression="CapacitacionDet">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("CapacitacionDet") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div style="overflow-y:auto; max-height:100px; padding-right:20px; overflow-x:hidden;">
                                                <asp:Label ID="Label15" runat="server" Text='<%# Bind("CapacitacionDet") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="CapacitacionFecha" SortExpression="CapacitacionFecha">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("CapacitacionFecha") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label16" runat="server" Text='<%# Bind("CapacitacionFecha") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Prestacion" SortExpression="Prestacion">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("Prestacion") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label17" runat="server" Text='<%# Bind("Prestacion") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="PrestacionDet" SortExpression="PrestacionDet">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("PrestacionDet") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div style="overflow-y:auto; max-height:100px; padding-right:20px; overflow-x:hidden;">
                                                <asp:Label ID="Label18" runat="server" Text='<%# Bind("PrestacionDet") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="Monto" SortExpression="Monto">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox19" runat="server" Text='<%# Bind("Monto") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div style="overflow-y:auto; max-height:100px; padding-right:20px; overflow-x:hidden;">
                                                <asp:Label ID="Label19" runat="server" Text='<%# Bind("Monto") %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>   
                                     <PagerSettings FirstPageText="&amp;lt; &amp;lt;" LastPageText="&amp;gt; &amp;gt;" Mode="NumericFirstLast" PageButtonCount="5" PreviousPageText="&amp;lt; " />
                                     <PagerStyle CssClass="pager-row"/>
                                </asp:GridView>
                            </div>
                        </div>
                        <div id="divSinRegistros" runat="server">
                            <div class="row text-center">
                                <div class="col-12 col-sm-12 col-md-12">
                                    <asp:Label ID="lblSinRegistros" runat="server" Text="lblSinRegistros" CssClass="text-muted"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
            <div class="row">
                <div class="col-12 col-sm-5 col-md-4 col-lg-3 offset-sm-7 offset-md-8 offset-lg-9">
                    <asp:Button runat="server" ID="btnDescargar" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" Text="btnDescargar" OnClick="btnDescargar_Click"/>
                </div>
            </div>
            <br />
            <br />
        </div>
    </div>
</asp:Content>
