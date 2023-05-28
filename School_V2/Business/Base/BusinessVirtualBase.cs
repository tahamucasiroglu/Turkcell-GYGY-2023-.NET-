using Business.Abstract;
using DataAccess.Abstract;
using DataAccess.Concrete.EfCore;
using Entities.Abstract;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Extensions;
using Utilities.Results.Abstract;
using Utilities.Results.Concrete;

namespace Business.Base
{
    public class BusinessVirtualBase<T> : IServiceForVirtualBase<T> where T : class, IEntity, new()
    {
        IEntityRepository<T> _entityRepository;
        public BusinessVirtualBase(IEntityRepository<T> entityRepository)
        {
            _entityRepository = entityRepository;
        }

        public IResult Add(T entity)
        {
            Console.WriteLine("virtual base");
            try
            {
                _entityRepository.Add(entity);
                return new SuccessResult($"{new T().GetClassName()} Başarıyla Eklendi");
            }
            catch (Exception e)
            {
                return new ErrorResult($"{new T().GetClassName()} Eklemede Hata Var.\nHata Mesajı:\n" + e.Message);
            }
        }

        public async Task<IResult> AddAsync(T entity)
        {
            try
            {
                await _entityRepository.AddAsync(entity);
                return new SuccessResult($"{new T().GetClassName()} Başarıyla asenkron Eklendi");
            }
            catch (Exception e)
            {
                return new ErrorResult($"{new T().GetClassName()} asenkron Eklemede Hata Var.\nHata Mesajı:\n" + e.Message);
            }
        }

        public IResult AddMultiple(List<T> entity)
        {
            try
            {
                _entityRepository.AddMultiple(entity);
                return new SuccessResult($"{new T().GetClassName()} çoklu olarak Başarıyla Eklendi");
            }
            catch (Exception e)
            {
                return new ErrorResult($"{new T().GetClassName()} çoklu Eklemede Hata Var.\nHata Mesajı:\n" + e.Message);
            }
        }

        public async Task<IResult> AddMultipleAsync(List<T> entity)
        {
            try
            {
                await _entityRepository.AddMultipleAsync(entity);
                return new SuccessResult($"{new T().GetClassName()} çoklu ve asenkton olarak Başarıyla Eklendi");
            }
            catch (Exception e)
            {
                return new ErrorResult($"{new T().GetClassName()} çoklu ve asenkron Eklemede Hata Var.\nHata Mesajı:\n" + e.Message);
            }
        }

        public IResult Delete(T entity)
        {
            try
            {
                _entityRepository.Delete(entity);
                return new SuccessResult($"{new T().GetClassName()} Başarıyla silindi");
            }
            catch (Exception e)
            {
                return new ErrorResult($"{new T().GetClassName()} silmede Hata Var.\nHata Mesajı:\n" + e.Message);
            }
        }

        public async Task<IResult> DeleteAsync(T entity)
        {
            try
            {
                await _entityRepository.DeleteAsync(entity);
                return new SuccessResult($"{new T().GetClassName()} asenkron Başarıyla silindi");
            }
            catch (Exception e)
            {
                return new ErrorResult($"{new T().GetClassName()} asenkron silmede Hata Var.\nHata Mesajı:\n" + e.Message);
            }
        }

        public IResult DeleteMultiple(List<T> entity)
        {
            try
            {
                _entityRepository.DeleteMultiple(entity);
                return new SuccessResult($"{new T().GetClassName()} çoklu Başarıyla silindi");
            }
            catch (Exception e)
            {
                return new ErrorResult($"{new T().GetClassName()} çoklu silmede Hata Var.\nHata Mesajı:\n" + e.Message);
            }
        }

        public async Task<IResult> DeleteMultipleAsync(List<T> entity)
        {
            try
            {
                await _entityRepository.DeleteMultipleAsync(entity);
                return new SuccessResult($"{new T().GetClassName()} çoklu asenkron Başarıyla silindi");
            }
            catch (Exception e)
            {
                return new ErrorResult($"{new T().GetClassName()} çoklu asenkron silmede Hata Var.\nHata Mesajı:\n" + e.Message);
            }
        }

        public IDataResult<List<T>> GetAll()
        {
            try
            {
                return new SuccessDataResult<List<T>>(_entityRepository.GetAll(), $"{new T().GetClassName()} Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<List<T>>($"{new T().GetClassName()} Getirmede Hata Var");
            }
        }

        public async Task<IDataResult<List<T>>> GetAllAsync()
        {
            try
            {
                return new SuccessDataResult<List<T>>(await _entityRepository.GetAllAsync(), $"{new T().GetClassName()} Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<List<T>>($"{new T().GetClassName()} Getirmede Hata Var");
            }
        }

        public IResult Update(T entity)
        {
            try
            {
                _entityRepository.Update(entity);
                return new SuccessResult($"{new T().GetClassName()} Başarıyla güncellendşi");
            }
            catch (Exception e)
            {
                return new ErrorResult($"{new T().GetClassName()} güncellendşi Hata Var.\nHata Mesajı:\n" + e.Message);
            }
        }

        public async Task<IResult> UpdateAsync(T entity)
        {
            try
            {
                await _entityRepository.UpdateAsync(entity);
                return new SuccessResult($"{new T().GetClassName()} Başarıyla güncellendşi");
            }
            catch (Exception e)
            {
                return new ErrorResult($"{new T().GetClassName()} güncellendşi Hata Var.\nHata Mesajı:\n" + e.Message);
            }
        }

        public IResult UpdateMultiple(List<T> entity)
        {
            try
            {
                _entityRepository.UpdateMultiple(entity);
                return new SuccessResult($"{new T().GetClassName()} Başarıyla güncellendşi");
            }
            catch (Exception e)
            {
                return new ErrorResult($"{new T().GetClassName()} güncellendşi Hata Var.\nHata Mesajı:\n" + e.Message);
            }
        }

        public async Task<IResult> UpdateMultipleAsync(List<T> entity)
        {
            try
            {
                await _entityRepository.UpdateMultipleAsync(entity);
                return new SuccessResult($"{new T().GetClassName()} Başarıyla güncellendşi");
            }
            catch (Exception e)
            {
                return new ErrorResult($"{new T().GetClassName()} güncellendşi Hata Var.\nHata Mesajı:\n" + e.Message);
            }
        }
    }
}
