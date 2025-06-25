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
    }
}
