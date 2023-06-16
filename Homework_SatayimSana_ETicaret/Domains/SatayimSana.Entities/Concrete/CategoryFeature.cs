using SatayimSana.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Entities.Concrete
{
    public partial class CategoryFeature : IEntity
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public int SubCategoryId { get; set; }

        public virtual ICollection<CategoryFeatureItem> CategoryFeatureItems { get; set; } = new List<CategoryFeatureItem>();

        public virtual SubCategory SubCategory { get; set; } = null!;
    }
}
