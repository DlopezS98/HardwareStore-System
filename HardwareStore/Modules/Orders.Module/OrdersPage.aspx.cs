using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using HardwareStore.Core.Interfaces;
using Ninject;
using Ninject.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardwareStore.Modules.Orders.Module
{
    public partial class OrdersPage : PageBase
    {
        [Inject]
        public IOrdersRepository vOrdersRepository { get; set; }
        [Inject]
        public ISuppliersRepository vSuppliersRepository { get; set; }
        [Inject]
        public IWarehousesRepository vWarehousesRepository { get; set; }
        [Inject]
        public IWarehouseProductsRepository vWarehouseProductsRepository { get; set; }

        List<OrderDetailsStage> listOdtStage = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.loadDdlistFilterByWarehouse();
                this.LoadDropDownWarehouse();
                this.loadGridViewWarehouseProducts("", 0);
                this.LoadDropDownSuppliers();
                DateTime Start = DateTime.Parse("1998-10-01");
                DateTime End = DateTime.Now;
                this.LoadGridViewOrders(Start, End, "");
            }

            if (Session["ListOdtStg"] != null)
            {
                listOdtStage = (Session["ListOdtStg"] as List<OrderDetailsStage>);
                GridViewOrderDetailsStage.DataSource = listOdtStage;
                GridViewOrderDetailsStage.DataBind();
            }
        }

        public void LoadDropDownWarehouse()
        {
            ddlstWarehouses.DataSource = this.vWarehousesRepository.GetWarehouses();
            ddlstWarehouses.DataTextField = "DropDisplayName";
            ddlstWarehouses.DataValueField = "Pk_WarehouseID";
            ddlstWarehouses.DataBind();
            ddlstWarehouses.Items.Insert(0, new ListItem("----[Seleccionar Bodega Destino]----", "0"));
        }

        public void loadGridViewWarehouseProducts(string query, int id)
        {
            var list = this.vWarehouseProductsRepository.GetProductsInWarehouse(query, id);
            var ProductsBySuppliers = list.FindAll(sp => sp.Fk_SupplierID == 1);
            GridViewWarehouseProducts.DataSource = ProductsBySuppliers;
            GridViewWarehouseProducts.DataBind();
        }

        public void LoadDropDownSuppliers()
        {
            ddlstSuppliers.DataSource = this.vSuppliersRepository.GetSuppliers();
            ddlstSuppliers.DataTextField = "Sps_CompanyName";
            ddlstSuppliers.DataValueField = "Pk_SupplierID";
            ddlstSuppliers.DataBind();
            ddlstSuppliers.Items.Insert(0, new ListItem("----[Seleccionar Proveedor]----", "0"));
        }

        public void loadDdlistFilterByWarehouse() 
        {
            ddlistFilterByWarehouse.DataSource = this.vWarehousesRepository.GetWarehouses();
            ddlistFilterByWarehouse.DataTextField = "DropDisplayName";
            ddlistFilterByWarehouse.DataValueField = "Pk_WarehouseID";
            ddlistFilterByWarehouse.DataBind();
            ddlistFilterByWarehouse.Items.Insert(0, new ListItem("----[Filtra por bodega]----", "0"));
        }

        public void LoadGridViewOrders(DateTime Start, DateTime End, string Invoice)
        {
            var list = vOrdersRepository.GetOrders(Start, End, Invoice);
            GridViewOrders.DataSource = list;
            GridViewOrders.DataBind();
        }

        //Grid del modal de los productos en bodega+
        protected void GridViewWarehouseProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow Row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int index = Row.RowIndex;
            int idWhr = Convert.ToInt32(GridViewWarehouseProducts.DataKeys[index]["Fk_WarehouseID"]);
            int idProdDetail = Convert.ToInt32(GridViewWarehouseProducts.DataKeys[index]["Fk_ProductDetailID"]);
            int idSupplier = Convert.ToInt32(GridViewWarehouseProducts.DataKeys[index]["Fk_SupplierID"]);
            switch (e.CommandName)
            {
                case "cmdSelect":
                    this.ResetDetailInputs();
                    this.SendWarehouseProductToTextBox(idWhr, idProdDetail, idSupplier);
                    break;
                default:
                    break;
            }
        }

        public void SendWarehouseProductToTextBox(int idWhr, int idProdDetail, int idSupplier)
        {
            //Metodo que retorna un elemento en productos bodegas (Warehouse-products)
            var obj = this.vWarehouseProductsRepository.GetAWarehouseProduct(idWhr, idProdDetail, idSupplier);
            //Valores a los textbox
            txtWarehouseId.Text = idWhr.ToString();
            txtProductId.Text = idProdDetail.ToString();
            txtProduct.Value = obj.ProductName;
            txtBrand.Value = obj.BrandName;
            txtDefaultCode.Value = obj.DefaultCode;
            txtDimensions.Value = obj.Dimensions;
            ddlstWarehouses.SelectedValue = obj.Fk_WarehouseID.ToString();
            txtMeasureUnit.Value = obj.MeasureUnit;
            txtPrice.Value = obj.WhPr_PurchasePrice.ToString();
            ddlstSuppliers.SelectedValue = obj.Fk_SupplierID.ToString();
            txtMaterialType.Value = obj.MaterialType;
            txtWarehouseName.Text = obj.WarehouseName;
            txtSupplierId.Text = obj.Fk_SupplierID.ToString();
        }

        //Grid Detalle de pedido
        protected void GridViewOrderDetailsStage_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow Row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int index = Row.RowIndex;
            int idWhr = Convert.ToInt32(GridViewOrderDetailsStage.DataKeys[index]["Fk_WarehouseID"]);
            int idProdDetail = Convert.ToInt32(GridViewOrderDetailsStage.DataKeys[index]["Fk_ProductDetailID"]);
            int SupplierId = Convert.ToInt32(GridViewOrderDetailsStage.DataKeys[index]["Fk_SupplierID"]);
            switch (e.CommandName)
            {
                case "cmdEdit":
                    this.SendOrderDetailStageToTextbox(idWhr, idProdDetail, SupplierId);
                    btnAddToDetailStageList.Text = "Editar";                   
                    break;

                case "cmdDelete":
                    listOdtStage = (Session["ListOdtStg"] as List<OrderDetailsStage>);
                    var obj = this.listOdtStage.FirstOrDefault(o => o.Fk_WarehouseID == idWhr && o.Fk_ProductDetailID == idProdDetail);
                    listOdtStage.Remove(obj);
                    GridViewOrderDetailsStage.DataSource = listOdtStage;
                    GridViewOrderDetailsStage.DataBind();
                    this.ResetDetailInputs();
                    this.ResetOrderInputs();
                    this.calculateTotalAmount();
                    break;

                default:
                    break;
            }
        }

        public void SendOrderDetailStageToTextbox(int idWhr, int idProdDetail, int SupplierId)
        {
            listOdtStage = (Session["ListOdtStg"] as List<OrderDetailsStage>);
            var obj = this.listOdtStage.FirstOrDefault(o => o.Fk_WarehouseID == idWhr && o.Fk_ProductDetailID == idProdDetail && o.Fk_SupplierID == SupplierId);
            txtWarehouseId.Text = idWhr.ToString();
            txtProductId.Text = idProdDetail.ToString();
            txtProduct.Value = obj.ProductName;
            txtBrand.Value = obj.BrandName;
            txtDimensions.Value = obj.Dimensions;
            ddlstWarehouses.SelectedValue = obj.Fk_WarehouseID.ToString();
            ddlstSuppliers.SelectedValue = obj.Fk_SupplierID.ToString();
            txtMeasureUnit.Value = obj.MeasureUnit;
            txtPrice.Value = obj.PurchasePrice.ToString();
            txtMaterialType.Value = obj.MaterialType;
            txtWarehouseName.Text = obj.WarehouseName;
            txtDetailDiscount.Value = obj.Discount.ToString();
            txtDimensions.Value = obj.Dimensions;
            txtDefaultCode.Value = obj.DefaultCode;
            txtQuantity.Value = obj.Quantity.ToString();
            txtSupplierId.Text = obj.Fk_SupplierID.ToString();
        }

        //Creacíon del objeto a añadir a lista de detalle (pedido)
        public OrderDetailsStage CreateItemForDetailStage()
        {
            OrderDetailsStage OdtStg = new OrderDetailsStage();
            OdtStg.Fk_ProductDetailID = Convert.ToInt32(txtProductId.Text);
            OdtStg.Fk_WarehouseID = Convert.ToInt32(ddlstWarehouses.SelectedValue);
            OdtStg.WarehouseName = ddlstWarehouses.SelectedItem.Text;
            OdtStg.ProductName = txtProduct.Value;
            OdtStg.BrandName = txtBrand.Value;
            OdtStg.SupplierName = ddlstSuppliers.SelectedItem.Text;
            OdtStg.MaterialType = txtMaterialType.Value;
            OdtStg.MeasureUnit = txtMeasureUnit.Value;
            OdtStg.PurchasePrice = Convert.ToDouble(txtPrice.Value);
            OdtStg.Quantity = Convert.ToInt32(txtQuantity.Value);
            OdtStg.Discount = Convert.ToInt32(txtDetailDiscount.Value);
            OdtStg.DefaultCode = txtDefaultCode.Value;
            OdtStg.Dimensions = txtDimensions.Value;
            OdtStg.Fk_SupplierID = Convert.ToInt32(ddlstSuppliers.SelectedValue);
            return OdtStg;
        }


        //Añadiendo a/ editanto la Lista de detalle (pedido)
        protected void btnAddToDetailStageList_Click(object sender, EventArgs e)
        {
            switch (btnAddToDetailStageList.Text)
            {
                case "Agregar":
                    var obj = this.CreateItemForDetailStage();

                    if (Session["ListOdtStg"] == null)
                    {
                        //Agregando a lista
                        listOdtStage = new List<OrderDetailsStage>();
                        listOdtStage.Add(obj);
                        //Guardando los datos en la sesión del usuario (persistencia de datos)
                        //Evitar que el postback elimine los datos...
                        Session["ListOdtStg"] = listOdtStage;
                    }
                    else
                    {
                        //recuperando los datos de la sesión...
                        listOdtStage = (Session["ListOdtStg"] as List<OrderDetailsStage>);
                        //veriicando si el objeto existe
                        bool WhProdExist = listOdtStage
                            .Exists(x => x.Fk_WarehouseID == obj.Fk_WarehouseID
                            && x.Fk_ProductDetailID == obj.Fk_ProductDetailID
                            && x.Fk_SupplierID == obj.Fk_SupplierID);
                        if (!WhProdExist)
                        {
                            listOdtStage.Add(obj);
                        }
                        else
                        {
                            //Response.Write("<script>alert('El elemento ya existe en la lista');</script>");
                            string ShowToaster = "launch_toast()";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowToaster, true);
                        }
                    }

                    GridViewOrderDetailsStage.DataSource = listOdtStage;
                    GridViewOrderDetailsStage.DataBind();
                    this.ResetDetailInputs();
                    this.calculateTotalAmount();
                    break;

                case "Editar":
                    listOdtStage = (Session["ListOdtStg"] as List<OrderDetailsStage>);
                    int WhrId = Convert.ToInt32(txtWarehouseId.Text);
                    int ProdDdtId = Convert.ToInt32(txtProductId.Text);
                    int SupplierId = Convert.ToInt32(txtSupplierId.Text);
                    var oldObj = listOdtStage.FirstOrDefault(o => o.Fk_WarehouseID == WhrId && o.Fk_ProductDetailID == ProdDdtId && o.Fk_SupplierID == SupplierId);
                    oldObj.PurchasePrice = Convert.ToDouble(txtPrice.Value);
                    oldObj.Quantity = Convert.ToInt32(txtQuantity.Value);
                    oldObj.Discount = Convert.ToInt32(txtDetailDiscount.Value);
                    oldObj.Fk_WarehouseID = Convert.ToInt32(ddlstWarehouses.SelectedValue);
                    oldObj.WarehouseName = ddlstWarehouses.SelectedItem.Text;
                    oldObj.SupplierName = ddlstSuppliers.SelectedItem.Text;
                    oldObj.Fk_SupplierID = Convert.ToInt32(ddlstSuppliers.SelectedValue);
                    GridViewOrderDetailsStage.DataSource = listOdtStage;
                    GridViewOrderDetailsStage.DataBind();
                    this.ResetDetailInputs();
                    this.calculateTotalAmount();
                    break;

                default:

                    break;
            }

        }

        //Cancelar agregar datos a la lista del detalle de orden
        protected void btnAbortAddToDetailStageList_Click(object sender, EventArgs e)
        {
            this.ResetDetailInputs();
        }

        public void ResetDetailInputs()
        {
            btnAddToDetailStageList.Text = "Agregar";
            txtProductId.Text = "";
            txtProduct.Value = "";
            txtWarehouseId.Text = "";
            txtWarehouseName.Text = "";
            ddlstWarehouses.SelectedIndex = 0;
            txtPrice.Value = "";
            txtBrand.Value = "";
            txtDefaultCode.Value = "";
            txtDimensions.Value = "";
            txtMaterialType.Value = "";
            txtMeasureUnit.Value = "";
            txtDetailDiscount.Value = "";
            txtQuantity.Value = "";
        }

        public double CalculateSubTotalOrderAmount()
        {
            double SubtotalAmount = 0;
            listOdtStage = (Session["ListOdtStg"] as List<OrderDetailsStage>);
            if (listOdtStage != null)
            {
                foreach (var item in listOdtStage)
                {
                    SubtotalAmount = SubtotalAmount + item.totalAmount;
                }

                txtSubtotal.Value = SubtotalAmount.ToString();
            }

            return SubtotalAmount;
        }

        public void calculateTotalAmount()
        {
            double total;
            int discount;
            double subtotal = this.CalculateSubTotalOrderAmount();
            total = subtotal;
            if (txtTotalTax.Value != "")
            {
                total = total + Convert.ToDouble(txtTotalTax.Value);
            }

            if (txtTotalDiscount.Value != "")
            {
                discount = Convert.ToInt32(txtTotalDiscount.Value);
                total = total - (((double)discount / 100) * total);
            }

            txtTotal.Value = total.ToString();
        }

        protected void btnRecalculateOrderTotal_Click(object sender, EventArgs e)
        {
            this.calculateTotalAmount();
        }

        protected void btnSearchWarehouseProduct_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlistFilterByWarehouse.SelectedValue);
            string filter = txtSearchWarehouseProduct.Value;
            this.loadGridViewWarehouseProducts(filter, id);
        }

        //protected void btnGoToListOrders_Click(object sender, EventArgs e)
        //{
        //    OrdersView.ActiveViewIndex = 1;
        //}

        //protected void btnBackToCreateOrder_Click(object sender, EventArgs e)
        //{
        //    OrdersView.ActiveViewIndex = 0;
        //}

        protected void btnCreateOrder_Click(object sender, EventArgs e)
        {
            this.calculateTotalAmount();
            List<Tbl_OrderDetails> OdtList = new List<Tbl_OrderDetails>();
            List<Tbl_WarehouseProducts> WpList = new List<Tbl_WarehouseProducts>();
            Tbl_Orders Ord = new Tbl_Orders();
            Ord.Fk_SupplierID = Convert.ToInt32(ddlstSuppliers.SelectedValue);
            Ord.Fk_UserID = 1;
            if (txtOrdNumber.Value != "") { Ord.Ord_Number = txtOrdNumber.Value; } else { Ord.Ord_Number = null; }
            Ord.Ord_Tax = Convert.ToDouble(txtTotalTax.Value);
            Ord.Ord_Subtotal = Convert.ToDouble(txtSubtotal.Value);
            Ord.Ord_Discount = Convert.ToInt32(txtTotalDiscount.Value);
            Ord.Ord_Total = Convert.ToDouble(txtTotal.Value);

            listOdtStage = (Session["ListOdtStg"] as List<OrderDetailsStage>);
            foreach (var item in listOdtStage)
            {
                Tbl_OrderDetails Odt = new Tbl_OrderDetails();
                Odt.Fk_ProductDetailID = item.Fk_ProductDetailID;
                Odt.Fk_DestinationWarehouseID = item.Fk_WarehouseID;
                Odt.Odt_Quantity = item.Quantity;
                Odt.Odt_PurchasePrice = item.PurchasePrice;
                Odt.Odt_DetailTax = null;
                Odt.Odt_Subtotal = item.Subtotal;
                Odt.Odt_Discount = item.Discount;
                Odt.Odt_Total = item.totalAmount;
                OdtList.Add(Odt);
            }

            foreach (var item in listOdtStage)
            {
                Tbl_WarehouseProducts obj = new Tbl_WarehouseProducts();
                obj.Fk_WarehouseID = item.Fk_WarehouseID;
                obj.Fk_ProductDetailID = item.Fk_ProductDetailID;
                obj.Fk_SupplierID = item.Fk_SupplierID;
                obj.WhPr_Stock = item.Quantity;
                obj.WhPr_PurchasePrice = item.PurchasePrice;
                obj.WhPr_SalePrice = item.PurchasePrice + (((double)25 / 100) * item.PurchasePrice);
                WpList.Add(obj);
            }

            vOrdersRepository.MainOrderTransaction(Ord, OdtList, WpList);
            this.RemoveListOrdertDetailsStage();
            this.ResetOrderInputs();
            string ShowToaster = "OrderCreated_Toast()";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowToaster, true);
            this.loadGridViewWarehouseProducts("", 0);
        }

        public void ResetOrderInputs()
        {
            txtOrdNumber.Value = "";
            txtSubtotal.Value = "";
            txtTotalTax.Value = "";
            txtTotalDiscount.Value = "";
            txtTotal.Value = "";
            txtSupplierId.Text = "";
            ddlstSuppliers.SelectedIndex = 0;
        }

        protected void btnCancelOrder_Click(object sender, EventArgs e)
        {
            this.RemoveListOrdertDetailsStage();
            this.ResetDetailInputs();
            this.ResetOrderInputs();
        }

        public void RemoveListOrdertDetailsStage()
        {
            Session.Remove("ListOdtStg");
            listOdtStage = (Session["ListOdtStg"] as List<OrderDetailsStage>);
            GridViewOrderDetailsStage.DataSource = listOdtStage;
            GridViewOrderDetailsStage.DataBind();
        }

        protected void GridViewOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow Row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int index = Row.RowIndex;
            int id = Convert.ToInt32(GridViewOrders.DataKeys[index].Value);
            if (e.CommandName == "cmdDetail")
            {
                this.LoadGridViewOrderDetail(id);

                string ShowOdtList = "ShowOdtList()";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowOdtList, true);
            }
        }

        public void LoadGridViewOrderDetail(int id)
        {
            var list = vOrdersRepository.GetOrderDetails(id);
            GridViewOrderDetail.DataSource = list;
            GridViewOrderDetail.DataBind();
        }

        protected void btnFilterByDate_Click(object sender, EventArgs e)
        {
            DateTime Start = Convert.ToDateTime(DatepickerFrom.Value);
            DateTime End = Convert.ToDateTime(DatepickerTo.Value);
            string invoice = txtSearchByInvoiceNumber.Value;
            if( Start >= End)
            {
                //Response.Write("<script>alert('La fecha de inicio no debe ser mayor que la fecha final');</script>");
                string ShowModalDate = "ModalDate()";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowModalDate, true);
            }
            else
            {
                this.LoadGridViewOrders(Start, End, invoice);
            }
        }

        protected void btnUpdateTable_Click(object sender, EventArgs e)
        {
            DateTime Start = DateTime.Parse("1998-10-01");
            DateTime End = DateTime.Now;
            this.LoadGridViewOrders(Start, End, "");
        }

        //protected void btnTblProducts_Click(object sender, EventArgs e)
        //{
        //    OrdersView.ActiveViewIndex = 2;
        //}

        protected void ddlistFilterByWarehouse_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlistFilterByWarehouse.SelectedValue);
            string filter = txtSearchWarehouseProduct.Value;
            this.loadGridViewWarehouseProducts(filter, id);
        }
    }
}