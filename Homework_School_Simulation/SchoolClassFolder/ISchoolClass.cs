using Homework_School_Simulation.HumanFolder;
using Homework_School_Simulation.SectionFolder;
using Homework_School_Simulation.StudentFolder;
using Homework_School_Simulation.TeacherFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.SchoolClassFolder
{
    internal interface ISchoolClass
    {
        public string GetName();
        public ITeacher GetTeacher();
        public string GetTeacherName();
        public List<IStudent> GetStudents();
        public List<string> GetStudentsName();
        public bool Is(ISchoolClass NewSchoolClass);
        public void ChangeTeacher(ITeacher NewTeacher);
        public void ChangeStudent(IStudent OldStudent, IStudent NewStudent);
        public void AddStudent(IStudent NewStudent);
        public void DeleteStudent(IStudent NewStudent);
        public void UpdateStudent(IStudent NewStudent);
        public bool ThisSectionIsEqual(ISection NewSection); 
        public int GetStudentsCount();
        public int getId();
        public void SetStudents(List<IStudent> students);
        public ISection GetSection();

    }
}
