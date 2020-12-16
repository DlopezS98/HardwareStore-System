<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainSales.aspx.cs" Inherits="HardwareStore.Modules.Sales.Module.MainSales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/cssSales.css" rel="stylesheet" />
    <link href="../../Styles/OrdersStyle.css" rel="stylesheet" />
    <link href="../../Styles/FloatingButtonStyles.css" rel="stylesheet" />
    <link href="../../Styles/Toast.css" rel="stylesheet" />
    <div class="container">

        <input type="checkbox" id="toggle">
        <label for="toggle" class="button"></label>

        <nav class="nav">
            <%--            <a href="#">Inicio</a>
            <a href="#">Contactame</a>
            <a href="#">Acerca de</a>
            <a href="#">Suscribete</a>--%>
            <asp:LinkButton ID="btnBackToCreateSale" OnClick="btnBackToCreateSale_Click" CssClass="textfloat" Text="Nueva" runat="server" />
            <asp:LinkButton ID="btnSaleDetailList" OnClick="btnSaleDetailList_Click" CssClass="textfloat" Text="Detalles" runat="server" />
            <asp:LinkButton ID="btnGoToListOrdersSales" OnClick="btnGoToListOrdersSales_Click" CssClass="textfloat" Text="Lista" runat="server" />
        </nav>

    </div>
    <div class="OdModal" id="odmodal" data-animation="slideInOutLeft">
        <div class="modal-dialog">
            <div class="modal-header">
                <h4 style="color: #fff;">Existencias Productos</h4>
                <label runat="server" id="getidFromtable"></label>
                <button id="btnCloseModal" class="btnClose" data-close>✕</button>
            </div>
            <div class="modal-content">
                <asp:UpdatePanel runat="server" ID="updatePanel4">
                    <ContentTemplate>
                        <div style="display: flex;">
                            <div class="col-42">
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtSearchWarehouseProduct" placeholder="Buscar..." />
                            </div>
                            <div style="margin-top: 15px">
                                <asp:Button CssClass="btnPrimary" runat="server" Text="Buscar" ID="btnSearchWarehouseProduct" OnClick="btnSearchWarehouseProduct_Click" />
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
    <%-- Fin Sección del modal --%>
    <div style="border-bottom: 1px solid #ddd; border-left: 1px solid #ddd; border-right: 1px solid #ddd; border-top: 1.5px solid #0D9DBB; background: #F9F9F9; margin-bottom: 10px; border-radius: 10px; max-width: 100%; margin-top: 30px;">
        <asp:MultiView ID="SalesView" ActiveViewIndex="0" runat="server">
            <asp:View runat="server">
                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                    <ContentTemplate>
                        <div class="containerSales">
                            <div class="form-principal-sales">
                                <br />
                                <br />
                                <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Bodega" runat="server" ID="txtWarehouseId" class="form-control" />
                                <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Producto" runat="server" ID="txtProductId" class="form-control" />
                                <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Proveedor" runat="server" ID="txtSupplierId" class="form-control" />
                                <asp:TextBox Visible="false" TextMode="Number" placeholder="Id Currency" runat="server" ID="txtCurrencyExchangeId" class="form-control" />
                                <asp:TextBox ReadOnly="true" runat="server" Visible="false" ID="txtWarehouseName" CssClass="form-control" />
                                <div style="display: flex">
                                    <div class="col-31">
                                        <h5 style="float: left; margin-left: 5px;">Producto</h5>
                                        <br />
                                        <br />
                                        <div style="display: inline-flex; float: left; width: 100%;">
                                            <asp:TextBox ReadOnly="true" runat="server" ID="txtProduct" placeholder="Producto" CssClass="form-control form-disable" />
                                            <asp:Button OnClientClick="ShowModalDetail()" ID="btnShowmodal" ToolTip="Seleccionar Producto" class="btnAdd" type="button" runat="server" Text="+" />
                                        </div>
                                    </div>
                                    <div class="col-31">
                                        <h5 style="float: left; margin-left: 5px;">Clientes</h5>
                                        <div style="display: inline-flex; float: left; width: 100%">
                                            <asp:DropDownList ID="ddlistCustomers" AutoPostBack="true" OnSelectedIndexChanged="ddlistCustomers_SelectedIndexChanged" CssClass="form-control" Width="100%" Height="50px" runat="server">
                                            </asp:DropDownList>
                                            <asp:Button ID="Button1" ToolTip="Crear Cliente" class="btnAdd" type="button" runat="server" Text="+" />
                                        </div>
                                    </div>
                                    <div class="col-31">
                                        <h5 style="float: left; margin-left: 5px;">Nombre Cliente</h5>
                                        <asp:TextBox runat="server" ID="txtCustomer" placeholder="Cliente" CssClass="form-control" />
                                    </div>
                                    <div class="col-31">
                                        <h5 style="float: left; margin-left: 5px;">Marca</h5>
                                        <div style="margin-left: 10px">
                                            <asp:TextBox ReadOnly="true" runat="server" ID="txtBrand" placeholder="Marca" CssClass="form-control form-disable" />
                                        </div>
                                    </div>
                                </div>
                                <div style="display: flex">
                                    <div class="col-31">
                                        <h5 style="float: left; margin-left: 5px;">Material</h5>
                                        <asp:TextBox ReadOnly="true" runat="server" ID="txtMaterialType" CssClass="form-control form-disable" />
                                    </div>

                                    <div class="col-31">
                                        <h5 style="float: left; margin-left: 5px;">Código Producto</h5>
                                        <div style="margin-left: 10px">
                                            <asp:TextBox ReadOnly="true" runat="server" ID="txtProductCode" CssClass="form-control form-disable" />
                                        </div>
                                    </div>
                                    <div class="col-31">
                                        <h5 style="float: left; margin-left: 5px;">Unidad de Medida</h5>
                                        <br />
                                        <br />
                                        <div style="margin-left: 10px">
                                            <asp:TextBox ReadOnly="true" runat="server" ID="txtMeasureUnit" CssClass="form-control form-disable" />
                                        </div>
                                    </div>
                                    <div class="col-31">
                                        <h5 style="float: left; margin-left: 5px;">Dimensiones</h5>
                                        <div style="margin-left: 10px">
                                            <asp:TextBox ReadOnly="true" runat="server" ID="txtDimensions" CssClass="form-control form-disable" />
                                        </div>
                                    </div>
                                </div>
                                <div style="display: flex">

                                    <div class="col-31">
                                        <h5 style="float: left; margin-left: 5px;">Existencia</h5>
                                        <br />
                                        <br />
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtProductStock" CssClass="form-control form-disable" />
                                    </div>
                                    <div class="col-31">
                                        <h5 style="float: left; margin-left: 5px;">Cantidad</h5>
                                        <br />
                                        <br />
                                        <div style="margin-left: 10px">
                                            <asp:TextBox TextMode="Number" runat="server" ID="txtQuantity" CssClass="form-control" />
                                        </div>
                                    </div>

                                    <div class="col-31">
                                        <h5 style="float: left; margin-left: 5px;">Precio</h5>
                                        <div style="margin-left: 10px">
                                            <asp:TextBox ReadOnly="true" runat="server" ID="txtPrice" CssClass="form-control form-disable" />
                                        </div>
                                    </div>
                                    <div class="col-31">
                                        <h5 style="float: left; margin-left: 5px;">Descuento</h5>
                                        <div style="margin-left: 10px">
                                            <asp:TextBox TextMode="Number" runat="server" ID="txtDetailDiscount" CssClass="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                                    <asp:Button runat="server" Text="Agregar" ID="btnAddToDetailStageList" OnClick="btnAddToDetailStageList_Click" CssClass="btnSuccess" Style="margin-left: 10px" />
                                    <asp:Button runat="server" Text="Cancelar" ID="btnAbortAddToDetailStageList" OnClick="btnAbortAddToDetailStageList_Click" CssClass="btnDanger" Style="margin-left: 10px" />
                                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:View>

            <asp:View runat="server">
                <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                    <ContentTemplate>
                        <div style="margin-left: 3%; margin-right: 3%; margin-top: 4%">
                            <div style="display: flex; align-items: center; justify-content: space-between;">
                                <asp:Button CssClass="btnPrimary" OnClick="btnUpdateTable_Click" runat="server" ID="btnUpdateTable" Text="Actualizar" />
                            </div>
                            <div style="display: flex">
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Desde</h6>
                                    <div style="display: flex">
                                        <input runat="server" type="date" name="Type" id="DatepickerFrom" class="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="DatepickerFrom" ValidationGroup="FormDateInput" ErrorMessage="Seleccione una fecha valida"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-31">
                                    <h6 style="margin-left: 10px">Hasta</h6>
                                    <div style="display: flex">
                                        <input runat="server" type="date" name="Type" id="DatepickerTo" class="form-control" />
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="DatepickerTo" ValidationGroup="FormDateInput" ErrorMessage="Seleccione una fecha valida"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-25" style="display: flex; align-items: flex-end;">
                                    <asp:Button runat="server" Text="Filtrar" ID="btnFilterByDate" OnClick="btnFilterByDate_Click" ValidationGroup="FormDateInput" CssClass="btnPrimary" Style="margin-left: 10px; margin-bottom: 30px;" />
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

                        <div class="OdModal" id="SdtModal" data-animation="slideInOutLeft">
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
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:View>
            <%-- Tabla --%>
            <asp:View runat="server">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <h4 style="text-align: center; margin-top: 90px">Detalle de venta</h4>
                        <div class="ContainerPedidos">
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
                        <%-- FIN DE LA TABLA --%>
                        <div style="display: flex; justify-content: center;">
                            <div style="display: flex">
                                <div class="col-15">
                                    <h5 style="float: left; margin-left: 5px;">Subtotal</h5>
                                    <br />
                                    <br />
                                    <div style="margin-left: 10px">
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtSubtotal" CssClass="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-15">
                                    <h5 style="float: left; margin-left: 5px;">Descuento</h5>
                                    <br />
                                    <br />
                                    <div style="margin-left: 10px">
                                        <asp:TextBox TextMode="Number" runat="server" ID="txtTotalDiscount" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-15">
                                    <h5 style="float: left; margin-left: 5px;">Total</h5>
                                    <br />
                                    <br />
                                    <div style="margin-left: 10px">
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtTotal" CssClass="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-20">
                                    <h5 style="float: left; margin-left: 5px;">Tipo de Moneda</h5>
                                    <br />
                                    <br />
                                    <br />

                                    <div style="margin-left: 10px">
                                        <asp:DropDownList ID="ddlistForeignCurrencies" AutoPostBack="true" OnSelectedIndexChanged="ddlistForeignCurrencies_SelectedIndexChanged" CssClass="form-control" Width="100%" Height="50px" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-20">
                                    <h5 style="float: left; margin-left: 5px;">Moneda local</h5>
                                    <br />
                                    <br />
                                    <br />
                                    <div style="margin-left: 10px">
                                        <asp:DropDownList ID="ddlistLocalCurrencies" CssClass="form-control" Width="100%" Height="50px" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div style="display: flex; justify-content: center;">
                            <div style="display: flex">

                                <div class="col-15">
                                    <h5 style="float: left; margin-left: 5px;">Compra</h5>
                                    <br />
                                    <br />
                                    <div style="margin-left: 10px">
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtCurrencyPurchase" CssClass="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-15">
                                    <h5 style="float: left; margin-left: 5px;">Venta</h5>
                                    <br />
                                    <br />
                                    <div style="margin-left: 10px">
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtCurrencySale" CssClass="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-15">
                                    <h5 style="float: left; margin-left: 5px;">Pago</h5>
                                    <br />
                                    <br />
                                    <div style="margin-left: 10px">
                                        <asp:TextBox TextMode="Number" runat="server" ID="txtPayment" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-15">
                                    <h5 style="float: left; margin-left: 5px;">Conversión</h5>
                                    <br />
                                    <br />
                                    <div style="margin-left: 10px">
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtConversion" CssClass="form-control form-disable" />
                                    </div>
                                </div>
                                <div class="col-15">
                                    <h5 style="float: left; margin-left: 5px;">Cambio</h5>
                                    <br />
                                    <br />
                                    <div style="margin-left: 10px">
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtPaymentChange" CssClass="form-control form-disable" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                            <asp:Button ID="btnCalculateTotal" OnClick="btnCalculateTotal_Click" Text="Calcular" runat="server" CssClass="btnSuccess" />
                            <asp:Button ID="btnCreateSale" OnClick="btnCreateSale_Click" Text="Registrar Venta" runat="server" CssClass="btnSuccess" />
                            <asp:Button ID="btnAbortTransaction" OnClick="btnAbortTransaction_Click" Text="Cancelar" runat="server" CssClass="btnDanger" />
                        </div>
                        </div>
                    </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:View>
        </asp:MultiView>
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

        function ShowModalDetail() {
            const isVisible = "is-visible";
            document.getElementById("odmodal").classList.add(isVisible);
        }

        document.getElementById("btnCloseModal").addEventListener("click", function (e) {
            e.preventDefault();
            this.parentElement.parentElement.parentElement.classList.remove("is-visible");
        })

        function ShowSdtList() {
            const isVisible = "is-visible";
            setTimeout(function () { document.getElementById("SdtModal").classList.add(isVisible); }, 500)
        }

        document.getElementById("btnCloseSdtModal").addEventListener("click", function (e) {
            e.preventDefault();
            this.parentElement.parentElement.parentElement.classList.remove("is-visible");
        });

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

    </script>
</asp:Content>
