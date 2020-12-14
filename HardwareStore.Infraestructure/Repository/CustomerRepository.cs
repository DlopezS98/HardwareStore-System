using HardwareStore.Core.Interfaces;
using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Repository
{
    public class CustomerRepository : HardwareStoreRepository, ICustomerRepository
    {
        private readonly HardwareStoreEntities Context;

        public CustomerRepository(HardwareStoreEntities Context) : base(Context)
        {
            this.Context = Context;
        }

        public List<Customers> ListAllCustomers()
        {
            try
            {
                var list = this.Context.Ctg_Customers.Select(e => new Customers
                {
                    Pk_CustomerID = e.Pk_CustomerID,
                    Cust_FirtsName = e.Cust_FirtsName,
                    Cust_LastName = e.Cust_LastName,
                    Cust_Address = e.Cust_Address,
                    Cust_CustomID = e.Cust_CustomID,
                    Cust_CreatedAt = e.Cust_CreatedAt,
                    Cust_Deleted = e.Cust_Deleted,
                    Cust_IdentificationCard = e.Cust_IdentificationCard,
                    Cust_UpdatedAt = e.Cust_UpdatedAt,
                    Cust_PhoneNumber = e.Cust_PhoneNumber
                }).ToList();

                return list;
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }
    }
}
