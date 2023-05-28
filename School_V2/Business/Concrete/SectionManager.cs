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
    public class SectionManager : BusinessVirtualBase<Section>, ISectionService
    {
        ISectionDal _sectionDal;
        public SectionManager(ISectionDal sectionDal) : base(sectionDal)
        {
            _sectionDal = sectionDal;
        }

        public IDataResult<Section> GetById(int Id)
        {
            try
            {
                return new SuccessDataResult<Section>(_sectionDal.Get(t => t.Id == Id), "section Ekleme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Section>("section Ekleme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<Section>> GetByIdAsync(int Id)
        {
            try
            {
                return new SuccessDataResult<Section>(await _sectionDal.GetAsync(t => t.Id == Id), "section Ekleme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Section>("section Ekleme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }
    }
}
