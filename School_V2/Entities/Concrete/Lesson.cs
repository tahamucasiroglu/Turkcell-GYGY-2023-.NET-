using Entities.Abstract;
using System;
using System.Collections.Generic;

namespace Entities.Concrete;

public partial class Lesson : IEntity
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public int SectionId { get; set; }

    public virtual Section Section { get; set; } = null!;
}
