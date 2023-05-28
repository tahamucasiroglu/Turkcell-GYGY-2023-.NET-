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
    public class ParentManager : BusinessVirtualBase<Parent>,IParentService
    {
        IParentDal _parentDal;
        public ParentManager(IParentDal parentDal) : base(parentDal)
        {
            _parentDal = _parentDal;
        }
        public IDataResult<List<Parent>> GetByGender(int GenderId)
        {
            try
            {
                return new SuccessDataResult<List<Parent>>(_parentDal.GetAll(p => p.GenderId == GenderId), "Veli getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Parent>>("Veli getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Parent>>> GetByGenderAsync(int GenderId)
        {
            try
            {
                return new SuccessDataResult<List<Parent>>(await _parentDal.GetAllAsync(p => p.GenderId == GenderId), "Veli getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Parent>>("Veli getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<Parent> GetById(int Id)
        {
            try
            {
                return new SuccessDataResult<Parent>(_parentDal.Get(p => p.Id == Id), "Veli getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Parent>("Veli getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<Parent>> GetByIdAsync(int Id)
        {
            try
            {
                return new SuccessDataResult<Parent>(await _parentDal.GetAsync(p => p.Id == Id), "Veli getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Parent>("Veli getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Parent>> GetByName(string Name)
        {
            try
            {
                return new SuccessDataResult<List<Parent>>(_parentDal.GetAll(p => p.Name == Name), "Veli getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Parent>>("Veli getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Parent>>> GetByNameAsync(string Name)
        {
            try
            {
                return new SuccessDataResult<List<Parent>>(await _parentDal.GetAllAsync(p => p.Name == Name), "Veli getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Parent>>("Veli getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Parent>> GetBySurname(string Surname)
        {
            try
            {
                return new SuccessDataResult<List<Parent>>(_parentDal.GetAll(p => p.Surname == Surname), "Veli getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Parent>>("Veli getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Parent>>> GetBySurnameAsync(string Surname)
        {
            try
            {
                return new SuccessDataResult<List<Parent>>(await _parentDal.GetAllAsync(p => p.Surname == Surname), "Veli getirme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Parent>>("Veli getirme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }
    }
}
