using Entities.Concrete;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Results.Abstract;

namespace DataAccess.Abstract
{
    public interface IClassDal : IEntityRepository<Class>
    {
        public List<ClassDetailDto> GetClassDetail(int ClassId);
        public Task<List<ClassDetailDto>> GetClassDetailAsync(int ClassId);
    }
}
