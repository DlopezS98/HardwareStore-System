using HardwareStore.Core.Interfaces;
using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace HardwareStore.Core.Repository
{
    public class SalesRepository : HardwareStoreRepository, ISalesRepository
    {
        private readonly HardwareStoreEntities Context;
        private SqlCommand Command;

        public SalesRepository(HardwareStoreEntities Context) : base(Context)
        {
            this.Context = Context;
        }

        public List<SaleDetails> GetSaleDetails(int id)
        {
            try
            {
                List<SaleDetails> list = new List<SaleDetails>();
                DataTable dt = this.ExecSpListSaleDetails(id);
                list = this.MapSaleDetailsList(dt);
                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private List<SaleDetails> MapSaleDetailsList(DataTable dt)
        {
            try
            {
                List<SaleDetails> list = new List<SaleDetails>();
                if(dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        SaleDetails e = new SaleDetails();
                        e.Id = Convert.ToInt32(row["Fk_SaleID"]);
                        e.Warehouse = row["Whs_Name"].ToString();
                        e.Product = row["Product"].ToString();
                        e.BaseUnit = row["NameBaseUnit"].ToString();
                        e.Abbrevation = row["Abbrevation"].ToString();
                        e.Price = Convert.ToDouble(row["Sdt_Price"]);
                        e.Quantity = Convert.ToInt32(row["Sdt_Quantity"]);
                        e.Subtotal = Convert.ToDouble(row["Sdt_Subtotal"]);
                        e.Discount = Convert.ToInt32(row["Sdt_Discount"]);
                        e.Total = Convert.ToDouble(row["Sdt_Total"]);
                        list.Add(e);
                    }
                }

                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private DataTable ExecSpListSaleDetails(int id)
        {
            try
            {
                DataTable dt = new DataTable();
                var query = string.Format("EXEC [dbo].[Sp_ListSaleDetails] {0}", id);
                dt = this.GetInformation(query);
                return dt;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public List<Sales> GetSalesList(DateTime StartDate, DateTime EndDate, int status)
        {
            try
            {
                List<Sales> saleList = new List<Sales>();
                var data = this.ExecSpListSales(StartDate, EndDate, status);
                saleList = this.MapSaleList(data);
                return saleList;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private DataTable ExecSpListSales(DateTime StartDate, DateTime EndDate, int status)
        {
            try
            {
                DataTable dt = new DataTable();
                var query = string.Format("EXEC [dbo].[Sp_ListSales] '{0}', '{1}', {2}", StartDate, EndDate, status);
                dt = this.GetInformation(query);
                return dt;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private List<Sales> MapSaleList(DataTable dataTable)
        {
            try
            {
                List<Sales> list = new List<Sales>();
                if(dataTable.Rows.Count > 0)
                {
                    foreach (DataRow row in dataTable.Rows)
                    {
                        Sales e = new Sales();
                        e.Id = Convert.ToInt32(row["Pk_SaleID"]);
                        e.UserName = row["UserName"].ToString();
                        e.CustomerName = row["CustomerName"].ToString();
                        e.LocalCurrency = row["LocalCurrency"].ToString();
                        e.LocalSymbol = row["LocalSymbol"].ToString();
                        e.ForeignCurrency = row["ForeignCurrency"].ToString();
                        e.ForeignSymbol = row["ForeignSymbol"].ToString();
                        e.CurrencyPurchase = Convert.ToDouble(row["Cye_Purchase"]);
                        e.CurrencySale = Convert.ToDouble(row["Cye_Sale"]);
                        e.PaymentType = row["Sale_PaymentType"].ToString();
                        e.SaleDate = Convert.ToDateTime(row["Sale_Date"]);
                        e.Subtotal = Convert.ToDouble(row["Sale_Subtotal"]);
                        e.Discount = Convert.ToInt32(row["Sale_Discount"]);
                        e.TotalAmount = Convert.ToDouble(row["Sale_TotalAmount"]);
                        e.Deleted = Convert.ToBoolean(row["Sale_Deleted"]);
                        list.Add(e);
                    }
                }

                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public void MainSalesTransactions(Tbl_Sales sales, List<SaleDetailsStage> listSaleDetails)
        {
            try
            {
                this.CreateSale(sales);
                this.CreateDetailSale(listSaleDetails);
                this.UpdateWarehousesStock(listSaleDetails);
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }

        private void CreateSale(Tbl_Sales sale)
        {
            try
            {
                Command = new SqlCommand();
                var Connection = this.GetConnection();
                Command.Connection = Connection;
                Command.CommandText = "[dbo].[Sp_CreateSales]";
                Command.CommandType = CommandType.StoredProcedure;
                Connection.Open();
                Command.Parameters.AddWithValue("@Fk_UserID", sale.Fk_UserID);
                Command.Parameters.AddWithValue("@Fk_CustomerID", sale.Fk_CustomerID);
                Command.Parameters.AddWithValue("@Fk_CurrencyExchangeID", sale.Fk_CurrencyExchange);
                Command.Parameters.AddWithValue("@Sale_CustomerName", sale.Sale_CustomerName);
                Command.Parameters.AddWithValue("@Sale_PaymentType", sale.Sale_PaymentType);
                Command.Parameters.AddWithValue("@Sale_TaxName", sale.Sale_TaxName);
                Command.Parameters.AddWithValue("@Sale_Tax", sale.Sale_Tax);
                Command.Parameters.AddWithValue("@Sale_Subtotal", sale.Sale_Subtotal);
                Command.Parameters.AddWithValue("@Sale_Discount", sale.Sale_Discount);
                Command.Parameters.AddWithValue("@Sale_TotalAmount", sale.Sale_TotalAmount);
                Command.ExecuteNonQuery();
                Connection.Close();
                //return true;
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }

        private void CreateDetailSale(List<SaleDetailsStage> Sdt)
        {
                var data = this.MapSaleDetailsStage(Sdt);
                var res = this.ExecSpCreateDetailSales(data);
        }

        private bool ExecSpCreateDetailSales(List<Tbl_SaleDetails> Sdt)
        {
            try
            {
                if (Sdt.Count > 0)
                {
                    var Connection = this.GetConnection();
                    Connection.Open();
                    for (int i = 0; i < Sdt.Count; i++)
                    {
                        Command = new SqlCommand();
                        Command.Connection = Connection;
                        Command.CommandText = "[dbo].[Sp_CreateSaleDetails]";
                        Command.CommandType = CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("@Fk_ProductDetailID", Sdt[i].Fk_ProductDetailID);
                        Command.Parameters.AddWithValue("@Fk_WarehouseId", Sdt[i].Fk_WarehouseId);
                        Command.Parameters.AddWithValue("@Sdt_Price", Sdt[i].Sdt_Price);
                        Command.Parameters.AddWithValue("@Sdt_Quantity", Sdt[i].Sdt_Quantity);
                        Command.Parameters.AddWithValue("@Sdt_Tax", Sdt[i].Sdt_Tax);
                        Command.Parameters.AddWithValue("@Sdt_Subtotal", Sdt[i].Sdt_Subtotal);
                        Command.Parameters.AddWithValue("@Sdt_Discount", Sdt[i].Sdt_Discount);
                        Command.Parameters.AddWithValue("@Sdt_Total", Sdt[i].Sdt_Total);
                        Command.ExecuteNonQuery();
                    }
                    Connection.Close();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }

        private List<Tbl_SaleDetails> MapSaleDetailsStage(List<SaleDetailsStage> list)
        {
            try
            {
                List<Tbl_SaleDetails> Sdt = new List<Tbl_SaleDetails>();

                foreach (var item in list)
                {
                    Tbl_SaleDetails obj = new Tbl_SaleDetails()
                    {
                        Fk_ProductDetailID = item.ProductId,
                        Fk_WarehouseId = item.WarehouseId,
                        Sdt_Price = item.Price,
                        Sdt_Quantity = item.Quantity,
                        Sdt_Tax = item.Tax,
                        Sdt_Subtotal = item.Subtotal,
                        Sdt_Discount = item.Discount,
                        Sdt_Total = item.Total
                    };

                    Sdt.Add(obj);
                }

                return Sdt;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private void UpdateWarehousesStock(List<SaleDetailsStage> Sdt)
        {
            try
            {
                if (Sdt.Count > 0)
                {
                    foreach (var item in Sdt)
                    {
                        var data = this.Context.Tbl_WarehouseProducts
                            .FirstOrDefault(e =>
                                            e.Fk_WarehouseID == item.WarehouseId &&
                                            e.Fk_ProductDetailID == item.ProductId &&
                                            e.Fk_SupplierID == item.SupplierId);
                        data.WhPr_Stock = data.WhPr_Stock - item.Quantity;
                        this.Context.SaveChanges();
                    }
                }
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }
    }
}
