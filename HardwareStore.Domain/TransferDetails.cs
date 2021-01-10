using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class TransferDetails
    {
        public int Id { get; set; }
        public int TrasnferId { get; set; }
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int SourceId { get; set; }
        public string Warehouse { get; set; }
        public int SupplierId { get; set; }
        public string SupplierName { get; set; }
        public int Quantity { get; set; }
        public string CreatedAt { get; set; }
        public string UpdatedAt { get; set; }
    }
}
