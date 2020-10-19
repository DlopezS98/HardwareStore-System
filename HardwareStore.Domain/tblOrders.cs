using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class tblOrders : Tbl_Orders
    {
        public string SupplierName { get; set; }
        public string UserName { get; set; }
        public string newDate { get; set; }
    }
}
