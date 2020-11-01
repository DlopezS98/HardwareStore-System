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
    public class SuppliersControllers : HarwareStoreRepository
    {
        private SqlCommand Command;

        public List<Ctg_Suppliers> GetSuppliers()
        {
            try
            {
                List<Ctg_Suppliers> SupplierList = new List<Ctg_Suppliers>();
                var data = this.ExecQuerySuppliers();
                SupplierList = this.MapSuppliersData(data);
                return SupplierList;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public DataTable ExecQuerySuppliers()
        {
            try
            {
                DataTable dt = new DataTable();
                var query = "SELECT * FROM [dbo].[Ctg_Suppliers] ORDER BY [Sps_CompanyName] ASC";
                dt = this.GetInformation(query);
                return dt;
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }

        public List<Ctg_Suppliers> MapSuppliersData(DataTable dataTable)
        {
            List<Ctg_Suppliers> List = new List<Ctg_Suppliers>();
            if (dataTable.Rows.Count > 0)
            {
                foreach (DataRow row in dataTable.Rows)
                {
                    Ctg_Suppliers obj = new Ctg_Suppliers();
                    obj.Pk_SupplierID = Convert.ToInt32(row["Pk_SupplierID"]);
                    obj.Sps_customID = row["Sps_customID"].ToString();
                    obj.Sps_CompanyName = row["Sps_CompanyName"].ToString();
                    obj.Sps_Name = row["Sps_Name"].ToString();
                    List.Add(obj);
                }
            }

            return List;
        }
    }
}
