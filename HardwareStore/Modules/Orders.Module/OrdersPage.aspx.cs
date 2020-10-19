using HardwareStore.Infraestructure.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardwareStore.Modules.Orders.Module
{
    public partial class OrdersPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static Object LoadData()
        {
            DateTime Start = DateTime.Parse("2000-09-12");
            DateTime End = DateTime.Parse("2020-10-18");
            OrdersController OrdCtr = new OrdersController();
            var obj = OrdCtr.GetOrders(Start, End);
            //return "Hello World";
            return obj;
        }
    }
}