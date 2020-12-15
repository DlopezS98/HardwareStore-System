<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductosB.aspx.cs" Inherits="HardwareStore.Modules.ProductsAdmin.Module.ProductosB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:MultiView ID="SalesView" ActiveViewIndex="0" runat="server">
        <asp:View runat="server">
            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                <ContentTemplate>
                    <h1 style="color: #1F2126; text-align: center;">Existencias en Bodega</h1>
                    <div style="display: flex; flex-direction: row;">
                        <div style="display: flex; margin-left: 10px; width: 40%">
                            <asp:TextBox placeholder="Buscar" runat="server" ID="txtOrdNumber" class="form-control" />
                            <asp:Button class="btnPrimary" type="button" runat="server" Text="Buscar" />
                        </div>
                        <div style="width: 30%; margin-left: 28%;">
                            <div style="margin-right: 15px; width: 100%">
                                <asp:DropDownList CssClass="form-control" Width="100%" Height="50px" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>

                    </div>
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-lg-12">
                            <table class="table">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Nombre completo</th>
                                        <th scope="col">Rol</th>
                                        <th scope="col">Nombre de Usuario</th>
                                        <th scope="col">Estado</th>
                                        <th scope="col">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Danny López</td>
                                        <td>Root</td>
                                        <td>DlopezS98</td>
                                        <td>Activo</td>
                                        <td>
                                            <asp:Button Text="Editar" runat="server" CssClass="btn btn-primary" />
                                            <asp:Button Text="Eliminar" runat="server" CssClass="btn btn-danger" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Carlos Aguirre</td>
                                        <td>Administrador de Ventas</td>
                                        <td>CarlosAP</td>
                                        <td>Activo</td>
                                        <td>
                                            <asp:Button Text="Editar" runat="server" CssClass="btn btn-primary" />
                                            <asp:Button Text="Eliminar" runat="server" CssClass="btn btn-danger" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                <ContentTemplate>
                </ContentTemplate>
            </asp:UpdatePanel>

            <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                <ContentTemplate>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
