using HardwareStore.Core.Interfaces;
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

        public DataTable FetchProductsFromDataBase()
        {
            try
            {
                DataTable dt = new DataTable();
                var query = "Exec Sp_ListProductsDetails";
                dt = this.GetInformation(query);
                return dt;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }
    }
}
