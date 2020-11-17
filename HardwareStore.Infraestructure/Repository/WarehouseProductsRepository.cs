using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using HardwareStore.Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Repository
{
    public class WarehouseProductsRepository: HardwareStoreRepository, IWarehouseProductsRepository
    {
        private readonly HardwareStoreEntities Context;

        public WarehouseProductsRepository(HardwareStoreEntities Context): base(Context)
        {
            this.Context = Context;
        }

        private SqlCommand Command;

        public List<tblWarehouseProducts> GetProductsInWarehouse(string QueryString)
        {
            try
            {
                List<tblWarehouseProducts> WhPr = new List<tblWarehouseProducts>();
                var data = this.ExecSpListWarehouseProduct(QueryString);
                WhPr = this.MapWarehouseProduct(data);
                return WhPr;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private DataTable ExecSpListWarehouseProduct(string QueryString)
        {
            try
            {
                DataTable dt = new DataTable();
                var query = string.Format("exec [dbo].[Sp_ListWarehouseProducts] '{0}'", QueryString);
                dt = this.GetInformation(query);
                return dt;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private List<tblWarehouseProducts> MapWarehouseProduct(DataTable dataTable)
        {
            try
            {
                DateTime date;
                List<tblWarehouseProducts> WhPr = new List<tblWarehouseProducts>();
                if (dataTable.Rows.Count > 0)
                {
                    foreach (DataRow row in dataTable.Rows)
                    {
                        tblWarehouseProducts obj = new tblWarehouseProducts();
                        obj.Fk_WarehouseID = Convert.ToInt32(row["Fk_WarehouseID"]);
                        obj.WarehouseName = row["Whs_Name"].ToString();
                        obj.Fk_ProductDetailID = Convert.ToInt32(row["Fk_ProductDetailID"]);
                        obj.ProductName = row["Prod_Name"].ToString();
                        obj.CategoryName = row["Cat_Name"].ToString();
                        obj.BrandName = row["Brs_Name"].ToString();
                        obj.Fk_SupplierID = Convert.ToInt32(row["Fk_SupplierID"]);
                        obj.SupplierName = row["Sps_CompanyName"].ToString();
                        obj.MeasureUnit = row["Utc_DestinationUnit"].ToString();
                        obj.DefaultCode = row["Pdl_DefaultCode"].ToString();
                        obj.Dimensions = row["Pdl_Dimensions"].ToString();
                        obj.MaterialType = row["Pdl_MaterialType"].ToString();
                        if (row["Pdl_ExpiryDate"].ToString() != "")
                        {
                            date = Convert.ToDateTime(row["Pdl_ExpiryDate"]);
                            obj.ExpiryDate = "[ " + date.ToString("dd-MM-yyyy") + " ]";
                        }
                        else
                        {
                            obj.ExpiryDate = "[ No date Set ]";
                        }
                        obj.WhPr_Stock = Convert.ToInt32(row["WhPr_Stock"]);
                        obj.WhPr_PurchasePrice = Convert.ToDouble(row["WhPr_PurchasePrice"]);
                        obj.WhPr_SalePrice = Convert.ToInt32(row["WhPr_SalePrice"]);
                        obj.WhPr_CreatedAt = Convert.ToDateTime(row["WhPr_CreatedAt"]);
                        obj.WhPr_UpdatedAt = Convert.ToDateTime(row["WhPr_UpdatedAt"]);
                        WhPr.Add(obj);
                    }
                }

                return WhPr;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public void CreaeteOrUpdateWarehouseProduct(Tbl_WarehouseProducts WhPr)
        {
            try
            {
                Command = new SqlCommand();
                var Connection = this.GetConnection();
                Command.Connection = Connection;
                Command.CommandText = "Sp_WirehouseProducts";
                Command.CommandType = CommandType.StoredProcedure;
                Connection.Open();
                Command.Parameters.AddWithValue("@Fk_WarehouseID", WhPr.Fk_WarehouseID);
                Command.Parameters.AddWithValue("@Fk_ProductDetailID", WhPr.Fk_ProductDetailID);
                Command.Parameters.AddWithValue("@WhPr_Stock", WhPr.WhPr_Stock);
                Command.Parameters.AddWithValue("@WhPr_PurchasePrice", WhPr.WhPr_PurchasePrice);
                Command.Parameters.AddWithValue("@WhPr_SalePrice", WhPr.WhPr_SalePrice);
                Command.ExecuteNonQuery();
                Connection.Close();
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public tblWarehouseProducts GetAWarehouseProduct(int idWhr, int idProdDetail)
        {
            var list = this.GetProductsInWarehouse("");
            var obj = list.FirstOrDefault(code => code.Fk_WarehouseID == idWhr && code.Fk_ProductDetailID == idProdDetail);
            return obj;
        }
    }
}
