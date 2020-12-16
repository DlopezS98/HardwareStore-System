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
        public string WarehouseName { get; set; }
        public DateTime Date { get; set; }
        public string FormatDate { get => "[ " + this.Date.ToString("ddd-MM-yyyy") + " ]"; }
        public int Total { get; set; }
        public bool Status { get; set; }
        public string StatusInfo { get; set; }
    }
}
