using SatayimSana.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SatayimSana.Entities.Concrete
{
    public partial class User : IEntity
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public string Surname { get; set; } = null!;
        public string Email { get; set; } = null!;

        public string IdentificationNumber { get; set; } = null!;

        public string Phone { get; set; } = null!;

        public string Password { get; set; } = null!;

        public int StatusId { get; set; }

        public virtual ICollection<Product> Products { get; set; } = new List<Product>();

        public virtual Situation Status { get; set; } = null!;
    }
}
