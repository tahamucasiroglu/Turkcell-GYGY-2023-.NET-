using AutoMapper;
using SatayimSana.Entities.Concrete;
using SatayimSana.Infrastructure.DTOs.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Infrastructure.Mappings
{
    public class EntityToDtoMapProfile : Profile
    {
        public EntityToDtoMapProfile()
        {
            CreateMap<Product, ProductList>();
        }
    }
}
