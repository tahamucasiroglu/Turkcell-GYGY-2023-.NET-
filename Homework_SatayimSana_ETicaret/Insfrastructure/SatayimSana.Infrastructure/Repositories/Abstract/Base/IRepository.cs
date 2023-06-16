using SatayimSana.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Infrastructure.Repositories.Abstract.Base
{
    public interface IRepository<T> where T : class, IEntity, new()
    {
        public T? Get(Expression<Func<T, bool>> filter);
        public Task<T?> GetAsync(Expression<Func<T, bool>> filter);
        public IList<T> GetAll(Expression<Func<T, bool>> filter = null);
        public Task<IList<T>> GetAllAsync(Expression<Func<T, bool>> filter = null);
        public void Add(T entity);
        public Task AddAsync(T entity);
        public void AddMultiple(List<T> entity);
        public Task AddMultipleAsync(List<T> entity);
        public void Update(T entity);
        public Task UpdateAsync(T entity);
        public void UpdateMultiple(List<T> entity);
        public Task UpdateMultipleAsync(List<T> entity);
        public void Delete(T entity);
        public Task DeleteAsync(T entity);
        public void DeleteMultiple(List<T> entity);
        public Task DeleteMultipleAsync(List<T> entity);
        public int Count(Expression<Func<T, bool>> filter = null);
        public Task<int> CountAsync(Expression<Func<T, bool>> filter = null);
        public IList<T> GetAllByRange(int start, int end, bool reserve = false, Expression<Func<T, bool>> filter = null);
        public Task<IList<T>> GetAllByRangeAsync(int start, int end, bool reserve = false, Expression<Func<T, bool>> filter = null);

    }
}
