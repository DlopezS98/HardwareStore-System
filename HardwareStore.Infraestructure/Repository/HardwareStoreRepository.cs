using HardwareStore.Domain;
using HardwareStore.Domain.Models;
using HardwareStore.Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;

namespace HardwareStore.Core.Repository
{
    public class HardwareStoreRepository: IHardwareStoreRepository
    {

        private readonly HardwareStoreEntities Context;

        public HardwareStoreRepository(HardwareStoreEntities Context)
        {
            this.Context = Context;
        }

        public SqlConnection GetConnection()
        {
            string stringConnection = @"" + this.Context.Database.Connection.ConnectionString;
            //string stringConnection = @"data source=01DLOPES98\DEVSTACK;initial catalog=HardwareStore;user id=DlopezS98;password=Aldahir1998;MultipleActiveResultSets=True;";
            return new SqlConnection(stringConnection);
            //return stringConnection;
        }

        public DataTable GetInformation(string query)
        {
            try
            {
                var Connection = this.GetConnection();
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

        public static List<T> ConvertDataTableToList<T>(DataTable dt)
        {
            List<T> data = new List<T>();
            foreach (DataRow row in dt.Rows)
            {
                T item = GetItem<T>(row);
                data.Add(item);
            }
            return data;
        }

        private static T GetItem<T>(DataRow dr)
        {
            Type temp = typeof(T);
            T obj = Activator.CreateInstance<T>();

            foreach (DataColumn column in dr.Table.Columns)
            {
                foreach (PropertyInfo pro in temp.GetProperties())
                {
                    if (pro.Name == column.ColumnName)
                        pro.SetValue(obj, dr[column.ColumnName], null);
                    else
                        continue;
                }
            }
            return obj;
        }
    }
}
