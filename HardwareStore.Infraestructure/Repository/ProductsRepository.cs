using HardwareStore.Core.Interfaces;
using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Repository
{
    public class ProductsRepository: HardwareStoreRepository, IProductsRepository
    {
        private readonly HardwareStoreEntities Context;

        public ProductsRepository(HardwareStoreEntities Context): base(Context)
        {
            this.Context = Context;
        }

        public DataTable FetchProductsFromDataBase(int Deleted, string Search)
        {
            try
            {
                DataTable dt = new DataTable();
                var query = string.Format("Exec [dbo].[Sp_ListProductsDetails] {0}, '{1}'", Deleted, Search);
                dt = this.GetInformation(query);
                return dt;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public List<Products> GetProductsDetails(int Deleted, string Search)
        {
            try
            {
                List<Products> list = new List<Products>();
                DataTable data = this.FetchProductsFromDataBase(Deleted, Search);
                list = this.MapProductDetails(data);
                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private List<Products> MapProductDetails(DataTable dt)
        {
            try
            {
                DateTime date;
                List<Products> list = new List<Products>();
                if(dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        Products e = new Products();
                        e.Id = Convert.ToInt32(row["Id"]);
                        e.Product = row["Product"].ToString();
                        e.DefaultCode = row["DefaultCode"].ToString();
                        e.CustomId = row["CustomId"].ToString();
                        e.Category = row["Category"].ToString();
                        e.Brand = row["Brand"].ToString();
                        e.MeasureUnit = row["MeasureUnit"].ToString();
                        e.Dimensions = row["Dimensions"].ToString();
                        e.MaterialType = row["MaterialType"].ToString();
                        if (row["Pdl_ExpiryDate"].ToString() != "")
                        {
                            date = Convert.ToDateTime(row["ExpiryDate"]);
                            e.ExpiryDate = date.ToString("dd-MMM-yyyy");
                        }
                        else
                        {
                            e.ExpiryDate = "00-00-0000";
                        }
                        date = Convert.ToDateTime(row["CreatedAt"]);
                        e.CreatedAt = date.ToString("dd-MMM-yyyy");
                        date = Convert.ToDateTime(row["UpdateAt"]);
                        e.UpdateAt = date.ToString("dd-MMM-yyyy");
                        e.Status = row["Status"].ToString();
                        list.Add(e);
                    }
                }

                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public ResponseStatus CreateProductDetail(Ctg_ProductDetails product)
        {
            try
            {
                this.Context.Ctg_ProductDetails.Add(product);
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "Operación exitosa", Message = "Se ha creado un nuevo producto!", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "Error al Crear", Message = exc.Message, Success = false };
            }
        }

        public ResponseStatus UpdateProductDetail(int Id, Ctg_ProductDetails product)
        {
            try
            {
                var obj = this.Context.Ctg_ProductDetails.FirstOrDefault(e => e.Pk_ProductDetailID == Id);
                obj.Fk_ProductID = product.Fk_ProductID;
                obj.Fk_CategoryID = product.Fk_CategoryID;
                obj.Fk_BrandID = product.Fk_BrandID;
                obj.Fk_UnitConversion = product.Fk_UnitConversion;
                obj.Pdl_DefaultCode = product.Pdl_DefaultCode;
                obj.Pdl_Dimensions = product.Pdl_Dimensions;
                obj.Pdl_MaterialType = product.Pdl_MaterialType;
                obj.Pdl_ExpiryDate = product.Pdl_ExpiryDate;
                obj.Pdl_UpdatedAt = DateTime.Now;
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "Operación exitosa", Message = "Producto Actualizado Exitosamente!", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "Error al Actualizar", Message = exc.Message, Success = false };
            }
        }

        public ResponseStatus DeleteProductDetail(int Id)
        {
            try
            {
                var obj = this.Context.Ctg_ProductDetails.FirstOrDefault(e => e.Pk_ProductDetailID == Id);
                obj.Pdl_Deleted = true;
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "Operación exitosa", Message = "Producto Eliminado Exitosamente!", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "Error al Eliminar", Message = exc.Message, Success = false };
            }
        }

        public Ctg_ProductDetails GetProductDetail(int Id)
        {
            try
            {
                var product = this.Context.Ctg_ProductDetails.FirstOrDefault(e => e.Pk_ProductDetailID == Id);
                return product;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public List<Ctg_Products> GetProducts(string search)
        {
            try
            {
                List<Ctg_Products> list = new List<Ctg_Products>();
                string query = string.Format("SELECT * FROM Ctg_Products WHERE Prod_Name LIKE '{0}' + '%' AND Prod_Deleted = 0", search);
                var data = this.GetInformation(query);
                list = ConvertDataTableToList<Ctg_Products>(data);
                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public ResponseStatus CreateProduct(Ctg_Products product)
        {
            try
            {
                this.Context.Ctg_Products.Add(product);
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "Operación Exitosa", Message = "Producto agregado correctamente!", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "Error al Crear", Message = exc.Message, Success = false };
            }
        }

        public ResponseStatus UpdateProduct(int Id, Ctg_Products product)
        {
            try
            {
                var prod = this.Context.Ctg_Products.FirstOrDefault(e => e.Pk_productID == Id);
                prod.Prod_Name = product.Prod_Name;
                prod.Prod_Description = product.Prod_Description;
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "Operación Exitosa", Message = "Producto Actualizado!", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "Error al Actualizar", Message = exc.Message, Success = false };
            }
        }

        public Ctg_Products GetProduct(int Id)
        {
            try
            {
                var product = this.Context.Ctg_Products.FirstOrDefault(e => e.Pk_productID == Id);
                return product;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public ResponseStatus DeleteProduct(int Id)
        {
            try
            {
                var product = this.Context.Ctg_Products.FirstOrDefault(e => e.Pk_productID == Id);
                product.Prod_Deleted = true;
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "Operación Exitosa", Message = "Producto Eliminado!", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "Error al Eliminar", Message = exc.Message, Success = false };
            }
        }
    }
}