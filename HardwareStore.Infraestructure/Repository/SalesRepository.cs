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
                var data = (from details in this.Context.Tbl_SaleDetails
                            join productDetail in this.Context.Ctg_ProductDetails
                            on details.Fk_ProductDetailID equals productDetail.Pk_ProductDetailID
                            join brand in this.Context.Ctg_Brands
                            on productDetail.Fk_BrandID equals brand.Pk_BrandID
                            join product in this.Context.Ctg_Products
                            on productDetail.Fk_ProductID equals product.Pk_productID
                            where details.Fk_SaleID == id
                            select new SaleDetails
                            {
                                SaleId = details.Fk_SaleID,
                                ProductId = details.Fk_ProductDetailID,
                                Product = product.Prod_Name,
                                Brand = brand.Brs_Name,
                                Dimensions = productDetail.Pdl_Dimensions,
                                MaterialType = productDetail.Pdl_MaterialType,
                                Price = details.Sdt_Price,
                                Quantity = details.Sdt_Quantity,
                                Tax = details.Sdt_Tax,
                                Subtotal = details.Sdt_Subtotal,
                                Discount = details.Sdt_Discount,
                                Total = details.Sdt_Total
                            }).ToList();
                return data;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public List<Sales> GetSalesList()
        {
            try
            {
                var data = (from sales in this.Context.Tbl_Sales
                            join users in this.Context.Ctg_Users
                            on sales.Fk_UserID equals users.Pk_UserID
                            join CyExchange in this.Context.Ctg_CurrencyExchange
                            on sales.Fk_CurrencyExchangeID equals CyExchange.Pk_CurrencyExchangeID
                            join Currency in this.Context.Ctg_Currency
                            on CyExchange.Fk_CurrencyID equals Currency.Pk_CurrencyID
                            where sales.Sale_Deleted == false
                            orderby sales.Sale_Date ascending
                            select new Sales
                            {
                                SaleId = sales.Pk_SaleID,
                                UserId = sales.Fk_UserID,
                                User = users.UserName,
                                CustomerId = sales.Fk_CustomerID,
                                Customer = sales.Sale_CustomerName,
                                CurrencyId = sales.Fk_CurrencyExchangeID,
                                Currency = Currency.Cy_Name,
                                CurrencySymbol = Currency.Cy_Symbol,
                                PaymentType = sales.Sale_PaymentType,
                                SaleDate = sales.Sale_Date,
                                TaxName = sales.Sale_TaxName,
                                Tax = sales.Sale_Tax,
                                Discount = sales.Sale_Discount,
                                TotalAmount = sales.Sale_TotalAmount,
                                Deleted = sales.Sale_Deleted
                            }).ToList();

                return data;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public bool MainSalesTransactions(Tbl_Sales sales, List<SaleDetailsStage> listSaleDetails)
        {
            try
            {
                this.CreateSale(sales);
                this.CreateDetailSale(listSaleDetails);
                this.UpdateWarehousesStock(listSaleDetails);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        private bool CreateSale(Tbl_Sales sale)
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
                Command.Parameters.AddWithValue("@Fk_CurrencyExchangeID", sale.Fk_CurrencyExchangeID);
                Command.Parameters.AddWithValue("@Sale_CustomerName", sale.Sale_CustomerName);
                Command.Parameters.AddWithValue("@Sale_PaymentType", sale.Sale_PaymentType);
                Command.Parameters.AddWithValue("@Sale_TaxName", sale.Sale_TaxName);
                Command.Parameters.AddWithValue("@Sale_Tax", sale.Sale_Tax);
                Command.Parameters.AddWithValue("@Sale_Subtotal", sale.Sale_Subtotal);
                Command.Parameters.AddWithValue("@Sale_Discount", sale.Sale_Discount);
                Command.Parameters.AddWithValue("@Sale_TotalAmount", sale.Sale_TotalAmount);
                Command.ExecuteNonQuery();
                Connection.Close();
                return true;
            }
            catch (Exception exc)
            {
                return false;
            }
        }

        private bool CreateDetailSale(List<SaleDetailsStage> Sdt)
        {
            try
            {
                var data = this.MapSaleDetailsStage(Sdt);
                var res = this.ExecSpCreateDetailSales(data);
                if (res)
                    return true;
                else
                    return false;
            }
            catch (Exception exc)
            {
                return false;
            }
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
            catch (Exception)
            {
                return false;
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
