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
    
    public partial class Ctg_MeasureUnits
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ctg_MeasureUnits()
        {
            this.Ctg_UnitConversion = new HashSet<Ctg_UnitConversion>();
        }
    
        public int Pk_MeasureID { get; set; }
        public int Fk_UnitType { get; set; }
        public string Msu_Type { get; set; }
        public string Msu_Abbreviation { get; set; }
        public System.DateTime Msu_CreatedAt { get; set; }
        public System.DateTime Msu_UpdatedAt { get; set; }
        public bool Msu_Deleted { get; set; }
    
        public virtual Ctg_UnitType Ctg_UnitType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ctg_UnitConversion> Ctg_UnitConversion { get; set; }
    }
}
