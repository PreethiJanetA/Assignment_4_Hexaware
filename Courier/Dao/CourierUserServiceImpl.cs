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
    public class CourierUserServiceImpl : ICourierUserService
    {
        protected CourierCompany companyObj;

        public CourierUserServiceImpl()
        {
            companyObj = new CourierCompany("HexaCourier");
        }

        public string GetOrderStatus(string trackingNumber)
        {
            foreach (var courier in companyObj.CourierDetails)
            {
                if (courier.tracking_number == trackingNumber)
                {
                    return courier.status;
                }
            }

            throw new TrackingNumberNotFoundException($"Tracking number not found.");
        }

        public bool CancelOrder(string tracking_number)
        {
            foreach (var courier in companyObj.CourierDetails)
            {
                if (courier.tracking_number == tracking_number)
                {
                    courier.status = "Cancelled";
                    return true;
                }
            }

            return false;
        }
    }
}
