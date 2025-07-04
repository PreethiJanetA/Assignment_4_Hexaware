﻿using System;
using System.Collections.Generic;


namespace Courier.Entity
{
    public class CourierDetails
    {

        public static int trackingCounter = new Random().Next(1000, 9999);

        public int courier_id;
        public string sender_name;
        public string sender_address;
        public string receiver_name;
        public string receiver_address;
        public decimal courier_weight;
        public string status;
        public string tracking_number;
        public DateTime delivery_date;
        internal string assigned_courier_id;

        //public CourierDetails()
        //{
        //    // Optionally log or initialize more static data here
        //}

        // Instance constructor assigns a unique tracking number
        public CourierDetails()
        {
            tracking_number = "TRK" + trackingCounter++;
            status = "yetToTransit";
            delivery_date = DateTime.MinValue;
        }

        // Setter methods
        public void SetCourierId(int courier_id)
        {
            this.courier_id = courier_id;
        }

        public void SetSenderName(string sender_name)
        {
            this.sender_name = sender_name;
        }

        public void SetSenderAddress(string sender_address)
        {
            this.sender_address = sender_address;
        }

        public void SetReceiverName(string receiver_name)
        {
            this.receiver_name = receiver_name;
        }

        public void SetReceiverAddress(string receiver_address)
        {
            this.receiver_address = receiver_address;
        }

        public void SetCourierWeight(decimal courier_weight)
        {
            this.courier_weight = courier_weight;
        }

        public void SetStatus(string status)
        {
            this.status = status;
        }

        public void SetTrackingNumber(string tracking_number)
        {
            this.tracking_number = tracking_number;
        }

        public void SetDeliveryDate(DateTime delivery_date)
        {
            this.delivery_date = delivery_date;
        }

        // Getter methods
        public int GetCourierId()
        {
            return courier_id;
        }

        public string GetSenderName()
        {
            return sender_name;
        }

        public string GetSenderAddress()
        {
            return sender_address;
        }

        public string GetReceiverName()
        {
            return receiver_name;
        }

        public string GetReceiverAddress()
        {
            return receiver_address;
        }

        public decimal GetCourierWeight()
        {
            return courier_weight;
        }

        public string GetStatus()
        {
            return status;
        }

        public string GetTrackingNumber()
        {
            return tracking_number;
        }

        public DateTime GetDeliveryDate()
        {
            return delivery_date;
        }

        // ToString override
        public override string ToString()
        {
            return "Courier ID: " + courier_id + "\n" +
                   "Sender Name: " + sender_name + "\n" +
                   "Sender Address: " + sender_address + "\n" +
                   "Receiver Name: " + receiver_name + "\n" +
                   "Receiver Address: " + receiver_address + "\n" +
                   "Weight: " + courier_weight + " kg\n" +
                   "Status: " + status + "\n" +
                   "Tracking Number: " + tracking_number + "\n" +
                   "Delivery Date: " + delivery_date.ToShortDateString();
        }
    }
}
