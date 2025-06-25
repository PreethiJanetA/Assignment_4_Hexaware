using Courier.Dao;
using Courier.Util;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

namespace Courier
{
    class Program
    {
        static void Main(string[] args)
        {
            //to check the connectivity to datadase
            SqlConnection con = DBConnection.GetConnection();
            try
            {
                con.Open();
                Console.WriteLine("Connected to database successfully!");
                con.Close();
            }
            catch (System.Exception ex)
            {
                Console.WriteLine("Error connecting to database: " + ex.Message);
            }


            try
            {
                CourierServiceDb service = new CourierServiceDb(); // Connect to DB

                // Example menu
                bool running = true;
                while (running)
                {
                    Console.WriteLine("\n--- Courier Management Menu ---");
                    Console.WriteLine("1. View all couriers");
                    Console.WriteLine("2. Exit");
                    Console.Write("Enter your choice: ");
                    int choice = int.Parse(Console.ReadLine());

                    switch (choice)
                    {
                        case 1:
                            service.GetAllCouriers();
                            break;
                        case 2:
                            Console.Write("Enter Tracking Number: ");
                            string track = Console.ReadLine();
                            Console.Write("Enter New Status: ");
                            string newStatus = Console.ReadLine();
                            service.UpdateCourierStatus(track, newStatus);
                            break;

                        case 3:
                            Console.Write("Enter Courier ID to delete: ");
                            int courierId = int.Parse(Console.ReadLine());
                            service.DeleteCourierById(courierId);
                            break;

                        case 4:
                            running = false;
                            Console.WriteLine("Exiting...");
                            break;

                        default:
                            Console.WriteLine("Invalid choice.");
                            break;
                    }
                }
            }
            catch (System.Exception ex)
            {
                Console.WriteLine("Error occurred: " + ex.Message);
            }
        }
    }

    //Console.WriteLine("Task 1.1: Order Status");
    //string statusInput = Console.ReadLine();
    //Task1_CheckOrderStatus(statusInput);

    //Console.WriteLine("\nTask 1.2: Parcel Category");
    //double weightInput = Convert.ToDouble(Console.ReadLine());
    //Task1_CategorizeParcel(weightInput);

    //Console.WriteLine("\nTask 1.3: User Authentication");
    //Console.Write("Enter user type (Employee/Customer): ");
    //string userType = Console.ReadLine();
    //Console.Write("Enter username: ");
    //string username = Console.ReadLine();
    //Console.Write("Enter password: ");
    //string password = Console.ReadLine();
    //Task1_AuthenticateUser(username, password, userType);

    //Console.WriteLine("\nTask 1.4: Courier Assignment");
    //Task1_AssignCourier();

    //Console.Write("Enter customer name to list orders: ");
    //string custName = Console.ReadLine();
    //Task2_DisplayCustomerOrders(custName);

    //Console.WriteLine("\nTracking a courier in real-time:");
    //Task2_TrackCourier();

    //Console.WriteLine("\nTask 3.1: Parcel Tracking History");
    //Task3_TrackingHistoryWithInput();

    //Console.WriteLine("\nTask 3.2: Nearest Available Courier");
    //Task3_FindNearestCourierInput();

    //Console.WriteLine("\nTask 4.1: Parcel Tracking Using 2D Array");
    //Task4_ParcelTracking();

    //Console.WriteLine("\nTask 4.2: Customer Data Validation");
    //Console.Write("Enter the type of data to validate (name/address/phone): ");
    //string type = Console.ReadLine();
    //Console.Write("Enter the actual value: ");
    //string value = Console.ReadLine();
    //Task4_ValidateCustomerData(value, type);

    //Console.WriteLine("\nTask 4.3: Address Formatting");
    //Task4_FormatAddress();

    //Console.WriteLine("\nTask 4.4: Order Confirmation Email");
    //Task4_GenerateOrderConfirmation();

    //Console.WriteLine("\nTask 4.5: Shipping Cost Calculation");
    //Task4_CalculateShippingCost();

    //Console.WriteLine("\nTask 4.6: Password Generator");
    //Task4_GeneratePassword();

    //Console.WriteLine("\nTask 4.7: Find Similar Addresses");
    //Task4_FindSimilarAddresses();
    //}
    // Task 1.1: Order Status Check using if-else
    //public static void Task1_CheckOrderStatus(string status)
    //{
    //    if (status == "Processing")
    //        Console.WriteLine("Order is still processing.");
    //    else if (status == "Delivered")
    //        Console.WriteLine("Order has been delivered.");
    //    else if (status == "Cancelled")
    //        Console.WriteLine("Order has been cancelled.");
    //    else
    //        Console.WriteLine("Invalid status.");
    //}
    // Task 1.2: Categorize parcel using switch-case
    //public static void Task1_CategorizeParcel(double weight)
    //{
    //    string category;

    //    if (weight <= 2)
    //        category = "Light";
    //    else if (weight <= 5)
    //        category = "Medium";
    //    else
    //        category = "Heavy";

