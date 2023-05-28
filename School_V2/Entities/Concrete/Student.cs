using Entities.Abstract;
using System;
using System.Collections.Generic;

namespace Entities.Concrete;

public partial class Student : IEntity
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Surname { get; set; } = null!;

    public int GenderId { get; set; }

    public DateTime Bırthdate { get; set; }

    public string Email { get; set; } = null!;

    public string Address { get; set; } = null!;

    public int ClassId { get; set; }

    public int ParentId { get; set; }

    public virtual Gender Gender { get; set; } = null!;

    public virtual ICollection<Homework> Homeworks { get; set; } = new List<Homework>();

    public virtual Parent Parent { get; set; } = null!;
}
