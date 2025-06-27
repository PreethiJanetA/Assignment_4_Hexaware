using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Courier.Entity
{
    public class Employee
    {
        public int emp_id;
        public string emp_name;
        public string email;
        public string contactnumber;
        public string role;
        public decimal salary;

        public Employee()
        {

        }
        // Setter methods
        public void SetEmpId(int emp_id)
        {
            this.emp_id = emp_id;
        }

        public void SetEmpName(string emp_name)
        {
            this.emp_name = emp_name;
        }

        public void SetEmail(string email)
        {
            this.email = email;
        }

        public void SetContactNumber(string contactnumber)
        {
            this.contactnumber = contactnumber;
        }

        public void SetRole(string role)
        {
            this.role = role;
        }

        public void SetSalary(decimal salary)
        {
            this.salary = salary;
        }

        // Getter methods
        public int GetEmpId()
        {
            return emp_id;
        }

        public string GetEmpName()
        {
            return emp_name;
        }

        public string GetEmail()
        {
            return email;
        }

        public string GetContactNumber()
        {
            return contactnumber;
        }

        public string GetRole()
        {
            return role;
        }

        public decimal GetSalary()
        {
            return salary;
        }

        // ToString override
        public override string ToString()
        {
            return "Employee ID: " + emp_id + "\n" +
                   "Name: " + emp_name + "\n" +
                   "Email: " + email + "\n" +
                   "Contact Number: " + contactnumber + "\n" +
                   "Role: " + role + "\n" +
                   "Salary: ₹" + salary.ToString("F2");
        }
    }
}
