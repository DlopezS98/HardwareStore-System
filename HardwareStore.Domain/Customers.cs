using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class Customers : Ctg_Customers
    {
        public string FullName { get => this.Cust_FirtsName + " " + this.Cust_LastName; }
    }
}
