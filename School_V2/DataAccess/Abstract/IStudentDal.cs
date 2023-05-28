using Entities.Concrete;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Abstract
{
    public interface IStudentDal : IEntityRepository<Student>
    {
        public List<StudentDetailDto> GetStudentDetails(int StudentId);
        public Task<List<StudentDetailDto>> GetStudentDetailsAsync(int StudentId);
    }
}
