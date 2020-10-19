using HardwareStore.Domain;
using HardwareStore.Infraestructure.Repository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Infraestructure.Controllers
{
    public class OrdersController : HarwareStoreRepository
    {
        public List<tblOrders> GetOrders(DateTime StartDate, DateTime EndDate)
        {
            try
            {
                List<tblOrders> OrderList = new List<tblOrders>();
                var data = this.execSpListOrders(StartDate, EndDate);
                OrderList = this.MapOrdersData(data);
                return OrderList;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public DataTable execSpListOrders(DateTime StartDate, DateTime EndDate)
        {
            try
            {
                DataTable dt = new DataTable();
                var query = string.Format("exec [dbo].[Sp_ListOrders] '{0}', '{1}', {2}", StartDate, EndDate, false);
                dt = this.GetInformation(query);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<tblOrders> MapOrdersData(DataTable dataTable)
        {
            try
            {
                DateTime date;
                string newDate;
                List<tblOrders> List = new List<tblOrders>();
                if (dataTable.Rows.Count > 0)
                {
                    foreach (DataRow row in dataTable.Rows)
                    {
                        tblOrders obj = new tblOrders();
                        obj.Pk_OrderID = Convert.ToInt32(row["Pk_OrderID"]);
                        obj.Fk_SupplierID = Convert.ToInt32(row["Fk_SupplierID"]);
                        obj.SupplierName = row["Sps_CompanyName"].ToString();
                        obj.Fk_UserID = Convert.ToInt32(row["Fk_UserID"]);
                        obj.UserName = row["UserName"].ToString();
                        obj.Ord_Number = row["Ord_Number"].ToString();
                        date = Convert.ToDateTime(row["Ord_Date"]);
                        newDate = "[" + date.ToString("dd-MM-yyyy") + "]";
                        obj.newDate = newDate;
                        obj.Ord_Tax = Convert.ToDouble(row["Ord_Tax"]);
                        obj.Ord_Subtotal = Convert.ToDouble(row["Ord_Subtotal"]);
                        obj.Ord_Discount = Convert.ToInt32(row["Ord_Discount"]);
                        obj.Ord_Total = Convert.ToDouble(row["Ord_Total"]);
                        obj.Ord_Deleted = Convert.ToBoolean(row["Ord_Deleted"]);
                        List.Add(obj);
                    }
                }

                return List;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
