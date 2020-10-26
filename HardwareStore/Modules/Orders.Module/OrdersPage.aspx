<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="HardwareStore.Modules.Orders.Module.OrdersPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="OdModal" id="odmodal" data-animation="slideInOutLeft">
            <div class="modal-dialog">
                <div class="modal-header">
                    <h4 style="color:#fff;">Existencias Productos</h4>
                    <button class="close-modal" aria-label="close modal" data-close>✕</button>
                </div>
                <div class="modal-content">
                    
                </div>
                <%--<footer class="modal-footer">
                    Footer of modal
                </footer>--%>
            </div>
        </div>
    <div style="border: 1px solid #ddd; background: #fff; margin-bottom: 10px; border-radius: 10px; max-width: 98.5%">
        <h1 style="text-align: center;">Módulo Pedidos / Compras</h1>
        <hr />
        <asp:MultiView ID="OrdersView" ActiveViewIndex="0" runat="server">
            <asp:View runat="server">
                <%-- Inicio formulario principal --%>
                <div class="ContainerPedidos" style="padding-left: 24px; padding-right: 24px;">
                    <div style="text-align: center">
                        <h2 class="titleVenta">Nuevo Pedido</h2>
                    </div>
                    <button type="button" class="open-modal" data-open="odmodal">
                        Launch Modal
                    </button>
                    <div style="display: flex; flex-wrap: wrap;">
                        <div style="width: 30%; margin: 5px">
                            <h6 style="margin-left: 10px">Bodegas</h6>
                            <div style="display: flex;">
                                <asp:DropDownList ID="ddlstWarehouses" CssClass="form-control" Width="100%" Height="40px" runat="server">
                                </asp:DropDownList>
                                <asp:Button CssClass="BtnAgregar" Height="30px" ID="BtnAddWarehouse" Text="+" runat="server" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 5px">
                            <h6 style="margin-left: 10px">N Pedido</h6>
                            <div style="display: flex">
                                <asp:TextBox placeholder="Número Factura" runat="server" ID="txtOrdNumber" class="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 5px">
                            <h6 style="margin-left: 10px">Precio</h6>
                            <div style="display: flex">
                                <asp:TextBox TextMode="Number" step="0.01" placeholder="Precio" runat="server" ID="TextBox1" class="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 5px">
                            <h6 style="margin-left: 10px">Producto</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" placeholder="Producto" runat="server" ID="txtProduct" class="form-control" />
                                <%--<a><i class="fas fa-plus-circle" style="margin: 10px; color: #00A350"></i></a>--%>
                                <asp:Button CssClass="BtnAgregar" Height="30px" ID="btnAddProduct" Text="+" runat="server" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 5px">
                            <h6 style="margin-left: 10px">Categoría</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" placeholder="Categoria" runat="server" ID="txtCategory" class="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 5px">
                            <h6 style="margin-left: 10px">Código</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" placeholder="Código producto" runat="server" ID="txtDefaultCode" CssClass="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 5px">
                            <h6 style="margin-left: 10px">Marca</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" placeholder="Marca" runat="server" ID="txtBrand" CssClass="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 5px">
                            <h6 style="margin-left: 10px">Dimensiones</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" placeholder="Dimensiones" runat="server" ID="txtDimensions" CssClass="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 5px">
                            <h6 style="margin-left: 10px">Unidad de medida</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" placeholder="Unidad de medida" runat="server" ID="txtMeasureUnit" CssClass="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 5px">
                            <h6 style="margin-left: 10px">Cantidad</h6>
                            <div style="display: flex">
                                <asp:TextBox placeholder="Cantidad" TextMode="Number" runat="server" ID="txtQuantity" CssClass="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 5px">
                            <h6 style="margin-left: 10px">Descuento</h6>
                            <div style="display: flex">
                                <asp:TextBox runat="server" placeholder="Descuento" TextMode="Number" ID="txtDetailDiscount" CssClass="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">SubTotal</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" placeholder="SubTotal" runat="server" ID="txtDetailSubTotal" CssClass="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">Total</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" placeholder="Total" runat="server" ID="txtDetailTotal" CssClass="form-control" />
                            </div>
                        </div>
                        <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                            <asp:Button runat="server" Text="Agregar" ID="btnAddToDetailList" CssClass="btnSuccess" Style="margin-left: 10px" />
                            <asp:Button runat="server" Text="Cancelar" ID="btnAbortAddToDetailList" CssClass="btnDanger" Style="margin-left: 10px" />
                        </div>
                    </div>
                </div>
                <%-- Fin Formulario principal --%>
                <%-- Tabla de productos --%>
                <div class="TableContainer">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Producto</th>
                                <th>Marca</th>
                                <th>Dimensiones</th>
                                <th>Unidad</th>
                                <th>Precio Compra</th>
                                <th>Cantidad</th>
                                <th>SubTotal</th>
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
                    <div style="display: flex; flex-wrap: wrap;">
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">IVA</h6>
                            <div style="display: flex">
                                <asp:TextBox TextMode="Number" step="0.01" runat="server" ID="txtTotalTax" placeholder="IVA" CssClass="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">Descuento</h6>
                            <div style="display: flex">
                                <asp:TextBox TextMode="Number" runat="server" ID="txtTotalDiscount" placeholder="Descuento" class="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">Sub Total</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" runat="server" ID="txtSubtotal" placeholder="Subtotal" class="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">Total</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" placeholder="Total" runat="server" ID="txtTotal" class="form-control" />
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
    <%--<script>
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
    </script>--%>
    <script src="../../Scripts/Modules/OrderModule.js"></script>
    <script src="../../Scripts/Modal/Modal.js"></script>
</asp:Content>
