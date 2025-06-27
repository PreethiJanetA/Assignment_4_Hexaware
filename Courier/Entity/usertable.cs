using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Courier.Entity
{
   public class User
    {
        private int userid_;
        private string username;
        private string email;
        private string userpassword;
        private string contactnumber;
        private string useraddress;

        // Setter methods
        public void SetUserid_(int userid_)
        {
            this.userid_ = userid_;
        }

        public void SetUsername(string username)
        {
            this.username = username;
        }

        public void SetEmail(string email)
        {
            this.email = email;
        }

        public void SetUserpassword(string userpassword)
        {
            this.userpassword = userpassword;
        }

        public void SetContactnumber(string contactnumber)
        {
            this.contactnumber = contactnumber;
        }

        public void SetUseraddress(string useraddress)
        {
            this.useraddress = useraddress;
        }

        // Getter methods
        public int GetUserid_()
        {
            return userid_;
        }

        public string GetUsername()
        {
            return username;
        }

        public string GetEmail()
        {
            return email;
        }

        public string GetUserpassword()
        {
            return userpassword;
        }

        public string GetContactnumber()
        {
            return contactnumber;
        }

        public string GetUseraddress()
        {
            return useraddress;
        }

        // ToString override
        public override string ToString()
        {
            return "User ID: " + userid_ + "\n" +
                   "Username: " + username + "\n" +
                   "Email: " + email + "\n" +
                   "Password: " + userpassword + "\n" +
                   "Contact Number: " + contactnumber + "\n" +
                   "Address: " + useraddress;
        }
    }
}
