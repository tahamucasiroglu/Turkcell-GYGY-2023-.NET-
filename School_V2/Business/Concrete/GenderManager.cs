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
    public class GenderManager : BusinessVirtualBase<Gender>, IGenderService
    {
        IGenderDal _genderDal;
        public GenderManager(IGenderDal genderDal) : base(genderDal)
        {
            _genderDal = genderDal;
        }

        public IDataResult<Gender> GetById(int Id)
        {
            try
            {
                return new SuccessDataResult<Gender>(_genderDal.Get(g => g.Id == Id), "Cinsiyetler Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<Gender>("Cinsiyetler Getirmede Hata Var");
            }
        }

        public async Task<IDataResult<Gender>> GetByIdAsync(int Id)
        {
            try
            {
                return new SuccessDataResult<Gender>(await _genderDal.GetAsync(g => g.Id == Id), "Cinsiyetler Başarıyla Getirildi");
            }
            catch (Exception)
            {
                return new ErrorDataResult<Gender>("Cinsiyetler Getirmede Hata Var");
            }
        }
    }
}
