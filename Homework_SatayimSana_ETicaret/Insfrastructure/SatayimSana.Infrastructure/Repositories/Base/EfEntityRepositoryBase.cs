using Microsoft.EntityFrameworkCore;
using SatayimSana.Entities.Abstract;
using SatayimSana.Infrastructure.Repositories.Abstract.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Infrastructure.Repositories.Base
{
    public class EfEntityRepositoryBase<TEntity, TContext> : IRepository<TEntity>
        where TEntity : class, IEntity, new()
        where TContext : DbContext, new()
    {
        internal readonly TContext context;
        public EfEntityRepositoryBase(TContext context)
        {
            this.context = context;
        }
        public void Add(TEntity entity)
        {
            context.Add(entity);
            context.SaveChanges();
        }
        public async Task AddAsync(TEntity entity)
        {

            await context.AddAsync(entity);
            await context.SaveChangesAsync();
        }

        public void AddMultiple(List<TEntity> entity)
        {
            context.AddRange(entity);
            context.SaveChanges();
        }

        public async Task AddMultipleAsync(List<TEntity> entity)
        {
            await context.AddRangeAsync(entity);
            await context.SaveChangesAsync();
        }

        public int Count(Expression<Func<TEntity, bool>> filter = null)
        {
            return filter == null ? context.Set<TEntity>().Count() : context.Set<TEntity>().Where(filter).Count();
        }

        public async Task<int> CountAsync(Expression<Func<TEntity, bool>> filter = null)
        {
            return filter == null ? await context.Set<TEntity>().CountAsync() : await context.Set<TEntity>().Where(filter).CountAsync();
        }

        public void Delete(TEntity entity)
        {
            context.Remove(entity);
            context.SaveChanges();
        }

        public async Task DeleteAsync(TEntity entity)
        {
            context.Remove(entity);
            await context.SaveChangesAsync();
        }

        public void DeleteMultiple(List<TEntity> entity)
        {
            context.RemoveRange(entity);
            context.SaveChanges();
        }

        public async Task DeleteMultipleAsync(List<TEntity> entity)
        {
            context.RemoveRange(entity);
            await context.SaveChangesAsync();
        }

        public TEntity? Get(Expression<Func<TEntity, bool>> filter)
        {
            return context.Set<TEntity>().AsNoTracking().FirstOrDefault(filter);
        }

        public IList<TEntity> GetAll(Expression<Func<TEntity, bool>> filter = null)
        {
            return filter == null
                ? context.Set<TEntity>().AsNoTracking().ToList()
                : context.Set<TEntity>().AsNoTracking().Where(filter).ToList();
        }

        public async Task<IList<TEntity>> GetAllAsync(Expression<Func<TEntity, bool>> filter = null)
        {
            return filter == null
                ? await context.Set<TEntity>().AsNoTracking().ToListAsync()
                : await context.Set<TEntity>().AsNoTracking().Where(filter).ToListAsync();
        }

        public IList<TEntity> GetAllByRange(int start, int end, bool reserve = false, Expression<Func<TEntity, bool>> filter = null)
        {
            IList<TEntity> res;
            if (reserve)
            {
                res = filter == null ? 
                    context.Set<TEntity>().AsNoTracking().AsEnumerable().Take(^end..^start).ToList() :
                    context.Set<TEntity>().AsNoTracking().Where(filter).AsEnumerable().Take(^end..^start).ToList();
                res = res.Reverse().ToList();
                return res;
            }
            else
            {
                return filter == null ?
                    context.Set<TEntity>().AsNoTracking().AsEnumerable().Take(start..end).ToList() :
                    context.Set<TEntity>().AsNoTracking().Where(filter).AsEnumerable().Take(start..end).ToList();
            }
        }

        public async Task<IList<TEntity>> GetAllByRangeAsync(int start, int end, bool reserve = false, Expression<Func<TEntity, bool>> filter = null)
        {//async lı fonksiyon yok :D
            IList<TEntity> res;
            if (reserve)
            {
                res = filter == null ?
                    context.Set<TEntity>().AsNoTracking().AsEnumerable().Take(^end..^start).ToList() :
                    context.Set<TEntity>().AsNoTracking().Where(filter).AsEnumerable().Take(^end..^start).ToList();
                res = res.Reverse().ToList();
                return res;
            }
            else
            {
                return filter == null ?
                    context.Set<TEntity>().AsNoTracking().AsEnumerable().Take(start..end).ToList() :
                    context.Set<TEntity>().AsNoTracking().Where(filter).AsEnumerable().Take(start..end).ToList();
            }
        }

        public async Task<TEntity?> GetAsync(Expression<Func<TEntity, bool>> filter)
        {
            return await context.Set<TEntity>().AsNoTracking().FirstOrDefaultAsync(filter);
        }

        public void Update(TEntity entity)
        {
            context.Update(entity);
            context.SaveChanges();
        }

        public async Task UpdateAsync(TEntity entity)
        {
            context.Update(entity);
            await context.SaveChangesAsync();
        }

        public void UpdateMultiple(List<TEntity> entity)
        {
            context.UpdateRange(entity);
            context.SaveChanges();
        }

        public async Task UpdateMultipleAsync(List<TEntity> entity)
        {
            context.UpdateRange(entity);
            await context.SaveChangesAsync();
        }
    }
}
