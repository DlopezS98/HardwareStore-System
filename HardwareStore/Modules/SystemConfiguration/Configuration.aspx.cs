using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardwareStore.Modules.SystemConfiguration
{
    public partial class Configuration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            containerConfig.ActiveViewIndex = 1;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            containerConfig.ActiveViewIndex = 0;
        }
    }
}