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
    public class PostManager : BusinessVirtualBase<Post>, IPostService
    {
        IPostDal _postDal;
        public PostManager(IPostDal postDal) : base(postDal)
        {
            _postDal = postDal;
        }
        public IDataResult<List<Post>> GetByEnding(int sectionId)
        {
            try
            {
                return new SuccessDataResult<List<Post>>(_postDal.GetAll(p => p.IsEnd), "Post Ekleme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Post>>("Post Ekleme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Post>>> GetByEndingAsync(int sectionId)
        {
            try
            {
                return new SuccessDataResult<List<Post>>(await _postDal.GetAllAsync(p => p.IsEnd), "Post Ekleme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Post>>("Post Ekleme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<Post> GetById(int Id)
        {
            try
            {
                return new SuccessDataResult<Post>(_postDal.Get(p => p.Id == Id), "Post Ekleme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Post>("Post Ekleme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<Post>> GetByIdAsync(int Id)
        {
            try
            {
                return new SuccessDataResult<Post>(await _postDal.GetAsync(p => p.Id == Id), "Post Ekleme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<Post>("Post Ekleme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Post>> GetByNonEnding(int sectionId)
        {
            try
            {
                return new SuccessDataResult<List<Post>>(_postDal.GetAll(p => !p.IsEnd), "Post Ekleme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Post>>("Post Ekleme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Post>>> GetByNonEndingAsync(int sectionId)
        {
            try
            {
                return new SuccessDataResult<List<Post>>(await _postDal.GetAllAsync(p => !p.IsEnd), "Post Ekleme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Post>>("Post Ekleme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Post>> GetBySectionId(int sectionId)
        {
            try
            {
                return new SuccessDataResult<List<Post>>(_postDal.GetAll(p => p.SectionId == sectionId), "Post Ekleme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Post>>("Post Ekleme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Post>>> GetBySectionIdAsync(int sectionId)
        {
            try
            {
                return new SuccessDataResult<List<Post>>(await _postDal.GetAllAsync(p => p.SectionId == sectionId), "Post Ekleme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Post>>("Post Ekleme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public IDataResult<List<Post>> GetByTeacherId(int teacherId)
        {
            try
            {
                return new SuccessDataResult<List<Post>>(_postDal.GetAll(p => p.TeacherId == teacherId), "Post Ekleme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Post>>("Post Ekleme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }

        public async Task<IDataResult<List<Post>>> GetByTeacherIdAsync(int teacherId)
        {
            try
            {
                return new SuccessDataResult<List<Post>>(await _postDal.GetAllAsync(p => p.TeacherId == teacherId), "Post Ekleme İşlemi Başarılı");
            }
            catch (Exception e)
            {
                return new ErrorDataResult<List<Post>>("Post Ekleme İşlemi Başarısız Hata var Hata:\n" + e.Message);
            }
        }
    }
}
