using Homework_School_Simulation.HumanFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.TeacherFolder
{
    internal interface ITeacher : IHuman
    {
        public string GetLesson();
    }
}
