using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class ProductsDeleted
    {
        public int Id { get; set; }
        public int WarehouseId { get; set; }
        public string Warehouse { get; set; }
        public int ProductId { get; set; }
        public string Product { get; set; }
        public string ProductCode { get; set; }
        public int UserId { get; set; }
        public string User { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int Quantity { get; set; }
        public double PurchasePrice { get; set; }
        public string CreatedAt { get; set; }
        public DateTime CreationDate { get; set; }
        public bool Status { get; set; }
    }
}
