using SatayimSana.Entities.Concrete;
using SatayimSana.Services.Abstract.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Services.Abstract
{
    public interface ISituationService : IService<Situation>
    {
        public int? GetSituationIdByName(string name);
        public Task<int?> GetSituationIdByNameAsync(string name);
        public Situation GetById(int id);
        public Task<Situation> GetByIdAsync(int id);
    }
}
