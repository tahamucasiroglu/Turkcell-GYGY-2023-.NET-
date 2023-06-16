using SatayimSana.Entities.Concrete;
using SatayimSana.Services.Abstract.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Services.Abstract
{
    public interface IMainCategoryService : IService<MainCategory>
    {
        public MainCategory? GetMainCategoryByName(string name);
        public Task<MainCategory?> GetMainCategoryByNameAsync(string name);
        public MainCategory GetById(int id);
        public Task<MainCategory> GetByIdAsync(int id);
    }
}
