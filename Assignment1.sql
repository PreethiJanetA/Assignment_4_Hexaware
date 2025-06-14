create database Assignment1
use Assignment1

-- USERS Table
create table Users (
UserID INT PRIMARY KEY,
Name VARCHAR(255),
Email VARCHAR(255) UNIQUE,
Password VARCHAR(255),
ContactNumber VARCHAR(20),
Address TEXT
)

-- EMPLOYEE Table
create table Employee (
EmployeeID INT PRIMARY KEY,
Name VARCHAR(255),
Email VARCHAR(255) UNIQUE,
ContactNumber VARCHAR(20),
Role VARCHAR(50),
Salary DECIMAL(10, 2)
)

-- COURIERSERVICES Table
create table CourierServices (
ServiceID INT PRIMARY KEY,
ServiceName VARCHAR(100),
Cost DECIMAL(8, 2)
)

-- LOCATION Table
create table Location (
LocationID INT PRIMARY KEY,
LocationName VARCHAR(100),
Address TEXT
)

-- COURIER Table
create table Courier (
CourierID INT PRIMARY KEY,
UserID INT,
EmployeeID INT,
ServiceID INT,
SenderName VARCHAR(255),
SenderAddress TEXT,
ReceiverName VARCHAR(255),
ReceiverAddress TEXT,
Weight DECIMAL(5, 2),
Status VARCHAR(50),
TrackingNumber VARCHAR(20) UNIQUE,
DeliveryDate DATE,
FOREIGN KEY (UserID) REFERENCES Users(UserID),
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
FOREIGN KEY (ServiceID) REFERENCES CourierServices(ServiceID)
)

-- PAYMENT Table
create table Payment (
PaymentID INT PRIMARY KEY,
CourierID INT,
LocationID INT,
Amount DECIMAL(10, 2),
PaymentDate DATE,
FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
)
select * from Users
select * from Employee
select * from CourierServices
select * from Location
select * from  Courier
select * from  Payment

-- INSERT VALUES USERS
insert into Users(UserID ,Name ,Email,Password,ContactNumber ,Address )
values
(101,'Preethi','preethi7@gmail.com','preets@23','7890985463','24, Lakshmi Ammal Street, Ayyavoo Colony, Aminjikarai, Chennai - 600 029'),
(102,'Janani', 'jana247@gmail.com', 'jane@36',  '6784562190','No. 1105 Tidel Park 11th Floor D Block No 4, Canal Bank Road, Rajiv Gandhi Salai, Tharamani, Chennai - 600113'),
(103,'Ajay', 'ajaystudio@gmail.com','ajay@2003','9884661314','Parson Commercial Complex 8 A 3rd Floor, K H Road, Nungambakkam, Chennai - 600034'),
(104,'Likith','likith18@gmail.com','likith@18','9885661413','Avinash Apartment, Central Avenue , Tailors Estate, Kodambakkam, Chennai - 600024'),
(105,'Sanjai','sanjai02@gmail.com','sanjai#25','7397431914','No 209, Ground Floor, 3rd Main Road, Velacheri, Chennai - 600042'),
(106,'Gracy','gracy45@gmail.com','gracy@20','9971431251','23, 35, 10th Ave, Sarvamangala Colony, Manthope Colony, Ashok Nagar, Chennai, Tamil Nadu 600083'),
(107,'Fathima','Fathima19@gmail.com','fathima@2004','9876543290','25, Ramanathan St, Alagappa Nagar, Kilpauk, Chennai, Tamil Nadu 600010'),
(108,'Arun','arun47@gmail.com','arun&34','9086754321','No.5, Purasawalkam High Rd, Purasaiwakkam, Chennai, Tamil Nadu 600007'),
(109,'Nirmal','nirmal90@gmail.com','nirmal*04','9551035529','171, Inner Ring Rd, Annai Sathya Nagar, Arumbakkam, Chennai, Tamil Nadu 600106'),
(110,'John','John77@gmail.com','john$234','9786321166','41\/19A, Anugraha Apartment, Nungambakkam High Road, Chennai, Tamil Nadu 600034')

