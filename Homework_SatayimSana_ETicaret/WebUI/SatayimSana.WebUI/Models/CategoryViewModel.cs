using SatayimSana.Entities.Concrete;

namespace SatayimSana.WebUI.Models
{
    public class CategoryViewModel
    {
        public MainCategory MainCategory { get; set; } = new MainCategory();
        public List<SubCategory> SubCategories { get; set; } = new List<SubCategory>();
    }
}
