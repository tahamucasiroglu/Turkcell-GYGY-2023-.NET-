using Homework_School_Simulation.Extensions;
using Homework_School_Simulation.LessonFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.HomeworkFolder
{
    internal class HomeWork : IHomework
    {
        private string? text { get; set; }
        private ILesson? lesson { get; set; }
        public HomeWork(string? text = null, ILesson? lesson = null)
        {
            this.text = text;
            this.lesson = lesson;
        }

        public void SetHomework(string homework) => text = homework;
        public void SetHomework(IHomework homework) => text = homework.GetHomework();
        public void SetHomework(ILesson homework) => lesson = homework;
        public void SetHomeworkLesson(ILesson lesson) => this.lesson = lesson;
        public string GetHomework() => text ?? "";
        public bool IsEmpyt() => text == null;
        public ILesson? GetHomeworkLesson() => lesson;

        
    }
}
