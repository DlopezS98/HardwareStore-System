<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainCatalogs.aspx.cs" Inherits="HardwareStore.Modules.Catalogs.Module.MainCatalogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center; margin: 10px;">
        <h2>Administrador de Catálogos</h2>
    </div>
    <div class="rowcard">
        <div class="column">
            <div class="card">
                <h3>Productos</h3>
                <p>(50 items)</p>
                <div style="align-items: center">
                    <asp:Image Height="50px" Width="50px" ImageUrl="~/Images/product.png" runat="server" />
                </div>
                <div style="margin-top: 10px">
                    <a href="Products.aspx" class="btn btn-outline-primary">Administrar</a>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="card">
                <h3>Categorías</h3>
                <p>(50 items)</p>
                <div style="align-items: center">
                    <asp:Image Height="50px" Width="50px" ImageUrl="~/Images/Categorias.png" runat="server" />
                </div>
                <div style="margin-top: 10px">
                    <a href="Categories.aspx" class="btn btn-outline-primary">Administrar</a>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="card">
                <h3>Empleados</h3>
                <p>(50 items)</p>
                <div style="align-items: center">
                    <asp:Image Height="50px" Width="50px" ImageUrl="~/Images/Empleados.png" runat="server" />
                </div>
                <div style="margin-top: 10px">
                    <a href="Employees.aspx" class="btn btn-outline-primary">Administrar</a>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="card">
                <h3>Marcas</h3>
                <p>(50 items)</p>
                <div style="align-items: center">
                    <asp:Image Height="50px" Width="50px" ImageUrl="~/Images/Marcas.png" runat="server" />
                </div>
                <div style="margin-top: 10px">
                    <a href="Brands.aspx" class="btn btn-outline-primary">Administrar</a>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="card">
                <h3>U. Medidas</h3>
                <p>(50 items)</p>
                <div style="align-items: center">
                    <asp:Image Height="50px" Width="50px" ImageUrl="~/Images/UMedidas.png" runat="server" />
                </div>
                <div style="margin-top: 10px">
                    <a href="UnitsOfMeasurement.aspx" class="btn btn-outline-primary">Administrar</a>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="card">
                <h3>Bodegas</h3>
                <p>(50 items)</p>
                <div style="align-items: center">
                    <asp:Image Height="50px" Width="50px" ImageUrl="~/Images/Bodegas.png" runat="server" />
                </div>
                <div style="margin-top: 10px">
                    <a href="Warehauses.aspx" class="btn btn-outline-primary">Administrar</a>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="card">
                <h3>Clientes</h3>
                <p>(50 items)</p>
                <div style="align-items: center">
                    <asp:Image Height="50px" Width="50px" ImageUrl="~/Images/CatClientes.png" runat="server" />
                </div>
                <div style="margin-top: 10px">
                    <a href="Customers.aspx" class="btn btn-outline-primary">Administrar</a>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="card">
                <h3>Proveedores</h3>
                <p>(50 items)</p>
                <div style="align-items: center">
                    <asp:Image Height="50px" Width="50px" ImageUrl="~/Images/Proveedores.png" runat="server" />
                </div>
                <div style="margin-top: 10px">
                    <a href="Suppliers.aspx" class="btn btn-outline-primary">Administrar</a>
                </div>
            </div>
        </div>
        <div class="column">
            <div class="card">
                <h3>Roles</h3>
                <p>(50 items)</p>
                <div style="align-items: center">
                    <asp:Image Height="50px" Width="50px" ImageUrl="~/Images/Roles.png" runat="server" />
                </div>
                <div style="margin-top: 10px">
                    <a href="Privilegies.aspx" class="btn btn-outline-primary">Administrar</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
