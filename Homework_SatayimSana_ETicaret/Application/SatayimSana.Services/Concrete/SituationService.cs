using AutoMapper;
using SatayimSana.Entities.Concrete;
using SatayimSana.Infrastructure.Repositories.Abstract;
using SatayimSana.Services.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Services.Concrete
{
    public class SituationService : ISituationService
    {
        private readonly ISituationRepository repository;
        private readonly IMapper mapper;
        public SituationService(ISituationRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }
        public IList<Situation> GetAll() => 
            repository.GetAll();

        public async Task<IList<Situation>> GetAllAsync() =>
            await repository.GetAllAsync();

        public int? GetSituationIdByName(string name) =>
            repository.Get(s => s.Name == name)?.Id;

        public async Task<int?> GetSituationIdByNameAsync(string name) =>
            (await repository.GetAsync(s => s.Name == name))?.Id;
        public Situation GetById(int id) => repository.Get(s => s.Id == id);
        public async Task<Situation> GetByIdAsync(int id) => await repository.GetAsync(s => s.Id == id);





    }
}
