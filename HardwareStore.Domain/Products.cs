﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public class Products
    {
        public int Id { get; set; }
        public string Product { get; set; }
        public string DefaultCode { get; set; }
        public string CustomId { get; set; }
        public string Category { get; set; }
        public string Brand { get; set; }
        public string MeasureUnit { get; set; }
        public string Dimensions { get; set; }
        public string MaterialType { get; set; }
        public Nullable<DateTime> ExpiryDate { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdateAt { get; set; }
        public string Status { get; set; }
    }
}
