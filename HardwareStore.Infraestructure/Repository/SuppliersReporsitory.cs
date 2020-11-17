using HardwareStore.Domain.Models;
using HardwareStore.Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Repository
{
    public class SuppliersReporsitory : HardwareStoreRepository, ISuppliersRepository
    {

        private readonly HardwareStoreEntities Context;

        public SuppliersReporsitory(HardwareStoreEntities Context) : base(Context)
        {
            this.Context = Context;
        }

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

        private DataTable ExecQuerySuppliers()
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

        private List<Ctg_Suppliers> MapSuppliersData(DataTable dataTable)
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
