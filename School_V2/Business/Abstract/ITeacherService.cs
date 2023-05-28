using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Results.Abstract;

namespace Business.Abstract
{
    public interface ITeacherService : IService<Teacher>
    {
        public IDataResult<List<Teacher>> GetByGender(int GenderId);
        public Task<IDataResult<List<Teacher>>> GetByGenderAsync(int GenderId);
        public IDataResult<List<Teacher>> GetByName(string Name);
        public Task<IDataResult<List<Teacher>>> GetByNameAsync(string Name);
        public IDataResult<List<Teacher>> GetBySurname(string Surname);
        public Task<IDataResult<List<Teacher>>> GetBySurnameAsync(string Surname);
        public IDataResult<List<Teacher>> GetByAgeBiggerThan(int Age);
        public Task<IDataResult<List<Teacher>>> GetByAgeBiggerThanAsync(int Age);
        public IDataResult<List<Teacher>> GetByAgeLessThan(int Age);
        public Task<IDataResult<List<Teacher>>> GetByAgeLessThanAsync(int Age);
    }
}
