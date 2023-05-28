using Entities.Abstract;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Utilities.Results.Abstract;

namespace Business.Abstract
{
    public interface IService<T> : IServiceForVirtualBase<T> where T : class, IEntity, new()
    {
        public IDataResult<T> GetById(int Id);
        public Task<IDataResult<T>> GetByIdAsync(int Id);
    }
    public interface IServiceForVirtualBase<T> where T : class, IEntity, new()
    {
        public IResult Add(T entity);
        public Task<IResult> AddAsync(T entity);
        public IResult AddMultiple(List<T> entity);
        public Task<IResult> AddMultipleAsync(List<T> entity);
        public IResult Delete(T entity);
        public Task<IResult> DeleteAsync(T entity);
        public IResult DeleteMultiple(List<T> entity);
        public Task<IResult> DeleteMultipleAsync(List<T> entity);
        public IResult Update(T entity);
        public Task<IResult> UpdateAsync(T entity);
        public IResult UpdateMultiple(List<T> entity);
        public Task<IResult> UpdateMultipleAsync(List<T> entity);
        public IDataResult<List<T>> GetAll();
        public Task<IDataResult<List<T>>> GetAllAsync();
    }
}
