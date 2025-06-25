using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Courier.Entity
{
    public class Location
    {
        private int location_id;
        private string location_name;
        private string location_address;

        // Setter methods
        public void SetLocationId(int location_id)
        {
            this.location_id = location_id;
        }

        public void SetLocationName(string location_name)
        {
            this.location_name = location_name;
        }

        public void SetLocationAddress(string location_address)
        {
            this.location_address = location_address;
        }

        // Getter methods
        public int GetLocationId()
        {
            return location_id;
        }

        public string GetLocationName()
        {
            return location_name;
        }

        public string GetLocationAddress()
        {
            return location_address;
        }

        // ToString override
        public override string ToString()
        {
            return "Location ID: " + location_id + "\n" +
                   "Location Name: " + location_name + "\n" +
                   "Location Address: " + location_address;
        }
    }
}
