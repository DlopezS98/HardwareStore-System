using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardwareStore.Modules.ProductsAdmin.Module
{
    public partial class MainProductsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNewProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MODULOS/ADMIN_CATALOGOS/Productos.aspx");
        }

        protected void btnbackToView0_Click(object sender, EventArgs e)
        {
            MultiViewProductStocks.ActiveViewIndex = 0;
        }

        protected void btnInfoDetails_Click(object sender, EventArgs e)
        {
            MultiViewProductStocks.ActiveViewIndex = 1;
        }
    }
}