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
    public interface IUserRepository
    {
        DataTable ExecSpListUsers(string Search, int RoleId);
        List<Users> GetAllUsers(string Search, int RoleId);
        Users GetUser(int Id);
        ResponseStatus CreateUser(Ctg_Users user);
        ResponseStatus UpdateUser(int Id, Users user);
        ResponseStatus DeleteUser(int Id);
        LoginResponse UserLogin(Users user);
    }
}
