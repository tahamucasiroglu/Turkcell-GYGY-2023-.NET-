using Homework_School_Simulation.Extensions;
using Homework_School_Simulation.SectionFolder;
using Homework_School_Simulation.StudentFolder;
using Homework_School_Simulation.TeacherFolder;
using Homework_School_Simulation.VirtualDatabase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.SchoolClassFolder
{
    internal class SchoolClass : ISchoolClass
    {
        private int Id { get; set; }
        private ITeacher ClassTeacher { get; set; }
        private List<IStudent> ClassStudents { get; set; }
        private string ClassName { get; set; }
        private ISection ClassSection { get; set; }

        public SchoolClass(string classname, ISection section, ITeacher teacher, List<IStudent>  students)
        {
            ClassSection = section;
            ClassName = classname;
            ClassTeacher = teacher;
            ClassStudents = students;
            Id = StaticCounts.ClassCount;
        }
        public void AddStudent(IStudent NewStudent) => ClassStudents.Add(NewStudent);
        
        public void ChangeStudent(IStudent OldStudent, IStudent NewStudent) => ClassStudents.SetByItem(OldStudent, NewStudent);

        public void ChangeTeacher(ITeacher NewTeacher) => ClassTeacher = NewTeacher;

        public void DeleteStudent(IStudent student) => ClassStudents.RemoveByItem(student);

        public string GetName() => ClassName;

        public List<IStudent> GetStudents() => ClassStudents;
        public void SetStudents(List<IStudent> students) => ClassStudents = students;

        public ITeacher GetTeacher() => ClassTeacher;

        public bool Is(ISchoolClass NewSchoolClass) => NewSchoolClass.getId() == Id; //id ile yapmaya üşendim

        public void UpdateStudent(IStudent NewStudent) => ClassStudents.SetById(NewStudent.GetId(), NewStudent);

        public string GetTeacherName() => ClassTeacher.GetName();

        public List<string> GetStudentsName() => ClassStudents.GetNameList();
        public bool ThisSectionIsEqual(ISection NewSection) => ClassSection.Is(NewSection);
        public int GetStudentsCount() => ClassStudents.Count();
        public int getId() => Id;
        public ISection GetSection() => ClassSection;
    }
}
