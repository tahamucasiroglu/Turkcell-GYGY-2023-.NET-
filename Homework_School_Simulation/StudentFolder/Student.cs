using Homework_School_Simulation.Extensions;
using Homework_School_Simulation.GenderFolder;
using Homework_School_Simulation.HomeworkFolder;
using Homework_School_Simulation.HumanFolder;
using Homework_School_Simulation.SectionFolder;
using Homework_School_Simulation.VirtualDatabase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.StudentFolder
{
    internal class Student : Human, IStudent
    {
        private ISection StudentSection { get; set; }
        private IHomework StudentHomework { get; set; }
        public Student(string name, string surname, IGender gender, ISection section) : base(StaticCounts.HumanCount,name,surname,gender)
        {
            StudentHomework = new HomeWork();
            StudentSection = section;
        }
        public string GetSection() => StudentSection.GetSection();
        public void SetSection(ISection NewSection) => StudentSection = NewSection;
        public void SetHomework(IHomework NewHomework) => StudentHomework = NewHomework;
        public void SetHomework(string NewHomework) => StudentHomework.SetHomework(NewHomework);
        public IHomework GetHomework() => StudentHomework;
    }
}
