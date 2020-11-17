using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Interfaces
{
    public interface IWarehousesRepository
    {
        List<ctgWarehouse> GetWarehouses();
        void CreateWarehouse(Ctg_Warehouses Warehouse);
        void UpdateWarehouse(Ctg_Warehouses Warehouse);
        void DeleteWarehouse(int Pk_WarehouseID);
    }
}
