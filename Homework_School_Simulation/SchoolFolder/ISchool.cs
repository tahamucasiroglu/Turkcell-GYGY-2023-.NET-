using Homework_School_Simulation.HumanFolder;
using Homework_School_Simulation.SchoolClassFolder;
using Homework_School_Simulation.SectionFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.SchoolFolder
{
    internal interface ISchool 
    {
        public string GetName();
        public List<ISchoolClass> GetClasses();
        public List<string> GetClassesNames();
        public bool DeleteClass(ISchoolClass NewSchoolClass);
        public bool DeleteClass(string ClassName);
        public void DeleteClass(int ClassIndex);
        public void AddClass(ISchoolClass NewSchoolClass);
        public int GetClassesCount();
        public void SetClasses(List<ISchoolClass> classes);

    }
}
