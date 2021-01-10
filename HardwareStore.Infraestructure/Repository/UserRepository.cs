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
    public class UserRepository : HardwareStoreRepository, IUserRepository
    {
        private readonly HardwareStoreEntities Context;
        public UserRepository(HardwareStoreEntities Context) : base(Context)
        {
            this.Context = Context;
        }

        public ResponseStatus CreateUser(Ctg_Users user)
        {
            try
            {
                this.UserNameAlreadyExist(user.UserName, 0);
                this.Context.Ctg_Users.Add(user);
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "¡Operación exitosa!", Message = "Usuario creado exitosamente", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "¡Error al crear!", Message = exc.Message, Success = false };
            }
        }

        public ResponseStatus DeleteUser(int Id)
        {
            try
            {
                var user = this.Context.Ctg_Users.FirstOrDefault(x => x.Pk_UserID == Id);
                user.UserDeleted = true;
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "¡Operación exitosa!", Message = "Usuario eliminado correctamente", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "¡Error al eliminar!", Message = exc.Message, Success = false };
            }
        }

        public DataTable ExecSpListUsers(string Search, int RoleId)
        {
            try
            {
                DataTable dt = new DataTable();
                string query = string.Format("EXEC [dbo].[Sp_ListUsers] '{0}', {1}", Search, RoleId);
                dt = this.GetInformation(query);
                return dt;
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }

        public List<Users> GetAllUsers(string Search, int RoleId)
        {
            try
            {
                List<Users> list = new List<Users>();
                DataTable dt = this.ExecSpListUsers(Search, RoleId);
                if (dt.Rows.Count > 0)
                {
                    list = ConvertDataTableToList<Users>(dt);
                }

                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public Users GetUser(int Id)
        {
            try
            {
                Users user = new Users();
                user = this.GetAllUsers().FirstOrDefault(x => x.Id == Id); ;
                return user;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public ResponseStatus UpdateUser(int Id, Users user)
        {
            try
            {
                this.UserNameAlreadyExist(user.UserName, Id);

                var data = this.Context.Ctg_Users.FirstOrDefault(x => x.Pk_UserID == Id);
                data.Fk_EmployeeID = user.EmployeeId;
                data.Fk_PrivilegieID = user.RoleId;
                data.UserName = user.UserName;
                data.UserPassword = user.Password;
                data.UserUpdatedAt = DateTime.Now;
                data.UserImage = user.Image;
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "¡Operación exitosa!", Message = "Usuario actualizado exitosamente...", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "¡Error al actualizar!", Message = exc.Message, Success = false };
            }
        }

        public LoginResponse UserLogin(Users obj)
        {
            try
            {
                Users user = new Users();
                int Id = this.VerifyUserNameExist(obj.UserName);
                this.VerifyPassword(Id, obj.Password);
                user = this.GetUser(Id);

                return new LoginResponse() { Title = "¡Exitoso!", Message = "Inicio de sesión exitoso", Success = true, User = user };
            }
            catch (Exception exc)
            {

                return new LoginResponse() { Title = "¡Ha ocurrido un error!", Message = exc.Message, Success = false };
            }
        }

        private List<Users> GetAllUsers()
        {
            try
            {
                return this.GetAllUsers("", 0);
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private bool UserNameAlreadyExist(string username, int Id)
        {
            try
            {
                var data = this.GetAllUsers().Where(x => x.Id != Id).ToList();
                var resp = data.Exists(x => x.UserName == username);
                if (resp)
                    throw new Exception("El nombre de usuario ya existe en la base de datos");

                return resp;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private int VerifyUserNameExist(string username)
        {
            try
            {
                var user = this.GetAllUsers().FirstOrDefault(x => x.UserName == username || x.Email == username);
                if (user != null)
                    return user.Id;

                throw new Exception("El nombre de usuario es incorrecto");
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private bool VerifyPassword(int Id, string password)
        {
            try
            {
                var list = this.Context.Ctg_Users.Where(x => x.UserDeleted == false).ToList();
                var user = list.FirstOrDefault(x => x.Pk_UserID == Id);
                var resp = user.UserPassword == password ? true : throw new Exception("La contraseña es incorrecta"); ;
                return resp;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }
    }
}
