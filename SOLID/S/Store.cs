using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace S
{
    static internal class ProductList
    {
        static internal List<Product> Products = new List<Product>();
    }
    internal class Store // bu arakdaş bir depo bu yüzden depoya gelen ve giden üründen sorumlu   kendime not: ürün girerken bir ek özellik istense ama çıkarken olmasa bu gibi şeylerde tek bir şeyde sorumlu olmuyor gibi araştır
    {
        public void AddProduct(Product product)
        {
            if(ProductList.Products.Any(x => x.getId() == product.getId()))
            {
                int index = ProductList.Products.FindIndex(x => x.getId() == product.getId());
                Product Temp = ProductList.Products[index];
                Temp.AddUnitStock(product.getUnitStock());
                ProductList.Products[index] = Temp;
            }
            else 
            {
                ProductList.Products.Add(product); 
            }
        }

        public void SubtractProduct(Product product) 
        {
            if (ProductList.Products.Any(x => x.getId() == product.getId()))
            {
                int index = ProductList.Products.FindIndex(x => x.getId() == product.getId());
                Product Temp = ProductList.Products[index];
                int profit = product.getUnitStock() * ( product.getPrice() - Temp.getPrice());// burası wallet içinde olabilir mi?
                Temp.SubtrackUnitStock(product.getUnitStock());
                ProductList.Products[index] = Temp;
                Wallet.AddBalance(profit);
            }
        }

        public List<Product> GetProductsList() => ProductList.Products;
        public int GetProductCount() => ProductList.Products.Count;


    }
}
