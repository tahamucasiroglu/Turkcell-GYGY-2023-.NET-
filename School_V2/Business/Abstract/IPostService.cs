using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Results.Abstract;

namespace Business.Abstract
{
    public interface IPostService : IService<Post>
    {
        public IDataResult<List<Post>> GetBySectionId(int sectionId);
        public Task<IDataResult<List<Post>>> GetBySectionIdAsync(int sectionId);
        public IDataResult<List<Post>> GetByTeacherId(int sectionId);
        public Task<IDataResult<List<Post>>> GetByTeacherIdAsync(int sectionId);
        public IDataResult<List<Post>> GetByEnding(int sectionId);
        public Task<IDataResult<List<Post>>> GetByEndingAsync(int sectionId);
        public IDataResult<List<Post>> GetByNonEnding(int sectionId);
        public Task<IDataResult<List<Post>>> GetByNonEndingAsync(int sectionId);
    }
}
