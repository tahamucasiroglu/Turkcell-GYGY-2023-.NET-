using Business.Abstract;
using Business.Base;
using DataAccess.Abstract;
using DataAccess.Concrete.EfCore;
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
    public class TeacherManager : BusinessVirtualBase<Teacher>, ITeacherService
    {
        ITeacherDal _teacherDal;
        public TeacherManager(ITeacherDal teacherDal) : base(teacherDal)
        {
            _teacherDal = teacherDal;
        }

        public IDataResult<List<Teacher>> GetByAgeBiggerThan(int Age)
        {
            try
            {
                return new SuccessDataResult<List<Teacher>>(_teacherDal.GetAll(t => DateTime.Now.Year - t.Birthdate.Year >= Age), "Öğretmen getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Teacher>>("Öğretmen getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Teacher>>> GetByAgeBiggerThanAsync(int Age)
        {
            try
            {
                return new SuccessDataResult<List<Teacher>>(await _teacherDal.GetAllAsync(t => DateTime.Now.Year - t.Birthdate.Year >= Age), "Öğretmen getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Teacher>>("Öğretmen getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Teacher>> GetByAgeLessThan(int Age)
        {
            try
            {
                return new SuccessDataResult<List<Teacher>>(_teacherDal.GetAll(t => DateTime.Now.Year - t.Birthdate.Year <= Age), "Öğretmen getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Teacher>>("Öğretmen getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Teacher>>> GetByAgeLessThanAsync(int Age)
        {
            try
            {
                return new SuccessDataResult<List<Teacher>>(await _teacherDal.GetAllAsync(t => DateTime.Now.Year - t.Birthdate.Year <= Age), "Öğretmen getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Teacher>>("Öğretmen getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Teacher>> GetByGender(int GenderId)
        {
            try
            {
                return new SuccessDataResult<List<Teacher>>(_teacherDal.GetAll(t => t.GenderId == GenderId), "Öğretmen getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Teacher>>("Öğretmen getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Teacher>>> GetByGenderAsync(int GenderId)
        {
            try
            {
                return new SuccessDataResult<List<Teacher>>(await _teacherDal.GetAllAsync(t => t.GenderId == GenderId), "Öğretmen getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Teacher>>("Öğretmen getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<Teacher> GetById(int Id)
        {
            try
            {
                return new SuccessDataResult<Teacher>(_teacherDal.Get(t => t.Id == Id), "Öğretmen getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Teacher>("Öğretmen getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<Teacher>> GetByIdAsync(int Id)
        {
            try
            {
                return new SuccessDataResult<Teacher>(await _teacherDal.GetAsync(t => t.Id == Id), "Öğretmen getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Teacher>("Öğretmen getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Teacher>> GetByName(string Name)
        {
            try
            {
                return new SuccessDataResult<List<Teacher>>(_teacherDal.GetAll(t => t.Name.Contains(Name)), "Öğretmen getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Teacher>>("Öğretmen getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Teacher>>> GetByNameAsync(string Name)
        {
            try
            {
                return new SuccessDataResult<List<Teacher>>(await _teacherDal.GetAllAsync(t => t.Name.Contains(Name)), "Öğretmen getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Teacher>>("Öğretmen getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Teacher>> GetBySurname(string Surname)
        {
            try
            {
                return new SuccessDataResult<List<Teacher>>(_teacherDal.GetAll(t => t.Surname.Contains(Surname)), "Öğretmen getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Teacher>>("Öğretmen getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Teacher>>> GetBySurnameAsync(string Surname)
        {
            try
            {
                return new SuccessDataResult<List<Teacher>>(await _teacherDal.GetAllAsync(t => t.Surname.Contains(Surname)), "Öğretmen getirme işlemi başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Teacher>>("Öğretmen getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }
    }
}

