using Homework_School_Simulation_REMAKE.DatabaseManager.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Core.Concrete;
using Homework_School_Simulation_REMAKE.Utils.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Entities.Concrete
{
    internal class Class : Entity, IClass
    {
        private List<IStudent> students;
        private ITeacher teacher;
        public Class(ITeacher teacher, List<IStudent>? students, IDatabaseManager databaseManager) : base(databaseManager) 
        {
            this.teacher = teacher;
            this.students = students ?? new List<IStudent>();
        }
        public List<IStudent> GetStudents() => students;

        public ITeacher GetTeacher() => teacher;

        public void SetStudents(List<IStudent> students) => this.students = students; 

        public void SetTeacher(ITeacher teacher) => this.teacher = teacher;
        public override string ToString()
        {
            string text = "";
            text += "Sınıf " + Id.ToString() + "\n";
            text += "Öğretmen = " + teacher.ToString() + "\n";
            text += "Öğrenciler:\n";
            foreach (IStudent student in students)
            {
                text += student.ToString();
            }
            return text;
        }
    }
}
