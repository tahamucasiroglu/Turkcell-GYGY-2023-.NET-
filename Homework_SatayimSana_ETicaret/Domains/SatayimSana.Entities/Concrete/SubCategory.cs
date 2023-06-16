using SatayimSana.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Entities.Concrete
{
    public partial class SubCategory : IEntity
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public int MainCategoryId { get; set; }

        public virtual ICollection<CategoryFeature> CategoryFeatures { get; set; } = new List<CategoryFeature>();

        public virtual MainCategory MainCategory { get; set; } = null!;

        public virtual ICollection<Product> Products { get; set; } = new List<Product>();
    }
}
