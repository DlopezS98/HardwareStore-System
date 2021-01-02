<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HardwareStore.Modules.Home.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
        <ContentTemplate>
            <asp:LinkButton CssClass="btn btn-primary" Text="Historial de Ventas" runat="server" ID="btnHistSale" OnClick="btnHistSale_Click" />
            <h4 style="text-align: center; margin-top: 5px">Nueva venta</h4>
            <div class="containerSales">
                <form class="form-principal-sales needs-validation" novalidate>
                    <div class="accordion" id="accordionExample">
                        <div class="card">
                            <div class="card-header" id="headingOne">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Venta
                                    </button>
                                </h2>
                            </div>
                            <div id="collapseOne" class="collapse show needs-validation" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body">
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
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingTwo">
                                    <h2 class="d-flex justify-content-between mb-0">
                                        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            Detalles de Venta
                                        </button>
                                        <div id="btnNotification" class="bg-danger mt-2" style="height: 15px; width: 15px; border-radius: 7px; display: none"></div>
                                    </h2>
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                    <div class="card-body">
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
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnGoToListOrders" />
            <%--<asp:PostBackTrigger ControlID="btnCreateOrder" />--%>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
