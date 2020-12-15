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

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnProductReport_Click(object sender, EventArgs e)
        {
            var data = this.vProductsRepository.FetchProductsFromDataBase();
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportDataSource Rdlc = new ReportDataSource("DataSet1", data);
            ReportViewer1.LocalReport.DataSources.Add(Rdlc);
            ReportViewer1.LocalReport.Refresh();
        }
    }
}