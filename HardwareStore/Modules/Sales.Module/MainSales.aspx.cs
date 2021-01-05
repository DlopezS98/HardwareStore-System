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
            var list = this.vWarehouseProductsRepository.GetProductsInWarehouse(query, 0);
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
            //GridViewSaleDetails.DataSource = list;
            //GridViewSaleDetails.DataBind();
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




        protected void btnSearchWarehouseProduct_Click(object sender, EventArgs e)
        {
            this.LoadGridViewWarehouseProducts(txtSearchWarehouseProduct.Value);
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
            txtProduct.Value = "";
            txtBrand.Value = "";
            txtMaterialType.Value = "";
            txtMeasureUnit.Value = "";
            txtProductCode.Value = "";
            txtWarehouseId.Text = "";
            txtProductId.Text = "";
            txtSupplierId.Text = "";
            txtDimensions.Value = "";
            txtQuantity.Value = "";
            txtPrice.Value = "";
            txtDetailDiscount.Value = "";
            txtProductStock.Value = "";
            txtPrice.Value = "";
            btnAddToDetailStageList.Text = "Agregar";
        }

        private void SendWarehouseProductToTextBox(int idWhr, int idProdDetail, int idSupplier)
        {
            var obj = this.vWarehouseProductsRepository.GetAWarehouseProduct(idWhr, idProdDetail, idSupplier);
            txtWarehouseId.Text = idWhr.ToString();
            txtProductId.Text = idProdDetail.ToString();
            txtProduct.Value = obj.ProductName;
            txtWarehouseName.Text = obj.WarehouseName;
            txtBrand.Value = obj.BrandName;
            txtMaterialType.Value = obj.MaterialType;
            txtDimensions.Value = obj.Dimensions;
            txtMeasureUnit.Value = obj.MeasureUnit;
            txtProductCode.Value = obj.DefaultCode;
            txtProductStock.Value = obj.WhPr_Stock.ToString();
            txtPrice.Value = obj.WhPr_SalePrice.ToString();
            txtSupplierId.Text = obj.Fk_SupplierID.ToString();
        }

        private SaleDetailsStage CreateItemForDetailStage()
        {
            var ObjStage = new SaleDetailsStage()
            {
                WarehouseId = Convert.ToInt32(txtWarehouseId.Text),
                ProductId = Convert.ToInt32(txtProductId.Text),
                SupplierId = Convert.ToInt32(txtSupplierId.Text),
                ProductName = txtProduct.Value,
                BrandName = txtBrand.Value,
                UnitMeasure = txtMeasureUnit.Value,
                Code = txtProductCode.Value,
                Dimensions = txtDimensions.Value,
                MaterialType = txtMaterialType.Value,
                Quantity = Convert.ToInt32(txtQuantity.Value),
                Price = Convert.ToDouble(txtPrice.Value),
                Discount = Convert.ToInt32(txtDetailDiscount.Value),
                WarehouseName = txtWarehouseName.Text,
                Stock = Convert.ToInt32(txtProductStock.Value)
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
                    string Visible = "notificationVisible()";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", Visible, true);
                    break;

                case "Editar":
                    this.UpdateItemFromSaleDetailList();
                    this.CalculateTotalAmount();
                    this.CalculatePaymentChange();
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

                txtSubtotal.Value = subtotal.ToString();
            }

            return subtotal;
        }

        private void CalculateTotalAmount()
        {
            double total, subtotal;
            int discount;
            subtotal = this.CalculateSubtotalAmount();
            total = subtotal;

            if (txtTotalDiscount.Value != "")
            {
                discount = Convert.ToInt32(txtTotalDiscount.Value);
                total = total - (((double)discount / 100) * total);
            }

            txtTotal.Value = total.ToString();
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

            int quantity = Convert.ToInt32(txtQuantity.Value);

            if (quantity <= OldReg.Stock)
            {
                OldReg.WarehouseId = Convert.ToInt32(txtWarehouseId.Text);
                OldReg.ProductId = Convert.ToInt32(txtProductId.Text);
                OldReg.SupplierId = Convert.ToInt32(txtSupplierId.Text);
                OldReg.ProductName = txtProduct.Value;
                OldReg.BrandName = txtBrand.Value;
                OldReg.UnitMeasure = txtMeasureUnit.Value;
                OldReg.Code = txtProductCode.Value;
                OldReg.Dimensions = txtDimensions.Value;
                OldReg.MaterialType = txtMaterialType.Value;
                OldReg.Quantity = quantity;
                OldReg.Price = Convert.ToDouble(txtPrice.Value);
                OldReg.Discount = Convert.ToInt32(txtDetailDiscount.Value);
                OldReg.WarehouseName = txtWarehouseName.Text;
                OldReg.Stock = Convert.ToInt32(txtProductStock.Value);
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
            txtProduct.Value = obj.ProductName;
            txtWarehouseName.Text = obj.WarehouseName;
            txtBrand.Value = obj.BrandName;
            txtMaterialType.Value = obj.MaterialType;
            txtDimensions.Value = obj.Dimensions;
            txtMeasureUnit.Value = obj.UnitMeasure;
            txtProductCode.Value = obj.Code;
            txtProductStock.Value = obj.Stock.ToString();
            txtPrice.Value = obj.Price.ToString();
            txtQuantity.Value = obj.Quantity.ToString();
            txtDetailDiscount.Value = obj.Discount.ToString();
        }

        protected void ddlistCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = ddlistCustomers.SelectedIndex;
            if (index != 0)
            {
                txtCustomer.Value = ddlistCustomers.SelectedItem.Text;
            }
            else
            {
                txtCustomer.Value = "";
            }

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
                Sale_CustomerName = txtCustomer.Value,
                Sale_PaymentType = ddlistForeignCurrencies.SelectedItem.Text,
                Sale_TaxName = "Without Tax",
                Sale_Tax = 0,
                Sale_Subtotal = Convert.ToDouble(txtSubtotal.Value),
                Sale_Discount = Convert.ToInt32(txtTotalDiscount.Value),
                Sale_TotalAmount = Convert.ToDouble(txtTotal.Value),
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
            string inVisible = "notificationinVisible()";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", inVisible, true);
        }

        protected void btnAbortTransaction_Click(object sender, EventArgs e)
        {
            this.RemoveItemsFromSaleDetailList();
            this.ResetDetailInputs();
            this.ResetSaleInputs();
        }

        private void ResetSaleInputs()
        {
            txtSubtotal.Value = "";
            txtTotalDiscount.Value = "";
            txtTotal.Value = "";
            txtPayment.Value = "";
            txtConversion.Value = "";
            txtPaymentChange.Value = "";
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
            txtCurrencySale.Value = Currency.Cye_Sale.ToString();
            txtCurrencyPurchase.Value = Currency.Cye_Purchase.ToString();
            txtCurrencyExchangeId.Text = Currency.Pk_CurrencyExchange.ToString();
        }

        private void CalculatePaymentChange()
        {
            this.FetchCurrencyExchangeFromDataBase();
            double sale, purchase, payment, conversion, paymentChange, totalToPay;
            if (txtCurrencyPurchase.Value != "" && txtPayment.Value != "")
            {
                purchase = Convert.ToDouble(txtCurrencyPurchase.Value);
                payment = Convert.ToDouble(txtPayment.Value);
                totalToPay = Convert.ToDouble(txtTotal.Value);
                conversion = purchase * payment;
                txtConversion.Value = conversion.ToString();
                paymentChange = conversion - totalToPay;
                txtPaymentChange.Value = paymentChange.ToString();
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

        //protected void btnNewSale_Click(object sender, EventArgs e)
        //{
        //    SalesView.ActiveViewIndex = 0;
        //}

        //protected void btnDetailsSale_Click(object sender, EventArgs e)
        //{
        //    SalesView.ActiveViewIndex = 2;
        //}

        //protected void btnHistSale_Click(object sender, EventArgs e)
        //{
        //    SalesView.ActiveViewIndex = 1;
        //}
    }
}