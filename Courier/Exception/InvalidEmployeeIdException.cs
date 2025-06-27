using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Courier.Exception
{
    public class InvalidEmployeeIdException : RankException
    {
        public InvalidEmployeeIdException() : base("Invalid employee ID.") { }

        public InvalidEmployeeIdException(string message) : base(message) { }
    }
}
