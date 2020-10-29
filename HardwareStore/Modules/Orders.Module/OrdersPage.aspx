<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="HardwareStore.Modules.Orders.Module.OrdersPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Sección del modal --%>
    <div class="OdModal" id="odmodal" data-animation="slideInOutLeft">
        <div class="modal-dialog">
            <div class="modal-header">
                <h4 style="color: #fff;">Existencias Productos</h4>
                <%--<label runat="server" id="getidFromtable"></label>--%>
                <button class="close-modal" aria-label="close modal" data-close>✕</button>
            </div>
            <div class="modal-content">
                <%--<asp:UpdatePanel runat="server" ID="UpdatePanel1">--%>
                <%--<ContentTemplate>--%>
                <asp:TextBox runat="server" ID="txtSearchWarehouseProduct" placeholder="Buscar..." />
                <asp:Button runat="server" OnClick="btnSearchWarehouseProduct_Click" Text="Buscar" ID="btnSearchWarehouseProduct" />
                <asp:GridView runat="server" DataKeyNames="Fk_WarehouseID,Fk_ProductDetailID" AutoGenerateColumns="false"
                    ID="GridViewWarehouseProducts" OnRowCommand="GridViewWarehouseProducts_RowCommand">
                    <Columns>
                        <asp:BoundField HeaderText="ID Bodega" DataField="Fk_WarehouseID" />
                        <asp:BoundField HeaderText="ID Producto" DataField="Fk_ProductDetailID" />
                        <asp:BoundField HeaderText="Bodega" DataField="WarehouseName" />
                        <asp:BoundField HeaderText="Producto" DataField="ProductName" />
                        <asp:BoundField HeaderText="Proveedor" DataField="SupplierName" />
                        <asp:BoundField HeaderText="Marca" DataField="BrandName" />
                        <asp:BoundField HeaderText="Material" DataField="MaterialType" />
                        <asp:BoundField HeaderText="Unidad" DataField="MeasureUnit" />
                        <asp:BoundField HeaderText="Precio Compra" DataField="WhPr_PurchasePrice" />
                        <asp:BoundField HeaderText="Precio Venta" DataField="WhPr_SalePrice" />
                        <asp:BoundField HeaderText="Existencias" DataField="WhPr_Stock" />
                        <asp:BoundField HeaderText="Fecha Actualización" DataField="UpdatedAt" />
                        <asp:TemplateField HeaderText="Opciones">
                            <ItemTemplate>
                                <asp:LinkButton Font-Size="11px" Height="28px" Width="80px"
                                    CssClass="btn-primary" ID="LinkSelect" ToolTip="Seleccionar Producto"
                                    CommandName="cmdSelect" runat="server">Seleccionar</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <%--</ContentTemplate>--%>
                <%--</asp:UpdatePanel>--%>
            </div>
        </div>
    </div>
     <%-- Fin Sección del modal --%>
    <div style="border: 1px solid #ddd; background: #fff; margin-bottom: 10px; border-radius: 10px; max-width: 98.5%">
        <h1 style="text-align: center;">Módulo Pedidos / Compras</h1>
        <label runat="server" id="warehouseId"></label>
        <label runat="server" id="proddetailid"></label>
        <hr />
        <asp:MultiView ID="OrdersView" ActiveViewIndex="0" runat="server">
            <asp:View runat="server">
                <%-- Inicio formulario principal --%>
                <div class="ContainerPedidos" style="padding-left: 24px; padding-right: 24px;">
                    <div style="text-align: center">
                        <h2 class="titleVenta">Nuevo Pedido</h2>
                    </div>
                    <div><asp:Button style="text-align:right;" runat="server" ID="btnGoToListOrders" OnClick="btnGoToListOrders_Click" Text="Ver Pedidos" /></div>
                    <div style="display: flex; flex-wrap: wrap;">
                        <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Bodega" runat="server" ID="txtWarehouseId" class="form-control" />
                        <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Producto" runat="server" ID="txtProductId" class="form-control" />
                        <asp:TextBox Visible="false" placeholder="Bodega" runat="server" ID="txtWarehouseName" class="form-control" />
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
                                <asp:TextBox TextMode="Number" step="0.01" placeholder="Precio" runat="server" ID="txtPrice" class="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 5px">
                            <h6 style="margin-left: 10px">Producto</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" placeholder="Producto" runat="server" ID="txtProduct" class="form-control" />
                                <button type="button" class="btn-primary" data-open="odmodal">
                                    +
                                </button>
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
                            <h6 style="margin-left: 10px">Proveedor</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" placeholder="Proveedor" runat="server" ID="txtSupplier" CssClass="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 5px">
                            <h6 style="margin-left: 10px">Material</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" placeholder="Material" runat="server" ID="txtMaterialType" CssClass="form-control" />
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
                                <asp:TextBox ID="txtQuantity" placeholder="Cantidad" TextMode="Number" runat="server" CssClass="form-control" />
                                <%--<asp:RequiredFieldValidator runat="server" ID="reqQuantity" ValidationGroup="DetailsGroup" ControlToValidate="txtQuantity" ErrorMessage="Cantidad requerida"></asp:RequiredFieldValidator>--%>
                            </div>
                        </div>
                        <div style="width: 30%; margin: 5px">
                            <h6 style="margin-left: 10px">Descuento (%)</h6>
                            <div style="display: flex">
                                <asp:TextBox ID="txtDetailDiscount" runat="server" placeholder="Descuento (%)" TextMode="Number" CssClass="form-control" />
                                <%--<asp:RequiredFieldValidator runat="server" ID="reqDiscount" ValidationGroup="DetailsGroup" ControlToValidate="txtDetailDiscount" ErrorMessage="El descuento no debe ser nulo requerida, debe ser entre 0 y 100 "></asp:RequiredFieldValidator>--%>
                            </div>
                        </div>
                       <%-- <div style="width: 30%; margin: 10px">
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
                        </div>--%>
                        <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                            <asp:Button runat="server" Text="Agregar" OnClick="btnAddToDetailStageList_Click" ID="btnAddToDetailStageList" CssClass="btnSuccess" Style="margin-left: 10px" />
                            <asp:Button runat="server" Text="Cancelar" OnClick="btnAbortAddToDetailStageList_Click" ID="btnAbortAddToDetailStageList" CssClass="btnDanger" Style="margin-left: 10px" />
                        </div>
                    </div>
                </div>
                <%-- Fin Formulario principal --%>
                <%-- Tabla de productos --%>
                <h4 style="text-align: center;">Tabla Productos</h4>
                <hr />
                <asp:GridView runat="server" DataKeyNames="Fk_WarehouseID,Fk_ProductDetailID" AutoGenerateColumns="false"
                    ID="GridViewOrderDetailsStage" OnRowCommand="GridViewOrderDetailsStage_RowCommand">
                    <Columns>
                        <asp:BoundField HeaderText="ID Bodega" DataField="Fk_WarehouseID" Visible="false" />
                        <asp:BoundField HeaderText="ID Producto" DataField="Fk_ProductDetailID" Visible="false" />
                        <asp:BoundField HeaderText="Bodega" DataField="WarehouseName" />
                        <asp:BoundField HeaderText="Producto" DataField="ProductName" />
                        <asp:BoundField HeaderText="Proveedor" DataField="SupplierName" />
                        <asp:BoundField HeaderText="Marca" DataField="BrandName" />
                        <asp:BoundField HeaderText="Material" DataField="MaterialType" />
                        <asp:BoundField HeaderText="Unidad" DataField="MeasureUnit" />
                        <asp:BoundField HeaderText="Dimensiones" DataField="Dimensions" />
                        <asp:BoundField HeaderText="Código" DataField="DefaultCode" />
                        <asp:BoundField HeaderText="Precio Compra" DataField="PurchasePrice" />
                        <asp:BoundField HeaderText="Cantidad" DataField="Quantity" />
                        <asp:BoundField HeaderText="Subtotal" DataField="Subtotal" />
                        <asp:BoundField HeaderText="Descuento" DataField="Discount" />
                        <asp:BoundField HeaderText="Total" DataField="totalAmount" />
                        <asp:TemplateField HeaderText="Opciones">
                            <ItemTemplate>
                                <asp:LinkButton Font-Size="11px" Height="28px" Width="80px"
                                    CssClass="btn-primary" ID="EditLink" ToolTip="Editar Producto"
                                    CommandName="cmdEdit" runat="server">Editar</asp:LinkButton>
                                <asp:LinkButton Font-Size="11px" Height="28px" Width="80px"
                                    CssClass="btn-primary" ID="DeleteLink" ToolTip="Eliminar Producto"
                                    CommandName="cmdDelete" runat="server">Eliminar</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <%-- Fin de la tabla --%>
                <%-- Inicio del formulario del total a pagar --%>
                <div class="ContainerPedidos">
                    <div style="display: flex; flex-wrap: wrap;">
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">Sub Total</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" runat="server" ID="txtSubtotal" placeholder="Subtotal" CssClass="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">IVA</h6>
                            <div style="display: flex">
                                <asp:TextBox TextMode="Number" step="0.01" runat="server" ID="txtTotalTax" placeholder="IVA" CssClass="form-control" />
                            </div>
                        </div>
                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">Descuento</h6>
                            <div style="display: flex">
                                <asp:TextBox TextMode="Number" runat="server" ID="txtTotalDiscount" placeholder="Descuento" CssClass="form-control" />
                            </div>
                        </div>

                        <div style="width: 30%; margin: 10px">
                            <h6 style="margin-left: 10px">Total</h6>
                            <div style="display: flex">
                                <asp:TextBox ReadOnly="true" placeholder="Total" runat="server" ID="txtTotal" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                        <asp:Button runat="server" Text="Calcular" OnClick="btnRecalculateOrderTotal_Click" ID="btnRecalculateOrderTotal" CssClass="btnSuccess" Style="margin-left: 10px" />
                        <a href="#" class="btnSuccess" style="margin-left: 10px"><span>Registrar Perdido</span></a>
                        <a href="#" class="btnDanger" style="margin-left: 10px"><span>Cancelar Pedido</span></a>
                    </div>
                </div>
                <%-- Fin del formulario --%>
            </asp:View>
            <asp:View runat="server">
                <div><asp:Button style="text-align:right;" runat="server" ID="btnBackToCreateOrder" OnClick="btnBackToCreateOrder_Click" Text="Crear Pedido" /></div>
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
    <script src="../../Scripts/Modules/OrderModule.js"></script>
    <script src="../../Scripts/Modal/Modal.js"></script>
</asp:Content>
