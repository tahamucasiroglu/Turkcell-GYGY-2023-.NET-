using L.Reservation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace L.Customers
{
    internal class Tourist : Customer
    {
        public Tourist(string Name, string Surname, string PhoneNumber, string Email, string Address) :
            base(Name, Surname, PhoneNumber, Email, Address, new List<Type>() { typeof(Hotel), typeof(Car)}){ }

    }
}
