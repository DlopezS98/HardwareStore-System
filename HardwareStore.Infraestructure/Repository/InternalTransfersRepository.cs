using HardwareStore.Core.Interfaces;
using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Repository
{
    public class InternalTransfersRepository : HardwareStoreRepository, IInternalTransfersRepository
    {
        private readonly HardwareStoreEntities Context;
        private SqlCommand Command;

        public InternalTransfersRepository(HardwareStoreEntities Context) : base(Context)
        {
            this.Context = Context;
        }

        public List<Transfers> GetTranfersList(DateTime StartDate, DateTime EndDate, int Status)
        {
            try
            {
                List<Transfers> list = new List<Transfers>();
                DataTable dt = this.ExcSpListProductTransfers(StartDate, EndDate, Status);
                list = this.MapProductTransfersList(dt);
                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private DataTable ExcSpListProductTransfers(DateTime StartDate, DateTime EndDate, int Status)
        {
            try
            {
                DataTable dt = new DataTable();
                var query = string.Format("EXC [dbo].[Sp_ListProductTransfers] '{0}', '{1}', {2}", StartDate, EndDate, Status);
                dt = this.GetInformation(query);
                return dt;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }
        private List<Transfers> MapProductTransfersList(DataTable dt)
        {
            try
            {
                List<Transfers> list = new List<Transfers>();
                if(dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        Transfers e = new Transfers();
                        e.Id = Convert.ToInt32(row["Id"]);
                        e.UserId = Convert.ToInt32(row["UserId"]);
                        e.UserName = row["UserName"].ToString();
                        e.DestinationId = Convert.ToInt32(row["DestinationId"]);
                        e.WarehouseName = row["Warehouse"].ToString();
                        e.Date = Convert.ToDateTime(row["Date"]);
                        e.Total = Convert.ToInt32(row["Total"]);
                        e.Status = Convert.ToBoolean(row["Status"]);
                        e.StatusInfo = row["StatusInfo"].ToString();
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

        public List<TransferDetails> GetTransferDetails(int Id)
        {
            try
            {
                List<TransferDetails> list = new List<TransferDetails>();
                DataTable dt = this.ExecSpListTransferDetails(Id);
                list = this.MapTransferDetailList(dt);
                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private DataTable ExecSpListTransferDetails(int Id)
        {
            try
            {
                DataTable dt = new DataTable();
                var query = string.Format("EXEC [dbo].[Sp_ListTransferDetails] {0}", Id);
                dt = this.GetInformation(query);
                return dt;
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }

        private List<TransferDetails> MapTransferDetailList(DataTable dt)
        {
            try
            {
                List<TransferDetails> list = new List<TransferDetails>();
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        TransferDetails e = new TransferDetails();
                        e.Id = Convert.ToInt32(row["Id"]);
                        e.TransferId = Convert.ToInt32(row["TransferId"]);
                        e.ProductId = Convert.ToInt32(row["ProductId"]);
                        e.ProductName = row["ProductName"].ToString();
                        e.SourceId = Convert.ToInt32(row["SourceId"]);
                        e.Warehouse = row["Warehouse"].ToString();
                        e.SupplierId = Convert.ToInt32(row["SupplierId"]);
                        e.SupplierName = row["SupplierName"].ToString();
                        e.Quantity = Convert.ToInt32(row["Quantity"]);
                        e.Created = Convert.ToDateTime(row["CreatedAt"]);
                        e.Updated = Convert.ToDateTime(row["UpdatedAt"]);
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

        //Id -> Destination Warehouse Id
        public void MainTransferTransaction(int Id, Tbl_Transfers transfer, List<TemporaryTransferList> TempList)
        {
            try
            {
                this.ExecSpCreateProductTransfer(transfer);
                var list = this.MapTransferDetails(TempList);
                this.ExecSpCreateTransferDetails(list);
                this.UpdateWarehousesStock(Id, TempList);
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private void ExecSpCreateProductTransfer(Tbl_Transfers transfer)
        {
            try
            {
                Command = new SqlCommand();
                var Connection = this.GetConnection();
                Command.Connection = Connection;
                Command.CommandText = "[dbo].[Sp_CreateProductTransfer]";
                Command.CommandType = CommandType.StoredProcedure;
                Connection.Open();
                Command.Parameters.AddWithValue("@UserId", transfer.Fk_UserID);
                Command.Parameters.AddWithValue("@Destination", transfer.Fk_DestinationWarehouse);
                Command.Parameters.AddWithValue("@Total", transfer.TransferTotal);
                Command.ExecuteNonQuery();
                Connection.Close();
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private void ExecSpCreateTransferDetails(List<Tbl_TransferDetails> td)
        {
            try
            {
                if (td.Count > 0)
                {
                    var Connection = this.GetConnection();
                    Connection.Open();

                    for (int i = 0; i < td.Count; i++)
                    {
                        Command = new SqlCommand();
                        Command.Connection = Connection;
                        Command.CommandText = "[dbo].[Sp_CreateProductTransfer]";
                        Command.CommandType = CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("@ProductId", td[i].Fk_ProductDetailID);
                        Command.Parameters.AddWithValue("@SourceId", td[i].Fk_SourceWarehouseID);
                        Command.Parameters.AddWithValue("@SupplierId", td[i].Fk_SupplierId);
                        Command.Parameters.AddWithValue("@Quantity", td[i].TD_Quantity);
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

        private List<Tbl_TransferDetails> MapTransferDetails(List<TemporaryTransferList> TempList)
        {
            try
            {
                List<Tbl_TransferDetails> list = new List<Tbl_TransferDetails>();
                foreach (var e in TempList)
                {
                    Tbl_TransferDetails td = new Tbl_TransferDetails()
                    {
                        Fk_ProductDetailID = e.ProductId,
                        Fk_SourceWarehouseID = e.WarehouseSourceId,
                        Fk_SupplierId = e.SupplierId,
                        TD_Quantity = e.Quantity
                    };

                    list.Add(td);
                }

                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private void UpdateWarehousesStock(int Id, List<TemporaryTransferList> TempList)
        {
            try
            {
                this.IncreaseStockOfTheOriginWarehouse(Id, TempList);
                this.DecreaseStockOfTheOriginWarehouse(TempList);
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private void DecreaseStockOfTheOriginWarehouse(List<TemporaryTransferList> TempList)
        {
            try
            {
                if (TempList.Count > 0)
                {
                    foreach (var item in TempList)
                    {
                        var data = this.Context.Tbl_WarehouseProducts
                                    .FirstOrDefault(e => e.Fk_WarehouseID == item.WarehouseSourceId
                                                    && e.Fk_ProductDetailID == item.ProductId
                                                    && e.Fk_SupplierID == item.SupplierId);
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

        private void IncreaseStockOfTheOriginWarehouse(int Id, List<TemporaryTransferList> TempList)
        {
            try
            {
                if (TempList.Count > 0)
                {
                    foreach (var item in TempList)
                    {
                        var data = this.Context.Tbl_WarehouseProducts
                                    .FirstOrDefault(e => e.Fk_WarehouseID == Id
                                                    && e.Fk_ProductDetailID == item.ProductId
                                                    && e.Fk_SupplierID == item.SupplierId);
                        data.WhPr_Stock = data.WhPr_Stock + item.Quantity;
                        this.Context.SaveChanges();
                    }
                }
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public void CreateDeletedProduct(Tbl_RemovedProducts RemovedProduct)
        {
            throw new NotImplementedException();
        }

        public List<RemovedProducts> GetRemovedProductsList(DateTime StartDate, DateTime EndDate, int Status)
        {
            throw new NotImplementedException();
        }
    }
}
