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
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Utilities.Results.Abstract;
using Utilities.Results.Concrete;

namespace Business.Concrete
{
    public class LessonManager : BusinessVirtualBase<Lesson>, ILessonService
    {
        ILessonDal _lessonDal;
        public LessonManager(ILessonDal lessonDal) : base(lessonDal)
        {
            _lessonDal = lessonDal;
        }

        private bool CheckLessonName(Lesson entity) => !Regex.IsMatch(entity.Name, @"^[a-zA-ZçğıöşüÇĞİÖŞÜ\s]*$");
        public new IResult Add(Lesson entity)
        {
                if(CheckLessonName(entity)) 
                {
                    return new ErrorResult("Lütfen adam gibi ders ismi girin");
                }
                return base.Add(entity);
        }

        public new async Task<IResult> AddAsync(Lesson entity)
        {
            if (CheckLessonName(entity))
            {
                return new ErrorResult("Lütfen adam gibi ders ismi girin");
            }
            return await base.AddAsync(entity);
        }

        public new IResult AddMultiple(List<Lesson> entity)
        {
            foreach(var item in entity)
            {
                if (CheckLessonName(item))
                {
                    return new ErrorResult("Lütfen adam gibi ders ismi girin Hatalı ders = " + item.Name);
                }
            }
            return base.AddMultiple(entity);
        }

        public new async Task<IResult> AddMultipleAsync(List<Lesson> entity)
        {
            foreach (var item in entity)
            {
                if (CheckLessonName(item))
                {
                    return new ErrorResult("Lütfen adam gibi ders ismi girin");
                }
            }
            return await base.AddMultipleAsync(entity);
        }
        public IDataResult<Lesson> GetById(int Id)
        {
            try
            {
                return new SuccessDataResult<Lesson>(_lessonDal.Get(l => l.Id == Id), "Ders Getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Lesson>("Ders Getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<Lesson>> GetByIdAsync(int Id)
        {
            try
            {
                return new SuccessDataResult<Lesson>(await _lessonDal.GetAsync(l => l.Id == Id), "Ders Getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Lesson>("Ders Getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }
    }
}
