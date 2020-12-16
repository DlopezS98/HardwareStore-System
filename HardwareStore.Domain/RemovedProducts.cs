using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class RemovedProducts
    {
        public int Id { get; set; }
        public int WarehouseId { get; set; }
        public string Warehouse { get; set; }
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public double PurchasePrice { get; set; }
        public DateTime Created { get; set; }
        public string CreatedAt { get => "[ " + this.Created.ToString("dd-MM-yyyy") + " ]"; }
    }
}
