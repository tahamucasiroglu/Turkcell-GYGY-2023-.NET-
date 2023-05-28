using Entities.Abstract;
using System;
using System.Collections.Generic;

namespace Entities.Concrete;

public partial class Parent : IEntity
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Surname { get; set; } = null!;

    public int GenderId { get; set; }

    public string Phone { get; set; } = null!;

    public virtual Gender Gender { get; set; } = null!;

    public virtual ICollection<Student> Students { get; set; } = new List<Student>();
}
