using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class tblWarehouseProducts : Tbl_WarehouseProducts
    {
        public string WarehouseName { get; set; }
        public string ProductName { get; set; }
        public string CategoryName { get; set; }
        public string BrandName { get; set; }
        public int Fk_SupplierID { get; set; }
        public string SupplierName { get; set; }
        public string MeasureUnit { get; set; }
        public string DefaultCode { get; set; }
        public string Dimensions { get; set; }
        public string MaterialType { get; set; }
        public string ExpiryDate { get; set; }
        public string CreatedAt { get => "[ " + this.WhPr_CreatedAt.ToString("dd-MM-yyyy") + " ]"; }
        public string UpdatedAt { get => "[ " + this.WhPr_UpdatedAt.ToString("dd-MM-yyyy") + " ]"; }

    }
}
