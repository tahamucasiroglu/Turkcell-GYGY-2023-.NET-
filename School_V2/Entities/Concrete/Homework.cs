using Entities.Abstract;
using System;
using System.Collections.Generic;

namespace Entities.Concrete;

public partial class Homework : IEntity
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public string Text { get; set; } = null!;

    public int PostId { get; set; }

    public DateTime Date { get; set; }

    public int StudentId { get; set; }
    public int? Grade { get; set; }

    public virtual Post Post { get; set; } = null!;

    public virtual Student Student { get; set; } = null!;
}
