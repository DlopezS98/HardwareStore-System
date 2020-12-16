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
    
    public partial class Ctg_Suppliers
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ctg_Suppliers()
        {
            this.Tbl_Orders = new HashSet<Tbl_Orders>();
            this.Tbl_WarehouseProducts = new HashSet<Tbl_WarehouseProducts>();
            this.Tbl_TransferDetails = new HashSet<Tbl_TransferDetails>();
        }
    
        public int Pk_SupplierID { get; set; }
        public string Sps_customID { get; set; }
        public string Sps_CompanyName { get; set; }
        public string Sps_Name { get; set; }
        public string Sps_Address { get; set; }
        public string Sps_PhoneNumber { get; set; }
        public string Sps_EmailAddress { get; set; }
        public System.DateTime Sps_CreatedAt { get; set; }
        public System.DateTime Sps_UpdatedAt_ { get; set; }
        public bool Sps_Deleted { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tbl_Orders> Tbl_Orders { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tbl_WarehouseProducts> Tbl_WarehouseProducts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tbl_TransferDetails> Tbl_TransferDetails { get; set; }
    }
}
