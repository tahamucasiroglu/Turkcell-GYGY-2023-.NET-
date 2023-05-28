using Entities.Abstract;
using System;
using System.Collections.Generic;

namespace Entities.Concrete;

public partial class Teacher : IEntity
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Surname { get; set; } = null!;

    public int GenderId { get; set; }

    public DateTime Birthdate { get; set; }

    public string Email { get; set; } = null!;

    public string Address { get; set; } = null!;

    public virtual ICollection<Class> Classes { get; set; } = new List<Class>();

    public virtual Gender Gender { get; set; } = null!;

    public virtual ICollection<Post> Posts { get; set; } = new List<Post>();
}
