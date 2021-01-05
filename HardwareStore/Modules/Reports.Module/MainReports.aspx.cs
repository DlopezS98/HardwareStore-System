using Ninject.Web;
using System;
using System.Collections.Generic;
using HardwareStore.Core.Interfaces;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ninject;
using System.Data;
using Microsoft.Reporting.WebForms;

namespace HardwareStore.Modules.Reports.Module
{
    public partial class MainReports : PageBase
    {
        [Inject]
        public IProductsRepository vProductsRepository { get; set; }
        [Inject]
        public IWarehousesRepository vWarehouseRepository { get; set; }
        [Inject]
        public IWarehouseProductsRepository vWarehouseProductRepository { get; set; }
        [Inject]
        public IOrdersRepository vOrderRepository { get; set; }
        [Inject]
        public ISalesRepository vSalesRepository { get; set; }

        public void LoadDDListWarehouses()
        {
            var list = this.vWarehouseRepository.GetWarehouses();
            this.ddlistFilterByWarehouse.DataSource = list;
            this.ddlistFilterByWarehouse.DataTextField = "DropDisplayName";
            this.ddlistFilterByWarehouse.DataValueField = "Pk_WarehouseID";
            this.ddlistFilterByWarehouse.DataBind();
            this.ddlistFilterByWarehouse.Items.Insert(0, new ListItem("----[Todas las bodegas]----", "0"));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LoadDDListWarehouses();
            }
        }

        protected void btnProductReport_Click(object sender, EventArgs e)
        {
            var data = this.vProductsRepository.FetchProductsFromDataBase(0, "");
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportDataSource Rdlc = new ReportDataSource("DataSet1", data);
            ReportViewer1.LocalReport.DataSources.Add(Rdlc);
            ReportViewer1.LocalReport.Refresh();
            MultiviewReports.ActiveViewIndex = 1;

        }

        protected void btnGoToMainView_Click(object sender, EventArgs e)
        {
            MultiviewReports.ActiveViewIndex = 0;
        }

        protected void btnStockReport_Click(object sender, EventArgs e)
        {
            MultiviewReports.ActiveViewIndex = 2;
            this.LoadDataSourceForProductStockReport(0);
        }

        private void LoadDataSourceForProductStockReport(int WarehouseId)
        {
            var data = this.vWarehouseProductRepository.ExecSpListWarehouseProduct("", WarehouseId);
            ReportViewerProductStock.LocalReport.DataSources.Clear();
            ReportDataSource source = new ReportDataSource("StockReport", data);
            ReportViewerProductStock.LocalReport.DataSources.Add(source);
            ReportViewerProductStock.LocalReport.Refresh();
        }

        protected void ddlistFilterByWarehouse_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlistFilterByWarehouse.SelectedValue);
            this.LoadDataSourceForProductStockReport(id);
        }
        private void loadDataSourceForProductPurchaseReport(DateTime StartDate, DateTime EndDate)
        {
            var data = this.vOrderRepository.ExecSpListOrders(StartDate, EndDate, "");
            ReportViewerProductPurchase.LocalReport.DataSources.Clear();
            ReportDataSource source = new ReportDataSource("PurchaseReport", data);
            ReportViewerProductPurchase.LocalReport.DataSources.Add(source);
            ReportViewerProductPurchase.LocalReport.Refresh();
        }

        protected void btnFilterFilterByDateInProductPurchaseReport_Click(object sender, EventArgs e)
        {
            DateTime Start = Convert.ToDateTime(DatepickerFrom.Value);
            DateTime End = Convert.ToDateTime(DatepickerTo.Value);

            if (End > Start)
            {
                this.loadDataSourceForProductPurchaseReport(Start, End);
                return;
            }

            string ShowModalDate = "ModalDate()";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowModalDate, true);
        }

        protected void btnPurchaseReport_Click(object sender, EventArgs e)
        {
            MultiviewReports.ActiveViewIndex = 4;
            DateTime Start = DateTime.Parse("1998-10-01");
            DateTime End = DateTime.Now;
            this.loadDataSourceForProductPurchaseReport(Start, End);
        }

        protected void btnSalesReport_Click(object sender, EventArgs e)
        {
            MultiviewReports.ActiveViewIndex = 3;
            DateTime Start = DateTime.Parse("1998-10-01");
            DateTime End = DateTime.Now;
            this.LoadDataSourceForProductSaleReport(Start, End);
        }

        private void LoadDataSourceForProductSaleReport(DateTime StartDate, DateTime EndDate)
        {
            var data = this.vSalesRepository.ExecSpListSales(StartDate, EndDate, 0);
            ReportViewerProductSales.LocalReport.DataSources.Clear();
            ReportDataSource source = new ReportDataSource("SaleReport", data);
            ReportViewerProductSales.LocalReport.DataSources.Add(source);
            ReportViewerProductSales.LocalReport.Refresh();
        }

        protected void btnFilterSalesByDateRange_Click(object sender, EventArgs e)
        {
            DateTime Start = Convert.ToDateTime(SaleDateFrom.Value);
            DateTime End = Convert.ToDateTime(SaleDateTo.Value);

            if (End > Start)
            {
                this.LoadDataSourceForProductSaleReport(Start, End);
                return;
            }

            string ShowModalDate = "ModalDate()";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowModalDate, true);
        }
    }
}