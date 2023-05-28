using Entities.Concrete;
using Entities.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Results.Abstract;

namespace Business.Abstract
{
    public interface IStudentService : IService<Student>
    {
        public IDataResult<List<Student>> GetByGender(int GenderId);
        public Task<IDataResult<List<Student>>> GetByGenderAsync(int GenderId);
        public IDataResult<List<Student>> GetByName(string Name);
        public Task<IDataResult<List<Student>>> GetByNameAsync(string Name);
        public IDataResult<List<Student>> GetBySurname(string Surname);
        public Task<IDataResult<List<Student>>> GetBySurnameAsync(string Surname);
        public IDataResult<List<Student>> GetByAgeBiggerThan(int Age);
        public Task<IDataResult<List<Student>>> GetByAgeBiggerThanAsync(int Age);
        public IDataResult<List<Student>> GetByAgeLessThan(int Age);
        public Task<IDataResult<List<Student>>> GetByAgeLessThanAsync(int Age);
        public IDataResult<List<StudentDetailDto>> GetStudentDetail(int StudentId);
        public Task<IDataResult<List<StudentDetailDto>>> GetStudentDetailAsync(int StudentId);
    }
}
