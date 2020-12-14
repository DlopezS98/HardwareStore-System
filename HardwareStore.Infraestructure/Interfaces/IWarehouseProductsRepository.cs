using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Interfaces
{
    public interface IWarehouseProductsRepository
    {
        List<tblWarehouseProducts> GetProductsInWarehouse(string QueryString);
        void CreaeteOrUpdateWarehouseProduct(Tbl_WarehouseProducts WhPr);
        tblWarehouseProducts GetAWarehouseProduct(int idWhr, int idProdDetail, int idSupplier);
    }
}
