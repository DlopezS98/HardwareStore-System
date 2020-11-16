using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Infraestructure.Interfaces
{
    public interface ISuppliersRepository
    {
        List<Ctg_Suppliers> GetSuppliers();
    }
}
