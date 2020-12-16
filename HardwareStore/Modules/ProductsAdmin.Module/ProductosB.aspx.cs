using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardwareStore.Modules.ProductsAdmin.Module
{
    public partial class ProductosB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMove_Click(object sender, EventArgs e)
        {
            string ShowToaster = "launch_toast()";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowToaster, true);
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {

        }

        protected void Listmove_Click(object sender, EventArgs e)
        {
            ProductWaresause.ActiveViewIndex = 2;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ProductWaresause.ActiveViewIndex = 1;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ProductWaresause.ActiveViewIndex = 0;
        }
    }
}