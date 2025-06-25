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
    public class CourierUserServiceCollectionImpl : ICourierUserService
    {
        protected CourierCompanyCollection companyObj;

        public CourierUserServiceCollectionImpl()
        {
            companyObj = new CourierCompanyCollection("HexaCourier");
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
            throw new TrackingNumberNotFoundException($"Tracking number {trackingNumber} not found.");
        }

        public bool CancelOrder(string trackingNumber)
        {
            foreach (var courier in companyObj.CourierDetails)
            {
                if (courier.tracking_number == trackingNumber)
                {
                    courier.status = "Cancelled";
                    return true;
                }
            }
            return false;
        }
    }
}
