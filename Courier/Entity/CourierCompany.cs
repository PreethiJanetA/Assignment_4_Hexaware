using System.Collections.Generic;

namespace Courier.Entity
{
    public class CourierCompany
    {
        public string companyName;
        public List<CourierDetails> courierDetails;
        public List<Employee> employeeDetails;
        public List<Location> locationDetails;

        public CourierCompany()
        {
            courierDetails = new List<CourierDetails>();
            employeeDetails = new List<Employee>();
            locationDetails = new List<Location>();
        }

        public CourierCompany(string companyName)
        {
            this.companyName = companyName;
            courierDetails = new List<CourierDetails>();
            employeeDetails = new List<Employee>();
            locationDetails = new List<Location>();
        }

        public string CompanyName { get => companyName; set => companyName = value; }
        public List<CourierDetails> CourierDetails { get => courierDetails; set => courierDetails = value; }
        public List<Employee> EmployeeDetails { get => employeeDetails; set => employeeDetails = value; }
        public List<Location> LocationDetails { get => locationDetails; set => locationDetails = value; }

        public override string ToString()
        {
            return $"CourierCompany [Name={companyName}, Couriers={courierDetails.Count}, Employees={employeeDetails.Count}]";
        }
    }
}
