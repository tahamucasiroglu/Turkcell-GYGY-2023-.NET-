using SatayimSana.Entities.Concrete;

namespace SatayimSana.WebUI.Models
{
    public class ProductPageModel
    {
        public Product product { get; set; }
        public List<ProductFeature> productFeatures { get; set; } = new List<ProductFeature>();
        public List<CategoryFeatureItem> categoryFeatureItems { get; set; } = new List<CategoryFeatureItem>();
        public List<CategoryFeature> categoryFeature { get; set; } = new List<CategoryFeature>();
        public SubCategory SubCategory { get; set; }
        public MainCategory mainCategory { get; set; }
    }
}
