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
    
    public partial class Ctg_Products
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ctg_Products()
        {
            this.Ctg_ProductDetails = new HashSet<Ctg_ProductDetails>();
        }
    
        public int Pk_productID { get; set; }
        public string Prod_customID { get; set; }
        public string Prod_Name { get; set; }
        public string Prod_Description { get; set; }
        public bool Prod_Deleted { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ctg_ProductDetails> Ctg_ProductDetails { get; set; }
    }
}
