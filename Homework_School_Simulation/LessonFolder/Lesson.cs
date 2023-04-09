using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.LessonFolder
{
    internal class Lesson : ILesson
    {
        private string TeacherLesson { get; set; }
        public Lesson(string lesson) 
        {
            TeacherLesson = lesson;
        }

        public string GetLesson() => TeacherLesson;

        public bool Is(ILesson NewLesson) => NewLesson.GetLesson() == TeacherLesson;
    }
}
