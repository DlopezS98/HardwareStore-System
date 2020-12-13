using HardwareStore.Core.Interfaces;
using HardwareStore.Domain;
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
        List<SaleDetailsStage> listSdtStage = null;

        public void LoadGridViewWarehouseProducts(string query)
        {
            var list = this.vWarehouseProductsRepository.GetProductsInWarehouse(query);
            //var ProductsBySuppliers = list.FindAll(sp => sp.Fk_SupplierID == 1);
            GridViewWarehouseProducts.DataSource = list;
            GridViewWarehouseProducts.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGridViewWarehouseProducts("");
            }
        }

        protected void btnBackToCreateSale_Click(object sender, EventArgs e)
        {
            SalesView.ActiveViewIndex = 0;
        }

        protected void btnTblProducts_Click(object sender, EventArgs e)
        {
            SalesView.ActiveViewIndex = 2;
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
            switch (e.CommandName)
            {
                case "cmdSelect":
                    //this.ResetDetailInputs();
                    this.SendWarehouseProductToTextBox(idWhr, idProdDetail);
                    break;
                default:
                    break;
            }
        }

        public void SendWarehouseProductToTextBox(int idWhr, int idProdDetail)
        {
            var obj = this.vWarehouseProductsRepository.GetAWarehouseProduct(idWhr, idProdDetail);
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
        }

        public SaleDetailsStage CreateItemForDetailStage()
        {
            var ObjStage = new SaleDetailsStage()
            {
                WarehouseId = Convert.ToInt32(txtWarehouseId.Text),
                ProductId = Convert.ToInt32(txtProductId.Text),
                ProductName = txtProduct.Text,
                BrandName = txtBrand.Text,
                UnitMeasure = txtMeasureUnit.Text,
                Code = txtProductCode.Text,
                Dimensions = txtDimensions.Text,
                MaterialType = txtMaterialType.Text,
                Quantity = Convert.ToInt32(txtQuantity.Text),
                Price = Convert.ToDouble(txtPrice.Text),
                //Tax = Convert.ToDouble(txt)
            };

            return ObjStage;
        }
    }
}