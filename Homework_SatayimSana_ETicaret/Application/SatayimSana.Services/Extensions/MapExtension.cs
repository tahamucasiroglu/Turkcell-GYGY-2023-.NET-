using AutoMapper;
using SatayimSana.Entities.Concrete;
using SatayimSana.Infrastructure.DTOs.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Infrastructure.Extensions
{
    static public class MapExtension
    {
        public static IEnumerable<ProductList> ConvertToProductList(this IEnumerable<Product> products, IMapper mapper)
        {
            return mapper.Map<IEnumerable<ProductList>>(products);
        }
    }
}
