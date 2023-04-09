using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.SectionFolder
{
    internal class Section : ISection
    {
        private string HumanSection { get; set; }
        public Section(string section) 
        {
            HumanSection = section;
        }
        public string GetSection() => HumanSection;

        public bool Is(ISection NewSection) => NewSection.GetSection() == HumanSection;
    }
}
