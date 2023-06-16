using AutoMapper;
using SatayimSana.Entities.Concrete;
using SatayimSana.Infrastructure.Repositories.Abstract;
using SatayimSana.Infrastructure.Repositories.Concrete;
using SatayimSana.Services.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Services.Concrete
{
    public class MainCategoryService : IMainCategoryService
    {
        private readonly IMainCategoryRepository repository;
        private readonly IMapper mapper;
        public MainCategoryService(IMainCategoryRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public IList<MainCategory> GetAll() =>
            repository.GetAll();

        public async Task<IList<MainCategory>> GetAllAsync() =>
            await repository.GetAllAsync();

        public MainCategory GetById(int id) => 
            repository.Get(c => c.Id == id);

        public async Task<MainCategory> GetByIdAsync(int id) =>
            await repository.GetAsync(c => c.Id == id);

        public MainCategory? GetMainCategoryByName(string name) =>
            repository.Get(m => m.Name == name);

        public Task<MainCategory?> GetMainCategoryByNameAsync(string name) =>
            repository.GetAsync(m => m.Name == name);
    }
}
