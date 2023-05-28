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
    public class DapperStudentDal : DapperEntityRepositoryBase<Student>, IStudentDal
    {
        public List<StudentDetailDto> GetStudentDetails(int StudentId)
        {
            throw new NotImplementedException();
        }

        public Task<List<StudentDetailDto>> GetStudentDetailsAsync(int StudentId)
        {
            throw new NotImplementedException();
        }
    }
}
