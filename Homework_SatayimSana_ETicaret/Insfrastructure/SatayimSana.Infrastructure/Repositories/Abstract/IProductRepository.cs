using SatayimSana.Entities.Concrete;
using SatayimSana.Infrastructure.Repositories.Abstract.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Infrastructure.Repositories.Abstract
{
    public interface IProductRepository : IRepository<Product>
    {
    }
}
