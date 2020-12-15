using HardwareStore.Core.Interfaces;
using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using Ninject;
using Ninject.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardwareStore.Modules.Sales.Module
{
    public partial class MainSales : PageBase
    {
        [Inject]
        public IWarehouseProductsRepository vWarehouseProductsRepository { get; set; }
        [Inject]
        public ICustomerRepository vCustomerRepository { get; set; }
        [Inject]
        public ICurrencyRepository vcurrencyRepository { get; set; }
        [Inject]
        public ISalesRepository vSalesRepository { get; set; }

        List<SaleDetailsStage> listSdtStage = null;

        public void LoadGridViewWarehouseProducts(string query)
        {
            var list = this.vWarehouseProductsRepository.GetProductsInWarehouse(query);
            //var ProductsBySuppliers = list.FindAll(sp => sp.Fk_SupplierID == 1);
            GridViewWarehouseProducts.DataSource = list;
            GridViewWarehouseProducts.DataBind();
        }

        public void LoadDropDownCustomers()
        {
            ddlistCustomers.DataSource = this.vCustomerRepository.ListAllCustomers();
            ddlistCustomers.DataTextField = "FullName";
            ddlistCustomers.DataValueField = "Pk_CustomerID";
            ddlistCustomers.DataBind();
            ddlistCustomers.Items.Insert(0, new ListItem("---[Seleccionar Cliente]---", "0"));
        }

        public void LoadDropDownListsCurrencies()
        {
            var foreignList = this.vcurrencyRepository.ListForeignCurrencies();
            var localList = this.vcurrencyRepository.ListLocalCurrencies();

            this.ddlistForeignCurrencies.DataSource = foreignList;
            this.ddlistForeignCurrencies.DataTextField = "Description";
            this.ddlistForeignCurrencies.DataValueField = "Pk_CurrencyID";
            this.ddlistForeignCurrencies.DataBind();

            this.ddlistLocalCurrencies.DataSource = localList;
            this.ddlistLocalCurrencies.DataTextField = "Description";
            this.ddlistLocalCurrencies.DataValueField = "Id";
            this.ddlistLocalCurrencies.DataBind();
        }

        public void LoadGridViewSales(DateTime Start, DateTime End, int status)
        {
            var list = this.vSalesRepository.GetSalesList(Start, End, status);
            this.GridviewSales.DataSource = list;
            this.GridviewSales.DataBind();
        }

        public void LoadGridViewDetail(int id)
        {
            var list = vSalesRepository.GetSaleDetails(id);
            GridViewSaleDetails.DataSource = list;
            GridViewSaleDetails.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime Start = DateTime.Parse("1998-10-01");
                DateTime End = DateTime.Now;
                this.LoadGridViewSales(Start, End, 0);
                this.LoadGridViewWarehouseProducts("");
                this.LoadDropDownCustomers();
                this.LoadDropDownListsCurrencies();
            }

            if (Session["ListSdt"] != null)
            {
                listSdtStage = Session["ListSdt"] as List<SaleDetailsStage>;
                GridViewSaleDetailsStage.DataSource = listSdtStage;
                GridViewSaleDetailsStage.DataBind();
            }
        }

        protected void btnBackToCreateSale_Click(object sender, EventArgs e)
        {
            SalesView.ActiveViewIndex = 0;
        }

        protected void btnGoToListOrdersSales_Click(object sender, EventArgs e)
        {
            SalesView.ActiveViewIndex = 1;
        }

        protected void btnSearchWarehouseProduct_Click(object sender, EventArgs e)
        {
            this.LoadGridViewWarehouseProducts(txtSearchWarehouseProduct.Text);
        }

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

        public void ResetDetailInputs()
        {
            txtProduct.Text = "";
            txtBrand.Text = "";
            txtMaterialType.Text = "";
            txtMeasureUnit.Text = "";
            txtProductCode.Text = "";
            txtWarehouseId.Text = "";
            txtProductId.Text = "";
            txtSupplierId.Text = "";
            txtDimensions.Text = "";
            txtQuantity.Text = "";
            txtPrice.Text = "";
            txtDetailDiscount.Text = "";
            txtProductStock.Text = "";
            txtPrice.Text = "";
            btnAddToDetailStageList.Text = "Agregar";
        }

        private void SendWarehouseProductToTextBox(int idWhr, int idProdDetail, int idSupplier)
        {
            var obj = this.vWarehouseProductsRepository.GetAWarehouseProduct(idWhr, idProdDetail, idSupplier);
            txtWarehouseId.Text = idWhr.ToString();
            txtProductId.Text = idProdDetail.ToString();
            txtProduct.Text = obj.ProductName;
            txtWarehouseName.Text = obj.WarehouseName;
            txtBrand.Text = obj.BrandName;
            txtMaterialType.Text = obj.MaterialType;
            txtDimensions.Text = obj.Dimensions;
            txtMeasureUnit.Text = obj.MeasureUnit;
            txtProductCode.Text = obj.DefaultCode;
            txtProductStock.Text = obj.WhPr_Stock.ToString();
            txtPrice.Text = obj.WhPr_SalePrice.ToString();
            txtSupplierId.Text = obj.Fk_SupplierID.ToString();
        }

        private SaleDetailsStage CreateItemForDetailStage()
        {
            var ObjStage = new SaleDetailsStage()
            {
                WarehouseId = Convert.ToInt32(txtWarehouseId.Text),
                ProductId = Convert.ToInt32(txtProductId.Text),
                SupplierId = Convert.ToInt32(txtSupplierId.Text),
                ProductName = txtProduct.Text,
                BrandName = txtBrand.Text,
                UnitMeasure = txtMeasureUnit.Text,
                Code = txtProductCode.Text,
                Dimensions = txtDimensions.Text,
                MaterialType = txtMaterialType.Text,
                Quantity = Convert.ToInt32(txtQuantity.Text),
                Price = Convert.ToDouble(txtPrice.Text),
                Discount = Convert.ToInt32(txtDetailDiscount.Text),
                WarehouseName = txtWarehouseName.Text,
                Stock = Convert.ToInt32(txtProductStock.Text)
            };

            return ObjStage;
        }

        protected void btnAddToDetailStageList_Click(object sender, EventArgs e)
        {
            switch (btnAddToDetailStageList.Text)
            {
                case "Agregar":
                    this.AddItemInToSaleDetailList();
                    this.CalculateTotalAmount();
                    this.CalculatePaymentChange();
                    break;

                case "Editar":
                    this.UpdateItemFromSaleDetailList();
                    this.CalculateTotalAmount();
                    this.CalculatePaymentChange();
                    SalesView.ActiveViewIndex = 2;
                    break;

                default:
                    break;
            }
        }

        private double CalculateSubtotalAmount()
        {
            double subtotal = 0;
            listSdtStage = Session["ListSdt"] as List<SaleDetailsStage>;

            if (listSdtStage != null && listSdtStage.Count > 0)
            {
                foreach (var item in listSdtStage)
                {
                    subtotal = subtotal + item.Total;
                }

                txtSubtotal.Text = subtotal.ToString();
            }

            return subtotal;
        }

        private void CalculateTotalAmount()
        {
            double total, subtotal;
            int discount;
            subtotal = this.CalculateSubtotalAmount();
            total = subtotal;

            if (txtTotalDiscount.Text != "")
            {
                discount = Convert.ToInt32(txtTotalDiscount.Text);
                total = total - (((double)discount / 100) * total);
            }

            txtTotal.Text = total.ToString();
        }

        private void AddItemInToSaleDetailList()
        {
            var obj = this.CreateItemForDetailStage();

            if (obj.Quantity <= obj.Stock)
            {
                if (Session["ListSdt"] == null)
                {
                    listSdtStage = new List<SaleDetailsStage>();
                    listSdtStage.Add(obj);
                    Session["ListSdt"] = listSdtStage;
                }
                else
                {
                    listSdtStage = Session["ListSdt"] as List<SaleDetailsStage>;
                    bool itemExist = listSdtStage.Exists(i =>
                    i.WarehouseId == obj.WarehouseId &&
                    i.ProductId == obj.ProductId &&
                    i.SupplierId == obj.SupplierId);

                    if (!itemExist)
                    {
                        listSdtStage.Add(obj);
                    }
                    else
                    {
                        string ShowToaster = "launch_toast()";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowToaster, true);
                    }
                }

                GridViewSaleDetailsStage.DataSource = listSdtStage;
                GridViewSaleDetailsStage.DataBind();
                this.ResetDetailInputs();
            }
            else
            {

                string ShowToastQuantityVal = "ToastQuantityVal()";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowToastQuantityVal, true);
            }

        }

        private void UpdateItemFromSaleDetailList()
        {
            listSdtStage = Session["ListSdt"] as List<SaleDetailsStage>;
            int warehouseId = Convert.ToInt32(txtWarehouseId.Text);
            int productId = Convert.ToInt32(txtProductId.Text);
            int supplierId = Convert.ToInt32(txtSupplierId.Text);

            var OldReg = this.listSdtStage.FirstOrDefault(i =>
            i.WarehouseId == warehouseId &&
            i.ProductId == productId &&
            i.SupplierId == supplierId);

            int quantity = Convert.ToInt32(txtQuantity.Text);

            if (quantity <= OldReg.Stock)
            {
                OldReg.WarehouseId = Convert.ToInt32(txtWarehouseId.Text);
                OldReg.ProductId = Convert.ToInt32(txtProductId.Text);
                OldReg.SupplierId = Convert.ToInt32(txtSupplierId.Text);
                OldReg.ProductName = txtProduct.Text;
                OldReg.BrandName = txtBrand.Text;
                OldReg.UnitMeasure = txtMeasureUnit.Text;
                OldReg.Code = txtProductCode.Text;
                OldReg.Dimensions = txtDimensions.Text;
                OldReg.MaterialType = txtMaterialType.Text;
                OldReg.Quantity = quantity;
                OldReg.Price = Convert.ToDouble(txtPrice.Text);
                OldReg.Discount = Convert.ToInt32(txtDetailDiscount.Text);
                OldReg.WarehouseName = txtWarehouseName.Text;
                OldReg.Stock = Convert.ToInt32(txtProductStock.Text);
                GridViewSaleDetailsStage.DataSource = listSdtStage;
                GridViewSaleDetailsStage.DataBind();
                this.ResetDetailInputs();
            }
            else
            {
                string ShowToastQuantityVal = "ToastQuantityVal()";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowToastQuantityVal, true);
            }
        }

        protected void btnAbortAddToDetailStageList_Click(object sender, EventArgs e)
        {
            this.ResetDetailInputs();
        }

        protected void GridViewSaleDetailsStage_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow Row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int index = Row.RowIndex;
            int WarehouseId = Convert.ToInt32(GridViewSaleDetailsStage.DataKeys[index]["WarehouseId"]);
            int ProductId = Convert.ToInt32(GridViewSaleDetailsStage.DataKeys[index]["ProductId"]);
            int SupplierId = Convert.ToInt32(GridViewSaleDetailsStage.DataKeys[index]["SupplierId"]);

            switch (e.CommandName)
            {
                case "cmdEdit":
                    this.SendSaleDetailToTextbox(WarehouseId, ProductId, SupplierId);
                    btnAddToDetailStageList.Text = "Editar";
                    //SalesView.ActiveViewIndex = 0;
                    break;

                case "cmdDelete":
                    listSdtStage = Session["ListSdt"] as List<SaleDetailsStage>;
                    var obj = this.listSdtStage.FirstOrDefault(i =>
                    i.WarehouseId == WarehouseId &&
                    i.ProductId == ProductId &&
                    i.SupplierId == SupplierId);
                    listSdtStage.Remove(obj);

                    GridViewSaleDetailsStage.DataSource = listSdtStage;
                    GridViewSaleDetailsStage.DataBind();
                    this.ResetDetailInputs();
                    this.CalculateTotalAmount();
                    this.CalculatePaymentChange();
                    break;
                default:
                    break;
            }
        }

        private void SendSaleDetailToTextbox(int warehouseId, int productId, int SupplierId)
        {
            listSdtStage = Session["ListSdt"] as List<SaleDetailsStage>;
            var obj = this.listSdtStage.FirstOrDefault(i =>
                    i.WarehouseId == warehouseId &&
                    i.ProductId == productId &&
                    i.SupplierId == SupplierId);

            txtWarehouseId.Text = warehouseId.ToString();
            txtProductId.Text = productId.ToString();
            txtSupplierId.Text = SupplierId.ToString();
            txtProduct.Text = obj.ProductName;
            txtWarehouseName.Text = obj.WarehouseName;
            txtBrand.Text = obj.BrandName;
            txtMaterialType.Text = obj.MaterialType;
            txtDimensions.Text = obj.Dimensions;
            txtMeasureUnit.Text = obj.UnitMeasure;
            txtProductCode.Text = obj.Code;
            txtProductStock.Text = obj.Stock.ToString();
            txtPrice.Text = obj.Price.ToString();
            txtQuantity.Text = obj.Quantity.ToString();
            txtDetailDiscount.Text = obj.Discount.ToString();
        }

        protected void ddlistCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = ddlistCustomers.SelectedIndex;
            if (index != 0)
            {
                txtCustomer.Text = ddlistCustomers.SelectedItem.Text;
            }
            else
            {
                txtCustomer.Text = "";
            }

        }

        protected void btnSaleDetailList_Click(object sender, EventArgs e)
        {
            SalesView.ActiveViewIndex = 2;
        }

        protected void btnCalculateTotal_Click(object sender, EventArgs e)
        {
            this.CalculateTotalAmount();
            this.CalculatePaymentChange();
        }

        protected void btnCreateSale_Click(object sender, EventArgs e)
        {
            this.CalculateTotalAmount();
            this.CalculatePaymentChange();

            Tbl_Sales sales = new Tbl_Sales()
            {
                Fk_UserID = 1,
                Fk_CustomerID = Convert.ToInt32(ddlistCustomers.SelectedValue),
                Fk_CurrencyExchange = Convert.ToInt32(txtCurrencyExchangeId.Text),
                Sale_CustomerName = txtCustomer.Text,
                Sale_PaymentType = ddlistForeignCurrencies.SelectedItem.Text,
                Sale_TaxName = "Without Tax",
                Sale_Tax = 0,
                Sale_Subtotal = Convert.ToDouble(txtSubtotal.Text),
                Sale_Discount = Convert.ToInt32(txtTotalDiscount.Text),
                Sale_TotalAmount = Convert.ToDouble(txtTotal.Text),
            };
            listSdtStage = Session["ListSdt"] as List<SaleDetailsStage>;

            if (listSdtStage != null && listSdtStage.Count > 0)
            {
                this.vSalesRepository.MainSalesTransactions(sales, listSdtStage);
            }

            this.RemoveItemsFromSaleDetailList();
            this.ResetDetailInputs();
            this.ResetSaleInputs();
            this.LoadGridViewWarehouseProducts("");
        }

        protected void btnAbortTransaction_Click(object sender, EventArgs e)
        {
            this.RemoveItemsFromSaleDetailList();
            this.ResetDetailInputs();
            this.ResetSaleInputs();
        }

        private void ResetSaleInputs()
        {
            txtSubtotal.Text = "";
            txtTotalDiscount.Text = "";
            txtTotal.Text = "";
            txtPayment.Text = "";
            txtConversion.Text = "";
            txtPaymentChange.Text = "";
        }

        private void RemoveItemsFromSaleDetailList()
        {
            Session.Remove("ListSdt");
            listSdtStage = Session["listSdt"] as List<SaleDetailsStage>;
            GridViewSaleDetailsStage.DataSource = listSdtStage;
            GridViewSaleDetailsStage.DataBind();
        }

        protected void ddlistForeignCurrencies_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.FetchCurrencyExchangeFromDataBase();
        }

        public void FetchCurrencyExchangeFromDataBase()
        {
            int local = Convert.ToInt32(ddlistLocalCurrencies.SelectedValue);
            int foreign = Convert.ToInt32(ddlistForeignCurrencies.SelectedValue);
            var Currency = this.vcurrencyRepository.GetACurrencyExchange(local, foreign);
            txtCurrencySale.Text = Currency.Cye_Sale.ToString();
            txtCurrencyPurchase.Text = Currency.Cye_Purchase.ToString();
            txtCurrencyExchangeId.Text = Currency.Pk_CurrencyExchange.ToString();
        }

        private void CalculatePaymentChange()
        {
            this.FetchCurrencyExchangeFromDataBase();
            double sale, purchase, payment, conversion, paymentChange, totalToPay;
            if (txtCurrencyPurchase.Text != "" && txtPayment.Text != "")
            {
                purchase = Convert.ToDouble(txtCurrencyPurchase.Text);
                payment = Convert.ToDouble(txtPayment.Text);
                totalToPay = Convert.ToDouble(txtTotal.Text);
                conversion = purchase * payment;
                txtConversion.Text = conversion.ToString();
                paymentChange = conversion - totalToPay;
                txtPaymentChange.Text = paymentChange.ToString();
            }
        }

        protected void GridviewSales_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow Row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int index = Row.RowIndex;
            int Id = Convert.ToInt32(GridviewSales.DataKeys[index].Value);

            if (e.CommandName == "cmdSelect")
            {
                this.LoadGridViewDetail(Id);

                string ShowSdt = "ShowSdtList()";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowSdt, true);
            }
        }

        protected void btnUpdateTable_Click(object sender, EventArgs e)
        {
            DateTime Start = DateTime.Parse("1998-10-01");
            DateTime End = DateTime.Now;
            this.LoadGridViewSales(Start, End, 0);
        }

        protected void btnFilterByDate_Click(object sender, EventArgs e)
        {
            DateTime Start = Convert.ToDateTime(DatepickerFrom.Value);
            DateTime End = Convert.ToDateTime(DatepickerTo.Value);
            if (Start > End)
            {
                string ShowModalDate = "ModalDate()";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowModalDate, true);
            }
            else
            {
                this.LoadGridViewSales(Start, End, 0);
            }
        }
    }
}