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
    
    public partial class Ctg_Currency
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ctg_Currency()
        {
            this.Ctg_CurrencyExchange = new HashSet<Ctg_CurrencyExchange>();
        }
    
        public int Pk_CurrencyID { get; set; }
        public string Cy_Name { get; set; }
        public string Cy_Description { get; set; }
        public bool Cy_Deleted { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ctg_CurrencyExchange> Ctg_CurrencyExchange { get; set; }
    }
}
