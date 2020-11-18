using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Interfaces
{
    public interface ISalesRepository
    {
        List<tblSales> GetSales(DateTime StartDate, DateTime EndDate);
        List<tblSaleDetails> GetSaleDetails(int id);
        string MainSalesTransactions();
    }
}
