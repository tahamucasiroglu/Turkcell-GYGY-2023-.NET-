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
    public class CategoryFeatureService : ICategoryFeatureService
    {
        private readonly ICategoryFeatureRepository categoryFeatureItemRepository;
        private readonly IMapper mapper;
        public CategoryFeatureService(ICategoryFeatureRepository categoryFeatureItemRepository, IMapper mapper)
        {
            this.categoryFeatureItemRepository = categoryFeatureItemRepository;
            this.mapper = mapper;
        }
        public IList<CategoryFeature> GetCategoryFeaturesByMainCategoryId(int id) =>
            categoryFeatureItemRepository.GetAll(c => c.SubCategory.MainCategoryId == id);

        public async Task<IList<CategoryFeature>> GetCategoryFeaturesByMainCategoryIdAsync(int id) =>
            await categoryFeatureItemRepository.GetAllAsync(c => c.SubCategory.MainCategoryId == id);

        public IList<CategoryFeature> GetCategoryFeaturesBySubCategoryId(int id) =>
            categoryFeatureItemRepository.GetAll(c => c.SubCategoryId == id);

        public async Task<IList<CategoryFeature>> GetCategoryFeaturesBySubCategoryIdAsync(int id) =>
            await categoryFeatureItemRepository.GetAllAsync(c => c.SubCategoryId == id);
        public IList<CategoryFeature> GetAll() => 
            categoryFeatureItemRepository.GetAll();

        public async Task<IList<CategoryFeature>> GetAllAsync() =>
            await categoryFeatureItemRepository.GetAllAsync();
    }
}
