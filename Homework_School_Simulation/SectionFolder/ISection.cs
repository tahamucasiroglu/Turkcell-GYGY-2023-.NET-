using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.SectionFolder
{
    internal interface ISection
    {
        public string GetSection();
        public bool Is(ISection NewSection);
    }
}
