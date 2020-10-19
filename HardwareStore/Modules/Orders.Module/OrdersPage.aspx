﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="HardwareStore.Modules.Orders.Module.OrdersPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Módulo Pedidos / Compras</h1>
    <hr />

    <table id="tblOrders" class="table-bordered">
        <thead>
            <tr>
                <th>#ID</th>
                <th>Codigo Orden</th>
                <th>Usuario</th>
                <th>Proveedor</th>
                <th>Fecha</th>
                <th>Impuesto</th>
                <th>Subtotal</th>
                <th>Descuento</th>
                <th>Total</th>
                <th>Opciones</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script>
        (function () {
            var res;
            $.ajax({
                type: "GET",
                url: "OrdersPage.aspx/LoadData",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    mapData(response);
                },
                error: function (error) {
                    console.log(error);
                }
            });

            function mapData(response) {
                console.log(response);
                let Frag = document.createDocumentFragment();
                response.d.forEach((orders) => {
                    let tr = document.createElement("tr");
                    let tdPk = document.createElement("td");
                    tdPk.append(orders.Pk_OrderID);
                    let tdCode = document.createElement("td");
                    tdCode.append(orders.Ord_Number);
                    let tdUser = document.createElement("td");
                    tdUser.append(orders.UserName);
                    let tdSupplier = document.createElement("td");
                    tdSupplier.append(orders.SupplierName);
                    let tdDate = document.createElement("td");
                    tdDate.append(orders.newDate);
                    let tdTax = document.createElement("td");
                    tdTax.append(orders.Ord_Tax);
                    let tdSubtotal = document.createElement("td");
                    tdSubtotal.append(orders.Ord_Subtotal);
                    let tdDiscount = document.createElement("td");
                    tdDiscount.append(orders.Ord_Discount);
                    let tdTotal = document.createElement("td");
                    tdTotal.append(orders.Ord_Total);
                    //Options...
                    let tdOptions = document.createElement("td");
                    let btnDetails = document.createElement("input");
                    btnDetails.value = "Detalles";
                    btnDetails.type = "button";
                    let btnDelete = document.createElement("input");
                    btnDelete.value = "Eliminar";
                    btnDelete.type = "button";
                    tdOptions.append(btnDetails, btnDelete);

                    tr.append(tdPk, tdCode, tdUser, tdSupplier, tdDate, tdTax, tdSubtotal, tdDiscount, tdTotal, tdOptions);
                    Frag.append(tr);
                });
                let table = document.getElementById("tblOrders");
                table.querySelector("tbody").append(Frag);
            }
        })();
    </script>
</asp:Content>
