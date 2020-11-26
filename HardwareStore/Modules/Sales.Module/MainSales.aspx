<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainSales.aspx.cs" Inherits="HardwareStore.Modules.Sales.Module.MainSales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/cssSales.css" rel="stylesheet" />
    <link href="../../Styles/OrdersStyle.css" rel="stylesheet" />

	    <header id="main-header">		
		    <div id="logo-header">
			    <span class="site-name">Ventas</span>
		    </div> <!-- / #logo-header -->

		    <nav>
			    <ul>
				    <li><asp:Button CssClass="btnDark" runat="server" ID="btnBackToCreateSale" OnClick="btnBackToCreateSale_Click" Text="Nueva" /></li>
				    <li><asp:Button CssClass="btnDark" runat="server" ID="btnTblProducts" OnClick="btnTblProducts_Click" Text="Detalle Venta" /></li>
				    <li><asp:Button CssClass="btnDark" runat="server" ID="btnGoToListOrdersSales" OnClick="btnGoToListOrdersSales_Click" Text="Ver Ventas" /></li>
			    </ul>
		    </nav><!-- / nav -->

	    </header>
    <%--Inicio del Modal--%>
<%--    <div class="OdModal" id="odmodal" data-animation="slideInOutLeft">
        <div class="modal-dialog">
            <div class="modal-header">
                <h4 style="color: #fff;">Existencias Productos</h4>
                <%--<label runat="server" id="getidFromtable"></label>
                <button id="btnCloseModal" class="btnClose" data-close>✕</button>
            </div>
            <div class="modal-content">
                <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                    <ContentTemplate>
                        <div style="display: flex;">
                            <div class="col-42">
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtSearchWarehouseProduct" placeholder="Buscar..." />
                            </div>
                            <div style="margin-top: 15px">
                                <asp:Button CssClass="btnPrimary" runat="server"  Text="Buscar" ID="btnSearchWarehouseProduct" />
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
    </div>--%>
    <%-- Fin Sección del modal --%>

        <asp:MultiView ID="SalesView" ActiveViewIndex="0" runat="server">
            <asp:View runat="server">
                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                    <ContentTemplate>
                         <div class="containerSales">                
                            <div class="form-principal-sales">
                                <div style="display: flex">
                                    <div class="col-31"> 
                                        <h5 style="float: left; margin-left: 5px;">Producto</h5>
                                        <br />
                                        <br />
                                        <div style="display: inline-flex; float: left; width: 100%">
                                            <asp:TextBox ReadOnly="true" runat="server" ID="txtProduct" placeholder="Producto" CssClass="form-control" />                                 
                                             <asp:Button OnClientClick="ShowModalDetail()" ID="btnShowmodal" ToolTip="Crear Nueva Categoría" class="btnAdd" type="button" runat="server" Text="+" />
                                        </div>
                                    </div>
                                    <div class="col-31">
                                        <h5 style="float: left; margin-left: 5px;">Fecha</h5>
                                        <br />
                                        <br />
                                        <asp:TextBox TextMode="Date" runat="server" ID="txtDate" placeholder="Descuento" CssClass="form-control" />
                                    </div>
                                    <div class="col-31">
                                        <h5 style="float: left; margin-left: 5px;">Num Factura</h5>
                                        <br />
                                        <br />
                                        <asp:TextBox ReadOnly="true" runat="server" ID="txtNFact" placeholder="Número de Factura" CssClass="form-control" />
                                    </div>
                                </div>
                                <div style="display: flex">
                                    <div class="col-31"> 
                                        <h5 style="float: left; margin-left: 5px;">Vendedor</h5>
                                         <asp:TextBox ReadOnly="true" runat="server" ID="txtVendedor" placeholder="Nombre del Vendedor" CssClass="form-control" />
                                    </div>

                                    <div class="col-31"> 
                                        <h5 style="float: left; margin-left: 5px;">Bodega</h5>
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtBodega" CssClass="form-control" />
                                    </div>

                                    <div class="col-31"> 
                                        <h5 style="float: left; margin-left: 5px;">Proveedor</h5>
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtProveedor" CssClass="form-control" />
                                    </div>
                                </div>

                                <div style="display: flex">
                                    <div class="col-31"> 
                                        <h5 style="float: left; margin-left: 5px;">Marca</h5>
                                         <asp:TextBox ReadOnly="true" runat="server" ID="txtMarca" placeholder="Nombre del Vendedor" CssClass="form-control" />
                                    </div>

                                    <div class="col-31"> 
                                        <h5 style="float: left; margin-left: 5px;">Material</h5>
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtMaterial" CssClass="form-control" />
                                    </div>

                                    <div class="col-31"> 
                                        <h5 style="float: left; margin-left: 5px;">Dimensiones</h5>
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtDimensiones" CssClass="form-control" />
                                    </div>
                                </div>
                                <div style="display: flex">
                                    <div class="col-20">
                                        <h5 style="float: left; margin-left: 5px;">Unidad de Medida</h5>
                                        <br />
                                        <br />
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtUMedida" CssClass="form-control" />
                                    </div>
                                    <div class="col-20">
                                        <h5 style="float: left; margin-left: 5px;">Código de producto</h5>
                                        <br />
                                        <br />
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtCodigoProducto" CssClass="form-control" />
                                    </div>
                                    <div class="col-20">
                                        <h5 style="float: left; margin-left: 5px;">Existencia</h5>
                                        <br />
                                        <br />
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtExistencia" CssClass="form-control" />
                                    </div>
                                    <div class="col-31"> 
                                        <h5 style="float: left; margin-left: 5px;">Cantidad</h5>
                                        <br />
                                        <br />
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtcantidad" CssClass="form-control" />
                                    </div>
                                </div>
                                <div style="display: flex">
                                    <div class="col-42"> 
                                        <h5 style="float: left; margin-left: 5px;">Precio</h5>
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtPrecio" CssClass="form-control" />
                                    </div>
                                    <div class="col-25"> 
                                        <h5 style="float: left; margin-left: 5px;">Descuento</h5>
                                        <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtDescuento" CssClass="form-control" />
                                    </div>
                                </div>  
                                <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                                    <asp:Button runat="server" Text="Agregar"  ID="btnAddToDetailStageList" CssClass="btnSuccess" Style="margin-left: 10px" />
                                    <asp:Button runat="server" Text="Cancelar" ID="btnAbortAddToDetailStageList" CssClass="btnDanger" Style="margin-left: 10px" />
                                </div>
                    </ContentTemplate>
               </asp:UpdatePanel>
            </asp:View>

            <asp:View runat="server">
                <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                    <ContentTemplate>
                        <div style="margin-left: 3%; margin-right: 3%; margin-top: 4%">
                            <div style="display:flex; align-items:center; justify-content:space-between;">                                
                                <asp:Button CssClass="btnPrimary" runat="server" ID="btnUpdateTable" Text="Actualizar" />
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
                                    <asp:Button runat="server" Text="Filtrar" ID="btnFilterByDate" ValidationGroup="FormDateInput" CssClass="btnPrimary" Style="margin-left: 10px; margin-bottom: 30px;" />
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
                        <h5 style="text-align: center; margin-top: 90px">Tabla de Ventas</h5>

                        <%-- FIN DE LA TABLA --%>
                        <div style="display: flex">
                             <div class="col-31"> 
                                  <h5 style="float: left; margin-left: 5px;">Total</h5>
                                  <br />
                                  <br />
                                  <asp:TextBox TextMode="Number" ReadOnly="true" runat="server" ID="txtTotal" CssClass="form-control" />
                             </div>
                             <div class="col-31"> 
                                  <h5 style="float: left; margin-left: 5px;">Descuento</h5>
                                  <br />
                                  <br />
                                  <asp:TextBox TextMode="Number" runat="server" ID="txtDescuentototal" CssClass="form-control" />
                             </div>
                             <div class="col-31"> 
                                  <h5 style="float: left; margin-left: 5px;">Tipo de Moneda</h5>
                                  <br />
                                  <br />
                                  <br />
                                  <div style="display: flex;">
                                      <asp:DropDownList ID="ddlstMoneda" CssClass="form-control" Width="100%" Height="50px" runat="server">
                                          <asp:ListItem>--Seleccione--</asp:ListItem>
                                          <asp:ListItem>C$</asp:ListItem>
                                          <asp:ListItem>USD</asp:ListItem>
                                      </asp:DropDownList>
                                  </div>                                  
                             </div>        
                         </div>

                        <div style="display: flex">
                             <div title="Tasa de Cambio 35 C$" class="col-31"> 
                                  <h5 style="float: left; margin-left: 5px;">Pago</h5>
                                  <br />
                                  <br />
                                  <asp:TextBox TextMode="Number" runat="server" ID="txtpago" CssClass="form-control" />
                             </div>
                             <div class="col-31"> 
                                  <h5 style="float: left; margin-left: 5px;">Cambio</h5>
                                  <br />
                                  <br />
                                  <asp:TextBox TextMode="Number" runat="server" ID="txtCambio" CssClass="form-control" />
                             </div>       
                         </div>

                         <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                            <asp:Button ID="btnCalcularr" Text="Calcular" runat="server" CssClass="btnSuccess" />
                            <asp:Button ID="btnRegistrar" Text="Registrar Venta" runat="server" CssClass="btnSuccess" />
                            <asp:Button ID="btnCancelar" Text="Cancelar" runat="server" CssClass="btnDanger" />                            
                         </div>
                    </div>
                    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
 </asp:View>
</asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
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