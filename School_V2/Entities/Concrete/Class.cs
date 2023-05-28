using Entities.Abstract;
using System;
using System.Collections.Generic;

namespace Entities.Concrete;

public partial class Class : IEntity
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public int SectionId { get; set; }

    public int TeacherId { get; set; }

    public int Size { get; set; }

    public int Number { get; set; }

    public virtual Section Section { get; set; } = null!;

    public virtual Teacher Teacher { get; set; } = null!;
}
