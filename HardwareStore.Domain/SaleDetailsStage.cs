using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class SaleDetailsStage
    {
        public int ProductId { get; set; }
        public int WarehouseId { get; set; }
        public int SupplierId { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public string BrandName { get; set; }
        public string SupplierName { get; set; }
        public string UnitMeasure { get; set; }
        public string Code { get; set; }
        public string Dimensions { get; set; }
        public string MaterialType { get; set; }
        public int Quantity { get; set; }
        public double Price { get; set; }
        public double Tax { get; set; }
        public double Subtotal { get => (this.Quantity * this.Price) + this.Tax; }
        public int Discount { get; set; }
        public double Total { get => (this.Subtotal - (((double)this.Discount / 100) * this.Subtotal)); }
    }
}
