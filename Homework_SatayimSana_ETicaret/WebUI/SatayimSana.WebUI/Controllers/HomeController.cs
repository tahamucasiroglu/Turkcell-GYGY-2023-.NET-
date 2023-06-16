using Microsoft.AspNetCore.Mvc;
using SatayimSana.Entities.Concrete;
using SatayimSana.Infrastructure.DTOs.Response;
using SatayimSana.Services.Abstract;
using SatayimSana.Services.Concrete;
using SatayimSana.WebUI.Models;
using System.Diagnostics;

namespace SatayimSana.WebUI.Controllers
{
    public class HomeController : Controller
    {
        private readonly IProductService productService;
        private readonly ICategoryFeatureItemService categoryFeatureItemService;
        public HomeController(IProductService productService, ICategoryFeatureItemService categoryFeatureItemService)
        {
            this.productService = productService;
            this.categoryFeatureItemService = categoryFeatureItemService;
        }

        public IActionResult Index(int? id)
        {
            var productPerPage = 20;
            var productCount = productService.GetProductCount();
            //var totalPage = Math.Ceiling((decimal)productCount / productPerPage);

            var pagingInfo = new PagingInfo
            {
                CurrentPage = id ?? 1,
                ItemsPerPage = productPerPage,
                TotalItems = productCount
            };

            var start = (pagingInfo.CurrentPage - 1) * pagingInfo.ItemsPerPage;
            var end = start + pagingInfo.ItemsPerPage;
            if(end > pagingInfo.TotalItems) { end  = pagingInfo.TotalItems; }

            var paginatedProducts = productService.GetProductsByRange(start, end, true);

            var model = new PaginationProductViewModel
            {
                Products = paginatedProducts,
                PagingInfo = pagingInfo
            };
            
            return View(model);
        }
    }
}