﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HardwareStore.Domain.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class HardwareStoreEntities : DbContext
    {
        public HardwareStoreEntities()
            : base("name=HardwareStoreEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Ctg_Brands> Ctg_Brands { get; set; }
        public virtual DbSet<Ctg_Categories> Ctg_Categories { get; set; }
        public virtual DbSet<Ctg_Currency> Ctg_Currency { get; set; }
        public virtual DbSet<Ctg_CurrencyExchange> Ctg_CurrencyExchange { get; set; }
        public virtual DbSet<Ctg_Customers> Ctg_Customers { get; set; }
        public virtual DbSet<Ctg_DiscountPromotions> Ctg_DiscountPromotions { get; set; }
        public virtual DbSet<Ctg_Employees> Ctg_Employees { get; set; }
        public virtual DbSet<Ctg_MeasureUnits> Ctg_MeasureUnits { get; set; }
        public virtual DbSet<Ctg_Privilegies> Ctg_Privilegies { get; set; }
        public virtual DbSet<Ctg_ProductDetails> Ctg_ProductDetails { get; set; }
        public virtual DbSet<Ctg_Products> Ctg_Products { get; set; }
        public virtual DbSet<Ctg_Suppliers> Ctg_Suppliers { get; set; }
        public virtual DbSet<Ctg_UnitConversion> Ctg_UnitConversion { get; set; }
        public virtual DbSet<Ctg_UnitType> Ctg_UnitType { get; set; }
        public virtual DbSet<Ctg_Users> Ctg_Users { get; set; }
        public virtual DbSet<Ctg_Warehouses> Ctg_Warehouses { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Tbl_OrderDetails> Tbl_OrderDetails { get; set; }
        public virtual DbSet<Tbl_Orders> Tbl_Orders { get; set; }
        public virtual DbSet<Tbl_RemovedProducts> Tbl_RemovedProducts { get; set; }
        public virtual DbSet<Tbl_SaleDetails> Tbl_SaleDetails { get; set; }
        public virtual DbSet<Tbl_Sales> Tbl_Sales { get; set; }
        public virtual DbSet<Tbl_Taxes> Tbl_Taxes { get; set; }
        public virtual DbSet<Tbl_TransferDetails> Tbl_TransferDetails { get; set; }
        public virtual DbSet<Tbl_Transfers> Tbl_Transfers { get; set; }
        public virtual DbSet<Tbl_HardwareStore> Tbl_HardwareStore { get; set; }
        public virtual DbSet<Tbl_WarehouseProducts> Tbl_WarehouseProducts { get; set; }
    }
}
