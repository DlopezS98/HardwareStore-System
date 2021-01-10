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
    public class EmployeeRepository : HardwareStoreRepository, IEmployeeRepository
    {
        private readonly HardwareStoreEntities Context;
        public EmployeeRepository(HardwareStoreEntities Context) : base(Context)
        {
            this.Context = Context;
        }

        public ResponseStatus CreateEmployee(Ctg_Employees emp)
        {
            try
            {
                this.IsValidEmail(0, emp.Emp_EmailAddress);

                this.Context.Ctg_Employees.Add(emp);
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "¡Operación Exitosa!", Message = "Empleado creado exitosamente", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "¡Error al Crear!", Message = exc.Message, Success = false };
            }
        }

        public ResponseStatus DeleteEmployee(int Id)
        {
            try
            {
                var emp = this.Context.Ctg_Employees.FirstOrDefault(x => x.Pk_EmployeeID == Id);
                emp.Emp_UpdatedAt = DateTime.Now;
                emp.Emp_Deleted = true;
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "¡Operación exitosa!", Message = "Empleado eliminado correctamente", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "¡Error al eliminar!", Message = exc.Message, Success = false };
            }
        }

        public DataTable ExecSpListEmployees(string Search)
        {
            try
            {
                DataTable dt = new DataTable();
                string query = string.Format("EXEC [dbo].[Sp_ListEmployees] '{0}'", Search);
                dt = this.GetInformation(query);
                return dt;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public List<Employees> GetAllEmployees(string Search)
        {
            try
            {
                List<Employees> list = new List<Employees>();
                DataTable dt = this.ExecSpListEmployees(Search);
                list = ConvertDataTableToList<Employees>(dt);
                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public Employees GetEmployee(int Id)
        {
            try
            {
                Employees emp = new Employees();
                emp = this.GetAllEmployees().FirstOrDefault(x => x.Id == Id);
                return emp;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public ResponseStatus UpdateEmployee(int Id, Employees emp)
        {
            try
            {
                this.IsValidEmail(Id, emp.Email);

                var reg = this.Context.Ctg_Employees.FirstOrDefault(x => x.Pk_EmployeeID == Id);
                reg.Emp_FirstName = emp.FirstName;
                reg.Emp_LastName = emp.LastName;
                reg.Emp_PhoneNumber = emp.Phone;
                reg.Emp_Position = emp.Position;
                reg.Emp_IdentificationCard = emp.IdentificationCard;
                reg.Emp_EmailAddress = emp.Email;
                reg.Emp_Address = emp.Address;
                reg.Emp_UpdatedAt = DateTime.Now;
                this.Context.SaveChanges();

                return new ResponseStatus() { Title = "¡Operación exitosa!", Message = "Empleado actualizado correctamente", Success = true };
            }
            catch (Exception exc)
            {

                return new ResponseStatus() { Title = "¡Error al actualizar!", Message = exc.Message, Success = false };
            }
        }

        private List<Employees> GetAllEmployees()
        {
            try
            {
                return this.GetAllEmployees("");
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private int IsValidEmail(int Id, string email)
        {
            try
            {
                var list = this.GetAllEmployees().Where(x => x.Id != Id).ToList();
                var emp = list.FirstOrDefault(x => x.Email == email);
                if (emp != null)
                    throw new Exception("El correo ya existe en la base de datos");

                return emp.Id;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }
    }
}
