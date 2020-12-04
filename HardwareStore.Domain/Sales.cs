using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class Sales
    {
        public int SaleId { get; set; }
        public Nullable<int> UserId { get; set; }
        public string User { get; set; }
        public Nullable<int> CustomerId { get; set; }
        public string Customer { get; set; }
        public Nullable<int> CurrencyId { get; set; }
        public string Currency { get; set; }
        public string CurrencySymbol { get; set; }
        public string PaymentType { get; set; }
        public DateTime SaleDate { get; set; }
        public string DateString { get => "[ " + this.SaleDate.ToString("dd-MM-yyyy") + " ]"; }
        public string TaxName { get; set; }
        public Nullable<double> Tax { get; set; }
        public Nullable<int> Discount { get; set; }
        public double TotalAmount { get; set; }
        public string TotalString { get => this.CurrencySymbol + "" + this.TotalAmount; }
        public bool Deleted { get; set; }
    }
}
