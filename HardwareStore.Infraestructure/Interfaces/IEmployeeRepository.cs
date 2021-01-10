using HardwareStore.Core.Repository;
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
    public interface IEmployeeRepository
    {
        DataTable ExecSpListEmployees(string Search);
        List<Employees> GetAllEmployees(string Search);
        Employees GetEmployee(int Id);
        ResponseStatus CreateEmployee(Ctg_Employees emp);
        ResponseStatus UpdateEmployee(int Id, Employees emp);
        ResponseStatus DeleteEmployee(int Id);
    }
}
