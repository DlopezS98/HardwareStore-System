<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="HardwareStore.Modules.Orders.Module.OrdersPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="border: 1px solid #ddd; background: #fff; margin-bottom: 10px; border-radius: 10px; max-width: 98.5%">
        <h1>Módulo Pedidos / Compras</h1>
        <hr />
        <asp:MultiView ID="OrdersView" ActiveViewIndex="0" runat="server">
            <asp:View runat="server">
                <%-- Inicio formulario principal --%>
                <div class="ContainerPedidos">
                    <div style="text-align: center">
                        <h2 class="titleVenta">Nuevo Pedido</h2>
                    </div>
                    <div style="display: flex; flex-wrap: wrap;">
                        <div style="width: 48%; margin: 5px">
                            <h6 style="margin-left: 10px">Bodegas</h6>
                            <div style="display: flex">
                                <asp:DropDownList ID="ddlstWarehouses" CssClass="form-control" Width="100%" Height="40px" runat="server">
                                </asp:DropDownList>                                
                            </div>
                            <asp:Button CssClass="BtnAgregar" Height="30px" ID="BtnAgregarPro" Text="+" runat="server" />
                        </div>
                        <div style="width: 45%; margin: 5px">
                            <h6 style="margin-left: 10px">Categoría</h6>
                            <div style="display: flex">
                                <input runat="server" type="text" name="Type" id="txtCategory" class="form-control" />
                            </div>
                        </div>
                        <div style="width: 48%; margin: 5px">
                            <h6 style="margin-left: 10px">N Pedido</h6>
                            <div style="display: flex">
                                <input runat="server" type="text" name="Type" id="txtOrdNumber" class="form-control" />
                            </div>
                        </div>
                        <div style="width: 45%; margin: 52px">
                            <h6 style="margin-left: 10px">Producto</h6>
                            <div style="display: flex">
                                <input runat="server" type="text" name="Type" id="txtProduct" class="form-control" />
                                <a href="#"><i class="fas fa-plus-circle" style="margin: 10px; color: #00A350"></i></a>
                            </div>
                        </div>
                        <div style="width: 45%; margin: 5px">
                            <h6 style="margin-left: 10px">Marca</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" runat="server" name="Type" ID="txtBrand" CssClass="form-control" />
                            </div>
                        </div>
                        <div style="width: 45%; margin: 5px">
                            <h6 style="margin-left: 10px">Descuento</h6>
                            <div style="display: flex">
                                <asp:TextBox runat="server" TextMode="Number" ID="txtDiscount" CssClass="form-control" />
                            </div>
                        </div>
                        <div style="width: 20%; margin: 10px">
                            <h6 style="margin-left: 10px">Total</h6>
                            <div style="display: flex">
                                <input runat="server" type="text" name="Type" id="Text4" class="form-control" />
                            </div>
                        </div>
                        </div>
                </div>
                <%-- Fin Formulario principal --%>
                <%-- Tabla de productos --%>
                <div class="TableContainer">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Precio Venta</th>
                                <th>SubTotal</th>
                                <th>IVA</th>
                                <th>Descuento</th>
                                <th>Total</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td data-label="ID">POL01</td>
                                <td data-label="Nombre">Sin datos</td>
                                <td data-label="Categoría">Sin datos</td>
                                <td data-label="Descripción">Sin datos</td>
                                <td data-label="Marca">Sin datos</td>
                                <td data-label="Proveedor">Sin datos</td>
                                <td data-label="Medida">Sin datos</td>
                                <td data-label="Dimensiones">Sin datos</td>
                                <td data-label="Acciones">
                                    <a href="#"><i class="fas fa-trash"></i></a>
                                </td>
                            </tr>

                            <tr>
                                <td data-label="ID">POL01</td>
                                <td data-label="Nombre">Sin datos</td>
                                <td data-label="Categoría">Sin datos</td>
                                <td data-label="Descripción">Sin datos</td>
                                <td data-label="Marca">Sin datos</td>
                                <td data-label="Proveedor">Sin datos</td>
                                <td data-label="Medida">Sin datos</td>
                                <td data-label="Dimensiones">Sin datos</td>
                                <td data-label="Acciones">
                                    <a href="#"><i class="fas fa-trash"></i></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <%-- Fin de la tabla --%>
                <%-- Inicio del formulario del total a pagar --%>
                <div class="ContainerPedidos">
                    <div style="display: flex">
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">Cantidad</h6>
                            <div style="display: flex">
                                <input runat="server" type="text" name="Type" id="Text6" class="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">Precio de Compra</h6>
                            <div style="display: flex">
                                <input runat="server" type="text" name="Type" id="Text7" class="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">Detalle de Impuestos</h6>
                            <div style="display: flex">
                                <input runat="server" type="text" name="Type" id="Text8" class="form-control" />
                            </div>
                        </div>
                    </div>
                    <div style="display: flex">
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">Sub Total</h6>
                            <div style="display: flex">
                                <input runat="server" type="text" name="Type" id="Text9" class="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">Descuento</h6>
                            <div style="display: flex">
                                <input runat="server" type="text" name="Type" id="Text10" class="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">Total</h6>
                            <div style="display: flex">
                                <input runat="server" type="text" name="Type" id="Text11" class="form-control" />
                            </div>
                        </div>

                    </div>
                    <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                        <a href="#" class="btnSuccess" style="margin-left: 10px"><span>Guardar</span></a>
                        <a href="#" class="btnDanger" style="margin-left: 10px"><span>Cancelar</span></a>
                    </div>
                </div>
                <%-- Fin del formulario --%>
            </asp:View>
            <asp:View runat="server">
                <table id="tblOrders" class="table">
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
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script>
        (function () {
            $.ajax({
                type: "POST",
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

            $.ajax({
                type: "POST",
                url: "OrdersPage.aspx/GetWarehouseProducts",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response);
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
