using System;

namespace Courier.Exception
{
    public class TrackingNumberNotFoundException : RankException
    {
        public TrackingNumberNotFoundException() : base("Tracking number not found.") { }

        public TrackingNumberNotFoundException(string message) : base(message) { }
    }
}
