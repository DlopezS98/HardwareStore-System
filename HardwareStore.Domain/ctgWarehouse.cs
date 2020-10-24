using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class ctgWarehouse : Ctg_Warehouses
    {
        public string DropDisplayName { get => "[" + this.Whs_CustomID + " - " + this.Whs_Name + "]"; }
        public string CreatedAt { get => "[ " + this.Whs_CreatedAt.ToString("dd-MM-yyyy") + " ]"; }
        public string UpdatedAt { get => "[ " + this.Whs_UpdatedAt.ToString("dd-MM-yyyy") + " ]"; }
    }
}
