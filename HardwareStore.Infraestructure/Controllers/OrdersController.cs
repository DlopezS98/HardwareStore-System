﻿using HardwareStore.Domain;
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
    public class OrdersController : HarwareStoreRepository
    {
        private SqlCommand Command;

        public List<tblOrders> GetOrders(DateTime StartDate, DateTime EndDate)
        {
            try
            {
                List<tblOrders> OrderList = new List<tblOrders>();
                var data = this.execSpListOrders(StartDate, EndDate);
                OrderList = this.MapOrdersData(data);
                return OrderList;
            }
            catch (Exception exc)
            {

                throw exc;
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
            catch (Exception exc)
            {
                throw exc;
            }
        }

        public List<tblOrders> MapOrdersData(DataTable dataTable)
        {
            try
            {
                DateTime date;
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
                        obj.newDate = "[ " + date.ToString("dd-MM-yyyy") + " ]";
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
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public string MainOrderTransaction(Tbl_Orders Ord, List<Tbl_OrderDetails> Odt, List<Tbl_WarehouseProducts> WhPr)
        {
            try
            {
                this.CreateOrder(Ord);
                this.SendOrderDetails(Odt);
                this.InsertOrUpdateWirehouseProducts(WhPr);
                return "Orden Registrada con éxito, se actualizado las existencias de los productos";
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public void CreateOrder(Tbl_Orders Ord)
        {
            try
            {
                Command = new SqlCommand();
                var Connection = this.GetConnection();
                Command.Connection = Connection;
                Command.CommandText = "Sp_CreateOrder";
                Command.CommandType = CommandType.StoredProcedure;
                Connection.Open();
                Command.Parameters.AddWithValue("@Fk_SupplierID", Ord.Fk_SupplierID);
                Command.Parameters.AddWithValue("@Fk_UserID", Ord.Fk_UserID);
                Command.Parameters.AddWithValue("@Ord_Number", Ord.Ord_Number);
                Command.Parameters.AddWithValue("@Ord_Tax", Ord.Ord_Tax);
                Command.Parameters.AddWithValue("@Ord_Subtotal", Ord.Ord_Subtotal);
                Command.Parameters.AddWithValue("@Ord_Discount", Ord.Ord_Discount);
                Command.Parameters.AddWithValue("@Ord_Total", Ord.Ord_Total);
                Command.ExecuteNonQuery();
                Connection.Close();
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }

        public void SendOrderDetails(List<Tbl_OrderDetails> Odt)
        {
            try
            {
                if (Odt.Count > 0)
                {
                    Command = new SqlCommand();
                    var Connection = this.GetConnection();
                    Connection.Open();
                    for (int i = 0; i < Odt.Count; i++)
                    {
                        Command.Connection = Connection;
                        Command.CommandText = "Sp_CreateOrderDetail";
                        Command.CommandType = CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("@Fk_ProductDetailID", Odt[i].Fk_ProductDetailID);
                        Command.Parameters.AddWithValue("@Odt_Quantity", Odt[i].Odt_Quantity);
                        Command.Parameters.AddWithValue("@Odt_PurchasePrice", Odt[i].Odt_PurchasePrice);
                        Command.Parameters.AddWithValue("@Odt_DetailTax", Odt[i].Odt_DetailTax);
                        Command.Parameters.AddWithValue("@Odt_Subtotal", Odt[i].Odt_Subtotal);
                        Command.Parameters.AddWithValue("@Odt_Discount", Odt[i].Odt_Discount);
                        Command.Parameters.AddWithValue("@Odt_Total", Odt[i].Odt_Total);
                        Command.ExecuteNonQuery();
                    }
                    Connection.Close();
                }
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public void InsertOrUpdateWirehouseProducts(List<Tbl_WarehouseProducts> WhPr)
        {
            try
            {
                if (WhPr.Count > 0)
                {
                    Command = new SqlCommand();
                    var Connection = this.GetConnection();
                    Connection.Open();
                    for (int i = 0; i < WhPr.Count; i++)
                    {
                        Command.Connection = Connection;
                        Command.CommandText = "Sp_WirehouseProducts";
                        Command.CommandType = CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("@Fk_WarehouseID", WhPr[i].Fk_WarehouseID);
                        Command.Parameters.AddWithValue("@Fk_ProductDetailID", WhPr[i].Fk_ProductDetailID);
                        Command.Parameters.AddWithValue("@WhPr_Stock", WhPr[i].WhPr_Stock);
                        Command.Parameters.AddWithValue("@WhPr_PurchasePrice", WhPr[i].WhPr_PurchasePrice);
                        Command.Parameters.AddWithValue("@WhPr_SalePrice", WhPr[i].WhPr_SalePrice);
                        Command.ExecuteNonQuery();
                    }
                    Connection.Close();
                }
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }
    }
}
