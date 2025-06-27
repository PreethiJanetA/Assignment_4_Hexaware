using Courier.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Courier.Service
{
    public interface ICourierAdminService
    {
        // Add new courier staff
        int AddCourierStaff(Employee employeeObj);

        List<CourierDetails> ViewAllOrders();
        bool AssignOrderToEmployee(string trackingNumber, string courierStaffId);
        bool UpdateOrderStatus(string trackingNumber, string newStatus);
    }
}
