using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardwareStore.Modules.Security.Module
{
    public partial class MainSecurity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNewUser_Click(object sender, EventArgs e)
        {
            MultiViewUsuarios.ActiveViewIndex = 1;
        }
    }
}