using Homework_School_Simulation.GenderFolder;
using Homework_School_Simulation.HumanFolder;
using Homework_School_Simulation.LessonFolder;
using Homework_School_Simulation.SectionFolder;
using Homework_School_Simulation.VirtualDatabase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.TeacherFolder
{
    internal class Teacher : Human, ITeacher
    {
        private ILesson TeacherLesson { get; set; }
        public Teacher (string name, string surname, IGender gender, ILesson lesson) : base(StaticCounts.HumanCount,name, surname, gender) 
        {
            TeacherLesson = lesson;
        }
        public string GetLesson() => TeacherLesson.GetLesson();
        public void SetLesson(ILesson NewLesson) => TeacherLesson = NewLesson;
    }
}
