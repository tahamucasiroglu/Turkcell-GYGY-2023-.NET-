using Microsoft.EntityFrameworkCore;
using SatayimSana.Entities.Concrete;
using SatayimSana.Infrastructure.Contexts;
using SatayimSana.Infrastructure.Repositories.Abstract;
using SatayimSana.Infrastructure.Repositories.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Infrastructure.Repositories.Concrete
{
    public class EFCategoryFeatureItemRepository : EfEntityRepositoryBase<CategoryFeatureItem, SatayimSanaDbContext>, ICategoryFeatureItemRepository
    {
        public EFCategoryFeatureItemRepository(SatayimSanaDbContext context) : base(context) { }
    }
}
