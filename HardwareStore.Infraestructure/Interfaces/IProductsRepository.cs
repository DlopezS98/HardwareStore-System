using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Interfaces
{
    public interface IProductsRepository
    {
        DataTable FetchProductsFromDataBase(int Deleted, string Search);
        List<Products> GetProductsDetails(int Deleted, string Search);
        Ctg_ProductDetails GetProductDetail(int Id);
        ResponseStatus CreateProductDetail(Ctg_ProductDetails product);
        ResponseStatus UpdateProductDetail(int Id, Ctg_ProductDetails product);
        ResponseStatus DeleteProductDetail(int Id);

        List<Ctg_Products> GetProducts(string search);
        ResponseStatus CreateProduct(Ctg_Products product);
        ResponseStatus UpdateProduct(int Id, Ctg_Products product);
        ResponseStatus DeleteProduct(int Id);
        Ctg_Products GetProduct(int Id);
    }
}
