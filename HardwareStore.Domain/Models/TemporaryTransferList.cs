using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain.Models
{
    public class TemporaryTransferList
    {
        public int ProductId { get; set; }
        public int WarehouseSourceId { get; set; }
        public int Quantity { get; set; }
        public int SupplierId { get; set; }
        public string ProductName { get; set; }
        public string WarehouseName { get; set; }
        public string SupplierName { get; set; }
        public string CategoryName { get; set; }
        public string BrandName { get; set; }
        public string MeasureUnit { get; set; }
        public string Dimensions { get; set; }
        public string MaterialType { get; set; }
        public int Stock { get; set; }
        public double PurchasePrice { get; set; }
        public double SalePrice { get; set; }
    }
}
