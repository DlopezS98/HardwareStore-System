<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainSales.aspx.cs" Inherits="HardwareStore.Modules.Sales.Module.MainSales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/Toast.css" rel="stylesheet" />


    <%-- Modal Cliente --%>
    <div style="margin-top: 45px" class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header  bg-dark">
                    <h5 class="modal-title text-light" id="exampleModalLabel">Nuevo Cliente</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span class="text-light" aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row p-3">
                        <div class="col-md-6">
                            <h5 style="float: left; margin-left: 5px;">Nombre</h5>
                            <input runat="server" type="text" name="Type" id="Text2" class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <h5 style="float: left; margin-left: 5px;">Apellido</h5>
                            <input runat="server" type="text" name="Type" id="Text1" class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <h5 style="float: left; margin-left: 5px;">Teléfono</h5>
                            <input runat="server" type="text" name="Type" id="Text4" class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <h5 style="float: left; margin-left: 5px;">DNI</h5>
                            <input runat="server" type="text" name="Type" id="Text5" class="form-control" />
                        </div>
                        <div class="col-md-12">
                            <h5 style="float: left; margin-left: 5px;">Dirección</h5>
                            <input runat="server" type="text" name="Type" id="Text3" class="form-control" />
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-success">Guardar</button>
                </div>
            </div>
        </div>
    </div>
    <%-- Fin modal Cliente --%>
    <br />
    <div style="margin-top: 90px" class="modal fade" id="ventanaModal" tabindex="-1" role="dialog" aria-labelledby="tituloVentana" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header bg-dark">
                    <h4 class="text-light">Existencias Productos</h4>
                    <button class="close" data-dismiss="modal" aria-label="cerrar">
                        <span class="text-light" aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" ID="updatePanel">
                        <ContentTemplate>
                            <div class="form-row">
                                <div class="col-md-4 mt-4">
                                    <input class="form-control" runat="server" id="txtSearchWarehouseProduct" placeholder="Buscar..." />
                                </div>
                                <div class="col-md-4 mt-4">
                                    <asp:Button CssClass="btn btn-primary" runat="server" Text="Buscar" ID="btnSearchWarehouseProduct" OnClick="btnSearchWarehouseProduct_Click" />
                                </div>
                                <div class="col-md-4 mb-2">
                                    <h6 style="margin-left: 10px">Bodegas</h6>
                                    <div style="display: flex; margin-left: 10px">
                                        <asp:DropDownList AutoPostBack="true" ID="ddlistFilterByWarehouse" CssClass="form-control" Width="100%" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <asp:GridView runat="server" DataKeyNames="Fk_WarehouseID,Fk_ProductDetailID,Fk_SupplierID" AutoGenerateColumns="false"
                                ID="GridViewWarehouseProducts" CssClass="headerTable" OnRowCommand="GridViewWarehouseProducts_RowCommand" CellPadding="5">
                                <Columns>
                                    <asp:BoundField HeaderText="ID Bodega" DataField="Fk_WarehouseID" Visible="false" />
                                    <asp:BoundField HeaderText="ID Producto" DataField="Fk_ProductDetailID" Visible="false" />
                                    <asp:BoundField HeaderText="ID Proveedor" DataField="Fk_SupplierID" Visible="false" />
                                    <asp:BoundField HeaderText="Bodega" DataField="WarehouseName" />
                                    <asp:BoundField HeaderText="Producto" DataField="ProductName" />
                                    <asp:BoundField HeaderText="Proveedor" DataField="SupplierName" />
                                    <asp:BoundField HeaderText="Marca" DataField="BrandName" />
                                    <asp:BoundField HeaderText="Material" DataField="MaterialType" />
                                    <asp:BoundField HeaderText="Dimensiones" DataField="Dimensions" />
                                    <asp:BoundField HeaderText="Código" DataField="DefaultCode" />
                                    <asp:BoundField HeaderText="Unidad" DataField="MeasureUnit" />
                                    <asp:BoundField HeaderText="Precio Venta" DataField="WhPr_SalePrice" />
                                    <asp:BoundField HeaderText="Precio Compra" DataField="WhPr_PurchasePrice" />
                                    <asp:BoundField HeaderText="Existencias" DataField="WhPr_Stock" />
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
                                <a class="nav-link" id="salesist-tab" data-toggle="tab" href="#salelist-content" role="tab" aria-controls="salelist-content" aria-selected="false">Historial de Ventas</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" id="newsale-tab" data-toggle="tab" href="#newsale-content" role="tab" aria-controls="newsale-content" aria-selected="true">Nueva venta</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="saledetail-tab" data-toggle="tab" href="#saledetail-content" role="tab" aria-controls="saledetail-content" aria-selected="false">Detalle venta</a>
                            </li>
                        </ul>
                        <!-- end of headers (tabs) -->

                        <!-- Tabs content -->
                        <div class="tab-content" id="myTabContent">

                            <div class="tab-pane fade" id="salelist-content" role="tabpanel" aria-labelledby="salesist-tab">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                    <ContentTemplate>
                                        <div style="margin-left: 3%; margin-right: 3%; margin-top: 1%">
                                            <h4 style="text-align: center; margin-top: 0px">Historial de ventas</h4>
                                            <%--                                            <ul class="d-flex justify-content-between">
                                                <li class="nav-item ml-1">
                                                    <asp:LinkButton CssClass="nav-link btn btn-success" Text="Nueva Venta" runat="server" ID="btnNewSale" OnClick="btnNewSale_Click" />
                                                </li>
                                                <li class="nav-item ml-1">
                                                    <asp:Button Visible="true" CssClass="nav-link btn btn-primary" Text="Actualizar" runat="server" ID="btnUpdateTable" OnClick="btnUpdateTable_Click" />
                                                </li>
                                            </ul>--%>
                                            <div style="display: flex; align-items: center; justify-content: space-between;">
                                                <asp:Button CssClass="btn btn-primary" OnClick="btnUpdateTable_Click" runat="server" ID="btnUpdateTable" Text="Actualizar" />
                                            </div>
                                            <div class="form-row mt-4">
                                                <div class="col-md-3">
                                                    <h6 style="margin-left: 10px">Desde</h6>
                                                    <div style="display: flex">
                                                        <input runat="server" type="date" name="Type" id="DatepickerFrom" class="form-control" />
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="DatepickerFrom" ValidationGroup="FormDateInput" ErrorMessage="Seleccione una fecha valida"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-md-3">
                                                    <h6 style="margin-left: 10px">Hasta</h6>
                                                    <div style="display: flex">
                                                        <input runat="server" type="date" name="Type" id="DatepickerTo" class="form-control" />
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="DatepickerTo" ValidationGroup="FormDateInput" ErrorMessage="Seleccione una fecha valida"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-md-3">
                                                    <h6 style="margin-left: 10px">Buscar</h6>
                                                    <div style="display: flex; margin-left: 10px">
                                                        <input runat="server" id="txtSearchByInvoiceNumber" class="form-control" placeholder="Número de factura" />
                                                    </div>
                                                </div>
                                                <div class="col-md-3 mt-4">
                                                    <asp:Button runat="server" Text="Filtrar" ID="btnFilterByDate" OnClick="btnFilterByDate_Click" ValidationGroup="FormDateInput" CssClass="btn btn-primary" Style="margin-left: 10px; margin-bottom: 30px;" />
                                                </div>
                                            </div>
                                        </div>

                                        <asp:GridView runat="server" DataKeyNames="Id" AutoGenerateColumns="false"
                                            ID="GridviewSales" OnRowCommand="GridviewSales_RowCommand" CssClass="headerTable" BorderStyle="None">
                                            <Columns>
                                                <asp:BoundField HeaderText="ID Venta" DataField="Id" Visible="false" />

                                                <asp:BoundField HeaderText="Usuario" DataField="UserName" />
                                                <asp:BoundField HeaderText="Cliente" DataField="CustomerName" />
                                                <asp:BoundField HeaderText="Tipo Pago" DataField="PaymentType" />
                                                <asp:BoundField HeaderText="Compra" DataField="CurrencyPurchase" />
                                                <asp:BoundField HeaderText="Venta" DataField="CurrencySale" />
                                                <asp:BoundField HeaderText="Fecha" DataField="DateString" />
                                                <asp:BoundField HeaderText="Descuento" DataField="Discount" />
                                                <asp:BoundField HeaderText="Subtotal" DataField="SubtotalString" />
                                                <asp:BoundField HeaderText="Total" DataField="TotalString" />
                                                <asp:TemplateField HeaderText="Opciones">
                                                    <ItemTemplate>
                                                        <asp:LinkButton Font-Size="11px" Height="28px" Width="80px"
                                                            CssClass="LinkbtnPrimary" ID="SelectLink" ToolTip="Ver Detalle de venta"
                                                            CommandName="cmdSelect" runat="server">Ver detalle</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                        <%--                        <div class="modal" id="SdtModal" data-animation="slideInOutLeft">
                            <div class="modal-dialog">
                                <div class="modal-header">
                                    <h4 style="color: #fff;" id="titleOdtModal">Detalle de Venta</h4>
                                    <button id="btnCloseSdtModal" class="btnClose" data-close>✕</button>
                                </div>
                                <div class="modal-content">
                                    <asp:GridView runat="server" DataKeyNames="Id" AutoGenerateColumns="false"
                                        ID="GridViewSaleDetails" CssClass="headerTable" CellPadding="5">
                                        <Columns>
                                            <asp:BoundField HeaderText="ID Venta" DataField="Id" Visible="false" />

                                            <asp:BoundField HeaderText="Bodega" DataField="Warehouse" />
                                            <asp:BoundField HeaderText="Producto" DataField="Product" />
                                            <asp:BoundField HeaderText="Unidad Medida" DataField="BaseUnit" />
                                            <asp:BoundField HeaderText="Precio" DataField="Price" />
                                            <asp:BoundField HeaderText="Cantidad" DataField="Quantity" />
                                            <asp:BoundField HeaderText="Subtotal" DataField="Subtotal" />
                                            <asp:BoundField HeaderText="Descuento" DataField="Discount" />
                                            <asp:BoundField HeaderText="Total" DataField="Total" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>--%>
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
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtProduct">Producto</label>
                                                                </div>
                                                                <div class="input-group">
                                                                    <input type="text" readonly placeholder="Producto" runat="server" id="txtProduct" class="form-control form-disable">
                                                                    <div class="input-group-append">
                                                                        <button runat="server" class="btn btn-info" data-toggle="modal" data-target="#ventanaModal">+</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="validationTooltip03">Cliente</label>
                                                                </div>
                                                                <div class="input-group">
                                                                    <asp:DropDownList ID="ddlistCustomers" AutoPostBack="true" OnSelectedIndexChanged="ddlistCustomers_SelectedIndexChanged" class="custom-select" runat="server">
                                                                    </asp:DropDownList>
                                                                    <div class="input-group-append">
                                                                        <button data-toggle="modal" data-target="#exampleModal" runat="server" class="btn btn-info" type="button">+</button>
                                                                    </div>
                                                                </div>
                                                                <div class="invalid-tooltip">
                                                                    Please provide a valid customer
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtCustomer">Nombre cliente</label>
                                                                </div>
                                                                <input runat="server" type="text" class="form-control" id="txtCustomer" placeholder="Cliente">
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form-group col-md-3">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtBrand">Marca</label>
                                                                </div>
                                                                <input runat="server" readonly type="text" class="form-control" id="txtBrand" placeholder="Marca">
                                                            </div>
                                                            <div class="form-group col-md-3">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtBrand">Material</label>
                                                                </div>
                                                                <input runat="server" readonly type="text" class="form-control" id="txtMaterialType" placeholder="Material">
                                                            </div>
                                                            <div class="form-group col-md-3">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtProductCode">Codigo producto</label>
                                                                </div>
                                                                <input runat="server" readonly type="text" class="form-control" id="txtProductCode" placeholder="Codigo">
                                                            </div>
                                                            <div class="form-group col-md-3">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtMeasureUnit">Unidad de medida</label>
                                                                </div>
                                                                <input runat="server" readonly type="text" class="form-control" id="txtMeasureUnit" placeholder="Unidad de medida">
                                                            </div>
                                                        </div>
                                                        <div class="form-row">
                                                            <div class="form-group col-md-4">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtDimensions">Dimensiones</label>
                                                                </div>
                                                                <input runat="server" readonly type="text" class="form-control" id="txtDimensions" placeholder="Dimensiones">
                                                            </div>
                                                            <div class="form-group col-md-2">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtProductStock">Existencias</label>
                                                                </div>
                                                                <input runat="server" readonly type="number" class="form-control" id="txtProductStock" placeholder="Existencias">
                                                            </div>
                                                            <div class="form-group col-md-2">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtPrice">Precio</label>
                                                                </div>
                                                                <div class="input-group">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text">C$</span>
                                                                    </div>
                                                                    <input runat="server" readonly type="number" class="form-control" id="txtPrice" placeholder="Precio">
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-2">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtQuantity">Cantidad</label>
                                                                </div>
                                                                <input runat="server" type="number" class="form-control" id="txtQuantity" placeholder="Cantidad">
                                                            </div>
                                                            <div class="form-group col-md-2">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtDetailDiscount">Descuento</label>
                                                                </div>
                                                                <input runat="server" type="number" class="form-control" id="txtDetailDiscount" placeholder="Descuento">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer">
                                                        <div class="row justify-content-center">

                                                            <asp:Button runat="server" Text="Agregar" ID="btnAddToDetailStageList" OnClick="btnAddToDetailStageList_Click" CssClass="btn btn-success m-1" />

                                                            <asp:Button runat="server" Text="Cancelar" ID="btnAbortAddToDetailStageList" OnClick="btnAbortAddToDetailStageList_Click" CssClass="btn btn-danger m-1" />
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <!-- End new sale section -->
                            </div>
                            <div class="tab-pane fade" id="saledetail-content" role="tabpanel" aria-labelledby="saledetail-tab">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                                    <ContentTemplate>
                                        <div class="row mt-3">
                                            <div class="col">
                                                <hr />
                                                <asp:GridView runat="server" DataKeyNames="WarehouseId,ProductId,SupplierId" AutoGenerateColumns="false"
                                                    ID="GridViewSaleDetailsStage" OnRowCommand="GridViewSaleDetailsStage_RowCommand" CssClass="headerTable" BorderStyle="None">
                                                    <Columns>
                                                        <asp:BoundField HeaderText="ID Bodega" DataField="WarehouseId" Visible="false" />
                                                        <asp:BoundField HeaderText="ID Producto" DataField="ProductId" Visible="false" />
                                                        <asp:BoundField HeaderText="ID Proveedor" DataField="SupplierId" Visible="false" />

                                                        <asp:BoundField HeaderText="Bodega" DataField="WarehouseName" />
                                                        <asp:BoundField HeaderText="Producto" DataField="ProductName" />
                                                        <asp:BoundField HeaderText="Marca" DataField="BrandName" />
                                                        <asp:BoundField HeaderText="Material" DataField="MaterialType" />
                                                        <asp:BoundField HeaderText="Unidad" DataField="UnitMeasure" />
                                                        <asp:BoundField HeaderText="Dimensiones" DataField="Dimensions" />
                                                        <asp:BoundField HeaderText="Código" DataField="Code" />
                                                        <asp:BoundField HeaderText="Precio venta" DataField="Price" />
                                                        <asp:BoundField HeaderText="Existencias" DataField="Stock" />
                                                        <asp:BoundField HeaderText="Cantidad" DataField="Quantity" />
                                                        <asp:BoundField HeaderText="Subtotal" DataField="Subtotal" />
                                                        <asp:BoundField HeaderText="Descuento" DataField="Discount" />
                                                        <asp:BoundField HeaderText="Total" DataField="Total" />
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
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtSubtotal">Subtotal</label>
                                                                </div>
                                                                <div class="input-group">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text">C$</span>
                                                                    </div>
                                                                    <input runat="server" readonly type="number" class="form-control" id="txtSubtotal" placeholder="Subtotal">
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-2">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtTotalDiscount">Descuento</label>
                                                                </div>
                                                                <div class="input-group">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text">%</span>
                                                                    </div>
                                                                    <input runat="server" type="number" class="form-control" id="txtTotalDiscount" placeholder="Descuento">
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-3">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtTotal">Total</label>
                                                                </div>
                                                                <div class="input-group">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text">%</span>
                                                                    </div>
                                                                    <input runat="server" readonly type="number" class="form-control" id="txtTotal" placeholder="Total">
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="ddlistCurrencies">Moneda</label>
                                                                </div>
                                                                <asp:DropDownList ID="ddlistForeignCurrencies" AutoPostBack="true" OnSelectedIndexChanged="ddlistForeignCurrencies_SelectedIndexChanged" CssClass="form-control" Width="100%" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>

                                                        <div class="form-row">
                                                            <div class="form-group col-md-4">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="ddlistCurrencies2">Moneda Local</label>
                                                                </div>
                                                                <asp:DropDownList ID="ddlistLocalCurrencies" CssClass="form-control" Width="100%" runat="server">
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="form-group col-md-2">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtPurchase">Compra</label>
                                                                </div>
                                                                <div class="input-group">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text">C$</span>
                                                                    </div>
                                                                    <input runat="server" readonly type="number" class="form-control" id="txtCurrencyPurchase" placeholder="compra">
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-3">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtPurchase">Venta</label>
                                                                </div>
                                                                <div class="input-group">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text">C$</span>
                                                                    </div>
                                                                    <input runat="server" readonly type="number" class="form-control" id="txtCurrencySale" placeholder="venta">
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-3">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtPurchase">Pago</label>
                                                                </div>
                                                                <div class="input-group">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text">C$</span>
                                                                    </div>
                                                                    <input runat="server" type="number" class="form-control" id="txtPayment" placeholder="Pago">
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-row">
                                                            <div class="form-group col-md-4">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtTotalDiscount">Conversion</label>
                                                                </div>
                                                                <div class="input-group">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text">C$</span>
                                                                    </div>
                                                                    <input runat="server" readonly type="number" class="form-control" id="txtConversion" placeholder="Conversion">
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-4">
                                                                <div class="d-flex justify-content-start">
                                                                    <label for="txtTotalDiscount">Cambio</label>
                                                                </div>
                                                                <div class="input-group">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text">C$</span>
                                                                    </div>
                                                                    <input runat="server" readonly type="number" class="form-control" id="txtPaymentChange" placeholder="Cambio">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer">
                                                        <div class="row justify-content-center">
                                                            <div class="col-md-2">
                                                                <asp:Button ID="btnCalculateTotal" OnClick="btnCalculateTotal_Click" Text="Calcular" runat="server" CssClass="btn btn-primary btn-block" />
                                                            </div>
                                                            <div class="col-md-2">
                                                                <asp:Button ID="btnCreateSale" OnClick="btnCreateSale_Click" Text="Crear venta" runat="server" CssClass="btn btn-success btn-block" />
                                                            </div>
                                                            <div class="col-md-2">
                                                                <asp:Button ID="btnAbortTransaction" OnClick="btnAbortTransaction_Click" Text="Cancelar" runat="server" CssClass="btn btn-danger btn-block" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <!-- End of tab content -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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

    <div id="toastQuantityVal" class="toast">
        <div class="toast-img toast-img-danger"><i class="fas fa-exclamation"></i></div>
        <div class="toast-body">
            <p style="text-align: justify;">
                La cantidad no debe
                <br />
                ser mayor a las existencias!
            </p>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script>   
        function launch_toast() {
            var el = document.getElementById("toast");
            el.classList.add("show");
            setTimeout(function () { el.classList.remove("show") }, 5000);
        }

        function SaleCreated_Toast() {
            var el = document.getElementById("toastSaleSuccess");
            el.classList.add("show");
            setTimeout(function () { el.classList.remove("show") }, 5000);
        }

        //function ShowModalDetail() {
        //    const isVisible = "is-visible";
        //    document.getElementById("odmodal").classList.add(isVisible);
        //}

        //document.getElementById("btnCloseModal").addEventListener("click", function (e) {
        //    e.preventDefault();
        //    this.parentElement.parentElement.parentElement.classList.remove("is-visible");
        //})

        //function ShowSdtList() {
        //    const isVisible = "is-visible";
        //    setTimeout(function () { document.getElementById("SdtModal").classList.add(isVisible); }, 500)
        //}

        //document.getElementById("btnCloseSdtModal").addEventListener("click", function (e) {
        //    e.preventDefault();
        //    this.parentElement.parentElement.parentElement.classList.remove("is-visible");
        //});

        function ModalDate() {
            var el = document.getElementById("toastDate");
            el.classList.add("show");
            setTimeout(function () { el.classList.remove("show") }, 5000);
        }

        function ToastQuantityVal() {
            var el = document.getElementById("toastQuantityVal");
            el.classList.add("show");
            setTimeout(function () { el.classList.remove("show") }, 5000);
        }
        function notificationVisible() {
            var buttom = document.getElementById("btnNotification");
            buttom.style.display = "inline";
        }

        function notificationinVisible() {
            var buttom = document.getElementById("btnNotification");
            buttom.style.display = "none";
        }
        //function validateProduct() {
        //    var Esquema = $('#ddlistCustomers').val();
        //    if (Esquema == "" ) {
        //        alert("Elige un cliente o escribe uno ai no está registrado"); 
        //    }
        //}

    </script>
</asp:Content>
