using Courier.Entity;
using Courier.Exception;
using Courier.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Courier.Dao
{
    public class CourierAdminServiceImpl : CourierUserServiceImpl, ICourierAdminService
    {
        public int AddCourierStaff(Employee employeeObj)
        {
            if (employeeObj.emp_id <= 0)
            {
                throw new InvalidEmployeeIdException("Employee ID must be a positive number.");
            }

            companyObj.EmployeeDetails.Add(employeeObj);
            return employeeObj.emp_id;
        }


        public List<CourierDetails> ViewAllOrders()
        {
            return new List<CourierDetails>(companyObj.CourierDetails);
        }

        // 3️⃣ Assign order to a courier staff member
        public bool AssignOrderToEmployee(string trackingNumber, string courierStaffId)
        {
            foreach (var courier in companyObj.CourierDetails)
            {
                if (courier.tracking_number == trackingNumber)
                {
                    courier.assigned_courier_id = courierStaffId;
                    return true;
                }
            }
            return false;
        }

        // 4️⃣ Update the status of a courier order
        public bool UpdateOrderStatus(string trackingNumber, string newStatus)
        {
            foreach (var courier in companyObj.CourierDetails)
            {
                if (courier.tracking_number == trackingNumber)
                {
                    courier.status = newStatus;
                    return true;
                }
            }
            return false;
        }

        List<CourierDetails> ICourierAdminService.ViewAllOrders()
        {
            throw new NotImplementedException();
        }
    }

}
