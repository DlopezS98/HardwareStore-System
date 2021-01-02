<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="HardwareStore.Modules.Orders.Module.OrdersPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--    <link href="../../Styles/Toast.css" rel="stylesheet" />--%>
    <br />
    <ul class="nav">
        <li class="nav-item ml-1">
            <asp:LinkButton CssClass="nav-link btn btn-outline-primary" Text="Nueva Compra" runat="server" ID="btnBackToCreateOrder" OnClick="btnBackToCreateOrder_Click" />
        </li>
        <li class="nav-item ml-1">
            <asp:LinkButton CssClass="nav-link btn btn-outline-primary" Text="Detalle de Compra" runat="server" ID="btnTblProducts" OnClick="btnTblProducts_Click" />
        </li>
        <li class="nav-item ml-1">
            <asp:LinkButton CssClass="nav-link btn btn-outline-primary" Text="Historial de Compras" runat="server" ID="btnGoToListOrders" OnClick="btnGoToListOrders_Click" />
        </li>
    </ul>

    <div style="height: 200px; left: 70%; bottom: 60%" class="position-absolute">
        <div id="toast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <svg class="bd-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice">
                </svg>
                <ul class="mt-3">
                    <li><a><i style="width: 100%; height: 100%;" class="fas fa-info mr-4 text-danger"></i></a></li>
                </ul>
                <strong class="mr-auto">Mensaje</strong>
                <small>Justo ahora</small>
                <%--            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">×</span>
            </button>--%>
            </div>
            <div class="toast-body">
                El producto ya está en la lista temporal ¿Quieres Editar la cantidad?
            </div>
        </div>
    </div>

    <div style="height: 200px; left: 70%; bottom: 60%" class="position-absolute">
        <div id="toastOrdSuccess" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <svg class="bd-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice">
                </svg>
                <ul class="mt-3">
                    <li><a><i style="width: 100%; height: 100%;" class="fas fa-info mr-4 text-danger"></i></a></li>
                </ul>
                <strong class="mr-auto">Mensaje</strong>
                <small>Justo ahora</small>
                <%--            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">×</span>
            </button>--%>
            </div>
            <div class="toast-body">
                Orden Registrada con éxito!
            </div>
        </div>
    </div>

    <div style="height: 200px; left: 70%; bottom: 60%" class="position-absolute">
        <div id="toastDate" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <svg class="bd-placeholder-img rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice">
                </svg>
                <ul class="mt-3">
                    <li><a><i style="width: 100%; height: 100%;" class="fas fa-info mr-4 text-danger"></i></a></li>
                </ul>
                <strong class="mr-auto">Mensaje</strong>
                <small>Justo ahora</small>
                <%--            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">×</span>
            </button>--%>
            </div>
            <div class="toast-body">
                La fecha incio no debe<br />
                ser mayor a la fecha final!
            </div>
        </div>
    </div>
    <%--Fin del Header--%>
    <%-- Sección del modal --%>
    <div class="modal fade" id="ventanaModal" tabindex="-1" role="dialog" aria-labelledby="tituloVentana" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>Existencias Productos</h4>
                    <%--<label runat="server" id="getidFromtable"></label>--%>
                    <button class="close" data-dismiss="modal" aria-label="cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <ContentTemplate>
                            <div class="form-row">
                                <div class="col-md-4 mt-3">
                                    <input class="form-control" runat="server" id="txtSearchWarehouseProduct" placeholder="Buscar..." />
                                </div>
                                <div class="col-md-4 mt-3 pl-3">
                                    <asp:Button CssClass="btn btn-primary" runat="server" OnClick="btnSearchWarehouseProduct_Click" Text="Buscar" ID="btnSearchWarehouseProduct" />
                                </div>
                                <div class="col-md-4">
                                    <h6 style="margin-left: 10px">Bodegas</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <asp:DropDownList AutoPostBack="true" ID="ddlistFilterByWarehouse" OnSelectedIndexChanged="ddlistFilterByWarehouse_SelectedIndexChanged" CssClass="form-control" Width="100%" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <asp:GridView runat="server" DataKeyNames="Fk_WarehouseID,Fk_ProductDetailID,Fk_SupplierID" AutoGenerateColumns="false"
                                ID="GridViewWarehouseProducts" OnRowCommand="GridViewWarehouseProducts_RowCommand" CssClass="headerTable" CellPadding="5">
                                <Columns>
                                    <asp:BoundField HeaderText="ID Bodega" DataField="Fk_WarehouseID" Visible="false" />
                                    <asp:BoundField HeaderText="ID Producto" DataField="Fk_ProductDetailID" Visible="false" />
                                    <asp:BoundField HeaderText="ID proveedor" DataField="Fk_SupplierID" Visible="false" />
                                    <asp:BoundField HeaderText="Bodega" DataField="WarehouseName" />
                                    <asp:BoundField HeaderText="Producto" DataField="ProductName" />
                                    <asp:BoundField HeaderText="Proveedor" DataField="SupplierName" />
                                    <asp:BoundField HeaderText="Marca" DataField="BrandName" />
                                    <asp:BoundField HeaderText="Material" DataField="MaterialType" />
                                    <asp:BoundField HeaderText="Dimensiones" DataField="Dimensions" />
                                    <asp:BoundField HeaderText="Código" DataField="DefaultCode" />
                                    <asp:BoundField HeaderText="Unidad" DataField="MeasureUnit" />
                                    <asp:BoundField HeaderText="Precio Compra" DataField="WhPr_PurchasePrice" />
                                    <asp:BoundField HeaderText="Precio Venta" DataField="WhPr_SalePrice" />
                                    <asp:BoundField HeaderText="Existencias" DataField="WhPr_Stock" />
                                    <asp:BoundField HeaderText="Fecha Actualización" DataField="UpdatedAt" />
                                    <asp:BoundField HeaderText="Expiración" DataField="ExpiryDate" />
                                    <asp:TemplateField HeaderText="Opciones">
                                        <ItemTemplate>
                                            <asp:LinkButton Font-Size="11px" Height="28px" Width="80px"
                                                CssClass="LinkbtnPrimary" ID="LinkSelect" ToolTip="Seleccionar Producto"
                                                CommandName="cmdSelect" runat="server">Seleccionar</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="GridViewWarehouseProducts" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <%-- Fin Sección del modal --%>
    <div style="border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; border-right: 1px solid #ddd; border-top: 1.5px solid #0D9DBB; background: #F9F9F9; margin-bottom: 10px; border-radius: 10px; max-width: 100%; margin-top: 30px; margin-bottom: 10px">

        <label runat="server" id="warehouseId"></label>
        <label runat="server" id="proddetailid"></label>

        <asp:MultiView ID="OrdersView" ActiveViewIndex="0" runat="server">
            <asp:View runat="server">
                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                    <ContentTemplate>
                        <%-- Inicio formulario principal --%>
                        <div class="ContainerPedidos" style="padding-left: 24px; padding-right: 24px;">
                            <div style="text-align: center">
                                <h2 runat="server" class="titleVenta" id="ShowMessage">Nueva Compra</h2>
                            </div>
                            <hr />
                            <div id="formdetail" class="form-row">
                                <input visible="false" textmode="Number" placeholder="Id Bodega" runat="server" id="txtWarehouseId" class="form-control" />
                                <input visible="false" textmode="Number" placeholder="Id Producto" runat="server" id="txtProductId" class="form-control" />
                                <input visible="false" textmode="Number" placeholder="Id Proveedor" runat="server" id="txtSupplierId" class="form-control" />
                                <input visible="false" placeholder="Bodega" runat="server" id="txtWarehouseName" class="form-control" />
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Producto</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <input required readonly placeholder="Producto" runat="server" id="txtProduct" class="form-control form-disable" />
                                        <%-- <asp:LinkButton data-open="odmodal" style="display: flex; margin-top: 5px" runat="server"><i class="fas fa-plus-circle" style="margin: 10px; color: #00A350"></i></asp:LinkButton>--%>
                                        <button class="btnAdd" data-toggle="modal" data-target="#ventanaModal">+</button>
                                    </div>
                                    <%--<asp:RequiredFieldValidator Height="5px" Font-Size="12px" ForeColor="Red" runat="server" ID="reqValProduct" ValidationGroup="DetailsGroup" ControlToValidate="txtProduct" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Bodegas</h6>
                                    <%-- validar drop --%>
                                    <div style="display: flex; margin-left: 10px">
                                        <asp:DropDownList ID="ddlstWarehouses" CssClass="form-control" Width="100%" runat="server">
                                        </asp:DropDownList>
                                        <asp:Button ToolTip="Crear nueva bodega" class="btnAdd" type="button" runat="server" Text="+" />
                                    </div>
                                    <%--<asp:RequiredFieldValidator Height="5px" Font-Size="12px" ID="reqValddlWarehouse" ValidationGroup="DetailsGroup" runat="server" InitialValue="0" ControlToValidate="ddlstWarehouses" ForeColor="Red" ErrorMessage="Seleccione una bodega destino"></asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Proveedores</h6>
                                    <%-- validar drop --%>
                                    <div style="display: flex; margin-left: 10px">
                                        <asp:DropDownList ID="ddlstSuppliers" CssClass="form-control" Width="100%" runat="server">
                                        </asp:DropDownList>
                                        <asp:Button ToolTip="Crear nuevo proveedor" class="btnAdd" type="button" runat="server" Text="+" />
                                    </div>
                                    <%--<div>
                                        <asp:RequiredFieldValidator Height="5px" Font-Size="12px" ID="RequiredFieldValidator2" ValidationGroup="DetailsGroup" runat="server" InitialValue="0" ControlToValidate="ddlstSuppliers" ForeColor="Red" ErrorMessage="Seleccione un proveedor"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:RequiredFieldValidator Height="5px" Font-Size="12px" ID="RequiredFieldValidator3" ValidationGroup="OrderGroup" runat="server" InitialValue="0" ControlToValidate="ddlstSuppliers" ForeColor="Red" ErrorMessage="Seleccione un proveedor"></asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Número Factura</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <input placeholder="Número Factura" runat="server" id="txtOrdNumber" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Precio</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <input required textmode="Number" step="0.01" placeholder="Precio" runat="server" id="txtPrice" class="form-control" />
                                    </div>
                                    <%--<div>
                                        <asp:RangeValidator Type="Double" runat="server" MinimumValue="0.1" MaximumValue="99999999999" ForeColor="Red" ID="RangeValidator1" ValidationGroup="DetailsGroup" ControlToValidate="txtPrice" ErrorMessage="Ingrese un precio válido"></asp:RangeValidator>
                                    </div>
                                    <asp:RequiredFieldValidator Height="5px" Font-Size="12px" ForeColor="Red" runat="server" ID="reqPrice" ValidationGroup="DetailsGroup" ControlToValidate="txtPrice" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Código</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <input readonly placeholder="Código producto" runat="server" id="txtDefaultCode" class="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Marca</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <input readonly placeholder="Marca" runat="server" id="txtBrand" class="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Material</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <input readonly placeholder="Material" runat="server" id="txtMaterialType" class="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Dimensiones</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <input readonly placeholder="Dimensiones" runat="server" id="txtDimensions" class="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Unidad de medida</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <input readonly placeholder="Unidad de medida" runat="server" id="txtMeasureUnit" class="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Cantidad</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <input required id="txtQuantity" placeholder="Cantidad" textmode="Number" runat="server" class="form-control" />
                                    </div>
                                    <%--<div>
                                        <asp:RangeValidator Type="Integer" runat="server" MinimumValue="1" MaximumValue="1000" ForeColor="Red" ID="valRangeQuantity" ValidationGroup="DetailsGroup" ControlToValidate="txtQuantity" ErrorMessage="La cantidad debe ser entre 1 o 1000"></asp:RangeValidator>
                                    </div>
                                    <asp:RequiredFieldValidator Height="5px" Font-Size="12px" ForeColor="Red" runat="server" ID="reqQuantity" ValidationGroup="DetailsGroup" ControlToValidate="txtQuantity" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Descuento (%)</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <input required id="txtDetailDiscount" runat="server" placeholder="Descuento (%)" textmode="Number" class="form-control" />
                                    </div>
                                    <%--<div>
                                        <asp:RangeValidator Type="Integer" runat="server" MinimumValue="0" MaximumValue="100" ForeColor="Red" ID="valRangeDiscount" ValidationGroup="DetailsGroup" ControlToValidate="txtDetailDiscount" ErrorMessage="El descuento debe ser entre 0 y 100"></asp:RangeValidator>
                                    </div>
                                    <asp:RequiredFieldValidator Height="5px" Font-Size="12px" ForeColor="Red" runat="server" ID="reqDiscount" ValidationGroup="DetailsGroup" ControlToValidate="txtDetailDiscount" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>--%>
                                </div>
                                <div style="width: 100%; margin: 5px; min-width: 150px; text-align: center">
                                    <asp:Button runat="server" Text="Agregar" ValidationGroup="DetailsGroup" OnClick="btnAddToDetailStageList_Click" ID="btnAddToDetailStageList" CssClass="btn btn-success" Style="margin-left: 10px" />
                                    <asp:Button runat="server" Text="Cancelar" OnClick="btnAbortAddToDetailStageList_Click" ID="btnAbortAddToDetailStageList" CssClass="btn btn-danger" Style="margin-left: 10px" />
                                </div>
                            </div>
                        </div>
                        <%-- Fin Formulario principal --%>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnGoToListOrders" />
                        <%--<asp:PostBackTrigger ControlID="btnCreateOrder" />--%>
                    </Triggers>
                </asp:UpdatePanel>
                <%-- Fin del formulario --%>
            </asp:View>

            <asp:View runat="server">
                <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                    <ContentTemplate>
                        <div style="display: flex; align-items: center; justify-content: space-between;">
                            <asp:Button CssClass="btn btn-primary m-4" runat="server" ID="btnUpdateTable" Text="Actualizar" OnClick="btnUpdateTable_Click" />
                        </div>
                        <div class="form-row mt-4">
                            <div class="col-md-3">
                                <h5 style="margin-left: 10px">Desde</h5>
                                <div style="display: flex; margin-left: 10px">
                                    <input required runat="server" type="date" name="Type" id="DatepickerFrom" class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <h5 style="margin-left: 10px">Hasta</h5>
                                <div style="display: flex; margin-left: 10px">
                                    <input required runat="server" type="date" name="Type" id="DatepickerTo" class="form-control" />
                                </div>
                            </div>

                            <di class="col-md-3">
                                    <h5 style="margin-left: 10px">Buscar</h5>
                                    <div style="display: flex; margin-left: 10px">
                                        <input required runat="server" ID="txtSearchByInvoiceNumber" CssClass="form-control" placeholder="Número de factura"/>
                                    </div>
                                </di>

                            <div class="col-md-3" style="margin-top: 40px">
                                <asp:Button runat="server" Text="Filtrar" ID="btnFilterByDate" ValidationGroup="FormDateInput" OnClick="btnFilterByDate_Click" CssClass="btn btn-primary" Style="margin-left: 10px; margin-bottom: 30px;" />
                            </div>
                        </div>
                        <asp:GridView runat="server" DataKeyNames="Pk_OrderID" AutoGenerateColumns="false"
                            ID="GridViewOrders" OnRowCommand="GridViewOrders_RowCommand" CssClass="headerTable" BorderStyle="None">
                            <Columns>
                                <asp:BoundField HeaderText="ID Orden" DataField="Pk_OrderID" Visible="false" />
                                <asp:BoundField HeaderText="ID Proveedor" DataField="Fk_SupplierID" Visible="false" />
                                <asp:BoundField HeaderText="Proveedor" DataField="SupplierName" />
                                <asp:BoundField HeaderText="Usuario" DataField="UserName" />
                                <asp:BoundField HeaderText="Número Pedido" DataField="Ord_Number" />
                                <asp:BoundField HeaderText="Subtotal" DataField="Ord_Subtotal" />
                                <asp:BoundField HeaderText="Impuesto" DataField="Ord_Tax" />
                                <asp:BoundField HeaderText="Descuento" DataField="Ord_Discount" />
                                <asp:BoundField HeaderText="Total" DataField="Ord_Total" />
                                <asp:BoundField HeaderText="Fecha" DataField="newDate" />
                                <asp:BoundField HeaderText="Estado" DataField="Ord_Deleted" Visible="false" />
                                <asp:TemplateField HeaderText="Opciones">
                                    <ItemTemplate>
                                        <asp:LinkButton Font-Size="11px" Height="28px" Width="80px"
                                            CssClass="LinkbtnPrimary" ID="LinkShowDetails" ToolTip="Mostrar Detalles de Pedido"
                                            CommandName="cmdDetail" runat="server">Ver detalles</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <div class="modal fade" id="ventanaModal1" tabindex="-1" role="dialog" aria-labelledby="tituloVentana" aria-hidden="true">
                            <div class="modal-dialog modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header" role="document">
                                        <h4 style="color: #fff;" id="titleOdtModal">Detalle de compra</h4>
                                        <button id="btnCloseOdtModal" class="btnClose" data-close>✕</button>
                                    </div>
                                    <div class="modal-body">
                                        <asp:GridView runat="server" DataKeyNames="Fk_OrderID, Fk_ProductDetailID, Fk_DestinationWarehouseID" AutoGenerateColumns="false"
                                            ID="GridViewOrderDetail" CssClass="headerTable" CellPadding="5">
                                            <Columns>
                                                <asp:BoundField HeaderText="ID Order" DataField="Fk_OrderID" Visible="false" />
                                                <asp:BoundField HeaderText="ID Producto" DataField="Fk_ProductDetailID" Visible="false" />
                                                <asp:BoundField HeaderText="ID Bodega" DataField="Fk_DestinationWarehouseID" Visible="false" />
                                                <asp:BoundField HeaderText="Codigo Producto" DataField="Pdl_CustomID" />
                                                <asp:BoundField HeaderText="Producto" DataField="Prod_Name" />
                                                <asp:BoundField HeaderText="Bodega" DataField="Whs_Name" />
                                                <asp:BoundField HeaderText="Cantidad" DataField="Odt_Quantity" />
                                                <asp:BoundField HeaderText="Precio Compra" DataField="Odt_PurchasePrice" />
                                                <asp:BoundField HeaderText="Subtotal" DataField="Odt_Subtotal" />
                                                <asp:BoundField HeaderText="Impuestos" DataField="Odt_DetailTax" />
                                                <asp:BoundField HeaderText="Descuento" DataField="Odt_Discount" />
                                                <asp:BoundField HeaderText="Total" DataField="Odt_Total" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnBackToCreateOrder" />
                        <%--<asp:PostBackTrigger ControlID="btnCreateOrder" />--%>
                    </Triggers>
                </asp:UpdatePanel>
            </asp:View>

            <asp:View runat="server">
                <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                    <ContentTemplate>
                        <%-- Tabla de productos --%>
                        <div class="ContainerPedidos">
                            <h4 style="text-align: center;">Tabla Productos</h4>
                            <hr />
                            <asp:GridView runat="server" DataKeyNames="Fk_WarehouseID,Fk_ProductDetailID,Fk_SupplierID" AutoGenerateColumns="false"
                                ID="GridViewOrderDetailsStage" OnRowCommand="GridViewOrderDetailsStage_RowCommand" CssClass="headerTable" BorderStyle="None">
                                <Columns>
                                    <asp:BoundField HeaderText="ID Bodega" DataField="Fk_WarehouseID" Visible="false" />
                                    <asp:BoundField HeaderText="ID Producto" DataField="Fk_ProductDetailID" Visible="false" />
                                    <asp:BoundField HeaderText="ID Proveedor" DataField="Fk_SupplierID" Visible="false" />
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
                                                CssClass="LinkbtnPrimary" ID="EditLink" ToolTip="Editar Producto"
                                                CommandName="cmdEdit" runat="server">Editar</asp:LinkButton>
                                            <asp:LinkButton Font-Size="11px" Height="28px" Width="80px"
                                                CssClass="LinkbtnDanger" ID="DeleteLink" ToolTip="Eliminar Producto"
                                                CommandName="cmdDelete" runat="server">Eliminar</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <%-- Inicio del formulario del total a pagar --%>
                        <div class="ContainerPedidos">
                            <div class="form-row">
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Sub Total</h6>
                                    <div class="input-group mb-3">
                                        <input required aria-label="Username" aria-describedby="basic-addon1" readonly runat="server" id="txtSubtotal" placeholder="Subtotal" class="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">IVA</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <input required textmode="Number" step="0.01" runat="server" id="txtTotalTax" placeholder="IVA" class="form-control" />
                                    </div>
                                    <%--                                    <div>
                                        <asp:RangeValidator Type="Double" runat="server" MinimumValue="0" MaximumValue="99999999999" ForeColor="Red" ID="valRangeTotalTax" ValidationGroup="OrderGroup" ControlToValidate="txtTotalTax" ErrorMessage="Ingrese un valor válido"></asp:RangeValidator>
                                    </div> --%>
                                </div>
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Descuento</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <input required textmode="Number" runat="server" id="txtTotalDiscount" placeholder="Descuento" class="form-control" />
                                    </div>
                                    <%--<div>
                                        <asp:RangeValidator Type="Integer" runat="server" MinimumValue="0" MaximumValue="100" ForeColor="Red" ID="RangeValidator2" ValidationGroup="OrderGroup" ControlToValidate="txtTotalDiscount" ErrorMessage="El descuento debe ser entre 0 y 100"></asp:RangeValidator>
                                    </div>
                                    <asp:RequiredFieldValidator Height="5px" Font-Size="12px" ForeColor="Red" runat="server" ID="RequiredFieldValidator1" ValidationGroup="OrderGroup" ControlToValidate="txtTotalDiscount" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="col-md-3">
                                    <h6 style="margin-left: 10px">Total</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <input required readonly placeholder="Total" runat="server" id="txtTotal" class="form-control form-disable" />
                                    </div>
                                </div>
                            </div>
                            <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                                <asp:Button runat="server" Text="Calcular" ValidationGroup="OrderGroup" OnClick="btnRecalculateOrderTotal_Click" ID="btnRecalculateOrderTotal" CssClass="btn btn-success" Style="margin-left: 10px" />
                                <asp:Button runat="server" Text="Registrar Orden" ValidationGroup="OrderGroup" ID="btnCreateOrder" OnClick="btnCreateOrder_Click" CssClass="btn btn-success" Style="margin-left: 10px" />
                                <asp:Button runat="server" Text="Cancelar" ID="btnCancelOrder" OnClick="btnCancelOrder_Click" CssClass="btn btn-danger" Style="margin-left: 10px" />
                            </div>
                        </div>
                        <%-- Fin de la tabla --%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:View>
        </asp:MultiView>
    </div>
    <%--Toast--%>



    <%--    <div id="toast" class="toast">
        <div class="toast-img toast-img-danger"><i class="fas fa-exclamation"></i></div>
        <div class="toast-body">
            <p style="text-align: justify;">
                El producto ya existe en la lista!
                <br />
                Edite el existente en su lugar
            </p>
        </div>
    </div>

    <div id="toastOrdSuccess" class="toast">
        <div class="toast-img toast-img-success"><i class="fas fa-check-circle"></i></div>
        <div class="toast-body">
            <p style="text-align: justify;">Orden Registrada con éxito!</p>
        </div>
    </div>
    <div id="toastDate" class="toast">
        <div class="toast-img toast-img-danger"><i class="fas fa-exclamation"></i></div>
        <div class="toast-body">
            <p style="text-align: justify;">
                La fecha incio no debe<br />
                ser mayor a la fecha final!
            </p>
        </div>
    </div>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <%--<script src="../../Scripts/Modules/OrderModule.js"></script>--%>
    <%--<script src="../../Scripts/Modal/Modal.js"></script>--%>
    <script>   

        function launch_toast() {
            var el = document.getElementById("toast")
            el.classList.add("show");
            setTimeout(function () { el.classList.remove("show") }, 5000);
        }

        function OrderCreated_Toast() {
            var el = document.getElementById("toastOrdSuccess")
            el.classList.add("show");
            setTimeout(function () { el.classList.remove("show") }, 5000);
        }

        function ModalDate() {
            var el = document.getElementById("toastDate")
            el.classList.add("show");
            setTimeout(function () { el.classList.remove("show") }, 5000);
        }


    </script>
</asp:Content>
