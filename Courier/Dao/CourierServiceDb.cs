using Courier.Entity;
using Courier.Util;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Courier.Dao
{
    public class CourierServiceDb
    {
        public static SqlConnection connection;

        public object courier_id { get; set; }
        public object sender_name { get;set; }
        public object sender_address { get;set; }
        public object receiver_name { get;set; }
        public object receiver_address { get; set; }
        public object courier_weight { get;set; }
        public object status { get; set; }
        public object tracking_number { get; set; }
        public object delivery_date { get;set; }

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
            cmd.Parameters.AddWithValue("@id", courier.courier_id);
            cmd.Parameters.AddWithValue("@sname", courier.sender_name);
            cmd.Parameters.AddWithValue("@saddr", courier.sender_address);
            cmd.Parameters.AddWithValue("@rname", courier.receiver_name);
            cmd.Parameters.AddWithValue("@raddr", courier.receiver_address);
            cmd.Parameters.AddWithValue("@weight", courier.courier_weight);
            cmd.Parameters.AddWithValue("@status", courier.status);
            cmd.Parameters.AddWithValue("@track", courier.tracking_number);
            cmd.Parameters.AddWithValue("@date", courier.delivery_date);

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
            if (connection.State != ConnectionState.Open)
                connection.Open();

            using (SqlCommand cmd = new SqlCommand(query, connection))
            {
                cmd.Parameters.AddWithValue("@status", newStatus);
                cmd.Parameters.AddWithValue("@track", trackingNumber);
                int rows = cmd.ExecuteNonQuery();
                Console.WriteLine(rows > 0 ? "Status updated." : "Tracking number not found.");
            }
            connection.Close();
        }
        public void DeleteCourierById(int courierId)
        {
            using (SqlConnection con = DBConnection.GetConnection())
            {
                try
                {
                    con.Open();
                    // 1. first delete from paymenttable 
                    string deletePayments = "DELETE FROM payment WHERE courier_id = @cid";
                    using (SqlCommand cmdPayments = new SqlCommand(deletePayments, connection))
                    {
                        cmdPayments.Parameters.AddWithValue("@cid", courierId);
                        cmdPayments.ExecuteNonQuery();
                    }

                    // 2. Then delete from couriertable
                    string deleteCourier = "DELETE FROM couriertable WHERE courier_id = @cid";
                    using (SqlCommand cmdCourier = new SqlCommand(deleteCourier, connection))
                    {
                        cmdCourier.Parameters.AddWithValue("@cid", courierId);
                        int rows = cmdCourier.ExecuteNonQuery();

                        if (rows > 0)
                            Console.WriteLine("Courier deleted successfully.");
                        else
                            Console.WriteLine("Courier ID not found.");
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
