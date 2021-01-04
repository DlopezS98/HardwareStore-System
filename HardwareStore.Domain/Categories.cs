using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class Categories : Ctg_Categories
    {
        public string CreatedAt { get => this.Cat_CreatedAt.ToString("dd-MMM-yyyy"); }
        public string UpdatedAt { get => this.Cat_UpdatedAt.ToString("dd-MMM-yyyy"); }
    }
}
