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
    public interface IClassService : IService<Class>
    {
        public IDataResult<List<Class>> GetAllSizeBiggerThan(int size);
        public Task<IDataResult<List<Class>>> GetAllSizeBiggerThanAsync(int size);
        public IDataResult<List<Class>> GetAllSizeLessThan(int size);
        public Task<IDataResult<List<Class>>> GetAllSizeLessThanAsync(int size);
        public IDataResult<List<Class>> GetAllByNumber(int number);
        public Task<IDataResult<List<Class>>> GetAllByNumberAsync(int number);
        public IDataResult<List<Class>> GetAllByGenderTeacher(Gender gender);
        public Task<IDataResult<List<Class>>> GetAllByGenderTeacherAsync(Gender gender);
        public IDataResult<List<Class>> GetAllBySection(Section section);
        public Task<IDataResult<List<Class>>> GetAllBySectionAsync(Section section);
        public IDataResult<List<ClassDetailDto>> GetDetail(int ClassId);
        public Task<IDataResult<List<ClassDetailDto>>> GetDetailAsync(int ClassId);
    }
}
