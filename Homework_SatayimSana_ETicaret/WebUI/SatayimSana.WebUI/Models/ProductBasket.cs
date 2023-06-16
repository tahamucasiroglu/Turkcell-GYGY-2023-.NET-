using SatayimSana.Infrastructure.DTOs.Response;

namespace SatayimSana.WebUI.Models
{
    public class ProductBasket
    {
        private List<ProductList> products { get; set; } = new List<ProductList>();
        public void Clear() => products.Clear();
        public List<ProductList> Get() => products;
        public void Add(ProductList product) => products.Add(product);
        public double TotalPrice() => products.Sum(p => p.Price);
        public int Count() => products.Count();
    }
}
