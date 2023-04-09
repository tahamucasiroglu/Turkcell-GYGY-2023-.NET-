using L.Reservation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace L.Customers
{
    internal class Customer : ICustomer
    {
        private string Name { get; set; }
        private string Surname { get; set; }
        private string PhoneNumber { get; set; }
        private string Email { get; set; }
        private string Address { get; set; }
        private List<Type> AccessibilityList { get; set; }

        public Customer(string Name, string Surname, string PhoneNumber, string Email, string Address, List<Type> AccessibilityList)
        {
            this.Name = Name;
            this.Surname = Surname;
            this.PhoneNumber = PhoneNumber;
            this.Email = Email;
            this.Address = Address;
            this.AccessibilityList = AccessibilityList;
        }
        public bool CanReserve(IReservation reservation) => AccessibilityList.Contains(reservation.GetType());

        public string GetEmail() => Email;

        public string GetName() => Name;

        public string GetPhoneNumber() => PhoneNumber;

        public string GetSurname() => Surname;
    }
}
