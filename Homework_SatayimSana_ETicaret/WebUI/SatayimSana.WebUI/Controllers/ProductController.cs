using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SatayimSana.Infrastructure.DTOs.Response;
using SatayimSana.Services.Abstract;
using SatayimSana.WebUI.Models;
using System.Data;

namespace SatayimSana.WebUI.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProductService productService;
        private readonly IProductFeatureService productFeatureService;
        private readonly ICategoryFeatureItemService categoryFeatureItemService;
        private readonly ICategoryFeatureService categoryFeatureService;
        private readonly IMainCategoryService mainCategoryService;
        private readonly ISubCategoryService subCategoryService;
        public ProductController(
            IProductService productService, 
            IProductFeatureService productFeatureService,
            ICategoryFeatureItemService categoryFeatureItemService,
            ICategoryFeatureService categoryFeatureService,
            IMainCategoryService mainCategoryService,
            ISubCategoryService subCategoryService
            )
        {
            this.productService = productService;
            this.productFeatureService = productFeatureService;
            this.categoryFeatureService = categoryFeatureService;
            this.categoryFeatureItemService = categoryFeatureItemService;
            this.mainCategoryService = mainCategoryService;
            this.subCategoryService = subCategoryService;
        }
        public IActionResult Index(int id)
        {
            Console.WriteLine("sayfa id si = " + id.ToString());
            ProductPageModel model = new ProductPageModel();
            model.product = productService.Get(id);
            model.productFeatures = productFeatureService.GetProductFeaturesByProductId(id).ToList();
            foreach ( var feature in model.productFeatures )
            {
                model.categoryFeatureItems.Add(categoryFeatureItemService.Get(feature.FeatureId));
            }
            model.SubCategory = subCategoryService.Get(model.product.SubCategoryId);
            model.mainCategory = mainCategoryService.GetById(model.SubCategory.MainCategoryId);
            return View(model);
        }

        public IActionResult MainCategoryPage(int id, int page)
        {
            var productPerPage = 20; // şu değerleri generic yapmaya üşendim
            var productCount = productService.GetProductCount(p => p.SubCategory.MainCategoryId == id);

            var pagingInfo = new PagingInfo
            {
                CurrentPage = page,
                ItemsPerPage = productPerPage,
                TotalItems = productCount
            };

            var start = (pagingInfo.CurrentPage - 1) * pagingInfo.ItemsPerPage;
            var end = start + pagingInfo.ItemsPerPage;
            if (end > pagingInfo.TotalItems) { end = pagingInfo.TotalItems; }

            var paginatedProducts = productService.GetProductsByRange(start, end, true, p => p.SubCategory.MainCategoryId == id);
            // niye bu inat dersek direk db den filtreli çekersek daha az sistem yorulur diye
            var model = (new PaginationProductViewModel
            {
                Products = paginatedProducts,
                PagingInfo = pagingInfo
            }, id);
            
            return View(model);
        }

        public IActionResult SubCategoryPage(int id, int page)
        {
            var productPerPage = 20; 
            var productCount = productService.GetProductCount(p => p.SubCategoryId == id);

            var pagingInfo = new PagingInfo
            {
                CurrentPage = page,
                ItemsPerPage = productPerPage,
                TotalItems = productCount
            };

            var start = (pagingInfo.CurrentPage - 1) * pagingInfo.ItemsPerPage;
            var end = start + pagingInfo.ItemsPerPage;
            if (end > pagingInfo.TotalItems) { end = pagingInfo.TotalItems; }

            var paginatedProducts = productService.GetProductsByRange(start, end, true, p => p.SubCategoryId == id);
            var model = (new PaginationProductViewModel
            {
                Products = paginatedProducts,
                PagingInfo = pagingInfo
            }, id);

            return View(model);
        }

        [Authorize(Roles = "Admin,Satici")]
        public IActionResult AddProductPage()
        {
            return View();
        }

        [Authorize(Roles = "Admin,Satici")]
        [HttpPost]
        public IActionResult AddProductPage(AddProductPageModel productPageModel)
        {
            return View();
        }

    }
}
