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
        public int Id { get; set; }
        public string Warehouse { get; set; }
        public string Product { get; set; }
        public string BaseUnit { get; set; }
        public string Abbrevation { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public double Subtotal { get; set; }
        public Nullable<int> Discount { get; set; }
        public double Total { get; set; }
    }
}
