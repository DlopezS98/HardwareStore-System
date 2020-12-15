using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardwareStore.Modules.ProductsAdmin.Module
{
    public partial class DeleteProductWarehause : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirmationDelete_Click(object sender, EventArgs e)
        {
            DPWView.ActiveViewIndex = 0;
        }
    }
}