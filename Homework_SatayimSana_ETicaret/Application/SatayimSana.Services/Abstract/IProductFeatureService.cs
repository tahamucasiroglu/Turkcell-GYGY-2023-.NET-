using SatayimSana.Entities.Concrete;
using SatayimSana.Services.Abstract.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Services.Abstract
{
    public interface IProductFeatureService : IService<ProductFeature>
    {
        public IList<ProductFeature> GetProductFeaturesByProductId(int id);
        public Task<IList<ProductFeature>> GetProductFeaturesByProductIdAsync(int id);
        public IList<ProductFeature> GetProductFeaturesByFeatureId(int id); // feature id verilerek o özelliğesahip ürünler gelecek plan altta önerilen ürünlerde en çok özelliği uyanları listeleyip ister misin demek
        public Task<IList<ProductFeature>> GetProductFeaturesByFeatureIdAsync(int id);
        public IList<int> GetProductFeaturesIdByProductId(int id);
        public Task<IList<int>> GetProductFeaturesIdByProductIdAsync(int id);
        public IList<int> GetProductFeaturesIdByFeatureId(int id);
        public Task<IList<int>> GetProductFeaturesIdByFeatureIdAsync(int id);
    }
}
