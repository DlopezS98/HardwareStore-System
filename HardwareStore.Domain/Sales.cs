using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class Sales
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string CustomerName { get; set; }
        public string LocalCurrency { get; set; }
        public string LocalSymbol { get; set; }
        public string ForeignCurrency { get; set; }
        public string ForeignSymbol { get; set; }
        public string PaymentType { get; set; }
        public double CurrencyPurchase { get; set; }
        public double CurrencySale { get; set; }
        public DateTime SaleDate { get; set; }
        public string DateString { get => "[ " + this.SaleDate.ToString("dd-MM-yyyy") + " ]"; }
        public Nullable<int> Discount { get; set; }
        public double Subtotal { get; set; }
        public string SubtotalString { get => this.LocalSymbol + " " + this.Subtotal; }
        public double TotalAmount { get; set; }
        public string TotalString { get => this.LocalSymbol + " " + this.TotalAmount; }
        public bool Deleted { get; set; }
    }
}