---INSERT VALUE EMPLOYEE
insert into  Employee (EmployeeID ,Name ,Email ,ContactNumber ,Role ,Salary) 
values
(201, 'John Mathews', 'john.m@courier.com', '9876543210', 'Delivery Agent', 25000.00),
(202, 'Ayesha Khan', 'ayesha.k@courier.com', '9812345678', 'Manager', 50000.00),
(203, 'Rajeev Nair', 'rajeev.n@courier.com', '9823456789', 'Driver', 20000.00),
(204, 'Sneha Verma', 'sneha.v@courier.com', '9871234567', 'Dispatcher', 28000.00),
(205, 'Karthik Rao', 'karthik.r@courier.com', '9807654321', 'Delivery Agent', 23000.00),
(206, 'Meena Joseph', 'meena.j@courier.com', '9811122233', 'Support Staff', 22000.00),
(207, 'Amit Saxena', 'amit.s@courier.com', '9876677889', 'Warehouse Head', 45000.00),
(208, 'Priya Desai', 'priya.d@courier.com', '9898989898', 'Customer Support', 24000.00),
(209, 'Rohit Sharma', 'rohit.s@courier.com', '9765432189', 'Driver', 21000.00),
(210, 'John Joseph4', 'neha.b@courier.com', '9834567890', 'HR Executive', 27000.00)

--INSERT VALUE COURIERSERVICES
insert into CourierServices(ServiceID ,ServiceName ,Cost)
values
(1,'Express Delivery',200),
(2,'Standard Delivery',100),
(3,'International Delivery',400),
(4,'Express Delivery',200),
(5,'International Delivery',400),
(6,'Standard Delivery',100),
(7,'Same day Delivery',300),
(8, 'Overnight Delivery', 350),
(9, 'Economy Delivery', 80),
(10, 'Bulk Parcel Delivery', 500)

--INSERT VALUE LOCATION
insert into Location (LocationID,LocationName ,Address) 
values
(301, 'Chennai Hub', 'No. 12, Anna Salai, Chennai, Tamil Nadu'),
(302, 'Bangalore Center', '14 MG Road, Bangalore, Karnataka'),
(303, 'Mumbai Warehouse', '22 Dadar East, Mumbai, Maharashtra'),
(304, 'Delhi Branch', 'Plot 7, Karol Bagh, New Delhi'),
(305, 'Hyderabad Depot', 'Gachibowli Road, Hyderabad, Telangana'),
(306, 'Kolkata Unit', 'Park Street, Kolkata, West Bengal'),
(307, 'Pune Station', 'Baner Road, Pune, Maharashtra'),
(308, 'Coimbatore Point', 'Avinashi Road, Coimbatore, Tamil Nadu'),
(309, 'Ahmedabad Node', 'CG Road, Ahmedabad, Gujarat'),
(310, 'Jaipur Hub', 'MI Road, Jaipur, Rajasthan')

--INSERT VALUE COURIER
insert into Courier (CourierID ,UserID ,EmployeeID,ServiceID ,SenderName ,SenderAddress,ReceiverName ,ReceiverAddress,Weight,Status,TrackingNumber,DeliveryDate ) 
values
(51,101,201,1, 'Amit Sharma', 'Chennai Hub, Tamil Nadu', 'Rita Singh', 'Delhi Branch, New Delhi', 2.5, 'Delivered', 'TRK001', '2025-07-10'),
(52,102,202,2, 'John Doe', 'Bangalore Center, Karnataka', 'Suresh Reddy', 'Hyderabad Depot, Telangana', 6.8, 'Undelivered', 'TRK002', '2025-09-14'),
(53,103,203,3, 'Nisha Verma', 'Mumbai Warehouse, Maharashtra', 'Meera Patel', 'Pune Station, Maharashtra', 0.8, 'In Transit', 'TRK003', '2025-06-15'),
(54,104,204,4, 'Rahul Das', 'Kolkata Unit, West Bengal', 'Anil Kumar', 'Delhi Branch, New Delhi', 3.0, 'Delivered', 'TRK004', '2025-10-13'),
(55,105,205,5, 'Sana Khan', 'Hyderabad Depot, Telangana', 'Priya Desai', 'Mumbai Warehouse, Maharashtra', 2.0, 'Scheduled', 'TRK005', '2025-06-14'),
(56,106,206,6, 'Vikram Singh', 'Pune Station, Maharashtra', 'Farah Ali', 'Chennai Hub, Tamil Nadu', 1.5, 'Undelivered', 'TRK006', '2025-05-14'),
(57,107,207,7, 'Divya Joshi', 'Delhi Branch, New Delhi', 'Rohit Nair', 'Kolkata Unit, West Bengal', 5.7, 'In Transit', 'TRK007', '2025-06-15'),
(58,108,208,8, 'Anita Menon', 'Coimbatore Point, Tamil Nadu', 'Ramesh Iyer', 'Ahmedabad Node, Gujarat', 10, 'Delivered', 'TRK008', '2025-06-12'),
(59,109,209,9, 'Kiran Rao', 'Ahmedabad Node, Gujarat', 'Sneha Kapoor', 'Jaipur Hub, Rajasthan', 9, 'Scheduled', 'TRK009', '2025-12-16'),
(60,110,210,10, 'Tarun Gupta', 'Jaipur Hub, Rajasthan', 'Meenal Jain', 'Chennai Hub, Tamil Nadu', 4.5, 'In Transit', 'TRK010', '2025-11-15')

