using Entities.Abstract;
using System;
using System.Collections.Generic;

namespace Entities.Concrete;

public partial class Post : IEntity
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public int SectionId { get; set; }

    public int TeacherId { get; set; }

    public bool IsEnd { get; set; }

    public DateTime StartDate { get; set; }

    public DateTime EndDate { get; set; }

    public virtual ICollection<Homework> Homeworks { get; set; } = new List<Homework>();

    public virtual Section Section { get; set; } = null!;

    public virtual Teacher Teacher { get; set; } = null!;
}
