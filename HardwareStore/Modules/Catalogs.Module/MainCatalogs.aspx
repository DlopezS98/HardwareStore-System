<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainCatalogs.aspx.cs" Inherits="HardwareStore.Modules.Catalogs.Module.MainCatalogs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="row">
      <div class="column">
        <div class="card">
            <h3>Productos</h3>
            <p>(50 items)</p>
            <a href="Products.aspx" class="btninfoborder">Administrar</a>
        </div>
      </div>
      <div class="column">
        <div class="card">
            <h3>Categorías</h3>
            <p>(50 items)</p>
            <a href="Categories.aspx" class="btninfoborder">Administrar</a>
        </div>
      </div>
      <div class="column">
        <div class="card">
            <h3>Empleados</h3>
            <p>(50 items)</p>
            <a href="Employees.aspx" class="btninfoborder">Administrar</a>
        </div>
      </div>
      <div class="column">
        <div class="card">
            <h3>Marcas</h3>
            <p>(50 items)</p>
            <a href="Brands.aspx" class="btninfoborder">Administrar</a>
        </div>
      </div>
       <div class="column">
        <div class="card">
            <h3>U. Medidas</h3>
            <p>(50 items)</p>
            <a href="UnitsOfMeasurement.aspx" class="btninfoborder">Administrar</a>
        </div>
      </div>
       <div class="column">
        <div class="card">
            <h3>Bodegas</h3>
            <p>(50 items)</p>
            <a href="Warehauses.aspx" class="btninfoborder">Administrar</a>
        </div>
      </div>
       <div class="column">
        <div class="card">
            <h3>Clientes</h3>
            <p>(50 items)</p>
            <a href="Customers.aspx" class="btninfoborder">Administrar</a>
        </div>
      </div>
       <div class="column">
        <div class="card">
            <h3>Proveedores</h3>
            <p>(50 items)</p>
            <a href="Suppliers.aspx" class="btninfoborder">Administrar</a>
        </div>
      </div>
       <div class="column">
        <div class="card">
            <h3>Roles</h3>
            <p>(50 items)</p>
            <a href="Privilegies.aspx" class="btninfoborder">Administrar</a>
        </div>
      </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
