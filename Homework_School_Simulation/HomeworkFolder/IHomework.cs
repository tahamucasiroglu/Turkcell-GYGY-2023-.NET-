using Homework_School_Simulation.LessonFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.HomeworkFolder
{
    internal interface IHomework
    {
        public string GetHomework();
        public void SetHomework(string homework);
        public void SetHomework(IHomework homework);
        public void SetHomework(ILesson homework);
        public ILesson? GetHomeworkLesson();
        public void SetHomeworkLesson(ILesson lesson);
        public bool IsEmpyt();
    }
}
