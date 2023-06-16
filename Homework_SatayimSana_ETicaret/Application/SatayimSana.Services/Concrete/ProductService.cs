using AutoMapper;
using SatayimSana.Entities.Concrete;
using SatayimSana.Infrastructure.DTOs.Response;
using SatayimSana.Infrastructure.Extensions;
using SatayimSana.Infrastructure.Repositories.Abstract;
using SatayimSana.Services.Abstract;
using SatayimSana.Services.Abstract.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Services.Concrete
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository productRepository;
        private readonly IMapper mapper;
        public ProductService(IProductRepository productRepository, IMapper mapper)
        {
            this.productRepository = productRepository;
            this.mapper = mapper;
        }

        public Product Get(int id) =>
            productRepository.Get(p => p.Id == id);

        public IList<Product> GetAll()
        {
            return productRepository.GetAll();
        }

        public async Task<IList<Product>> GetAllAsync()
        {
            return await productRepository.GetAllAsync();
        }

        public IList<ProductList> GetAllProductList()
        {
            return productRepository.GetAll().ConvertToProductList(mapper).ToList();
        }

        public async Task<IList<ProductList>> GetAllProductListAsync()
        {
            return (await productRepository.GetAllAsync()).ConvertToProductList(mapper).ToList();
        }

        public async Task<Product> GetAsync(int id) =>
            await productRepository.GetAsync(p => p.Id == id);

        public int GetProductCount(Expression<Func<Product, bool>> filter = null) => productRepository.Count(filter);

        public async Task<int> GetProductCountAsync(Expression<Func<Product, bool>> filter = null) => await productRepository.CountAsync(filter);

        public IList<ProductList> GetProductsByMainCategoryId(int id)
        {
            return productRepository.GetAll(p => p.SubCategory.MainCategoryId == id).ConvertToProductList(mapper).ToList();
        }

        public async Task<IList<ProductList>> GetProductsByMainCategoryIdAsync(int id)
        {
            return (await productRepository.GetAllAsync(p => p.SubCategory.MainCategoryId == id)).ConvertToProductList(mapper).ToList();
        }

        public IList<ProductList> GetProductsByPriceEqualOrBiggerThan(double price)
        {
            return productRepository.GetAll(p => p.Price >= price).ConvertToProductList(mapper).ToList();
        }

        public async Task<IList<ProductList>> GetProductsByPriceEqualOrBiggerThanAsync(double price)
        {
            return (await productRepository.GetAllAsync(p => p.Price >= price)).ConvertToProductList(mapper).ToList();
        }

        public IList<ProductList> GetProductsByPriceEqualOrLessThan(double price)
        {
            return productRepository.GetAll(p => p.Price <= price).ConvertToProductList(mapper).ToList();
        }

        public async Task<IList<ProductList>> GetProductsByPriceEqualOrLessThanAsync(double price)
        {
            return (await productRepository.GetAllAsync(p => p.Price <= price)).ConvertToProductList(mapper).ToList();
        }

        public IList<ProductList> GetProductsByRange(int start, int end, bool reserve = false, Expression<Func<Product, bool>> filter = null) =>
            productRepository.GetAllByRange(start, end, reserve, filter).ConvertToProductList(mapper).ToList();

        public async Task<IList<ProductList>> GetProductsByRangeAsync(int start, int end, bool reserve = false, Expression<Func<Product, bool>> filter = null) =>
            (await productRepository.GetAllByRangeAsync(start, end, reserve, filter)).ConvertToProductList(mapper).ToList();

        public IList<ProductList> GetProductsBySubCategoryId(int id)
        {
            return productRepository.GetAll(p => p.SubCategoryId == id).ConvertToProductList(mapper).ToList();
        }

        public async Task<IList<ProductList>> GetProductsBySubCategoryIdAsync(int id)
        {
            return (await productRepository.GetAllAsync(p => p.SubCategoryId == id)).ConvertToProductList(mapper).ToList();
        }

        public IList<ProductList> GetProductsByUserId(int id)
        {
            return productRepository.GetAll(p => p.UserId == id).ConvertToProductList(mapper).ToList();
        }

        public async Task<IList<ProductList>> GetProductsByUserIdAsync(int id)
        {
            return (await productRepository.GetAllAsync(p => p.UserId == id)).ConvertToProductList(mapper).ToList();
        }

    }
}
