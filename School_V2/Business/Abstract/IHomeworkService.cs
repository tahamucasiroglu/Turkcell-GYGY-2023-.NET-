using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Results.Abstract;

namespace Business.Abstract
{
    public interface IHomeworkService : IService<Homework>
    {
        public IDataResult<List<Homework>> GetByPostingId(int Id);
        public Task<IDataResult<List<Homework>>> GetByPostingIdAsync(int Id);
        public IDataResult<List<Homework>> GetByLast1Day();
        public Task<IDataResult<List<Homework>>> GetByLast1DayAsync();
        public IDataResult<List<Homework>> GetByLast1Week();
        public Task<IDataResult<List<Homework>>> GetByLast1WeekAsync();
        public IDataResult<List<Homework>> GetByLast1Month();
        public Task<IDataResult<List<Homework>>> GetByLast1MonthAsync();
    }
}
