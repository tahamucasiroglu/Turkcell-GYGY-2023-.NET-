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
    public class SubCategoryService : ISubCategoryService
    {
        private readonly ISubCategoryRepository repository;
        private readonly IMapper mapper;
        public SubCategoryService(ISubCategoryRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public SubCategory Get(int id) => 
            repository.Get(s => s.Id == id);

        public IList<SubCategory> GetAll() =>
            repository.GetAll();

        public async Task<IList<SubCategory>> GetAllAsync() =>
            await repository.GetAllAsync();

        public async Task<SubCategory> GetAsync(int id) =>
            await repository.GetAsync(s => s.Id == id);
        public async Task<IList<SubCategory>> GetSubCategoiesyByMainCategoryIdAsync(int id) =>
            await repository.GetAllAsync(c => c.MainCategoryId == id);

        public IList<SubCategory> GetSubCategoriesByMainCategoryId(int id) =>
            repository.GetAll(c => c.MainCategoryId == id);
    }
}
