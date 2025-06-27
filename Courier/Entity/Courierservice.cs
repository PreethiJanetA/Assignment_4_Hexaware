using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Courier.Entity
{
    public class Courierservice
    {
        public int service_id;
        public string service_name;
        public decimal cost;

        // Setter methods
        public void SetServiceId(int service_id)
        {
            this.service_id = service_id;
        }

        public void SetServiceName(string service_name)
        {
            this.service_name = service_name;
        }

        public void SetCost(decimal cost)
        {
            this.cost = cost;
        }

        // Getter methods
        public int GetServiceId()
        {
            return service_id;
        }

        public string GetServiceName()
        {
            return service_name;
        }

        public decimal GetCost()
        {
            return cost;
        }

        // ToString override
        public override string ToString()
        {
            return "Service ID: " + service_id + "\n" +
                   "Service Name: " + service_name + "\n" +
                   "Cost: ₹" + cost.ToString("F2");
        }
    }
}
