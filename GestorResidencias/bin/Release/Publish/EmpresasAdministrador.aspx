<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EmpresasAdministrador.aspx.cs" Inherits="GestorResidencias.EmpresasAdministrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Assets/CSS/EstilosResponsivos.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">  
        .swal-overlay {
            z-index: 99999;
        }        
    </style>
    <style type="text/css">
        .background-titulo {
            background-image: url(Assets/Imagenes/Fondos/Empresas.jpg);
            color:white;
            background-position: 100% 100%;
            text-align:center;
            background-size: cover;
            background-repeat:no-repeat;
            padding-top: 12.5rem;
            padding-bottom: 2rem;
        }

        @media screen and (min-width:992px) {
            .modal-responsivo {
                width: 900px;
            }
        }
    </style>
    <script type="text/javascript">             
        $(document).ready(function () {
           
        });
                          
        function SoloNumeros(keyCode) {
            if (keyCode == 8 | keyCode == 190 | keyCode == 37 | keyCode == 39 | (keyCode >= 48 && keyCode <= 57)) {
                return true;
            } else {
                return false;
            }
        }    

        function iskeyPress(keyCode) {
            if (keyCode == 13) {
                document.getElementById("<%=btnBuscar.ClientID%>").focus();
                document.getElementById("<%=btnBuscar.ClientID%>").style.backgroundColor ="#AEB6BF"
            }
        }
    </script>
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
        <br />
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-12">
                    <asp:ImageButton ID="ibtnRetroceder" CssClass="ibtn-hover-general" runat="server" CausesValidation="false" OnClick="ibtnRetroceder_Click"/>
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
                        <div class="col-12 col-sm-7 col-md-5 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblNombreEmpresa" Text="lblNombreEmpresa" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxNombreEmpresa" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" AutoPostBack="true" OnTextChanged="tboxNombreEmpresa_TextChanged"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-5 col-md-4 col-lg-4" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblDomicilio" Text="lblDomicilio" CssClass="fontsizeh6"></asp:Label>
                            <asp:TextBox runat="server" ID="tboxDomicilio" CssClass="form-control fontsizeh6" onkeydown="iskeyPress(event.keyCode)" AutoPostBack="true" OnTextChanged="tboxNombreEmpresa_TextChanged"></asp:TextBox>
                        </div>
                        <div class="col-12 col-sm-4 col-md-3 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblSector" Text="lblSector" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxSector" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="tboxNombreEmpresa_TextChanged"></asp:DropDownList>
                        </div>
                        <div class="col-12 col-sm-4 col-md-3 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblRamo" Text="lblRamo" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxRamo" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="tboxNombreEmpresa_TextChanged"></asp:DropDownList>
                        </div>
                        <div class="col-12 col-sm-4 col-md-4 col-lg-2" style="margin-bottom:10px;">
                            <asp:Label runat="server" ID="lblEstatus" Text="lblEstatus" CssClass="fontsizeh6"></asp:Label>
                            <asp:DropDownList runat="server" ID="cboxEstatus" CssClass="form-select fontsizeh6" AutoPostBack="true" OnSelectedIndexChanged="tboxNombreEmpresa_TextChanged"></asp:DropDownList>
                        </div>
                    </div>
                    <asp:Button runat="server" ID="btnBuscar" style="display:none;" OnClick="tboxNombreEmpresa_TextChanged"/>
                    <asp:ImageButton runat="server" CssClass="ibtn-hover-general" ID="ibtnAgregar" OnClick="ibtnAgregar_Click"/>
                    <div style="overflow-x:auto;">
                        <asp:GridView ID="gvEmpresas" runat="server" AllowPaging="True" PageSize="7" OnPageIndexChanging="gvEmpresas_PageIndexChanging" OnSorting="gvEmpresas_Sorting" OnRowCreated="gvEmpresas_RowCreated" OnRowCommand="gvEmpresas_RowCommand"
                            CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6" AllowSorting="True" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="IdCompany">
                        <Columns>
                            <asp:BoundField DataField="IdCompany" HeaderText="IdCompany"/>
                            <asp:BoundField DataField="IdTypeState" HeaderText="IdTypeState"/>
                            <asp:BoundField DataField="Fax" HeaderText="Fax"/>
                            <asp:BoundField DataField="TamanioEmpresa" HeaderText="TamanioEmpresa"/>
                            <asp:BoundField DataField="Mision" HeaderText="Mision"/>
                            <asp:BoundField DataField="Giro" HeaderText="Giro"/>
                            <asp:BoundField DataField="Calle" HeaderText="Calle"/>
                            <asp:BoundField DataField="NumeroExterior" HeaderText="NumeroExterior"/>
                            <asp:BoundField DataField="NumeroInterior" HeaderText="NumeroInterior"/>
                            <asp:BoundField DataField="Colonia" HeaderText="Colonia"/>
                            <asp:BoundField DataField="Municipio" HeaderText="Municipio"/>
                            <asp:BoundField DataField="NumeroPostal" HeaderText="NumeroPostal"/>
                            <asp:BoundField DataField="Ciudad" HeaderText="Ciudad"/>
                            <asp:BoundField DataField="Estado" HeaderText="Estado"/>
                            <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Domicilio" SortExpression="Domicilio">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Domicilio") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Domicilio") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TelefonoOficina" SortExpression="TelefonoOficina">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TelefonoOficina") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("TelefonoOficina") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                        
                            <asp:TemplateField HeaderText="NombreDuenio" SortExpression="NombreDuenio">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("NombreDuenio") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("NombreDuenio") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                      
                            <asp:TemplateField HeaderText="Sector" SortExpression="Sector">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox41" runat="server" Text='<%# Bind("Sector") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label41" runat="server" Text='<%# Bind("Sector") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                     
                            <asp:TemplateField HeaderText="Ramo" SortExpression="Ramo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Ramo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Ramo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                  
                            <asp:TemplateField HeaderText="RFC" SortExpression="RFC">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("RFC") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("RFC") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estatus" SortExpression="Estatus">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Estatus") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Estatus") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Editar" ItemStyle-HorizontalAlign="Center"/>                       
                            <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Ver" ItemStyle-HorizontalAlign="Center"/>                       
                            <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Eliminar" ItemStyle-HorizontalAlign="Center"/>                       
                        </Columns>   
                             <PagerSettings FirstPageText="&amp;lt; &amp;lt;" LastPageText="&amp;gt; &amp;gt;" Mode="NumericFirstLast" PageButtonCount="5" PreviousPageText="&amp;lt; " />
                             <PagerStyle CssClass="pager-row"/>
                        </asp:GridView>
                    </div>
                    <br />
                    <br />
                    <asp:ImageButton runat="server" CssClass="ibtn-hover-general" ID="ibtnAgregarUniversidad" OnClick="ibtnAgregarUniversidad_Click"/>
                    <div style="overflow-x:auto;">
                        <asp:GridView ID="gvUniversidad" runat="server" OnRowCreated="gvUniversidad_RowCreated" OnRowCommand="gvUniversidad_RowCommand"
                            CssClass="table text-center tabla-sinsubrayado table-bordered table-striped fontsizeh6" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="IdCompany">
                        <Columns>
                            <asp:BoundField DataField="IdCompany" HeaderText="IdCompany"/>
                            <asp:BoundField DataField="IdTypeState" HeaderText="IdTypeState"/>
                            <asp:BoundField DataField="Fax" HeaderText="Fax"/>
                            <asp:BoundField DataField="TamanioEmpresa" HeaderText="TamanioEmpresa"/>
                            <asp:BoundField DataField="Mision" HeaderText="Mision"/>
                            <asp:BoundField DataField="Giro" HeaderText="Giro"/>
                            <asp:BoundField DataField="Calle" HeaderText="Calle"/>
                            <asp:BoundField DataField="NumeroExterior" HeaderText="NumeroExterior"/>
                            <asp:BoundField DataField="NumeroInterior" HeaderText="NumeroInterior"/>
                            <asp:BoundField DataField="Colonia" HeaderText="Colonia"/>
                            <asp:BoundField DataField="Municipio" HeaderText="Municipio"/>
                            <asp:BoundField DataField="NumeroPostal" HeaderText="NumeroPostal"/>
                            <asp:BoundField DataField="Ciudad" HeaderText="Ciudad"/>
                            <asp:BoundField DataField="Estado" HeaderText="Estado"/>
                            <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxU1" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelU1" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Domicilio" SortExpression="Domicilio">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxU2" runat="server" Text='<%# Bind("Domicilio") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelU2" runat="server" Text='<%# Bind("Domicilio") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TelefonoOficina" SortExpression="TelefonoOficina">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxU3" runat="server" Text='<%# Bind("TelefonoOficina") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelU3" runat="server" Text='<%# Bind("TelefonoOficina") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                        
                            <asp:TemplateField HeaderText="NombreDuenio" SortExpression="NombreDuenio">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxU4" runat="server" Text='<%# Bind("NombreDuenio") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelU4" runat="server" Text='<%# Bind("NombreDuenio") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                      
                            <asp:TemplateField HeaderText="Sector" SortExpression="Sector">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxU5" runat="server" Text='<%# Bind("Sector") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelU5" runat="server" Text='<%# Bind("Sector") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                     
                            <asp:TemplateField HeaderText="Ramo" SortExpression="Ramo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxU6" runat="server" Text='<%# Bind("Ramo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelU6" runat="server" Text='<%# Bind("Ramo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                  
                            <asp:TemplateField HeaderText="RFC" SortExpression="RFC">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxU7" runat="server" Text='<%# Bind("RFC") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelU7" runat="server" Text='<%# Bind("RFC") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estatus" SortExpression="Estatus">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxU8" runat="server" Text='<%# Bind("Estatus") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelU8" runat="server" Text='<%# Bind("Estatus") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Editar" ItemStyle-HorizontalAlign="Center"/>                       
                            <asp:ButtonField ButtonType="Button" HeaderText="Opciones" Text="Ver" ItemStyle-HorizontalAlign="Center"/>                     
                        </Columns>   
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
            <div class="row">
                <div class="col-12 col-sm-4 col-md-3 col-lg-3 offset-sm-8 offset-md-9 offset-lg-9">
                    <asp:Button runat="server" ID="btnDescargar" BorderStyle="None" CssClass="form-control fontsizeh6 btn-hover-general" Text="btnDescargar" OnClick="btnDescargar_Click"/>
                </div>
            </div>

            <asp:Button ID="Button1" runat="server" Text="btnAgregar" style="display:none"/> 
            <ajaxToolkit:ModalPopupExtender runat="server" ID="modAgregar" TargetControlID="Button1" BackgroundCssClass="modalBackground" PopupControlID="PAgregar"></ajaxToolkit:ModalPopupExtender>
            <asp:Panel runat="server" CssClass="modal-responsivo" ID="PAgregar" style="display:none; background-color:white;">
                <asp:UpdatePanel runat="server" ID="up2">
                    <ContentTemplate>
                        <div class="modal-headers text-center">
                            <asp:Label ID="lblDescripcionModuloMod" runat="server" Text="lblDescripcionModuloMod" style="font-size:13px;" CssClass="text-muted"></asp:Label>
                        </div>
                        <div class="modal-bodys" style="max-height:450px; overflow-y:auto;" id="ScrollModalA">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-8 col-lg-5" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreMod" Text="lblNombreMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="250" ID="tboxNombreMod" CssClass="form-control fontsizeh6"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvNombreMod" CssClass="campo-obligatorio" ControlToValidate="tboxNombreMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEstatusMod" Text="lblEstatusMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxEstatusMod" CssClass="form-select fontsizeh6" ></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvEstatusMod" CssClass="campo-obligatorio" ControlToValidate="cboxEstatusMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblSectorMod" Text="lblSectorMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxSectorMod" CssClass="form-select fontsizeh6"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvSectorMod" CssClass="campo-obligatorio" ControlToValidate="cboxSectorMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblRamoMod" Text="lblRamoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxRamoMod" CssClass="form-select fontsizeh6" ></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvRamoMod" CssClass="campo-obligatorio" ControlToValidate="cboxRamoMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-6 col-md-4 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblRFCMod" Text="lblRFCMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxRFCMod" MaxLength="50" CssClass="form-control fontsizeh6"></asp:TextBox>
                                </div>
                                <div class="col-12 col-sm-6 col-md-6 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblTelefonoOficinaMod" Text="lblTelefonoOficinaMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxTelefonoOficinaMod" MaxLength="50" CssClass="form-control fontsizeh6"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="fteTelefonoOficinaMod" runat="server"
                                        FilterType="Numbers"
                                        TargetControlID="tboxTelefonoOficinaMod"/>
                                    <asp:RegularExpressionValidator ID="revTelefonoOficinaMod" runat="server" CssClass="campo-obligatorio"
                                        ControlToValidate="tboxTelefonoOficinaMod" SetFocusOnError="true" Display="Dynamic"
                                        ErrorMessage="Deben ser 10 caracteres."
                                        ValidationExpression="^\d{10}$" ValidationGroup="AgregarEmpresa"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvTelefonoOficinaMod" CssClass="campo-obligatorio" ControlToValidate="tboxTelefonoOficinaMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-5 col-md-5 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblFaxMod" Text="lblFaxMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxFaxMod" MaxLength="30" CssClass="form-control fontsizeh6" ></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvFaxMod" CssClass="campo-obligatorio" ControlToValidate="tboxFaxMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-7 col-md-5 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblTamanioEmpMod" Text="lblTamanioEmpMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:DropDownList runat="server" ID="cboxTamanioEmpMod" CssClass="form-select fontsizeh6"></asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvTamanioEmpMod" CssClass="campo-obligatorio" ControlToValidate="cboxTamanioEmpMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-8 col-md-9 col-lg-4" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNombreTitularMod" Text="lblNombreTitularMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="250" ID="tboxNombreTitularMod" CssClass="form-control fontsizeh6"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvNombreTitularMod" CssClass="campo-obligatorio" ControlToValidate="tboxNombreTitularMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblMisionMod" Text="lblMisionMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxMisionMod" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvMisionMod" CssClass="campo-obligatorio" ControlToValidate="tboxMisionMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom:20px;">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblGiroMod" Text="lblGiroMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" ID="tboxGiroMod" CssClass="form-control fontsizeh6" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvGiroMod" CssClass="campo-obligatorio" ControlToValidate="tboxGiroMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12" style="margin-bottom:10px;">
                                    <asp:Label ID="lblDomicilioMod" runat="server" Text="lblDomicilioMod" CssClass="h5"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-6 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCalleMod" Text="lblCalleMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="50" ID="tboxCalleMod" CssClass="form-control fontsizeh6" ></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvCalleMod" CssClass="campo-obligatorio" ControlToValidate="tboxCalleMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-3 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNumExteriorMod" Text="lblNumExteriorMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="35" ID="tboxNumExteriorMod" CssClass="form-control fontsizeh6"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvNumExteriorMod" CssClass="campo-obligatorio" ControlToValidate="tboxNumExteriorMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-3 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblNumInteriorMod" Text="lblNumInteriorMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="35" ID="tboxNumInteriorMod" CssClass="form-control fontsizeh6"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvNumInteriorMod" CssClass="campo-obligatorio" ControlToValidate="tboxNumInteriorMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-8 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblColoniaMod" Text="lblColoniaMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="150" ID="tboxColoniaMod" CssClass="form-control fontsizeh6"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvColoniaMod" CssClass="campo-obligatorio" ControlToValidate="tboxColoniaMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-4 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblMunicipioMod" Text="lblMunicipioMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="100" ID="tboxMunicipioMod" CssClass="form-control fontsizeh6" ></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvMunicipioMod" CssClass="campo-obligatorio" ControlToValidate="tboxMunicipioMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-4 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCiudadMod" Text="lblCiudadMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="100" ID="tboxCiudadMod" CssClass="form-control fontsizeh6"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvCiudadMod" CssClass="campo-obligatorio" ControlToValidate="tboxCiudadMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-4 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblEstadoMod" Text="lblEstadoMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="100" ID="tboxEstadoMod" CssClass="form-control fontsizeh6"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvEstadoMod" CssClass="campo-obligatorio" ControlToValidate="tboxEstadoMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-12 col-sm-4 col-md-3 col-lg-3" style="margin-bottom:10px;">
                                    <asp:Label runat="server" ID="lblCPMod" Text="lblCPMod" CssClass="fontsizeh6"></asp:Label>
                                    <asp:TextBox runat="server" MaxLength="5" ID="tboxCPMod" CssClass="form-control fontsizeh6"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                                        FilterType="Numbers"
                                        TargetControlID="tboxCPMod"/>
                                    <asp:RegularExpressionValidator ID="revCPMod" runat="server" CssClass="campo-obligatorio"
                                        ControlToValidate="tboxCPMod" SetFocusOnError="true" Display="Dynamic"
                                        ErrorMessage="Deben ser 5 caracteres."
                                        ValidationExpression="^\d{5}$" ValidationGroup="AgregarEmpresa"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvCPMod" CssClass="campo-obligatorio" ControlToValidate="tboxCPMod" Display="Dynamic" SetFocusOnError="true" ValidationGroup="AgregarEmpresa"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footers">
                            <div class="row alineacion-vertical" >
                                <div class="col-6 col-sm-3 col-md-3 col-lg-2 offset-sm-6 offset-md-6 offset-lg-8"> 
                                    <asp:Button ID="btnCancelarMod" runat="server" Text="btnCancelarMod" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnCancelarMod_Click"/>                                                                                         
                                </div>
                                <div class="col-6 col-sm-3 col-md-3 col-lg-2"> 
                                    <asp:Button ID="btnAceptarMod" runat="server" Text="btnAceptarMod" cssclass="form-control fontsizeh6 btn-hover-general" OnClick="btnAceptarMod_Click" ValidationGroup="AgregarEmpresa"/>           
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
