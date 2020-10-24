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
        private readonly WarehouseController WarehouseCtrl;
        //private readonly WarehouseProductsController WhPrCtrl;

        public OrdersPage()
        {
            this.WarehouseCtrl = new WarehouseController();
            //this.WhPrCtrl = new WarehouseProductsController();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LoadDropDownWarehouse();
            }
        }

        public void LoadDropDownWarehouse()
        {
            ddlstWarehouses.DataSource = this.WarehouseCtrl.GetWarehouses();
            ddlstWarehouses.DataTextField = "DropDisplayName";
            ddlstWarehouses.DataValueField = "Pk_WarehouseID";
            ddlstWarehouses.DataBind();
            ddlstWarehouses.Items.Insert(0, new ListItem("----[Seleccionar Bodega Destino]----", "0"));
        }

        [WebMethod]
        //[ScriptMethod(UseHttpGet = true)]
        public static Object LoadData()
        {
            DateTime Start = DateTime.Parse("2000-09-12");
            DateTime End = DateTime.Parse("2020-10-18");
            OrdersController OrdCtr = new OrdersController();
            var obj = OrdCtr.GetOrders(Start, End);
            //return "Hello World";
            return obj;
        }

        [WebMethod]
        public static Object GetWarehouseProducts()
        {
            WarehouseProductsController WhPr = new WarehouseProductsController();
            var obj = WhPr.GetProductsInWarehouse("");
            return obj;
        }

        public void SendOrder()
        {

        }
    }
    }
}