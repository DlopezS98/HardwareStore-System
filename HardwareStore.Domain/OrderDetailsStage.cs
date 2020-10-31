using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HardwareStore.Domain
{
    public class OrderDetailsStage
    {
        public int Fk_WarehouseID { get; set; }
        public int Fk_ProductDetailID { get; set; }
        public string WarehouseName { get; set; }
        public string DefaultCode { get; set; }
        public string ProductName { get; set; }
        public string SupplierName { get; set; }
        public int Fk_SupplierID { get; set; }
        public string BrandName { get; set; }
        public string MaterialType { get; set; }
        public string Dimensions { get; set; }
        public string MeasureUnit { get; set; }
        public double PurchasePrice { get; set; }
        public int Quantity { get; set; }
        public int Discount { get; set; }
        public double Subtotal { get => this.Quantity * this.PurchasePrice; }
        public double totalAmount
        { get => (this.Subtotal - (((double)this.Discount / 100) * this.Subtotal)); }
    }
}