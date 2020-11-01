using HardwareStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Domain
{
    public abstract class DbConnection
    {
        private readonly HardwareStoreEntities Context;
        public DbConnection()
        {
            this.Context = new HardwareStoreEntities();
        }

        protected SqlConnection GetConnection()
        {
            //string stringConnection = @"" + ConfigurationManager.ConnectionStrings["HardwareStoreEntities"].ConnectionString;
            //ConnectionStringSettings Settings = ConfigurationManager.ConnectionStrings["HardwareStoreEntities"];
            //string stringConnection = @"" + Settings.ConnectionString;
            string stringConnection = @"" + this.Context.Database.Connection.ConnectionString;
            //string stringConnection = @"data source=01DLOPES98\DEVSTACK;initial catalog=HardwareStore;user id=DlopezS98;password=01DlopezS98;MultipleActiveResultSets=True;";
            return new SqlConnection(stringConnection);
        }
    }
}
