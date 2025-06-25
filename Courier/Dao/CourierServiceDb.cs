using Courier.Util;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Courier.Dao
{
    public class CourierServiceDb
    {
        public static SqlConnection connection;

        public object Courier_Id { get; private set; }
        public object Sender_name { get; private set; }
        public object Sender_address { get; private set; }
        public object Receiver_name { get; private set; }
        public object Receiver_address { get; private set; }
        public object Courier_weight { get; private set; }
        public object Status { get; private set; }
        public object Tracking_number { get; private set; }
        public object Delivery_date { get; private set; }

        public CourierServiceDb()
        {
            connection = DBConnection.GetConnection();
        }

        public void InsertCourier(CourierServiceDb courier)
        {
            string query = @"INSERT INTO couriertable
                             (courier_id, sender_name, sender_address, receiver_name, receiver_address,
                              courier_weight, status, tracking_number, delivery_date)
                             VALUES (@id, @sname, @saddr, @rname, @raddr, @weight, @status, @track, @date)";

            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@id", courier.Courier_Id);
            cmd.Parameters.AddWithValue("@sname", courier.Sender_name);
            cmd.Parameters.AddWithValue("@saddr", courier.Sender_address);
            cmd.Parameters.AddWithValue("@rname", courier.Receiver_name);
            cmd.Parameters.AddWithValue("@raddr", courier.Receiver_address);
            cmd.Parameters.AddWithValue("@weight", courier.Courier_weight);
            cmd.Parameters.AddWithValue("@status", courier.Status);
            cmd.Parameters.AddWithValue("@track", courier.Tracking_number);
            cmd.Parameters.AddWithValue("@date", courier.Delivery_date);

            connection.Open();
            int rows = cmd.ExecuteNonQuery();
            connection.Close();

            Console.WriteLine(rows > 0 ? "Courier inserted successfully." : "Insert failed.");
        }

        public void GetAllCouriers()
        {
            string query = "SELECT * FROM couriertable";

            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Console.WriteLine($"ID: {reader["courier_id"]}, Sender: {reader["sender_name"]}, Status: {reader["status"]}");
            }

            connection.Close();
        }

        public void UpdateCourierStatus(string trackingNumber, string newStatus)
        {
            string query = "UPDATE couriertable SET status = @status WHERE tracking_number = @track";

            using (SqlCommand cmd = new SqlCommand(query, connection))
            {
                cmd.Parameters.AddWithValue("@status", newStatus);
                cmd.Parameters.AddWithValue("@track", trackingNumber);
                int rows = cmd.ExecuteNonQuery();
                Console.WriteLine(rows > 0 ? "Status updated." : "Tracking number not found.");
            }
        }
        public void DeleteCourierById(int courierId)
        {
            using (SqlConnection con = DBConnection.GetConnection())
            {
                try
                {
                    con.Open(); 

                    string query = "DELETE FROM couriertable WHERE courier_id = @CourierId";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@CourierId", courierId);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Console.WriteLine("Courier deleted successfully.");
                    }
                    else
                    {
                        Console.WriteLine("No courier found with the given ID.");
                    }
                }
                catch (System.Exception ex)
                {
                    Console.WriteLine("Error occurred: " + ex.Message);
                }
            }
        }

    }
}
