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
    
    public partial class Tbl_RemovedProducts
    {
        public int Pk_RemovedProductID { get; set; }
        public int Fk_WarehouseID { get; set; }
        public int Fk_ProductDetailID { get; set; }
        public int Fk_UserID { get; set; }
        public string RmProd_Title { get; set; }
        public string RmProd_Description { get; set; }
        public int RmProd_Quantity { get; set; }
        public double RmProd_PurchasePrice { get; set; }
        public System.DateTime RmProd_CreatedAt { get; set; }
        public Nullable<bool> RmProd_Status { get; set; }
    
        public virtual Ctg_Warehouses Ctg_Warehouses { get; set; }
        public virtual Ctg_ProductDetails Ctg_ProductDetails { get; set; }
    }
}
