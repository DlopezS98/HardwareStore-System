//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HardwareStore.Domain.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tbl_OrderDetails
    {
        public int Fk_OrderID { get; set; }
        public int Fk_ProductDetailID { get; set; }
        public int Fk_DestinationWarehouseID { get; set; }
        public int Odt_Quantity { get; set; }
        public double Odt_PurchasePrice { get; set; }
        public Nullable<double> Odt_DetailTax { get; set; }
        public double Odt_Subtotal { get; set; }
        public Nullable<int> Odt_Discount { get; set; }
        public double Odt_Total { get; set; }
    
        public virtual Ctg_ProductDetails Ctg_ProductDetails { get; set; }
        public virtual Ctg_Warehouses Ctg_Warehouses { get; set; }
        public virtual Tbl_Orders Tbl_Orders { get; set; }
    }
}
