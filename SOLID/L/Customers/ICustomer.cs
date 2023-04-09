using L.Reservation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace L.Customers
{
    internal interface ICustomer
    {
        public string GetName();
        public string GetSurname();
        public string GetEmail();
        public string GetPhoneNumber();
        public bool CanReserve(IReservation reservation);
    }
}
