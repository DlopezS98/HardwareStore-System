using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class tblOrderDetails : Tbl_OrderDetails
    {
        public string Ord_Number { get; set; }
        public string Pdl_CustomID { get; set; }
        public string Prod_Name { get; set; }
        public string Whs_Name { get; set; }
    }
}
