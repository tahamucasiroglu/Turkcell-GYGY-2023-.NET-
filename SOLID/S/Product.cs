using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace S
{
    internal class Product
    {
        private int Id;
        private string Name;
        private int Price;
        private int UnitStock;

        public Product(int Id, string Name, int Price, int UnitStock)
        {
            this.Id = Id;
            this.Name = Name;
            this.Price = Price;
            this.UnitStock = UnitStock;
        }

        public int getId() => Id;
        public string getName() => Name;
        public int getPrice() => Price;
        public int getUnitStock() => UnitStock;
        public void AddUnitStock(int newStock) => UnitStock += newStock;
        public void SubtrackUnitStock(int newStock) => UnitStock -= newStock;
        public string getProductInfo() => $"Product Id = {Id} | Name = {Name} | Price = {Price} | UnitStock = {UnitStock}";
    }
}
