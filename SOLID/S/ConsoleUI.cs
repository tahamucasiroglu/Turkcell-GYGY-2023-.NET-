using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Formats.Asn1.AsnWriter;

namespace S
{
    internal class ConsoleUI
    {
        public Product GetAddProductDetailsFromCustomer(int productCount)
        {

            Console.WriteLine("Product Name:");
            string Name = Console.ReadLine();
            Console.WriteLine("Product Price:");
            int Price = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Product Unit Stock:");
            int UnitStock = Convert.ToInt32(Console.ReadLine());
            return new Product(productCount + 1, Name, Price, UnitStock); // +1 altta id otomatik 0 verdiğimden yani üşengeçlikten yine :)
            
        }

        public Product GetSubtrackProductDetailsFromCustomer()
        {

            Store store = new Store();
            foreach (Product item in store.GetProductsList())
            {
                Console.WriteLine(item.getProductInfo());
            }
            Console.WriteLine("Select Your Product Id:");
            int productId = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Price:");
            int productPrice = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Unit Stock:");
            int productUnitStock = Convert.ToInt32(Console.ReadLine());
            return new Product(productId, "", productPrice, productUnitStock);
            
        }
    }
}