--INSERT VALUE PAYMENT
insert into Payment (PaymentID,CourierID ,LocationID ,Amount,PaymentDate) 
values
(401, 51, 301, 300, '2025-06-01'),
(402, 52, 302, 1500, '2025-06-03'),
(403, 53, 303, 2500, '2025-06-04'),
(404, 54, 304, 4200, '2025-06-06'),
(405, 55, 305, 6750, '2025-06-08'),
(406, 56, 306, 8200, '2025-06-10'),
(407, 57, 307, 10000, '2025-06-12'),
(408, 58, 308, 1200, '2025-06-13'),
(409, 59, 309, 900, '2025-06-14'),
(410, 60, 310, 3500, '2025-06-15')

---TASK 2

---1. List all customers: 
select * from Users
---2. List all orders for a specific customer:  
select * from Courier where UserID = 108 
---3. List all couriers:  
select * from Courier
---4. List all packages for a specific order:  
select CourierID,UserID,Weight,Status,TrackingNumber from Courier where CourierID=60
---5. List all deliveries for a specific courier: 
select * from Courier where CourierID = 52
---6. List all undelivered packages: 
select UserID,Weight,Status,TrackingNumber from Courier where status !='Delivered' 
select * from Courier where status != 'Delivered'
---7. List all packages that are scheduled for delivery today:
select UserID,Weight,Status,TrackingNumber from Courier where status ='Delivered today'
select * from Courier where status ='Delivered today'
---8. List all packages with a specific status:  
select UserID,Weight,Status,TrackingNumber from Courier where status = 'In Transit'
---9. Calculate the total number of packages for each courier. 
select CourierID ,count(*) as totalpackages from Courier 
group by CourierID
---10. Find the average delivery time for each courier  
select CourierID, AVG(DATEDIFF(DAY, DispatchDate, DeliveryDate)) 
AS AvgTime FROM Courier GROUP BY CourierID;
---11. List all packages with a specific weight range: 
select * from Courier where Weight between 5 and 10
---12. Retrieve employees whose names contain 'John'  
select * from Employee where Name like '%John%'
---13. Retrieve all courier records with payments greater than 50. 
select c.* from Courier c JOIN Payment p 
on c.CourierID =p.CourierID 
where p.Amount >50

----TASK 3

---14. Find the total number of couriers handled by each employee.
select EmployeeID , count(*) as total from Courier 
group by EmployeeID
---15. Calculate the total revenue generated by each location  
select LocationID, sum(Amount) as Totalrevenue from payment 
group by LocationID
---16. Find the total number of couriers delivered to each location. 
select LocationID, count(*) as TotalCouriers from Payment 
group by LocationID;
---17. Find the courier with the highest average delivery time:  
select top 1 CourierID, AVG(DATEDIFF(DAY, DispatchDate, DeliveryDate)) 
as AvgTime from Courier 
group by CourierID 
order by AvgTime desc;
---18. Find Locations with Total Payments Less Than a Certain Amount  
select LocationID , sum(Amount) as totalpayment from Payment 
group by LocationID having sum(Amount)<8000
---19. Calculate Total Payments per Location  
select LocationID , sum(Amount) as total from payment 
group by LocationID
---20. Retrieve couriers who have received payments totaling more than 1000 in a specific location
select CourierID ,sum(Amount) As total from Payment where LocationID = 305
group by CourierID having sum(Amount) >1000 
---21. Retrieve couriers who have received payments totaling more than 1000 after a certain date
select CourierID ,sum(Amount) As total from Payment where PaymentDate > '2025-06-01'
group by CourierID having sum(Amount) >1000
---22. Retrieve locations where the total amount received is more than 5000 before a certain date 
select CourierID ,sum(Amount) As total from Payment where PaymentDate < '2025-06-15'
group by CourierID having sum(Amount) >5000

