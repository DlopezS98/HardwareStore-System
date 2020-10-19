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
    
    public partial class Tbl_Sales
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tbl_Sales()
        {
            this.Tbl_SaleDetails = new HashSet<Tbl_SaleDetails>();
        }
    
        public int Pk_SaleID { get; set; }
        public Nullable<int> Fk_UserID { get; set; }
        public Nullable<int> Fk_CustomerID { get; set; }
        public Nullable<int> Fk_CurrencyExchangeID { get; set; }
        public string Sale_CustomerName { get; set; }
        public string Sale_PaymentType { get; set; }
        public System.DateTime Sale_Date { get; set; }
        public string Sale_TaxName { get; set; }
        public Nullable<double> Sale_Tax { get; set; }
        public double Sale_Subtotal { get; set; }
        public Nullable<int> Sale_Discount { get; set; }
        public double Sale_TotalAmount { get; set; }
        public bool Sale_Deleted { get; set; }
    
        public virtual Ctg_CurrencyExchange Ctg_CurrencyExchange { get; set; }
        public virtual Ctg_Customers Ctg_Customers { get; set; }
        public virtual Ctg_Users Ctg_Users { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tbl_SaleDetails> Tbl_SaleDetails { get; set; }
    }
}
