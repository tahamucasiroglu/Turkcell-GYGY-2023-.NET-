using DataAccess.Abstract;
using DataAccess.Base;
using Entities.Concrete;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete.Dapper
{
    public class DapperClassDal : DapperEntityRepositoryBase<Class>, IClassDal
    {
        public List<ClassDetailDto> GetClassDetail(int ClassId)
        {
            throw new NotImplementedException();
        }

        public Task<List<ClassDetailDto>> GetClassDetailAsync(int ClassId)
        {
            throw new NotImplementedException();
        }
    }
}
