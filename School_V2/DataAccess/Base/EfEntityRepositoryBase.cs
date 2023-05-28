using DataAccess.Abstract;
using Entities.Abstract;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Base
{
    public class EfEntityRepositoryBase<TEntity, TContext> : IEntityRepository<TEntity>
        where TEntity : class, IEntity, new()
        where TContext : DbContext, new()
    {
        public void Add(TEntity entity)
        {
            using (TContext context = new TContext())
            {
                context.Add(entity);
                //var addEntity = context.Entry(entity);
                //addEntity.State = EntityState.Added;
                context.SaveChanges();
            }
        }
        //public async Task AddAsync(TEntity entity) mantıken async fonsiyonda async olmayan methodlar kullanırsam içerisinde sürekli await kullanmaktan kurtarırım ama tek zeki ben değilimdir genel yöntemden devam bu örnek dursun
        //{
        //    using (TContext context = new TContext())
        //    {
        //        context.Add(entity);
        //        context.SaveChanges();

        //    }
        //}
        public async Task AddAsync(TEntity entity)
        {

            using (TContext context = new TContext())
            {
                await context.AddAsync(entity);
                await context.SaveChangesAsync();
                
            }
        }

        public void AddMultiple(List<TEntity> entity)
        {
            using (TContext context = new TContext())
            {
                context.AddRange(entity);
                context.SaveChanges();
            }
        }

        public async Task AddMultipleAsync(List<TEntity> entity)
        {
            using (TContext context = new TContext())
            {
                await context.AddRangeAsync(entity);
                await context.SaveChangesAsync();
            }
        }

        public void Delete(TEntity entity)
        {
            using (TContext context = new TContext())
            {
                context.Remove(entity);
                context.SaveChanges();
            }
        }

        public async Task DeleteAsync(TEntity entity)
        {
            using (TContext context = new TContext())
            {
                context.Remove(entity);
                await context.SaveChangesAsync();
            }
        }

        public void DeleteMultiple(List<TEntity> entity)
        {
            using (TContext context = new TContext())
            {
                context.RemoveRange(entity);
                context.SaveChanges();
            }
        }

        public async Task DeleteMultipleAsync(List<TEntity> entity)
        {
            using (TContext context = new TContext())
            {
                context.RemoveRange(entity);
                await context.SaveChangesAsync();
            }
        }

        public TEntity Get(Expression<Func<TEntity, bool>> filter)
        {
            using (TContext context = new TContext())
            {
                return context.Set<TEntity>().AsNoTracking().SingleOrDefault(filter);
            }
        }

        public List<TEntity> GetAll(Expression<Func<TEntity, bool>> filter = null)
        {
            using (TContext context = new TContext())
            {
                return filter == null
                    ? context.Set<TEntity>().AsNoTracking().ToList()
                    : context.Set<TEntity>().AsNoTracking().Where(filter).ToList();
            }
        }

        public async Task<List<TEntity>> GetAllAsync(Expression<Func<TEntity, bool>> filter = null)
        {
            using (TContext context = new TContext())
            {
                return await Task.Run(() =>
                {
                    return filter == null
                        ? context.Set<TEntity>().AsNoTracking().ToList()
                        : context.Set<TEntity>().AsNoTracking().Where(filter).ToList();
                });
            }
        }

        public async Task<TEntity> GetAsync(Expression<Func<TEntity, bool>> filter)
        {
            using (TContext context = new TContext())
            {
                return await context.Set<TEntity>().AsNoTracking().SingleOrDefaultAsync(filter);
            }
        }

        public void Update(TEntity entity)
        {
            using (TContext context = new TContext())
            {
                context.Update(entity);
                //var updatedEntity = context.Entry(entity);
                //updatedEntity.State = EntityState.Modified;
                context.SaveChanges();
            }
        }

        public async Task UpdateAsync(TEntity entity)
        {
            using (TContext context = new TContext())
            {
                context.Update(entity);
                await context.SaveChangesAsync();
            }
        }

        public void UpdateMultiple(List<TEntity> entity)
        {
            using (TContext context = new TContext())
            {
                context.UpdateRange(entity);
                context.SaveChanges();
            }
        }

        public async Task UpdateMultipleAsync(List<TEntity> entity)
        {
            using (TContext context = new TContext())
            {
                context.UpdateRange(entity);
                await context.SaveChangesAsync();
            }
        }
    }
}
