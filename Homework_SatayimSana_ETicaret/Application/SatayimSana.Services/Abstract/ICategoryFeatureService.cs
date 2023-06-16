using SatayimSana.Entities.Concrete;
using SatayimSana.Services.Abstract.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Services.Abstract
{
    public interface ICategoryFeatureService : IService<CategoryFeature>
    {
        public IList<CategoryFeature> GetCategoryFeaturesBySubCategoryId(int id);
        public Task<IList<CategoryFeature>> GetCategoryFeaturesBySubCategoryIdAsync(int id);
        public IList<CategoryFeature> GetCategoryFeaturesByMainCategoryId(int id);
        public Task<IList<CategoryFeature>> GetCategoryFeaturesByMainCategoryIdAsync(int id);
    }
}
