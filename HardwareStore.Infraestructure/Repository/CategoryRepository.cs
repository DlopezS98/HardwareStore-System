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
    public class CategoryRepository : HardwareStoreRepository, ICategoryRepository
    {
        private readonly HardwareStoreEntities Context;
        public CategoryRepository(HardwareStoreEntities Context) : base(Context)
        {
            this.Context = Context;
        }

        public DataTable ExecSpListCategories(string Search)
        {
            try
            {
                string query = string.Format("EXEC [dbo].[Sp_ListCategories] '{0}'", Search);
                DataTable dt = this.GetInformation(query);
                return dt;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public List<Categories> GetCategories(string Search)
        {
            try
            {
                List<Categories> list = new List<Categories>();
                DataTable dt = this.ExecSpListCategories(Search);
                list = ConvertDataTableToList<Categories>(dt);
                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public Categories GetCategory(int Id)
        {
            try
            {
                Categories obj = new Categories();
                obj = this.GetCategories("").FirstOrDefault(row => row.Pk_CategoryID == Id);
                return obj; 
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public ResponseStatus CreateCategory(Ctg_Categories Category)
        {
            try
            {
                this.Context.Ctg_Categories.Add(Category);
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "Operación Exitosa", Message = "¡Categoria creada exitosamente!", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "Error al Crear", Message = exc.Message, Success = false };
            }
        }

        public ResponseStatus DeleteCategory(int Id)
        {
            try
            {
                var cat = this.Context.Ctg_Categories.FirstOrDefault(row => row.Pk_CategoryID == Id);
                cat.Cat_Deleted = true;
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "Operación Exitosa", Message = "¡Categoría eliminada correctamente!", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "Error al eliminar", Message = exc.Message, Success = false };
            }
        }

        public ResponseStatus UpdateCategory(int Id, Categories Cat)
        {
            try
            {
                var obj = this.Context.Ctg_Categories.FirstOrDefault(row => row.Pk_CategoryID == Id);
                obj.Cat_Name = Cat.Cat_Name;
                obj.Cat_Description = Cat.Cat_Description;
                obj.Cat_UpdatedAt = DateTime.Now;
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "Operación Exitosa", Message = "¡Categoría actualizada correctamente!", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "Error al actualizar", Message = exc.Message, Success = false };
            }
        }
    }
}