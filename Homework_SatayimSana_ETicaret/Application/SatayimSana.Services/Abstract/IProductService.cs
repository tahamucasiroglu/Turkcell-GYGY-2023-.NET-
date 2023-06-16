using SatayimSana.Entities.Abstract;
using SatayimSana.Entities.Concrete;
using SatayimSana.Infrastructure.DTOs.Response;
using SatayimSana.Services.Abstract.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Services.Abstract
{
    public interface IProductService : IService<Product>
    {
        public Product Get(int id);
        public Task<Product> GetAsync(int id);
        public IList<ProductList> GetProductsBySubCategoryId(int id);
        public Task<IList<ProductList>> GetProductsBySubCategoryIdAsync(int id);
        public IList<ProductList> GetProductsByMainCategoryId(int id);
        public Task<IList<ProductList>> GetProductsByMainCategoryIdAsync(int id);
        public IList<ProductList> GetProductsByUserId(int id);
        public Task<IList<ProductList>> GetProductsByUserIdAsync(int id);
        public IList<ProductList> GetProductsByPriceEqualOrBiggerThan(double price);
        public Task<IList<ProductList>> GetProductsByPriceEqualOrBiggerThanAsync(double price);
        public IList<ProductList> GetProductsByPriceEqualOrLessThan(double price);
        public Task<IList<ProductList>> GetProductsByPriceEqualOrLessThanAsync(double price);
        public IList<ProductList> GetAllProductList();
        public Task<IList<ProductList>> GetAllProductListAsync();
        public int GetProductCount(Expression<Func<Product, bool>> filter = null);
        public Task<int> GetProductCountAsync(Expression<Func<Product, bool>> filter = null);
        public IList<ProductList> GetProductsByRange(int start, int end, bool reserve = false, Expression<Func<Product, bool>> filter = null);
        public Task<IList<ProductList>> GetProductsByRangeAsync(int start, int end, bool reserve = false, Expression<Func<Product, bool>> filter = null);
    }
}
