<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TransfersHistory.aspx.cs" Inherits="HardwareStore.Modules.ProductsAdmin.Module.TransfersHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
        <ContentTemplate>
            <h1 style="color: #1F2126; text-align: center;">Historial de Transferencias</h1>
            <div style="display: flex; flex-direction: row;">
                <div style="display: flex; margin-left: 10px; width: 40%">
                    <asp:TextBox placeholder="Buscar" runat="server" ID="txtOrdNumber" class="form-control" />
                    <asp:Button class="btnPrimary" type="button" runat="server" Text="Buscar" />
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
                                    <asp:Button ID="btnMove" Text="info" runat="server" CssClass="btnSuccess" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