    //    Console.WriteLine($"Parcel is categorized as: {category}");
    //}

    //Task 1.3: User Authentication
    //public static void Task1_AuthenticateUser(string username, string password, string userType)
    //{
    //    if (userType == "Employee" && username == "admin" && password == "admin@123")
    //        Console.WriteLine("Employee login successful.");
    //    else if (userType == "Customer" && username == "user" && password == "user@123")
    //        Console.WriteLine("Customer login successful.");
    //    else
    //        Console.WriteLine("Login failed.");
    //}
    // Task 1.4: Assign courier based on least load using loop
    //public static void Task1_AssignCourier()
    //{
    //    string[] couriers = { "C101", "C102", "C103" };
    //    int[] loads = { 3, 1, 2 }; // Lower load is better

    //    int minLoad = int.MaxValue;
    //    int assignedIndex = -1;

    //    for (int i = 0; i < loads.Length; i++)
    //    {
    //        if (loads[i] < minLoad)
    //        {
    //            minLoad = loads[i];
    //            assignedIndex = i;
    //        }
    //    }

    //    Console.WriteLine($"Assigned courier is: {couriers[assignedIndex]}");
    //}
    //task2.1
    //    public static void Task2_DisplayCustomerOrders(string customerName)
    //    {
    //        string[] customers = { "Preethi", "Janani", "Ajay", "Preethi", "Fathima" };
    //        string[] orders = { "TRK001", "TRK002", "TRK003", "TRK004", "TRK005" };

    //        Console.WriteLine($"Orders placed by {customerName}:");
    //        bool found = false;

    //        for (int i = 0; i < customers.Length; i++)
    //        {
    //            if (customers[i] == customerName)
    //            {
    //                Console.WriteLine($" - Order ID: {orders[i]}");
    //                found = true;
    //            }
    //        }

    //        if (!found)
    //        {
    //            Console.WriteLine("No orders found for this customer.");
    //        }
    //    }
    //    //task2.2
    //    public static void Task2_TrackCourier()
    //    {
    //        string[] locations = { "Chennai Hub", "Bangalore Center", "Hyderabad Depot", "Destination" };
    //        int index = 0;

    //        Console.WriteLine("Tracking Courier Location:");

    //        while (index < locations.Length)
    //        {
    //            Console.WriteLine($"Courier reached: {locations[index]}");
    //            index++;

    //            // Simulate delay
    //            System.Threading.Thread.Sleep(1000); // 1 second pause
    //        }

    //        Console.WriteLine("Courier has reached its final destination.");
    //    }
    //    //task3.1
    //    public static void Task3_TrackingHistoryWithInput()
    //    {
    //        var trackingData = new Dictionary<string, string[]>
    //{
    //    { "TRK001", new string[] { "Chennai Hub - Dispatched", "In Transit", "Delivered" } },
    //    { "TRK002", new string[] { "Bangalore Center - In Transit", "Hyderabad Depot - Out for Delivery" } },
    //    { "TRK003", new string[] { "Mumbai Warehouse - Picked Up", "In Transit", "Delivered" } }
    //};

    //        Console.Write("Enter tracking number: ");
    //        string input = Console.ReadLine().ToUpper();

    //        if (trackingData.ContainsKey(input))
    //        {
    //            Console.WriteLine($"Tracking history for {input}:");
    //            foreach (string update in trackingData[input])
    //            {
    //                Console.WriteLine(" - " + update);
    //            }
    //        }
    //        else
    //        {
    //            Console.WriteLine("Tracking number not found.");
    //        }
    //    }
    //    //task3.2
    //    public static void Task3_FindNearestCourierInput()
    //    {
    //        Console.Write("Enter number of couriers: ");
    //        int count = Convert.ToInt32(Console.ReadLine());

    //        string[] courierIds = new string[count];
    //        int[] distances = new int[count];

    //        for (int i = 0; i < count; i++)
    //        {
    //            Console.Write($"Enter Courier ID #{i + 1}: ");
    //            courierIds[i] = Console.ReadLine();

    //            Console.Write($"Enter distance for {courierIds[i]} (in km): ");
    //            distances[i] = Convert.ToInt32(Console.ReadLine());
    //        }

    //        // Find nearest
    //        int min = int.MaxValue, index = -1;
    //        for (int i = 0; i < count; i++)
    //        {
    //            if (distances[i] < min)
    //            {
    //                min = distances[i];
    //                index = i;
    //            }
    //        }

    //        Console.WriteLine($"\nNearest available courier is {courierIds[index]} ({distances[index]} km away)");
    //    }

    //    //task4.1
    //    public static void Task4_ParcelTracking()
    //    {
    //        string[,] parcelData = {
    //    { "TRK001", "In Transit" },
    //    { "TRK002", "Out for Delivery" },
    //    { "TRK003", "Delivered" },
    //    { "TRK004", "Scheduled" }
    //};

    //        Console.Write("Enter Tracking Number: ");
    //        string trackingNumber = Console.ReadLine().ToUpper();
    //        bool found = false;

