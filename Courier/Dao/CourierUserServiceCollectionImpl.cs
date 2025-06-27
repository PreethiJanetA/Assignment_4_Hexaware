using Courier.Entity;
using Courier.Exception;
using Courier.Service;
using System.Collections.Generic;

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

        public string PlaceOrder(CourierDetails courierObj)
        {
            // Auto-generates tracking number via Courier constructor logic
            companyObj.CourierDetails.Add(courierObj);
            return courierObj.tracking_number;
        }


        public List<CourierDetails> GetAssignedOrder(string courierStaffId)
        {
            var result = new List<CourierDetails>();
            foreach (var courier in companyObj.CourierDetails)
            {
                if (courier.assigned_courier_id == courierStaffId)
                    result.Add(courier);
            }
            return result;
        }

        //public string PlaceOrder(CourierDetails courierObj)
        //{
        //    throw new System.NotImplementedException();
        //}

        List<CourierDetails> ICourierUserService.GetAssignedOrder(string courierStaffId)
        {
            throw new System.NotImplementedException();
        }
    }
}
