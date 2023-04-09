using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.GenderFolder
{
    internal interface IGender
    {
        public string GetGenderName();
        public bool Is(IGender NewGender);
        public bool IsBoy();
        public bool IsGirl();
    }
}
