using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using SatayimSana.Infrastructure.DTOs.Response;
using SatayimSana.WebUI.Models;
using System.Text.Json;

namespace SatayimSana.WebUI.Controllers
{
    public class BasketController : Controller
    {

        public BasketController()
        {
            
        }

        public IActionResult Index()
        {
            ProductBasket productBasket = getProductBasketFromSession();
            return View(productBasket);
        }

        public IActionResult AddProduct(ProductList productList)
        {
            saveToSession(productList);
            return Json(new { message = $"{productList.Name} Sepete eklendi" });
        }

        public IActionResult ClearAll()
        {
            getProductBasketFromSession().Clear();
            return Index();
        }

        private ProductBasket getProductBasketFromSession()
        {
            return JsonSerializer.Deserialize<ProductBasket>(HttpContext.Session.GetString("basket")) ?? new ProductBasket();
        }
        private void saveToSession(ProductList productlist)
        {
            ProductBasket productBasket = getProductBasketFromSession();
            productBasket.Add(productlist);
            HttpContext.Session.SetString("basket", JsonSerializer.Serialize(productBasket));
        }
    }
}
