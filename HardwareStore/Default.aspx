<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HardwareStore._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="text-align: center">
        <h1 class="Title1">Bienvenido!</h1>
        <h4 class="Title2">¿Qué quieres hacer?</h4>
    </div>
    <div style="margin-left: 20%; margin-top: 2%">
        <div class="rowcard">
            <div class="column">
                <div class="card">
                    <h3 style="color: #4F4C54">Hacer una Venta</h3>
                    <asp:Image Height="150px" Width="150px" ImageUrl="~/Images/clientes.png" runat="server" />
                    <div style="margin-top: 15px">
                        <a href="/Modules/Sales.Module/MainSales.aspx" class="btninfoborder">Vamos</a>
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="card">
                    <h3 style="color: #4F4C54">Reporte</h3>
                    <asp:Image Height="150px" Width="150px" ImageUrl="~/Images/lista-tareas.png" runat="server" />
                    <div style="margin-top: 15px">
                        <a href="/Modules/Reports.Module/MainReports.aspx" class="btninfoborder">Vamos</a>
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="card">
                    <h3 style="color: #4F4C54">Nueva Compra</h3>
                    <asp:Image Height="150px" Width="150px" ImageUrl="~/Images/mensajero-trabajando.png" runat="server" />
                    <div style="margin-top: 15px">
                        <a href="/Modules/Orders.Module/OrdersPage.aspx" class="btninfoborder">Vamos</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
