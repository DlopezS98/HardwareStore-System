using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class SaleDetails
    {
        public int SaleId { get; set; }
        public int ProductId { get; set; }
        public string Product { get; set; }
        public string Brand { get; set; }
        public string Dimensions { get; set; }
        public string MaterialType { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public Nullable<double> Tax { get; set; }
        public double Subtotal { get; set; }
        public Nullable<int> Discount { get; set; }
        public double Total { get; set; }
    }
}
