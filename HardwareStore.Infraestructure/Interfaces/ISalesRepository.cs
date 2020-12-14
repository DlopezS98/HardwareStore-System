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
        List<Sales> GetSalesList(DateTime StartDate, DateTime EndDate);
        List<SaleDetails> GetSaleDetails(int id);
        void MainSalesTransactions(Tbl_Sales sales, List<SaleDetailsStage> SaleDetails);
    }
}
