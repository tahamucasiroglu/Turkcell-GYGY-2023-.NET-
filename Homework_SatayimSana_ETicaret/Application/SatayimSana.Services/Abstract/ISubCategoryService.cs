using SatayimSana.Entities.Concrete;
using SatayimSana.Services.Abstract.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Services.Abstract
{
    public interface ISubCategoryService : IService<SubCategory>
    {
        public IList<SubCategory> GetSubCategoriesByMainCategoryId(int id);
        public Task<IList<SubCategory>> GetSubCategoiesyByMainCategoryIdAsync(int id);
        public SubCategory Get(int id);
        public Task<SubCategory> GetAsync(int id);
    }
}
