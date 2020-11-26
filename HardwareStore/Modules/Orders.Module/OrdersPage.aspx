<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="HardwareStore.Modules.Orders.Module.OrdersPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/Toast.css" rel="stylesheet" />
    <link href="../../Styles/OrdersStyle.css" rel="stylesheet" />
    <%--header--%>
	<header id="main-header">		
		<div id="logo-header">
			<span class="site-name">Modulo pedido / Compra</span>
		</div> <!-- / #logo-header -->

		<nav>
			<ul>
				<li><asp:Button CssClass="btnDark" runat="server" ID="btnBackToCreateOrder" OnClick="btnBackToCreateOrder_Click" Text="Nuevo" /></li>
				<li><asp:Button CssClass="btnDark" runat="server" ID="btnTblProducts" OnClick="btnTblProducts_Click" Text="Detalle Compra" /></li>
				<li><asp:Button CssClass="btnDark" runat="server" ID="btnGoToListOrders" OnClick="btnGoToListOrders_Click" Text="Ver Pedidos" /></li>
			</ul>
		</nav><!-- / nav -->

	</header>
    <%--Fin del Header--%>
    <%-- Sección del modal --%>
    <div class="OdModal" id="odmodal" data-animation="slideInOutLeft">
        <div class="modal-dialog">
            <div class="modal-header">
                <h4 style="color: #fff;">Existencias Productos</h4>
                <%--<label runat="server" id="getidFromtable"></label>--%>
                <button id="btnCloseModal" class="btnClose" data-close>✕</button>
            </div>
            <div class="modal-content">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <div style="display: flex;">
                            <div class="col-42">
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtSearchWarehouseProduct" placeholder="Buscar..." />
                            </div>
                            <div style="margin-top: 15px">
                                <asp:Button CssClass="btnPrimary" runat="server" OnClick="btnSearchWarehouseProduct_Click" Text="Buscar" ID="btnSearchWarehouseProduct" />
                            </div>
                        </div>
                        <asp:GridView runat="server" DataKeyNames="Fk_WarehouseID,Fk_ProductDetailID" AutoGenerateColumns="false"
                            ID="GridViewWarehouseProducts" OnRowCommand="GridViewWarehouseProducts_RowCommand" CssClass="headerTable" CellPadding="5">
                            <Columns>
                                <asp:BoundField HeaderText="ID Bodega" DataField="Fk_WarehouseID" Visible="false" />
                                <asp:BoundField HeaderText="ID Producto" DataField="Fk_ProductDetailID" Visible="false" />
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
    <%-- Fin Sección del modal --%>
    <div style="border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; border-right: 1px solid #ddd; border-top: 1.5px solid #0D9DBB; background: #F9F9F9; margin-bottom: 10px; border-radius: 10px; max-width: 100%; margin-top: 30px;">
        
        <label runat="server" id="warehouseId"></label>
        <label runat="server" id="proddetailid"></label>

        <asp:MultiView ID="OrdersView" ActiveViewIndex="0" runat="server">
            <asp:View runat="server">
                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                    <ContentTemplate>
                        <%-- Inicio formulario principal --%>
                        <div class="ContainerPedidos" style="padding-left: 24px; padding-right: 24px;">
                            <div style="text-align: center">
                                <h2 runat="server" class="titleVenta" id="ShowMessage"></h2>
                            </div>
                            <hr />
                            <div id="formdetail" style="display: flex; flex-wrap: wrap;">
                                <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Bodega" runat="server" ID="txtWarehouseId" class="form-control" />
                                <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Producto" runat="server" ID="txtProductId" class="form-control" />
                                <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Proveedor" runat="server" ID="txtSupplierId" class="form-control" />
                                <asp:TextBox Visible="false" placeholder="Bodega" runat="server" ID="txtWarehouseName" class="form-control" />
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Producto</h6>
                                    <div style="display: flex; ">
                                        <asp:TextBox ReadOnly="true" placeholder="Producto" runat="server" ID="txtProduct" class="form-control form-disable" />
                                        <%-- <asp:LinkButton data-open="odmodal" style="display: flex; margin-top: 5px" runat="server"><i class="fas fa-plus-circle" style="margin: 10px; color: #00A350"></i></asp:LinkButton>--%>
                                        <asp:Button runat="server" ToolTip="Agregar producto" ID="btnShowmodal" OnClientClick="ShowModalDetail()" type="button" class="btnAdd" data-open="odmodal" Text="+" />
                                    </div>
                                    <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="reqValProduct" ValidationGroup="DetailsGroup" ControlToValidate="txtProduct" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Bodegas</h6>
                                    <div style="display: flex;">
                                        <asp:DropDownList ID="ddlstWarehouses" CssClass="form-control" Width="100%" Height="50px" runat="server">
                                        </asp:DropDownList>
                                        <asp:Button ToolTip="Crear nueva bodega" class="btnAdd" type="button" runat="server" Text="+" />
                                    </div>
                                    <asp:RequiredFieldValidator ID="reqValddlWarehouse" ValidationGroup="DetailsGroup" runat="server" InitialValue="0" ControlToValidate="ddlstWarehouses" ForeColor="Red" ErrorMessage="Seleccione una bodega destino"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Proveedores</h6>
                                    <div style="display: flex;">
                                        <asp:DropDownList ID="ddlstSuppliers" CssClass="form-control" Width="100%" Height="50px" runat="server">
                                        </asp:DropDownList>
                                        <asp:Button ToolTip="Crear nuevo proveedor" class="btnAdd" type="button" runat="server" Text="+" />
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="DetailsGroup" runat="server" InitialValue="0" ControlToValidate="ddlstSuppliers" ForeColor="Red" ErrorMessage="Seleccione un proveedor"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="OrderGroup" runat="server" InitialValue="0" ControlToValidate="ddlstSuppliers" ForeColor="Red" ErrorMessage="Seleccione un proveedor"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Número Factura</h6>
                                    <div style="display: flex">
                                        <asp:TextBox placeholder="Número Factura" runat="server" ID="txtOrdNumber" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Precio</h6>
                                    <div style="display: flex">
                                        <asp:TextBox TextMode="Number" step="0.01" placeholder="Precio" runat="server" ID="txtPrice" class="form-control" />
                                    </div>
                                    <div>
                                        <asp:RangeValidator Type="Double" runat="server" MinimumValue="0.1" MaximumValue="99999999999" ForeColor="Red" ID="RangeValidator1" ValidationGroup="DetailsGroup" ControlToValidate="txtPrice" ErrorMessage="Ingrese un precio válido"></asp:RangeValidator>
                                    </div>
                                    <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="reqPrice" ValidationGroup="DetailsGroup" ControlToValidate="txtPrice" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Código</h6>
                                    <div style="display: flex">
                                        <asp:TextBox ReadOnly="true" placeholder="Código producto" runat="server" ID="txtDefaultCode" CssClass="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Marca</h6>
                                    <div style="display: flex">
                                        <asp:TextBox ReadOnly="true" placeholder="Marca" runat="server" ID="txtBrand" CssClass="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Material</h6>
                                    <div style="display: flex">
                                        <asp:TextBox ReadOnly="true" placeholder="Material" runat="server" ID="txtMaterialType" CssClass="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Dimensiones</h6>
                                    <div style="display: flex">
                                        <asp:TextBox ReadOnly="true" placeholder="Dimensiones" runat="server" ID="txtDimensions" CssClass="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Unidad de medida</h6>
                                    <div style="display: flex">
                                        <asp:TextBox ReadOnly="true" placeholder="Unidad de medida" runat="server" ID="txtMeasureUnit" CssClass="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Cantidad</h6>
                                    <div style="display: flex">
                                        <asp:TextBox ID="txtQuantity" placeholder="Cantidad" TextMode="Number" runat="server" CssClass="form-control" />
                                    </div>
                                    <div>
                                        <asp:RangeValidator Type="Integer" runat="server" MinimumValue="1" MaximumValue="1000" ForeColor="Red" ID="valRangeQuantity" ValidationGroup="DetailsGroup" ControlToValidate="txtQuantity" ErrorMessage="La cantidad debe ser entre 1 o 1000"></asp:RangeValidator>
                                    </div>
                                    <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="reqQuantity" ValidationGroup="DetailsGroup" ControlToValidate="txtQuantity" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Descuento (%)</h6>
                                    <div style="display: flex">
                                        <asp:TextBox ID="txtDetailDiscount" runat="server" placeholder="Descuento (%)" TextMode="Number" CssClass="form-control" />
                                    </div>
                                    <div>
                                        <asp:RangeValidator Type="Integer" runat="server" MinimumValue="0" MaximumValue="100" ForeColor="Red" ID="valRangeDiscount" ValidationGroup="DetailsGroup" ControlToValidate="txtDetailDiscount" ErrorMessage="El descuento debe ser entre 0 y 100"></asp:RangeValidator>
                                    </div>
                                    <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="reqDiscount" ValidationGroup="DetailsGroup" ControlToValidate="txtDetailDiscount" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                </div>
                                <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                                    <asp:Button runat="server" Text="Agregar" ValidationGroup="DetailsGroup" OnClick="btnAddToDetailStageList_Click" ID="btnAddToDetailStageList" CssClass="btnSuccess" Style="margin-left: 10px" />
                                    <asp:Button runat="server" Text="Cancelar" OnClick="btnAbortAddToDetailStageList_Click" ID="btnAbortAddToDetailStageList" CssClass="btnDanger" Style="margin-left: 10px" />
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
                        <div style="margin-left: 3%; margin-right: 3%; margin-top: 4%">
                            <div style="display:flex; align-items:center; justify-content:space-between;">                                
                                <asp:Button CssClass="btnPrimary" runat="server" ID="btnUpdateTable" Text="Actualizar" OnClick="btnUpdateTable_Click" />
                            </div>
                            <div style="display: flex">
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Desde</h6>
                                    <div style="display: flex">
                                        <input runat="server" type="date" name="Type" id="DatepickerFrom" class="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="DatepickerFrom" ValidationGroup="FormDateInput" ErrorMessage="Seleccione una fecha valida" ></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Hasta</h6>
                                    <div style="display: flex">
                                        <input runat="server" type="date" name="Type" id="DatepickerTo" class="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="DatepickerTo" ValidationGroup="FormDateInput" ErrorMessage="Seleccione una fecha valida" ></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-25" style="display:flex; align-items:flex-end;">
                                    <asp:Button runat="server" Text="Filtrar" ID="btnFilterByDate" ValidationGroup="FormDateInput" OnClick="btnFilterByDate_Click" CssClass="btnPrimary" Style="margin-left: 10px; margin-bottom: 30px;" />
                                </div>
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

                        <div class="OdModal" id="OdtModal" data-animation="slideInOutLeft">
                            <div class="modal-dialog">
                                <div class="modal-header">
                                    <h4 style="color: #fff;" id="titleOdtModal">Detalle de compra</h4>
                                    <button id="btnCloseOdtModal" class="btnClose" data-close>✕</button>
                                </div>
                                <div class="modal-content">
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
                            <asp:GridView runat="server" DataKeyNames="Fk_WarehouseID,Fk_ProductDetailID" AutoGenerateColumns="false"
                                ID="GridViewOrderDetailsStage" OnRowCommand="GridViewOrderDetailsStage_RowCommand" CssClass="headerTable" BorderStyle="None">
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
                            <div style="display: flex; flex-wrap: wrap;">
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Sub Total</h6>
                                    <div style="display: flex">
                                        <div class="spanType">
                                            <span>C$</span>
                                        </div>
                                        <div style="padding-left: 12%; width: 100%">
                                            <asp:TextBox ReadOnly="true" runat="server" ID="txtSubtotal" placeholder="Subtotal" CssClass="form-control form-disable" />
                                        </div>
                                    </div>
                                    <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="reqValSubtotal" ValidationGroup="OrderGroup" ControlToValidate="txtSubtotal" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">IVA</h6>
                                    <div style="display: flex">
                                        <asp:TextBox TextMode="Number" step="0.01" runat="server" ID="txtTotalTax" placeholder="IVA" CssClass="form-control" />
                                    </div>
                                    <div>
                                        <asp:RangeValidator Type="Double" runat="server" MinimumValue="0" MaximumValue="99999999999" ForeColor="Red" ID="valRangeTotalTax" ValidationGroup="OrderGroup" ControlToValidate="txtTotalTax" ErrorMessage="Ingrese un valor válido"></asp:RangeValidator>
                                    </div>
                                    <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="reqValTotalTax" ValidationGroup="OrderGroup" ControlToValidate="txtTotalTax" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Descuento</h6>
                                    <div style="display: flex">
                                        <asp:TextBox TextMode="Number" runat="server" ID="txtTotalDiscount" placeholder="Descuento" CssClass="form-control" />
                                    </div>
                                    <div>
                                        <asp:RangeValidator Type="Integer" runat="server" MinimumValue="0" MaximumValue="100" ForeColor="Red" ID="RangeValidator2" ValidationGroup="OrderGroup" ControlToValidate="txtTotalDiscount" ErrorMessage="El descuento debe ser entre 0 y 100"></asp:RangeValidator>
                                    </div>
                                    <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator1" ValidationGroup="OrderGroup" ControlToValidate="txtTotalDiscount" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Total</h6>
                                    <div style="display: flex">
                                        <div class="spanType">
                                            <span>C$</span>
                                        </div>
                                        <div style="width: 100%">
                                            <asp:TextBox ReadOnly="true" placeholder="Total" runat="server" ID="txtTotal" CssClass="form-control form-disable" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                                <asp:Button runat="server" Text="Calcular" ValidationGroup="" OnClick="btnRecalculateOrderTotal_Click" ID="btnRecalculateOrderTotal" CssClass="btnSuccess" Style="margin-left: 10px" />
                                <asp:Button runat="server" Text="Registrar Orden" ValidationGroup="OrderGroup" ID="btnCreateOrder" OnClick="btnCreateOrder_Click" CssClass="btnSuccess" Style="margin-left: 10px" />
                                <asp:Button runat="server" Text="Cancelar" ID="btnCancelOrder" OnClick="btnCancelOrder_Click" CssClass="btnDanger" Style="margin-left: 10px" />
                            </div>
                        </div>
                        <%-- Fin de la tabla --%>
                     </ContentTemplate>
                </asp:UpdatePanel>
            </asp:View>
        </asp:MultiView>
    </div>
    <%--Toast--%>

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
            <p style="text-align: justify;">La fecha incio no debe<br />ser mayor a la fecha final!</p>
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

        function ShowModalDetail() {
            const isVisible = "is-visible";
            document.getElementById("odmodal").classList.add(isVisible);
        }

        document.getElementById("btnCloseModal").addEventListener("click", function (e) {
            e.preventDefault();
            this.parentElement.parentElement.parentElement.classList.remove("is-visible");
        })

        function ShowOdtList() {
            const isVisible = "is-visible";
            setTimeout(function () { document.getElementById("OdtModal").classList.add(isVisible); }, 500)
        }

        document.getElementById("btnCloseOdtModal").addEventListener("click", function (e) {
            e.preventDefault();
            this.parentElement.parentElement.parentElement.classList.remove("is-visible");
        });

        function ModalDate() {
            var el = document.getElementById("toastDate")
            el.classList.add("show");
            setTimeout(function () { el.classList.remove("show") }, 5000);
        }
    </script>
</asp:Content>
