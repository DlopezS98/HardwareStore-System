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
    public class BrandRepository : HardwareStoreRepository, IBrandRepository
    {
        private readonly HardwareStoreEntities Context;
        public BrandRepository(HardwareStoreEntities Context) : base(Context)
        {
            this.Context = Context;
        }

        public ResponseStatus CreateNewBrand(Ctg_Brands br)
        {
            try
            {
                this.Context.Ctg_Brands.Add(br);
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "¡Operacion Exitosa!", Message = "¡Marca creada exitosamente!", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "¡Error al Crear!", Message = exc.Message, Success = false };
            }
        }

        public ResponseStatus DeleteBrand(int Id)
        {
            try
            {
                var br = this.Context.Ctg_Brands.FirstOrDefault(x => x.Pk_BrandID == Id);
                br.Brs_Deleted = true;
                this.Context.SaveChanges();
                return new ResponseStatus() { Title = "¡Operación exitosa!", Message = "¡Marca eliminada exitosamente!", Success = true };
            }
            catch (Exception exc)
            {
                return new ResponseStatus() { Title = "¡Error al Eliminar!", Message = exc.Message, Success = false };
            }
        }

        public DataTable ExecSpListBrands(string Search)
        {
            try
            {
                string query = string.Format("EXEC [dbo].[Sp_ListBrands] '{0}'", Search);
                DataTable dt = this.GetInformation(query);
                return dt;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public List<Brands> GetAllBrands(string Search)
        {
            try
            {
                List<Brands> list = new List<Brands>();
                DataTable dt = this.ExecSpListBrands(Search);
                list = ConvertDataTableToList<Brands>(dt);
                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public Brands GetBrand(int Id)
        {
            try
            {
                Brands br = new Brands();
                br = this.GetAllBrands("").FirstOrDefault(x => x.Id == Id);
                return br;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public ResponseStatus UpdateBrand(int Id, Brands br)
        {
            try
            {
                var el = this.Context.Ctg_Brands.FirstOrDefault(x => x.Pk_BrandID == Id);
                el.Brs_Name = br.Name;
                el.Brs_Description = br.Description;
                el.Brs_UpdatedAt = DateTime.Now;
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "¡Operación exitosa!", Message = "¡Marca actualizada exitosamente!", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "¡Error al Actualizar!", Message = exc.Message, Success = false };
            }
        }
    }
}
