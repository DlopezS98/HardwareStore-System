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
    
    public partial class Ctg_Customers
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ctg_Customers()
        {
            this.Tbl_Sales = new HashSet<Tbl_Sales>();
        }
    
        public int Pk_CustomerID { get; set; }
        public string Cust_CustomID { get; set; }
        public string Cust_FirtsName { get; set; }
        public string Cust_LastName { get; set; }
        public string Cust_Address { get; set; }
        public string Cust_PhoneNumber { get; set; }
        public string Cust_IdentificationCard { get; set; }
        public System.DateTime Cust_CreatedAt { get; set; }
        public System.DateTime Cust_UpdatedAt { get; set; }
        public bool Cust_Deleted { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tbl_Sales> Tbl_Sales { get; set; }
    }
}
