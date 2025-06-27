using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Courier.Entity
{
    public class CourierCompanyCollection
    {
        public string CompanyName { get; set; }
        public List<CourierDetails> CourierDetails { get; set; }
        public List<Employee> EmployeeDetails { get; set; }
        public List<Location> LocationDetails { get; set; }

        public CourierCompanyCollection(string companyName)
        {
            CompanyName = companyName;
            CourierDetails = new List<CourierDetails>();
            EmployeeDetails = new List<Employee>();
            LocationDetails = new List<Location>();
        }
    }
}
