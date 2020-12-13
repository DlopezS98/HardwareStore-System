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
    
    public partial class Ctg_CurrencyExchange
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ctg_CurrencyExchange()
        {
            this.Tbl_Sales = new HashSet<Tbl_Sales>();
        }
    
        public int Pk_CurrencyExchange { get; set; }
        public int Fk_ForeignCurrency { get; set; }
        public int Fk_LocalCurrency { get; set; }
        public double Cye_Sale { get; set; }
        public double Cye_Purchase { get; set; }
        public System.DateTime Cye_CreatedAt { get; set; }
        public System.DateTime Cye_UpdateddAt { get; set; }
        public bool Cye_Deleted { get; set; }
    
        public virtual Ctg_ForeignCurrencies Ctg_ForeignCurrencies { get; set; }
        public virtual Ctg_LocalCurrencies Ctg_LocalCurrencies { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tbl_Sales> Tbl_Sales { get; set; }
    }
}
