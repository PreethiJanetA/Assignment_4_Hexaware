
using System.Collections.Generic;

namespace Courier.Service
{
    public interface ICourierUserService
    {

        // Get status of a courier order
        string GetOrderStatus(string trackingNumber);

        // Cancel a courier order
        bool CancelOrder(string trackingNumber);
    }
}
