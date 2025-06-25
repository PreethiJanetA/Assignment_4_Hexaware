using System.Configuration;
using System.Data.SqlClient;


namespace Courier.Util
{
    public static class DBConnection
    {
        private static SqlConnection connection;

        public static SqlConnection GetConnection()
        {
            if (connection == null)
            {
                string connStr = ConfigurationManager.ConnectionStrings["cmsystem"].ConnectionString;
                connection = new SqlConnection(connStr);
            }
            return connection;
        }
    }
}

