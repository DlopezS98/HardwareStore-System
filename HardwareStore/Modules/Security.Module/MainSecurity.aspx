<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainSecurity.aspx.cs" Inherits="HardwareStore.Modules.Security.Module.MainSecurity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-left: 24px; padding-right: 24px;">
        <h1>Seguridad</h1>
        <asp:MultiView ID="MultiViewUsuarios" ActiveViewIndex="0" runat="server">
            <asp:View runat="server">

                <div class="Container_Seguridad">

                    <div class="row">
                        <div class="Button_Group">
                            <asp:Button ID="btnNewUser" OnClick="btnNewUser_Click" Text="Nuevo Usuario" runat="server" CssClass="btnSuccess" />
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
                </div>
            </asp:View>
            <asp:View runat="server">
                <div class="row">
                    <div style="text-align: center">
                        <h2>Crear Nuevo Usuario</h2>
                    </div>
                    <div style="padding: 20px;">
                        <div class="formSection">

                            <div class="col-46">
                                <h4>Código</h4>
                                <asp:TextBox ReadOnly="true" runat="server" placeholder="Codigo Usuario" CssClass="form-control" />
                            </div>
                            <div class="col-46">
                                <h4>Empleado</h4>
                                <asp:DropDownList runat="server" class="form-control">
                                    <asp:ListItem>Empleados</asp:ListItem>
                                    <asp:ListItem>Danny López</asp:ListItem>
                                    <asp:ListItem>Rubén Parrales</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-46">
                                <h4>Privilegio</h4>
                                <asp:DropDownList runat="server" class="form-control">
                                    <asp:ListItem>Seleccione el rol</asp:ListItem>
                                    <asp:ListItem>Administrador del sistema</asp:ListItem>
                                    <asp:ListItem>Administrador de ventas</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-46">
                                <h4>Contraseña</h4>
                                <asp:TextBox runat="server" placeholder="Contraseña" CssClass="form-control" />
                            </div>
                            <div class="col-46">
                                <h4>Foto</h4>
                                <input type="file" title="Seleccionar Imagen" class="form-control" />
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
