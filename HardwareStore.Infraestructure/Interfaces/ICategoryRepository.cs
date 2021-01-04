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
    public interface ICategoryRepository
    {
        DataTable ExecSpListCategories(string Search);
        List<Categories> GetCategories(string Search);
        Categories GetCategory(int Id);
        ResponseStatus CreateCategory(Ctg_Categories Category);
        ResponseStatus UpdateCategory(int Id, Categories Cat);
        ResponseStatus DeleteCategory(int Id);
    }
}
