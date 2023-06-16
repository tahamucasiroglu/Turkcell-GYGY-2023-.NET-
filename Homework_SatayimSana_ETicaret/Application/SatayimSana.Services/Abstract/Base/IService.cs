using SatayimSana.Infrastructure.DTOs.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Services.Abstract.Base
{
    public interface IService<T>
    {
        public IList<T> GetAll();
        public Task<IList<T>> GetAllAsync();
    }
}
