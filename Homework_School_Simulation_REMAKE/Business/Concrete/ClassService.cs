using Homework_School_Simulation_REMAKE.Business.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Business.Concrete
{
    internal class ClassService : IClassService
    {
        private IClass @class;
        public ClassService(IClass @class)
        {
            this.@class = @class;
        }

        public void AddStudent(IStudent student)
        {
            List<IStudent> students = @class.GetStudents();
            students.Add(student);
            @class.SetStudents(students);
        }

        public List<IStudent> GetStudents() => @class.GetStudents();
        public IClass GetClass() => @class;
        public void SetClass(IClass @class) => this.@class = @class;

        public void RemoveStudent(IStudent student)
        {
            List<IStudent> students = @class.GetStudents();
            //students = students.Where(x => !x.Equals(student)).ToList();
            students.RemoveAt(students.FindIndex(p => p.Equals(students)));
            @class.SetStudents(students);
        }
        public void ChangeTeacher(ITeacher teacher)
        {
            @class.SetTeacher(teacher);
        }

        public void RemoveStudent(int index)
        {
            @class.GetStudents().RemoveAt(index);
        }

        public List<IStudent> GetStudentsHasHomework() => @class.GetStudents().Where(p => !p.GetHomework().IsEmpty()).ToList();
        public List<IStudent> GetStudentsHasNotHomework() => @class.GetStudents().Where(p => p.GetHomework().IsEmpty()).ToList();
        public IStudent? GetById(int Id) => @class.GetStudents().FirstOrDefault(p => p.GetId() == Id);
        public List<IStudent> GetByName(string Name) => @class.GetStudents().Where(p => p.GetName() == Name).ToList();
        public List<IStudent> GetBySurname(string Surname) => @class.GetStudents().Where(p => p.GetSurname() == Surname).ToList();
        public override string? ToString() => @class.ToString();
    }
}
