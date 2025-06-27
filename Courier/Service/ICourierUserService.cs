
using Courier.Entity;
using System.Collections.Generic;
namespace Courier.Service
{
    public interface ICourierUserService
    {
         string PlaceOrder(CourierDetails courierObj);
        // Get status of a courier order
        string GetOrderStatus(string trackingNumber);

        // Cancel a courier order
        bool CancelOrder(string trackingNumber);

        List<CourierDetails> GetAssignedOrder(string courierStaffId);
    }
}
