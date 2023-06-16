using SatayimSana.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Entities.Concrete
{
    public partial class MainCategory : IEntity
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public virtual ICollection<SubCategory> SubCategories { get; set; } = new List<SubCategory>();
    }
}
