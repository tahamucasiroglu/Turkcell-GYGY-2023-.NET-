using Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Abstract
{
    public interface IEntityRepository<T> where T : class, IEntity, new()
    {
        List<T> GetAll(Expression<Func<T, bool>> filter = null);
        Task<List<T>> GetAllAsync(Expression<Func<T, bool>> filter = null);
        T Get(Expression<Func<T, bool>> filter);
        Task<T> GetAsync(Expression<Func<T, bool>> filter);
        void Add(T entity);
        Task AddAsync(T entity);
        void AddMultiple(List<T> entity);
        Task AddMultipleAsync(List<T> entity);
        void Update(T entity);
        Task UpdateAsync(T entity);
        void UpdateMultiple(List<T> entity);
        Task UpdateMultipleAsync(List<T> entity);
        void Delete(T entity);
        Task DeleteAsync(T entity);
        void DeleteMultiple(List<T> entity);
        Task DeleteMultipleAsync(List<T> entity);
    }
}
