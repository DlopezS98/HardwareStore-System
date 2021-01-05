<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Brands.aspx.cs" Inherits="HardwareStore.Modules.Brands" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/cssCatalogs.css" rel="stylesheet" />

    <div class="container-all">
        <asp:MultiView ID="mtvContenedor" runat="server" ActiveViewIndex="0">
            <asp:View ID="vVista0" runat="server">
                <div class="containerCatalog mt-5">
                    <div class="form-principal">
                        <div class="mt-2 mr-2" style="float: right">
                            <asp:Button ID="BtnMarTodos" OnClick="BtnMarTodos_Click" Text="Ver Todos" runat="server" CssClass="btn btn-primary" />
                        </div>
                        <div style="text-align: center; margin: 10px;">
                            <h2>Nueva Marca</h2>
                        </div>
                        <div class="form-row p-3 mt-5">
                            <div class="col-md-12">
                                <h5 style="float: left; margin-left: 5px;">Nombre</h5>
                                <input runat="server" type="text" name="Type" id="Text2" class="form-control" />
                            </div>
                            <div class="col-md-12">
                                <h5 style="float: left; margin-left: 5px;">Decripción</h5>
                                <input runat="server" type="text" name="Type" id="Text1" class="form-control" />
                            </div>
                        </div>
                        <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                            <asp:Button ID="btnCancelar" OnClick="btnCancelar_Click" Text="Cancelar" runat="server" CssClass="btn btn-danger" />
                            <asp:Button Text="Guardar" runat="server" CssClass="btn btn-success" />
                        </div>
                    </div>
                </div>
            </asp:View>
            <%-- Vista 2 --%>
            <asp:View ID="vVista1" runat="server">
                <div class="mt-4">
                    <div style="text-align: center">
                        <h4>Catálogo Marcas</h4>
                    </div>
                    <div class="form-row mt-5">
                        <div class="col-md-6">
                            <asp:TextBox CssClass="form-control" runat="server" ID="txtSearch" placeholder="Buscar..." />
                        </div>
                        <div class="col-md-6 pl-3" style="margin-top: 10px">
                            <asp:Button CssClass="btn btn-primary" runat="server" Text="Buscar" ID="btnSearch" />
                        </div>
                    </div>
                    <%-- Tabla --%>
                    <div class="TableContainer">
                        <asp:GridView runat="server" DataKeyNames="Id" AutoGenerateColumns="false"
                                ID="GridViewBrands" CssClass="headerTable" CellPadding="5">
                                <Columns>
                                    <asp:BoundField HeaderText="ID Marca" DataField="Id" Visible="false" />
                                    <asp:BoundField HeaderText="Código" DataField="Code" />
                                    <asp:BoundField HeaderText="Marca" DataField="Name" />
                                    <asp:BoundField HeaderText="Descripción" DataField="Description" />
                                    <asp:BoundField HeaderText="Creación" DataField="CreatedAt" />
                                    <asp:BoundField HeaderText="Actualización" DataField="UpdatedAt" />
                                    
                                    <asp:TemplateField HeaderText="Opciones">
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Size="11px" Height="28px" Width="80px"
                                                CssClass="LinkbtnPrimary" ID="LinkSelect" ToolTip="Editar Marca"
                                                CommandName="cmdSelect" runat="server">Editar</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
