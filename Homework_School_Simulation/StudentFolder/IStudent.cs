using Homework_School_Simulation.GenderFolder;
using Homework_School_Simulation.HomeworkFolder;
using Homework_School_Simulation.HumanFolder;
using Homework_School_Simulation.SectionFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.StudentFolder
{
    internal interface IStudent : IHuman
    {
        public string GetSection();
        public void SetSection(ISection NewSection);
        public void SetHomework(IHomework NewHomework);
        public void SetHomework(string NewHomework);
        public IHomework GetHomework();
    }
}