    //        for (int i = 0; i < parcelData.GetLength(0); i++)
    //        {
    //            if (parcelData[i, 0] == trackingNumber)
    //            {
    //                Console.WriteLine($"Status of {trackingNumber}: {parcelData[i, 1]}");
    //                found = true;
    //                break;
    //            }
    //        }

    //        if (!found)
    //        {
    //            Console.WriteLine("Tracking number not found.");
    //        }
    //    }
    //    //task4.2
    //    public static void Task4_ValidateCustomerData(string data, string detail)
    //    {
    //        switch (detail.ToLower())
    //        {
    //            case "name":
    //                if (System.Text.RegularExpressions.Regex.IsMatch(data, @"^[A-Z][a-z]+$"))
    //                    Console.WriteLine("Valid name.");
    //                else
    //                    Console.WriteLine("Invalid name. Use only letters and capitalize first letter.");
    //                break;

    //            case "address":
    //                if (System.Text.RegularExpressions.Regex.IsMatch(data, @"^[a-zA-Z0-9\s,.-]+$"))
    //                    Console.WriteLine("Valid address.");
    //                else
    //                    Console.WriteLine("Invalid address. No special symbols allowed.");
    //                break;

    //            case "phone":
    //                if (System.Text.RegularExpressions.Regex.IsMatch(data, @"^\d{3}-\d{3}-\d{4}$"))
    //                    Console.WriteLine("Valid phone number.");
    //                else
    //                    Console.WriteLine("Invalid phone. Use format ###-###-####.");
    //                break;

    //            default:
    //                Console.WriteLine("Unknown detail type.");
    //                break;
    //        }
    //    }
    //    //task4.3
    //    public static void Task4_FormatAddress()
    //    {
    //        Console.Write("Enter address (street, city, state, zip): ");
    //        string input = Console.ReadLine();

    //        string[] parts = input.Split(' ');
    //        for (int i = 0; i < parts.Length; i++)
    //        {
    //            if (parts[i].Length > 0)
    //                parts[i] = char.ToUpper(parts[i][0]) + parts[i].Substring(1).ToLower();
    //        }

    //        string formatted = string.Join(" ", parts);
    //        Console.WriteLine("Formatted Address: " + formatted);
    //    }
    //    //task4.4
    //    public static void Task4_GenerateOrderConfirmation()
    //    {
    //        Console.Write("Enter Customer Name: ");
    //        string name = Console.ReadLine();

    //        Console.Write("Enter Order Number: ");
    //        string orderNo = Console.ReadLine();

    //        Console.Write("Enter Delivery Address: ");
    //        string address = Console.ReadLine();

    //        Console.Write("Enter Expected Delivery Date (yyyy-mm-dd): ");
    //        string date = Console.ReadLine();

    //        Console.WriteLine("\n--- Order Confirmation Email ---");
    //        Console.WriteLine($"Dear {name},");
    //        Console.WriteLine($"Your order {orderNo} is confirmed and will be delivered to {address} by {date}.");
    //        Console.WriteLine("Thank you for using our Courier Service!");
    //    }
    //    //task4.5
    //    public static void Task4_CalculateShippingCost()
    //    {
    //        Console.Write("Enter source location: ");
    //        string source = Console.ReadLine();

    //        Console.Write("Enter destination location: ");
    //        string destination = Console.ReadLine();

    //        Console.Write("Enter weight (kg): ");
    //        double weight = Convert.ToDouble(Console.ReadLine());

    //        Console.Write("Enter distance (km): ");
    //        double distance = Convert.ToDouble(Console.ReadLine());

    //        double cost = weight * 10 + distance * 2; // simple formula
    //        Console.WriteLine($"Shipping cost from {source} to {destination} is ₹{cost}");
    //    }
    //    //task4.6

    //    public static void Task4_GeneratePassword()
    //    {
    //        string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#$!";
    //        Random rand = new Random();
    //        string password = "";

    //        for (int i = 0; i < 10; i++)
    //        {
    //            password += chars[rand.Next(chars.Length)];
    //        }

    //        Console.WriteLine("Generated Secure Password: " + password);
    //    }
    //    //task4.7

    //    public static void Task4_FindSimilarAddresses()
    //    {
    //        string[] addresses = {
    //    "24, Lakshmi Ammal Street, Ayyavoo Colony, Aminjikarai",
    //    "1105 Tidel Park, Canal Bank Road",
    //    "Nungambakkam, Chennai - 600034",
    //    "Velacheri, Chennai",
    //    "Park Street, Kolkata"
    //};

    //        Console.Write("Enter partial address to search: ");
    //        string input = Console.ReadLine().ToLower();

    //        Console.WriteLine("Similar addresses found:");
    //        foreach (string addr in addresses)
    //        {
    //            if (addr.ToLower().Contains(input))
    //            {
    //                Console.WriteLine(" - " + addr);
    //            }
    //        }
    //    }

}
