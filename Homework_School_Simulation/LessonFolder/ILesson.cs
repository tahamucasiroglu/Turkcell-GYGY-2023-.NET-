using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.LessonFolder
{
    internal interface ILesson
    {
        public string GetLesson();
        public bool Is(ILesson NewLesson);
    }
}
