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
    public class ProductFeatureService : IProductFeatureService
    {
        private readonly IProductFeatureRepository repository;
        private readonly IMapper mapper;
        public ProductFeatureService(IProductFeatureRepository repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }
        public IList<ProductFeature> GetAll() =>
            repository.GetAll();

        public async Task<IList<ProductFeature>> GetAllAsync() => 
            await repository.GetAllAsync();

        public IList<ProductFeature> GetProductFeaturesByFeatureId(int id) =>
            repository.GetAll(p => p.FeatureId == id);

        public async Task<IList<ProductFeature>> GetProductFeaturesByFeatureIdAsync(int id) => 
            await repository.GetAllAsync(p => p.FeatureId == id);

        public IList<ProductFeature> GetProductFeaturesByProductId(int id) =>
            repository.GetAll(p => p.ProductId == id);

        public async Task<IList<ProductFeature>> GetProductFeaturesByProductIdAsync(int id) =>
            await repository.GetAllAsync(p => p.ProductId == id);

        public IList<int> GetProductFeaturesIdByFeatureId(int id) =>
            repository.GetAll(p => p.FeatureId == id).Select(p => p.Id).ToList();
        public async Task<IList<int>> GetProductFeaturesIdByFeatureIdAsync(int id) =>
            (await repository.GetAllAsync(p => p.FeatureId == id)).Select(p => p.Id).ToList();

        public IList<int> GetProductFeaturesIdByProductId(int id) =>
            repository.GetAll(p => p.ProductId == id).Select(p => p.Id).ToList();

        public async Task<IList<int>> GetProductFeaturesIdByProductIdAsync(int id) =>
            (await repository.GetAllAsync(p => p.ProductId == id)).Select(p => p.Id).ToList();
    }
}
