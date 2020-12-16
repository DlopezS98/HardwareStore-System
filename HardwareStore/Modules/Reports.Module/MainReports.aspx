<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainReports.aspx.cs" Inherits="HardwareStore.Modules.Reports.Module.MainReports" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Styles/Toast.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <div class="container mt-3">
                <asp:MultiView runat="server" ID="MultiviewReports" ActiveViewIndex="0">
                    <asp:View runat="server">
                        <div class="jumbotron">
                            <h1>Reportes</h1>
                            <hr />
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="card text-center p-3">
                                        <h4>Productos</h4>
                                        <asp:Button runat="server"
                                            ID="btnProductReport" OnClick="btnProductReport_Click"
                                            class="btn btn-primary" Text="Crear Reporte" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card text-center p-3">
                                        <h4>Existencias</h4>
                                        <asp:Button runat="server"
                                            ID="btnStockReport" OnClick="btnStockReport_Click"
                                            class="btn btn-primary" Text="Crear Reporte" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card text-center p-3">
                                        <h4>Ventas</h4>
                                        <asp:Button runat="server"
                                            ID="btnSalesReport" OnClick="btnSalesReport_Click"
                                            class="btn btn-primary" Text="Crear Reporte" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card text-center p-3">
                                        <h4>Compras</h4>
                                        <asp:Button runat="server"
                                            ID="btnPurchaseReport" OnClick="btnPurchaseReport_Click"
                                            class="btn btn-primary" Text="Crear Reporte" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                    </asp:View>
                    <asp:View runat="server">
                        <h3>Lista de productos</h3>
                        <div class="row">
                            <asp:Button Text="Vista principal" runat="server" ID="btnGoToMainView" OnClick="btnGoToMainView_Click" />
                        </div>
                        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%">
                            <LocalReport ReportPath="Data\Report1.rdlc">
                            </LocalReport>
                        </rsweb:ReportViewer>
                    </asp:View>

                    <asp:View runat="server">
                        <h3>Existencia de los productos</h3>
                        <div class="text-right">
                            <asp:Button Text="Vista principal" CssClass="btn btn-primary" runat="server" ID="btnGoToMainView1" OnClick="btnGoToMainView_Click" />
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-5">
                                <label>Filtrar por bodegas</label>
                                <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlistFilterByWarehouse" OnSelectedIndexChanged="ddlistFilterByWarehouse_SelectedIndexChanged" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <rsweb:ReportViewer ID="ReportViewerProductStock" runat="server" ClientIDMode="AutoID" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="100%">
                            <LocalReport ReportPath="Data\StockReport\ProductStockReport.rdlc">
                            </LocalReport>
                        </rsweb:ReportViewer>
                    </asp:View>

                    <asp:View runat="server">
                        <h3>Venta de productos</h3>
                        <div class="text-right">
                            <asp:Button Text="Vista principal" CssClass="btn btn-primary" runat="server" ID="btnGoToMainView2" OnClick="btnGoToMainView_Click" />
                        </div>
                        <div class="form-row align-items-center">
                            <div class="col-4">
                                <h5>Desde</h5>
                                <input runat="server" type="date" name="Type" id="SaleDateFrom" class="form-control" />
                                <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="SaleDateFrom" ValidationGroup="SaleReportGruop" ErrorMessage="Seleccione una fecha valida"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-4">
                                <h5>Hasta</h5>
                                <input runat="server" type="date" name="Type" id="SaleDateTo" class="form-control" />
                                <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="SaleDateTo" ValidationGroup="SaleReportGruop" ErrorMessage="Seleccione una fecha valida"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-2">
                                <asp:Button runat="server" Text="Filtrar" ID="btnFilterSalesByDateRange" ValidationGroup="SaleReportGruop" OnClick="btnFilterSalesByDateRange_Click" CssClass="btn btn-success btn-block" />
                            </div>
                            <rsweb:ReportViewer ID="ReportViewerProductSales" runat="server" Width="100%">
                                <LocalReport ReportPath="Data\SaleReport\ProductSaleReport.rdlc">
                                </LocalReport>
                            </rsweb:ReportViewer>
                        </div>
                    </asp:View>

                    <asp:View runat="server">
                        <h3>Compra de productos</h3>
                        <div class="text-right">
                            <asp:Button Text="Vista principal" CssClass="btn btn-primary" runat="server" ID="btnGoToMainView3" OnClick="btnGoToMainView_Click" />
                        </div>
                        <div class="form-row align-items-center">
                            <div class="col-4">
                                <h5>Desde</h5>
                                <input runat="server" type="date" name="Type" id="DatepickerFrom" class="form-control" />
                                <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="DatepickerFrom" ValidationGroup="PurchaseReportGroup" ErrorMessage="Seleccione una fecha valida"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-4">
                                <h5>Hasta</h5>
                                <input runat="server" type="date" name="Type" id="DatepickerTo" class="form-control" />
                                <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="DatepickerTo" ValidationGroup="PurchaseReportGroup" ErrorMessage="Seleccione una fecha valida"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-2">
                                <asp:Button runat="server" Text="Filtrar" ID="btnFilterFilterByDateInProductPurchaseReport" ValidationGroup="PurchaseReportGroup" OnClick="btnFilterFilterByDateInProductPurchaseReport_Click" CssClass="btn btn-success btn-block" />
                            </div>
                        </div>

                        <rsweb:ReportViewer ID="ReportViewerProductPurchase" runat="server" Width="100%">
                            <LocalReport ReportPath="Data\PurchaseReport\ProductPurchaseReport.rdlc">
                            </LocalReport>
                        </rsweb:ReportViewer>
                    </asp:View>
                </asp:MultiView>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnProductReport" />
            <asp:PostBackTrigger ControlID="btnStockReport" />
            <asp:PostBackTrigger ControlID="btnSalesReport" />
            <asp:PostBackTrigger ControlID="btnPurchaseReport" />
        </Triggers>
    </asp:UpdatePanel>

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
    <%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>--%>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

    <script>
        function ModalDate() {
            var el = document.getElementById("toastDate")
            el.classList.add("show");
            setTimeout(function () { el.classList.remove("show") }, 5000);
        }
    </script>
</asp:Content>
