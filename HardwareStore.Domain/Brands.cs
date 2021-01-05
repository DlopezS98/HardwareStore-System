using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class Brands
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Description { get; set; }
        public DateTime Brs_CreatedAt { get; set; }
        public string CreatedAt { get => this.Brs_CreatedAt.ToString("dd-MMM-yyyy"); }
        public DateTime Brs_UpdatedAt { get; set; }
        public string UpdatedAt { get => this.Brs_UpdatedAt.ToString("dd-MMM-yyyy"); }
        public bool Status { get; set; }
    }
}
