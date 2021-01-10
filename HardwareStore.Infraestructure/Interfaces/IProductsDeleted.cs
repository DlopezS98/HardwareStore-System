using HardwareStore.Domain;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Interfaces
{
    public interface IProductsDeleted
    {
        DataTable ExecSpListProductsDeleted(DateTime StartDate, DateTime EndDate);
        List<ProductsDeleted> GetProductsDeleted(DateTime StartDate, DateTime EndDate);
        List<ProductsDeleted> GetProductsDeleted();
        ResponseStatus DeleteProductFromStocks(ProductsDeleted prod);
    }
}
