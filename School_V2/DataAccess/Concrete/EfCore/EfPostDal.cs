using DataAccess.Abstract;
using DataAccess.Base;
using Entities.Concrete;
using Entities.Contexts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete.EfCore
{
    public class EfPostDal : EfEntityRepositoryBase<Post, EfSchoolContext>, IPostDal
    {
    }
}
