using SatayimSana.Entities.Concrete;
using SatayimSana.Services.Abstract.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Services.Abstract
{
    public interface ICategoryFeatureItemService : IService<CategoryFeatureItem>
    {
        public IList<CategoryFeatureItem> GetCategoryFeatureItemsByCategoryFeatureId(int id);
        public Task<IList<CategoryFeatureItem>> GetCategoryFeatureItemsByCategoryFeatureIdAsync(int id);
        public IList<CategoryFeatureItem> GetCategoryFeatureItemsBySubCategoryId(int id);
        public Task<IList<CategoryFeatureItem>> GetCategoryFeatureItemsBySubCategoryIdAsync(int id);
        public IList<CategoryFeatureItem> GetCategoryFeatureItemsByMainCategoryId(int id);
        public Task<IList<CategoryFeatureItem>> GetCategoryFeatureItemsByMainCategoryIdAsync(int id);
        public CategoryFeatureItem Get(int id);
        public Task<CategoryFeatureItem> GetAsync(int id);
    }
}
