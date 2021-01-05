<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="HardwareStore.Modules.Orders.Module.OrdersPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/Toast.css" rel="stylesheet" />
    <br />
    <%-- Modal Bodega --%>
    <div style="margin-top: 80px" class="modal fade" id="ModalWarehause" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-dark">
                    <h5 class="modal-title text-light" id="exampleModalLabel">Nueva Bodega</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span class="text-light" aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row p-3">
                        <div class="col-md-12">
                            <h5 style="float: left; margin-left: 5px;">Nombre</h5>
                            <input runat="server" type="text" name="Type" id="Text2" class="form-control" />
                        </div>
                        <div class="col-md-12">
                            <h5 style="float: left; margin-left: 5px;">Decripción</h5>
                            <input runat="server" type="text" name="Type" id="Text1" class="form-control" />
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </div>
    </div>

    <%-- Fin Modal --%>

    <%-- Modal Proveedores --%>
    <div style="margin-top: 80px" class="modal fade" id="ModalSuppliers" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-dark">
                    <h5 class="modal-title text-light" id="exampleModalLabel1">Nueva Bodega</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span class="text-light" aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row p-3">
                        <div class="col-md-6">
                            <h5 style="float: left; margin-left: 5px;">Nombre</h5>
                            <input runat="server" type="text" name="Type" id="Text3" class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <h5 style="float: left; margin-left: 5px;">Compañía</h5>
                            <input runat="server" type="text" name="Type" id="Text4" class="form-control" />
                        </div>
                        <div class="col-md-12">
                            <h5 style="float: left; margin-left: 5px;">Dirección</h5>
                            <input runat="server" type="text" name="Type" id="Text5" class="form-control" />
                        </div>

                        <div class="col-md-4">
                            <h5 style="float: left; margin-left: 5px;">Teléfono</h5>
                            <input runat="server" type="text" name="Type" id="Text6" class="form-control" />
                        </div>
                        <div class="col-md-4">
                            <h5 style="float: left; margin-left: 5px;">DNI</h5>
                            <input runat="server" type="text" name="Type" id="Text7" class="form-control" />
                        </div>
                        <div class="col-md-4">
                            <h5 style="float: left; margin-left: 5px;">Correo</h5>
                            <input runat="server" type="text" name="Type" id="Text8" class="form-control" />
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </div>
    </div>

    <%-- Fin Modal --%>
    <%-- Sección del modal --%>
    <div style="margin-top: 50px" class="modal fade" id="ventanaModal" tabindex="-1" role="dialog" aria-labelledby="tituloVentana" aria-hidden="true">
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
                    <asp:UpdatePanel runat="server" ID="UpdatePanel4">
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
    <div class="container">
        <div class="row">
            <div class="col-md-12 mx-auto">
                <div class="card">
                    <!-- <div>
                        <h5>Modulo Venta</h5>
                    </div> -->
                    <div class="card-body">
                        <!-- Header of tabs -->
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="salesist-tab" data-toggle="tab" href="#salelist-content" role="tab" aria-controls="salelist-content" aria-selected="false">Historial de Compras</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" id="newsale-tab" data-toggle="tab" href="#newsale-content" role="tab" aria-controls="newsale-content" aria-selected="true">Nueva Compra</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="saledetail-tab" data-toggle="tab" href="#saledetail-content" role="tab" aria-controls="saledetail-content" aria-selected="false">Detalle Compra</a>
                            </li>
                        </ul>
                        <!-- end of headers (tabs) -->

                        <!-- Tabs content -->
                        <div class="tab-content" id="myTabContent">

                            <div class="tab-pane fade" id="salelist-content" role="tabpanel" aria-labelledby="salesist-tab">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                                    <ContentTemplate>
                                        <div style="display: flex; align-items: center; justify-content: space-between;">
                                            <asp:Button CssClass="btn btn-primary m-4" runat="server" ID="btnUpdateTable" Text="Actualizar" OnClick="btnUpdateTable_Click" />
                                        </div>
                                        <div class="form-row mt-4">
                                            <div class="col-md-3">
                                                <h6 style="margin-left: 10px">Desde</h6>
                                                <div style="display: flex; margin-left: 10px">
                                                    <input required runat="server" type="date" name="Type" id="DatepickerFrom" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <h6 style="margin-left: 10px">Hasta</h6>
                                                <div style="display: flex; margin-left: 10px">
                                                    <input required runat="server" type="date" name="Type" id="DatepickerTo" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <h6 style="margin-left: 10px">Buscar</h6>
                                                <div style="display: flex; margin-left: 10px">
                                                    <input runat="server" id="txtSearchByInvoiceNumber" class="form-control" placeholder="Número de factura" />
                                                </div>
                                            </div>

                                            <div class="col-md-3" style="margin-top: 28px">
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
                                </asp:UpdatePanel>
                            </div>

                            <!-- New Sale section -->
                            <div class="tab-pane fade show active" id="newsale-content" role="tabpanel" aria-labelledby="newsale-tab">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                    <ContentTemplate>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <form class="card card-shadow needs-validation" novalidate>
                                                    <div class="card-body">
                                                        <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Bodega" runat="server" ID="txtWarehouseId" class="form-control" />
                                                        <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Producto" runat="server" ID="txtProductId" class="form-control" />
                                                        <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Proveedor" runat="server" ID="txtSupplierId" class="form-control" />
                                                        <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Currency" runat="server" ID="txtCurrencyExchangeId" class="form-control" />
                                                        <asp:TextBox ReadOnly="true" runat="server" Visible="false" ID="txtWarehouseName" CssClass="form-control" />
                                                        <div class="form-row">
                                                            <div class="form-group col-md-4">
                                                                <label for="txtProduct">Producto</label>
                                                                <div class="input-group">
                                                                    <input type="text" readonly placeholder="Producto" runat="server" id="txtProduct" class="form-control form-disable">
                                                                    <div class="input-group-append">
                                                                        <button runat="server" class="btn btn-info" data-toggle="modal" data-target="#ventanaModal">+</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <label for="validationTooltip03">Bodega</label>
                                                                <div class="input-group">
                                                                    <asp:DropDownList ID="ddlstWarehouses" CssClass="form-control" runat="server">
                                                                    </asp:DropDownList>
                                                                    <div class="input-group-append">
                                                                        <button data-toggle="modal" data-target="#ModalWarehause" class="btn btn-primary" type="button">+</button>
                                                                    </div>
                                                                </div>
                                                                <div class="invalid-tooltip">
                                                                    Please provide a valid customer
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <label for="txtCustomer">Proveedores</label>
                                                                <div class="input-group">
                                                                    <asp:DropDownList ID="ddlstSuppliers" CssClass="form-control" runat="server">
                                                                    </asp:DropDownList>
                                                                    <div class="input-group-append">
                                                                        <button data-toggle="modal" data-target="#ModalSuppliers" class="btn btn-primary" type="button">+</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form-group col-md-3">
                                                                <label for="txtBrand">Número Factura</label>
                                                                <input runat="server" readonly type="text" class="form-control" id="txtOrdNumber" placeholder="Número Factura">
                                                            </div>
                                                            <div class="form-group col-md-3">
                                                                <label for="txtBrand">Precio</label>
                                                                <input required textmode="Number" step="0.01" placeholder="Precio" runat="server" id="txtPrice" class="form-control" />
                                                            </div>
                                                            <div class="form-group col-md-3">
                                                                <label for="txtProductCode">Codigo</label>
                                                                <input readonly placeholder="Código producto" runat="server" id="txtDefaultCode" class="form-control form-disable" />
                                                            </div>
                                                            <div class="form-group col-md-3">
                                                                <label for="txtMeasureUnit">Marca</label>
                                                                <input readonly placeholder="Marca" runat="server" id="txtBrand" class="form-control form-disable" />
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form-group col-md-4">
                                                                <label for="txtDimensions">Material</label>
                                                                <input readonly placeholder="Material" runat="server" id="txtMaterialType" class="form-control form-disable" />
                                                            </div>
                                                            <div class="form-group col-md-2">
                                                                <label for="txtProductStock">Dimensiones</label>
                                                                <input readonly placeholder="Dimensiones" runat="server" id="txtDimensions" class="form-control form-disable" />
                                                            </div>
                                                            <div class="form-group col-md-2">
                                                                <label for="txtPrice">Unidad de medida</label>
                                                                <%--<div class="input-group">--%>
                                                                <%--                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text">C$</span>
                                                                    </div>--%>
                                                                <input readonly placeholder="Unidad de medida" runat="server" id="txtMeasureUnit" class="form-control form-disable" />
                                                                <%--</div>--%>
                                                            </div>
                                                            <div class="form-group col-md-2">
                                                                <label for="txtQuantity">Cantidad</label>
                                                                <input required id="txtQuantity" placeholder="Cantidad" textmode="Number" runat="server" class="form-control" />
                                                            </div>
                                                            <div class="form-group col-md-2">
                                                                <label for="txtDetailDiscount">Descuento</label>
                                                                <input required id="txtDetailDiscount" runat="server" placeholder="Descuento (%)" textmode="Number" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer">
                                                        <div class="row justify-content-center">
                                                            <div class="p-1">
                                                                <asp:Button runat="server" Text="Agregar" ValidationGroup="DetailsGroup" OnClick="btnAddToDetailStageList_Click" ID="btnAddToDetailStageList" CssClass="btn btn-success" Style="margin-left: 10px" />
                                                            </div>
                                                            <div class="p-1">
                                                                <asp:Button runat="server" Text="Cancelar" OnClick="btnAbortAddToDetailStageList_Click" ID="btnAbortAddToDetailStageList" CssClass="btn btn-danger" Style="margin-left: 10px" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btnAddToDetailStageList" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <!-- End new sale section -->

                                <div class="tab-pane fade" id="saledetail-content" role="tabpanel" aria-labelledby="saledetail-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                        <ContentTemplate>
                                            <div class="row mt-3">
                                                <div class="col">
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
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col">
                                                    <div class="card card-shadow">
                                                        <div class="card-body">
                                                            <div class="form-row">
                                                                <div class="form-group col-md-3">
                                                                    <label for="txtSubtotal">Subtotal</label>
                                                                    <div class="input-group">
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text">C$</span>
                                                                        </div>
                                                                        <input required aria-label="Username" aria-describedby="basic-addon1" readonly runat="server" id="txtSubtotal" placeholder="Subtotal" class="form-control form-disable" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-2">
                                                                    <label for="txtTotalDiscount">IVA</label>
                                                                    <div class="input-group">
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text">%</span>
                                                                        </div>
                                                                        <input required textmode="Number" step="0.01" runat="server" id="txtTotalTax" placeholder="IVA" class="form-control" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <label for="txtTotal">Descuento</label>
                                                                    <div class="input-group">
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text">%</span>
                                                                        </div>
                                                                        <input required textmode="Number" runat="server" id="txtTotalDiscount" placeholder="Descuento" class="form-control" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label for="ddlistCurrencies">Total</label>
                                                                    <input required readonly placeholder="Total" runat="server" id="txtTotal" class="form-control form-disable" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-footer">
                                                            <div class="row justify-content-center">
                                                                <div class="col-md-2">
                                                                    <asp:Button runat="server" Text="Calcular" ValidationGroup="OrderGroup" OnClick="btnRecalculateOrderTotal_Click" ID="btnRecalculateOrderTotal" CssClass="btn btn-success" Style="margin-left: 10px" />
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <asp:Button runat="server" Text="Registrar Orden" ValidationGroup="OrderGroup" ID="btnCreateOrder" OnClick="btnCreateOrder_Click" CssClass="btn btn-success" Style="margin-left: 10px" />
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <asp:Button runat="server" Text="Cancelar" ID="btnCancelOrder" OnClick="btnCancelOrder_Click" CssClass="btn btn-danger" Style="margin-left: 10px" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <!-- End of tab content -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div id="toast" class="toast">
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
    </div>
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
