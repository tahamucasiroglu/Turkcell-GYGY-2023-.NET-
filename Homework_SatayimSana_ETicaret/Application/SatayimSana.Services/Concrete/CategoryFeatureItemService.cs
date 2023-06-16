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
    public class CategoryFeatureItemService : ICategoryFeatureItemService
    {
        private readonly ICategoryFeatureItemRepository categoryFeatureItemRepository;
        private readonly IMapper mapper;
        public CategoryFeatureItemService(ICategoryFeatureItemRepository categoryFeatureItemRepository, IMapper mapper)
        {
            this.categoryFeatureItemRepository = categoryFeatureItemRepository;
            this.mapper = mapper;
        }
        public CategoryFeatureItem Get(int id) =>
            categoryFeatureItemRepository.Get(c => c.Id == id);
        public async Task<CategoryFeatureItem> GetAsync(int id) =>
            await categoryFeatureItemRepository.GetAsync(c => c.Id == id);
        public IList<CategoryFeatureItem> GetAll() => categoryFeatureItemRepository.GetAll();
        public async Task<IList<CategoryFeatureItem>> GetAllAsync() => await categoryFeatureItemRepository.GetAllAsync();
        public IList<CategoryFeatureItem> GetCategoryFeatureItemsByCategoryFeatureId(int id) =>
            categoryFeatureItemRepository.GetAll(c => c.CategoryFeatureId == id);
        public async Task<IList<CategoryFeatureItem>> GetCategoryFeatureItemsByCategoryFeatureIdAsync(int id) =>
            await categoryFeatureItemRepository.GetAllAsync(c => c.CategoryFeatureId == id);
        public IList<CategoryFeatureItem> GetCategoryFeatureItemsByMainCategoryId(int id) =>
            categoryFeatureItemRepository.GetAll(c => c.CategoryFeature.SubCategory.MainCategoryId == id);
        public async Task<IList<CategoryFeatureItem>> GetCategoryFeatureItemsByMainCategoryIdAsync(int id) =>
            await categoryFeatureItemRepository.GetAllAsync(c => c.CategoryFeature.SubCategory.MainCategoryId == id);
        public IList<CategoryFeatureItem> GetCategoryFeatureItemsBySubCategoryId(int id) =>
            categoryFeatureItemRepository.GetAll(c => c.CategoryFeature.SubCategoryId == id);
        public async Task<IList<CategoryFeatureItem>> GetCategoryFeatureItemsBySubCategoryIdAsync(int id) =>
            await categoryFeatureItemRepository.GetAllAsync(c => c.CategoryFeature.SubCategoryId == id);
    }
}
