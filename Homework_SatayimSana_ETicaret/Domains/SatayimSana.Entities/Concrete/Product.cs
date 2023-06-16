using SatayimSana.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Entities.Concrete
{
    public partial class Product : IEntity
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public string Describtions { get; set; } = null!;

        public double Price { get; set; }
        public string ImageURl { get; set; } = null!;
        public int SubCategoryId { get; set; }

        public int UserId { get; set; }

        public virtual ICollection<ProductFeature> ProductFeatures { get; set; } = new List<ProductFeature>();

        public virtual SubCategory SubCategory { get; set; } = null!;

        public virtual User User { get; set; } = null!;
    }
}
