<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="HardwareStore.Modules.Catalogs.Module.Employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/cssCatalogs.css" rel="stylesheet" />

    <asp:MultiView ID="mtvContenedor" runat="server" ActiveViewIndex="0">
        <asp:View ID="vVista0" runat="server">
            <div class="containerCatalog mt-5">
                <div class="form-principal-employees p-3">
                    <div style="float: right;">
                        <asp:Button CssClass="btn btn-primary mt-2 mr-2" runat="server" OnClick="BtnEmpTodos_Click" Text="Ver Todos" ID="BtnEmpTodos" />
                    </div>
                    <div style="text-align: center; margin: 10px;">
                        <h2>Nuevo Empleado</h2>
                    </div>
                    <div class="form-row mt-5">
                        <div class="col-md-4">
                            <h5 style="float: left; margin-left: 5px;">Nombre</h5>
                            <input runat="server" type="text" name="Type" id="Text2" class="form-control" />
                        </div>
                        <div class="col-md-4">
                            <h5 style="float: left; margin-left: 5px;">Apellido</h5>
                            <input runat="server" type="text" name="Type" id="Text1" class="form-control" />
                        </div>
                        <div class="col-md-4">
                            <h5 style="float: left; margin-left: 5px;">Dirección</h5>
                            <input runat="server" type="text" name="Type" id="Text3" class="form-control" />
                        </div>
                        <div class="col-md-4">
                            <h5 style="float: left; margin-left: 5px;">Teléfono</h5>
                            <input runat="server" type="text" name="Type" id="Text4" class="form-control" />
                        </div>
                        <div class="col-md-4">
                            <h5 style="float: left; margin-left: 5px;">DNI</h5>
                            <input runat="server" type="text" name="Type" id="Text5" class="form-control" />
                        </div>

                        <div class="col-md-4">
                            <h5 style="float: left; margin-left: 5px;">Correo</h5>
                            <input runat="server" type="text" name="Type" id="Text6" class="form-control" />
                        </div>
                        <div class="col-md-4">
                            <h5 style="float: left; margin-left: 5px;">Correo</h5>
                            <div style="width: 100%">
                                <asp:DropDownList CssClass="form-control" runat="server">
                                    <asp:ListItem Text="Seleccionar--" />
                                    <asp:ListItem Text="..." />
                                    <asp:ListItem Text="..." />
                                </asp:DropDownList>

                            </div>
                        </div>
                        <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                            <asp:Button ID="btnCancelar" OnClick="btnCancelar_Click" Text="Cancelar" runat="server" CssClass="btn btn-danger" />
                            <asp:Button Text="Guardar" runat="server" CssClass="btn btn-success" />
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
        </asp:View>
        <%-- Vista 2 --%>
        <asp:View ID="vView1" runat="server">
            <div class="mt-4 p-3">
                <div style="text-align: center">
                    <h4>Catálogo Empleado</h4>
                </div>
                <div class="form-row mt-5">
                    <div class="col-md-4">
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtSearch" placeholder="Buscar..." />
                    </div>
                    <div class="col-md-4 pl-3" style="margin-top: 0px">
                        <asp:Button CssClass="btn btn-primary" runat="server" Text="Buscar" ID="btnSearch" />
                    </div>
                </div>
                <%-- Tabla --%>
                <div class="TableContainer">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Teléfono</th>
                                <th>Dirección</th>
                                <th>Cédula</th>
                                <th>Correo</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td data-label="ID">1</td>
                                <td data-label="Nombre">Sin datos</td>
                                <td data-label="Descripción">Sin datos</td>
                                <td data-label="Estado">Sin datos</td>
                                <td data-label="Estado">Sin datos</td>
                                <td data-label="Estado">Sin datos</td>
                                <td data-label="Estado">Sin datos</td>
                                <td data-label="Estado">Sin datos</td>
                                <td data-label="Acciones">
                                    <a href="#"><i class="far fa-edit"></i></a>
                                    <a href="#"><i class="fas fa-trash"></i></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
