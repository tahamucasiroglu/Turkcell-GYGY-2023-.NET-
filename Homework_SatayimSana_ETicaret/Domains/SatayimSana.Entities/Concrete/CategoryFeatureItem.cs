using SatayimSana.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Entities.Concrete
{
    public partial class CategoryFeatureItem : IEntity
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public int CategoryFeatureId { get; set; }

        public virtual CategoryFeature CategoryFeature { get; set; } = null!;

        public virtual ICollection<ProductFeature> ProductFeatures { get; set; } = new List<ProductFeature>();
    }
}
