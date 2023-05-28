using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Results.Abstract;

namespace Business.Abstract
{
    public interface IParentService : IService<Parent>
    {
        public IDataResult<List<Parent>> GetByGender(int GenderId);
        public Task<IDataResult<List<Parent>>> GetByGenderAsync(int GenderId);
        public IDataResult<List<Parent>> GetByName(string Name);
        public Task<IDataResult<List<Parent>>> GetByNameAsync(string Name);
        public IDataResult<List<Parent>> GetBySurname(string Surname);
        public Task<IDataResult<List<Parent>>> GetBySurnameAsync(string Surname);
    }
}
