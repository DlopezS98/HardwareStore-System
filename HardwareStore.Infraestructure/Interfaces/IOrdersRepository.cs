using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Infraestructure.Interfaces
{
    public interface IOrdersRepository
    {
        List<tblOrders> GetOrders(DateTime StartDate, DateTime EndDate);
        string MainOrderTransaction(Tbl_Orders Ord, List<Tbl_OrderDetails> Odt, List<Tbl_WarehouseProducts> WhPr);
        List<tblOrderDetails> GetOrderDetails(int id);
    }
}
