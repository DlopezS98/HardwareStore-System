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
    public interface IBrandRepository
    {
        DataTable ExecSpListBrands(string Search);
        List<Brands> GetAllBrands(string Search);
        Brands GetBrand(int Id);
        ResponseStatus CreateNewBrand(Ctg_Brands br);
        ResponseStatus UpdateBrand(int Id, Brands br);
        ResponseStatus DeleteBrand(int Id);
    }
}
