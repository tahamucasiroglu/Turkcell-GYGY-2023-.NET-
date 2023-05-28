using Business.Abstract;
using Business.Base;
using DataAccess.Abstract;
using DataAccess.Concrete.EfCore;
using Entities.Abstract;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Results.Abstract;
using Utilities.Results.Concrete;

namespace Business.Concrete
{
    public class HomeworkManager : BusinessVirtualBase<Homework>,IHomeworkService
    {
        IHomeworkDal _homeworkDal;
        public HomeworkManager(IHomeworkDal homeworkDal) : base(homeworkDal)
        {
            _homeworkDal = homeworkDal;
        }

        public new IResult Add(Homework entity)
        {
            if (entity.Text.Length <= 50)
            {
                return new ErrorResult("Açıklama Kısa En az 50 Uzunluk lazım böyle ödev mi olur kısacık");
            }
            else
            {
                return base.Add(entity);
            }
        }

        public async new Task<IResult> AddAsync(Homework entity)
        {
            if (entity.Text.Length <= 50)
            {
                return new ErrorResult("Açıklama Kısa En az 50 Uzunluk lazım böyle ödev mi olur kısacık");
            }
            else
            {
                return await base.AddAsync(entity);
            }
        }

        public new IResult AddMultiple(List<Homework> entity)
        {
            foreach (var item in entity)
            {
                if (item.Text.Length <= 50)
                {
                    return new ErrorResult("Açıklama Kısa En az 50 Uzunluk lazım böyle ödev mi olur kısacık");
                }
            }
            return base.AddMultiple(entity);
        }

        public async new Task<IResult> AddMultipleAsync(List<Homework> entity)
        {
            foreach (var item in entity)
            {
                if (item.Text.Length <= 50)
                {
                    return new ErrorResult("Açıklama Kısa En az 50 Uzunluk lazım böyle ödev mi olur kısacık");
                }
            }
            return await base.AddMultipleAsync(entity);
        }
        public IDataResult<Homework> GetById(int Id)
        {
            try
            {
                return new SuccessDataResult<Homework>(_homeworkDal.Get(h => h.Id == Id), "Ödev Getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Homework>("Ödevi id ye göre getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<Homework>> GetByIdAsync(int Id)
        {
            try
            {
                return new SuccessDataResult<Homework>(await _homeworkDal.GetAsync(h => h.Id == Id), "Ödev Getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Homework>("Ödevi id ye göre getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Homework>> GetByLast1Day()
        {
            try
            {
                return new SuccessDataResult<List<Homework>>(_homeworkDal.GetAll(h => h.Date <= DateTime.Now && h.Date >= DateTime.Now.AddDays(-1) ), "Ödev Getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Homework>>("son 1 gün Ödev Getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Homework>>> GetByLast1DayAsync()
        {
            try
            {
                return new SuccessDataResult<List<Homework>>(await _homeworkDal.GetAllAsync(h => h.Date <= DateTime.Now && h.Date >= DateTime.Now.AddDays(-1)), "Ödev Getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Homework>>("son 1 gün Ödev Getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Homework>> GetByLast1Month()
        {
            try
            {
                return new SuccessDataResult<List<Homework>>(_homeworkDal.GetAll(h => h.Date <= DateTime.Now && h.Date >= DateTime.Now.AddMonths(-1)), "Ödev Getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Homework>>("son 1 ay Ödev Getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Homework>>> GetByLast1MonthAsync()
        {
            try
            {
                return new SuccessDataResult<List<Homework>>(await _homeworkDal.GetAllAsync(h => h.Date <= DateTime.Now && h.Date >= DateTime.Now.AddMonths(-1)), "Ödev Getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Homework>>("son 1 ay Ödev Getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Homework>> GetByLast1Week()
        {
            try
            {
                return new SuccessDataResult<List<Homework>>(_homeworkDal.GetAll(h => h.Date <= DateTime.Now && h.Date >= DateTime.Now.AddDays(-7)), "Ödev Getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Homework>>("son 1 hafta Ödev Getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Homework>>> GetByLast1WeekAsync()
        {
            try
            {
                return new SuccessDataResult<List<Homework>>(await _homeworkDal.GetAllAsync(h => h.Date <= DateTime.Now && h.Date >= DateTime.Now.AddDays(-7)), "Ödev Getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Homework>>("son 1 hafta Ödev Getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Homework>> GetByPostingId(int Id)
        {
            try
            {
                return new SuccessDataResult<List<Homework>>(_homeworkDal.GetAll(h => h.PostId == Id), "Ödev Getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Homework>>("Ödevi post a göre getirme Getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Homework>>> GetByPostingIdAsync(int Id)
        {
            try
            {
                return new SuccessDataResult<List<Homework>>(await _homeworkDal.GetAllAsync(h => h.PostId == Id), "Ödev Getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Homework>>("Ödevi post a göre getirme Getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }
    }
}
