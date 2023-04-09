using Homework_School_Simulation.GenderFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.HumanFolder
{
    internal interface IHuman
    {
        public bool Is(IHuman NewHuman);
        public int GetId();
        public void SetName(string NewName);
        public void SetSurname(string NewSurame);
        public void SetGender(IGender NewGender);
        public IGender GetGender();
        public string GetGenderName();
        public string GetName();
        public string GetSurname();
    }
}
