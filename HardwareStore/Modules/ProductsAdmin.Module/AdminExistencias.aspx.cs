using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardwareStore.Modules.ProductsAdmin.Module
{
    public partial class AdminExistencias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProductWarehouse_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Modules/ProductsAdmin.Module/WarehouseProducts.aspx");
        }

        protected void btntransferencies_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Modules/ProductsAdmin.Module/TransfersHistory.aspx");
        }

        protected void btnDamage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Modules/ProductsAdmin.Module/DamagedProducts.aspx");
        }
    }
}