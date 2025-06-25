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
    }
}
