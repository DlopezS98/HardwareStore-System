﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardwareStore.Modules.Catalogs.Module
{
    public partial class Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnCatTodos_Click(object sender, EventArgs e)
        {
            ctvContenedor.ActiveViewIndex = 1;
        }

        protected void Btnatras_Click(object sender, EventArgs e)
        {
            ctvContenedor.ActiveViewIndex = 0;
        }
    }
}