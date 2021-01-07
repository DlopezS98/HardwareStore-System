<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainSecurity.aspx.cs" Inherits="HardwareStore.Modules.Security.Module.MainSecurity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Modal Alert --%>
    <div style="margin-top: 120px" class="modal fade" id="ModalAlert" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-dark">
                    <h5 class="modal-title text-light" id="exampleModalLabel">Advertencia!</h5>
                    <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                        <span class="text-light" aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Estás seguro que quieres eliminar el usuario?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnDelete" Text="Confirmar" runat="server" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
    </div>

    <%-- Fin Modal Alert --%>
    <div style="padding-left: 24px; padding-right: 24px;">
        <asp:MultiView ID="MultiViewUsuarios" ActiveViewIndex="0" runat="server">
            <asp:View runat="server">
                <asp:UpdatePanel runat="server" ID="UpdatePanel">
                    <ContentTemplate>
                        <div class="Container_Seguridad">
                            <div class="row">
                                <div class="Button_Group">
                                    <asp:Button ID="btnNewUser" OnClick="btnNewUser_Click" Text="Nuevo Usuario" runat="server" CssClass="btn btn-success" />
                                </div>
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
                                                <th scope="row">2</th>
                                                <td>Carlos Aguirre</td>
                                                <td>Administrador de Ventas</td>
                                                <td>CarlosAP</td>
                                                <td>Activo</td>
                                                <td>
                                                    <asp:Button Text="Editar" runat="server" CssClass="btn btn-primary" />
                                                    <button data-toggle="modal" data-target="#ModalAlert" class="btn btn-danger">Eliminar</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnNewUser" />
                        <%--<asp:PostBackTrigger ControlID="btnCreateOrder" />--%>
                    </Triggers>
                </asp:UpdatePanel>
            </asp:View>
            <asp:View runat="server">
                <div class="row d-flex justify-content-center">
                    <div style="text-align: center">
                        <h2 class="mt-2">Crear Nuevo Usuario</h2>
                    </div>
                    <div style="padding: 20px;">
                        <div class="formSection form-row">
                            <asp:TextBox Visible="false" ReadOnly="true" runat="server" placeholder="Codigo Usuario" CssClass="form-control" />
                            <div class="col-md-6">
                                <h4>Empleado</h4>
                                <asp:DropDownList runat="server" class="form-control">
                                    <asp:ListItem>Empleados</asp:ListItem>
                                    <asp:ListItem>Danny López</asp:ListItem>
                                    <asp:ListItem>Rubén Parrales</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <h4>Privilegio</h4>
                                <asp:DropDownList runat="server" class="form-control">
                                    <asp:ListItem>Seleccione el rol</asp:ListItem>
                                    <asp:ListItem>Administrador del sistema</asp:ListItem>
                                    <asp:ListItem>Administrador de ventas</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <h4>Contraseña</h4>
                                <asp:TextBox runat="server" placeholder="Contraseña" CssClass="form-control" />
                            </div>
                            <div class="col-md-6">
                                <h4>Foto</h4>
                                <input type="file" title="Seleccionar Imagen" class="form-control" />
                            </div>
                            <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                                <asp:Button runat="server" Text="Agregar" CssClass="btn btn-success" Style="margin-left: 10px" />
                                <asp:Button runat="server" Text="Cancelar" CssClass="btn btn-danger" Style="margin-left: 10px" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