---TASK 4
---23. Retrieve Payments with Courier Information 
SELECT p.*, c.TrackingNumber, c.Status FROM Payment p INNER JOIN Courier c ON p.CourierID = c.CourierID
---24. Retrieve Payments with Location Information 
SELECT p.*, l.LocationName FROM Payment p INNER JOIN Location l ON p.LocationID = l.LocationID
---25. Retrieve Payments with Courier and Location Information  
SELECT p.PaymentID, c.TrackingNumber, l.LocationName, p.Amount, p.PaymentDate FROM Payment p
INNER JOIN Courier c ON p.CourierID = c.CourierID 
INNER JOIN Location l ON p.LocationID = l.LocationID
---26. List all payments with courier details  
SELECT p.*, c.SenderName, c.ReceiverName, c.Weight 
FROM Payment p JOIN Courier c ON p.CourierID = c.CourierID
---27. Total payments received for each courier 
SELECT CourierID, SUM(Amount) AS Total FROM Payment GROUP BY CourierID
---28. List payments made on a specific date  
SELECT * FROM Payment WHERE PaymentDate = '2025-06-10'
---29. Get Courier Information for Each Payment 
SELECT p.PaymentID, c.* FROM Payment p JOIN Courier c ON p.CourierID = c.CourierID
---30. Get Payment Details with Location  
SELECT p.PaymentID, p.Amount, l.LocationName FROM Payment p 
JOIN Location l ON p.LocationID = l.LocationID
---31. Calculating Total Payments for Each Courier  
SELECT c.CourierID, c.TrackingNumber, SUM(p.Amount) AS TotalPaid FROM Courier c 
JOIN Payment p ON c.CourierID = p.CourierID GROUP BY c.CourierID, c.TrackingNumber
---32. List Payments Within a Date Range  
SELECT * FROM Payment WHERE PaymentDate BETWEEN '2025-06-01' AND '2025-06-10'
---33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side 
SELECT u.UserID, u.Name, c.CourierID, c.TrackingNumber FROM Users u 
FULL OUTER JOIN Courier c ON u.UserID = c.UserID
--34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side  
SELECT c.CourierID, c.TrackingNumber, s.ServiceName FROM Courier c 
FULL OUTER JOIN CourierServices s ON c.ServiceID = s.ServiceID
--35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side 
SELECT e.EmployeeID, e.Name, p.PaymentID, p.Amount FROM Employee e 
LEFT JOIN Courier c ON e.EmployeeID = c.EmployeeID 
LEFT JOIN Payment p ON c.CourierID = p.CourierID
--36. List all users and all courier services, showing all possible combinations. 
SELECT u.Name AS UserName, s.ServiceName FROM Users u CROSS JOIN CourierServices s
--37. List all employees and all locations, showing all possible combinations:  
SELECT e.Name AS EmployeeName, l.LocationName FROM Employee e CROSS JOIN Location l
--38. Retrieve a list of couriers and their corresponding sender information (if available)
SELECT CourierID, SenderName, SenderAddress FROM Courier
--39. Retrieve a list of couriers and their corresponding receiver information (if available): 
SELECT CourierID, ReceiverName, ReceiverAddress FROM Courier
--40. Retrieve a list of couriers along with the courier service details (if available):
SELECT c.CourierID, c.TrackingNumber, s.ServiceName, s.Cost FROM Courier c 
LEFT JOIN CourierServices s ON c.ServiceID = s.ServiceID
--41. Retrieve a list of employees and the number of couriers assigned to each employee: 
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS NumCouriers FROM Employee e 
LEFT JOIN Courier c ON e.EmployeeID = c.EmployeeID GROUP BY e.EmployeeID, e.Name
--42. Retrieve a list of locations and the total payment amount received at each location: 
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayment FROM Location l 
LEFT JOIN Payment p ON l.LocationID = p.LocationID GROUP BY l.LocationID, l.LocationName
--43. Retrieve all couriers sent by the same sender (based on SenderName).  
SELECT * FROM Courier WHERE SenderName = 'John Doe'
--44. List all employees who share the same role.  
SELECT Role, COUNT(*) AS Count FROM Employee GROUP BY Role HAVING COUNT(*) > 1
--45. Retrieve all payments made for couriers sent from the same location.  
SELECT p.*FROM Courier c JOIN Payment p ON c.CourierID = p.CourierID
WHERE CAST(c.SenderAddress AS VARCHAR(MAX)) = 'Delhi Branch, New Delhi'
--46. Retrieve all couriers sent from the same location (based on SenderAddress).
SELECT * FROM Courier WHERE CONVERT(VARCHAR(MAX), SenderAddress) = 'Delhi Branch, New Delhi'
--47. List employees and the number of couriers they have delivered:  
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS DeliveredCount FROM Employee e 
LEFT JOIN Courier c ON e.EmployeeID = c.EmployeeID WHERE c.Status = 'Delivered' 
GROUP BY e.EmployeeID, e.Name
--48. Find couriers that were paid an amount greater than the cost of their respective courier services 
SELECT c.CourierID, s.Cost, SUM(p.Amount) AS TotalPaid FROM Courier c 
JOIN CourierServices s ON c.ServiceID = s.ServiceID 
JOIN Payment p ON c.CourierID = p.CourierID 
GROUP BY c.CourierID, s.Cost HAVING SUM(p.Amount) > s.Cost

