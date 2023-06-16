using SatayimSana.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Entities.Concrete
{
    public partial class ProductFeature : IEntity
    {
        public int Id { get; set; }

        public int ProductId { get; set; }

        public int FeatureId { get; set; }

        public virtual CategoryFeatureItem Feature { get; set; } = null!;

        public virtual Product Product { get; set; } = null!;
    }
}
