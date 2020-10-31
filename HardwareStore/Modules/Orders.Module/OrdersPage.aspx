<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="HardwareStore.Modules.Orders.Module.OrdersPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/Toast.css" rel="stylesheet" />


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
    <div style="border-bottom: 1px solid #ddd;border-left: 1px solid #ddd; border-right: 1px solid #ddd; border-top: 1.5px solid #0D9DBB;; background: #fff; margin-bottom: 10px; border-radius: 10px; max-width: 100%; margin-top: 30px;">
        <h1 style="text-align: center;">Módulo Pedidos / Compras</h1>
        <label runat="server" id="warehouseId"></label>
        <label runat="server" id="proddetailid"></label>
        
        <asp:MultiView ID="OrdersView" ActiveViewIndex="0" runat="server">
            <asp:View runat="server">
                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                    <ContentTemplate>
                        <%-- Inicio formulario principal --%>
                        <div class="ContainerPedidos" style="padding-left: 24px; padding-right: 24px;">
                            <div style="text-align: center">
                                <h2 class="titleVenta">Nuevo Pedido</h2>
                                <h5 runat="server" id="msgCreate"></h5>
                            </div>
                            <div><asp:Button CssClass="btnPrimary" runat="server" ID="btnGoToListOrders" OnClick="btnGoToListOrders_Click" Text="Ver Pedidos" /></div>
                            <hr />
                            <div style="display: flex; flex-wrap: wrap;">
                                <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Bodega" runat="server" ID="txtWarehouseId" class="form-control" />
                                <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Producto" runat="server" ID="txtProductId" class="form-control" />
                                <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Proveedor" runat="server" ID="txtSupplierId" class="form-control" />
                                <asp:TextBox Visible="false" placeholder="Bodega" runat="server" ID="txtWarehouseName" class="form-control" />
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Bodegas</h6>
                                    <div style="display: flex;">
                                        <asp:DropDownList ID="ddlstWarehouses" CssClass="form-control" Width="100%" Height="40px" runat="server">
                                        </asp:DropDownList>
                                        <button class="btnAdd" type="button" runat="server" onclick="launch_toast()">+</button>
        <%--                                <asp:LinkButton CssClass="btnAdd" runat="server">+</asp:LinkButton>--%>
                                    </div>
                                    <asp:RequiredFieldValidator ID="reqValddlWarehouse" ValidationGroup="DetailsGroup" runat="server" InitialValue="0" ControlToValidate="ddlstWarehouses" ForeColor="Red" ErrorMessage="Seleccione una bodega destino"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">N Pedido</h6>
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
                                    <h6 style="margin-left: 10px">Producto</h6>
                                    <div style="display: flex">
                                        <asp:TextBox ReadOnly="true" placeholder="Producto" runat="server" ID="txtProduct" class="form-control" />
                                        <%-- <asp:LinkButton data-open="odmodal" style="display: flex; margin-top: 5px" runat="server"><i class="fas fa-plus-circle" style="margin: 10px; color: #00A350"></i></asp:LinkButton>--%>
                                        <button id="btnShowmodal" onclick="ShowModalDetail()" type="button" class="btnAdd" data-open="odmodal">+
                                        </button>
                                    </div>
                                    <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="reqValProduct" ValidationGroup="DetailsGroup" ControlToValidate="txtProduct" ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Código</h6>
                                    <div style="display: flex">
                                        <asp:TextBox ReadOnly="true" placeholder="Código producto" runat="server" ID="txtDefaultCode" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Marca</h6>
                                    <div style="display: flex">
                                        <asp:TextBox ReadOnly="true" placeholder="Marca" runat="server" ID="txtBrand" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Proveedor</h6>
                                    <div style="display: flex">
                                        <asp:TextBox ReadOnly="true" placeholder="Proveedor" runat="server" ID="txtSupplier" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Material</h6>
                                    <div style="display: flex">
                                        <asp:TextBox ReadOnly="true" placeholder="Material" runat="server" ID="txtMaterialType" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Dimensiones</h6>
                                    <div style="display: flex">
                                        <asp:TextBox ReadOnly="true" placeholder="Dimensiones" runat="server" ID="txtDimensions" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Unidad de medida</h6>
                                    <div style="display: flex">
                                        <asp:TextBox ReadOnly="true" placeholder="Unidad de medida" runat="server" ID="txtMeasureUnit" CssClass="form-control" />
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
                        <%-- Tabla de productos --%>
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
                        <%-- Fin de la tabla --%>
                        <%-- Inicio del formulario del total a pagar --%>
                        <div class="ContainerPedidos">
                            <div style="display: flex; flex-wrap: wrap;">
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Sub Total</h6>
                                    <div style="display: flex">
                                        <div class="spanType">
                                            <span>C$</span>
                                        </div>
                                        <asp:TextBox ReadOnly="true" runat="server" ID="txtSubtotal" placeholder="Subtotal" CssClass="form-control  " />
                                    </div>
                                    <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="reqValSubtotal" ValidationGroup="OrderGroup" ControlToValidate="txtSubtotal" ErrorMessage="Campo requerido" ></asp:RequiredFieldValidator>
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
                                            <asp:TextBox ReadOnly="true" placeholder="Total" runat="server" ID="txtTotal" CssClass="form-control" />
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
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnGoToListOrders" />
                        <asp:PostBackTrigger ControlID="btnCreateOrder" />
                    </Triggers>
                </asp:UpdatePanel>
                <%-- Fin del formulario --%>
            </asp:View>
            <asp:View runat="server">
                <div><asp:Button CssClass="btnSuccess" runat="server" ID="btnBackToCreateOrder" OnClick="btnBackToCreateOrder_Click" Text="Crear Pedido" /></div>
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

    
    <%--Toast--%>

    <div id="toast">
        <div id="img"><i class="fas fa-exclamation"></i></div>
        <div id="desc">
            <p style="text-align:justify;">El producto ya existe en la lista! <br /> Edite el existente en su lugar...</p>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../../Scripts/Modules/OrderModule.js"></script>
    <%--<script src="../../Scripts/Modal/Modal.js"></script>--%>
    <script>
        function launch_toast() {
            var x = document.getElementById("toast")
            x.className = "show";
            setTimeout(
                function () {
                    x.className = x.className.replace("show", "");
                }, 5000);
        }

        function ShowModalDetail(odmodal) {
            const isVisible = "is-visible";
            document.getElementById("odmodal").classList.add(isVisible);
        }

        document.getElementById("btnCloseModal").addEventListener("click", function (e) {
            e.preventDefault();
            this.parentElement.parentElement.parentElement.classList.remove("is-visible");
        })
    </script>
</asp:Content>
