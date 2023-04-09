using Homework_School_Simulation.Extensions;
using Homework_School_Simulation.SchoolClassFolder;
using Homework_School_Simulation.SectionFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.SchoolFolder
{
    internal class School : ISchool
    {
        private string SchoolName { get; set; }
        private List<ISchoolClass> Classes { get; set; }
        public School(string schoolname, List<ISchoolClass> classes)
        {
            SchoolName = schoolname;
            Classes = classes;
        }

        public void AddClass(ISchoolClass NewSchoolClass) => Classes.Add(NewSchoolClass);
        public void SetClasses(List<ISchoolClass> classes) => Classes = classes;
        public bool DeleteClass(ISchoolClass NewSchoolClass) => Classes.RemoveByItem(NewSchoolClass);
        public bool DeleteClass(string ClassName) => Classes.RemoveByName(ClassName);
        public void DeleteClass(int ClassIndex) => Classes.RemoveAt(ClassIndex);

        public List<ISchoolClass> GetClasses() => Classes;

        public string GetName() => SchoolName;

        public List<string> GetClassesNames() => Classes.GetNameList();
        public int GetClassesCount() => Classes.Count;

    }
}
