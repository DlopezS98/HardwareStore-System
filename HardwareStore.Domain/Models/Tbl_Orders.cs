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
    
    public partial class Tbl_Orders
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tbl_Orders()
        {
            this.Tbl_OrderDetails = new HashSet<Tbl_OrderDetails>();
        }
    
        public int Pk_OrderID { get; set; }
        public int Fk_SupplierID { get; set; }
        public int Fk_UserID { get; set; }
        public string Ord_Number { get; set; }
        public Nullable<System.DateTime> Ord_Date { get; set; }
        public Nullable<double> Ord_Tax { get; set; }
        public double Ord_Subtotal { get; set; }
        public Nullable<int> Ord_Discount { get; set; }
        public double Ord_Total { get; set; }
        public bool Ord_Deleted { get; set; }
    
        public virtual Ctg_Suppliers Ctg_Suppliers { get; set; }
        public virtual Ctg_Users Ctg_Users { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tbl_OrderDetails> Tbl_OrderDetails { get; set; }
    }
}
