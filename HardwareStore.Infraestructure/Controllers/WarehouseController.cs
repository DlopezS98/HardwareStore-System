using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using HardwareStore.Infraestructure.Repository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Infraestructure.Controllers
{
    public class WarehouseController : HarwareStoreRepository
    {
        private SqlCommand Command;

        public List<ctgWarehouse> GetWarehouses()
        {
            List<ctgWarehouse> warehouse = new List<ctgWarehouse>();
            warehouse = this.ExecSpListWarehouses();
            return warehouse;
        }

        public List<ctgWarehouse> ExecSpListWarehouses()
        {
            DataTable dt = new DataTable();
            var query = string.Format("exec [dbo].[Sp_ListWarehouses]");
            dt = this.GetInformation(query);

            List<ctgWarehouse> warehouses = new List<ctgWarehouse>();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    ctgWarehouse Whs = new ctgWarehouse();
                    Whs.Pk_WarehouseID = Convert.ToInt32(row["Pk_WarehouseID"]);
                    Whs.Whs_CustomID = row["Whs_CustomID"].ToString();
                    Whs.Whs_Name = row["Whs_Name"].ToString();
                    Whs.Whs_Description = row["Whs_Description"].ToString();
                    Whs.Whs_CreatedAt = Convert.ToDateTime(row["Whs_CreatedAt"]);
                    Whs.Whs_UpdatedAt = Convert.ToDateTime(row["Whs_UpdatedAt"]);
                    Whs.Whs_Deleted = Convert.ToBoolean(row["Whs_Deleted"]);
                    warehouses.Add(Whs);
                }
            }

            return warehouses;
        }

        public void CreateWarehouse(Ctg_Warehouses Warehouse)
        {
            try
            {
                Command = new SqlCommand();
                var Connection = this.GetConnection();
                Command.Connection = Connection;
                Command.CommandText = "Sp_CreateWarehouse";
                Command.CommandType = CommandType.StoredProcedure;
                Connection.Open();
                Command.Parameters.AddWithValue("@Whs_Name", Warehouse.Whs_Name);
                Command.Parameters.AddWithValue("@Whs_Description", Warehouse.Whs_Description);
                Command.ExecuteNonQuery();
                Connection.Close();
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }

        public void UpdateWarehouse(Ctg_Warehouses Warehouse)
        {
            try
            {
                Command = new SqlCommand();
                var Connection = this.GetConnection();
                Command.Connection = Connection;
                Command.CommandText = "Sp_UpdateWarehouse";
                Command.CommandType = CommandType.StoredProcedure;
                Connection.Open();
                Command.Parameters.AddWithValue("@Pk_WarehouseID", Warehouse.Pk_WarehouseID);
                Command.Parameters.AddWithValue("@Whs_Name", Warehouse.Whs_Name);
                Command.Parameters.AddWithValue("@Whs_Description", Warehouse.Whs_Description);
                Command.ExecuteNonQuery();
                Connection.Close();
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public void DeleteWarehouse(Boolean Deleted)
        {
            
        }
    }
}
