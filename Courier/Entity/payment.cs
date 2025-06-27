using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Courier.Entity
{
    public class Payment
    {
        public int payment_id;
        public int courier_id;
        public int location_id;
        public decimal amount;
        public DateTime paymentdate;

        // Setter methods
        public void SetPaymentId(int payment_id)
        {
            this.payment_id = payment_id;
        }

        public void SetCourierId(int courier_id)
        {
            this.courier_id = courier_id;
        }

        public void SetLocationId(int location_id)
        {
            this.location_id = location_id;
        }

        public void SetAmount(decimal amount)
        {
            this.amount = amount;
        }

        public void SetPaymentDate(DateTime paymentdate)
        {
            this.paymentdate = paymentdate;
        }

        // Getter methods
        public int GetPaymentId()
        {
            return payment_id;
        }

        public int GetCourierId()
        {
            return courier_id;
        }

        public int GetLocationId()
        {
            return location_id;
        }

        public decimal GetAmount()
        {
            return amount;
        }

        public DateTime GetPaymentDate()
        {
            return paymentdate;
        }

        // ToString override
        public override string ToString()
        {
            return "Payment ID: " + payment_id + "\n" +
                   "Courier ID: " + courier_id + "\n" +
                   "Location ID: " + location_id + "\n" +
                   "Amount: ₹" + amount.ToString("F2") + "\n" +
                   "Payment Date: " + paymentdate.ToShortDateString();
        }
    }
}
