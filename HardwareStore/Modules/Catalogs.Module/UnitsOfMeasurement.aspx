<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UnitsOfMeasurement.aspx.cs" Inherits="HardwareStore.Modules.Catalogs.Module.UnitsOfMeasurement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="../../Styles/cssCatalogs.css" rel="stylesheet" />
    <asp:MultiView ID="mtvContenedor" runat="server" ActiveViewIndex="0">
        <asp:View ID="vVista0" runat="server">
            <div class="containerCatalog mt-5">
                <div class="form-principal p-3">
                    <div class="mt-2 mr-2" style="float: right">
                        <asp:Button ID="BtnUnitTodos" OnClick="BtnUnitTodos_Click" Text="Ver Todos" runat="server" CssClass="btn btn-primary" />
                    </div>
                    <div style="text-align: center; margin: 10px;">
                        <h2>Nueva Unidad de Medida</h2>
                    </div>
                    <div class="form-row mt-5">
                        <div class="col-md-6">
                            <h5 style="float: left; margin-left: 5px;">Nombre</h5>
                            <input runat="server" type="text" name="Type" id="Text2" class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <h5 style="float: left; margin-left: 5px;">Abreviación</h5>
                            <input runat="server" type="text" name="Type" id="Text3" class="form-control" />
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
        <asp:View ID="vVista1" runat="server">
            <div class="mt-4">
                <div style="text-align: center">
                    <h4>Catálogo Unidades de Medidas</h4>
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
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tipo</th>
                                <th>Abreviación</th>
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
