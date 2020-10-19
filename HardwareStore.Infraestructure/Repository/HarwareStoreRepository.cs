using HardwareStore.Domain;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Infraestructure.Repository
{
    public class HarwareStoreRepository: DbConnection
    {
        public DataTable GetInformation(string query)
        {
            try
            {
                var Connection = GetConnection();
                DataTable dt = new DataTable();
                Connection.Open();
                var command = Connection.CreateCommand();
                command.CommandText = query;
                command.CommandTimeout = 150;
                var response = command.ExecuteReader();
                dt.Load(response);
                command.Dispose();
                Connection.Close();

                return dt;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }
    }
}
