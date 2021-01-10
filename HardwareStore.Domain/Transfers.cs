using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class Transfers
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string UserName { get; set; }
        public int DestinationId { get; set; }
        public string Warehouse { get; set; }
        public string Date { get; set; }
        public int Total { get; set; }
        public Status TransferStatus { get; set; }
        public string TransferInfo { get; set; }

        public enum Status { Pending, Completed, Deleted }
    }
}
