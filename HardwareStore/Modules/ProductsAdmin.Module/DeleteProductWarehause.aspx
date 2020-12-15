<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteProductWarehause.aspx.cs" Inherits="HardwareStore.Modules.ProductsAdmin.Module.DeleteProductWarehause" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/cssConfiguration.css" rel="stylesheet" />
    <asp:MultiView ID="DPWView" ActiveViewIndex="0" runat="server">
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
                                            <asp:Button ID="btnConfirmationDelete" OnClick="btnConfirmationDelete_Click" Text="Eliminar" runat="server" CssClass="btnDanger" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:View>

        <asp:View runat="server">
            <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                <ContentTemplate>
                    <div class="form-principal">
                        <div style="display: flex; flex-wrap: wrap;">
                            <div class="col-70">
                                <h6 style="margin-left: 10px">Título del Informe</h6>
                                <div style="display: flex; margin-left: 10px">
                                    <asp:TextBox placeholder="Número Factura" runat="server" ID="TextBox1" class="form-control" />
                                </div>
                            </div>
                            <div class="col-25">
                                <h6 style="margin-left: 10px">Cantidad a Restar</h6>
                                <div style="display: flex; margin-left: 10px">
                                    <asp:TextBox TextMode="Number" placeholder="Número Factura" runat="server" ID="TextBox3" class="form-control" />
                                </div>
                            </div>
                            <div class="col-95">
                                <h6 style="margin-left: 10px">Descripción</h6>
                                <div style="display: flex; margin-left: 10px">
                                    <asp:TextBox placeholder="Número Factura" runat="server" ID="TextBox2" class="form-control" />
                                </div>
                            </div>
                            <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                                <asp:Button runat="server" Text="Confirmar" CssClass="btnSuccess" Style="margin-left: 10px" />
                                <asp:Button runat="server" Text="Cancelar" CssClass="btnDanger" Style="margin-left: 10px" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
