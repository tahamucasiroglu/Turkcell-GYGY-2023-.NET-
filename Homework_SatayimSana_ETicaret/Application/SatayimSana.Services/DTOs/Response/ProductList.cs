using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Infrastructure.DTOs.Response
{
    public class ProductList
    {
        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public double Price { get; set; }
        public string ImageURl { get; set; } = null!;
        public override string ToString()
        {
            return $"Ad = {Name}  Price = {Price}";
        }
    }
}
