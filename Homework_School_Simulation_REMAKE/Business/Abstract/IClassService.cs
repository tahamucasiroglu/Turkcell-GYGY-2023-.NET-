using Homework_School_Simulation_REMAKE.Entities.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Business.Abstract
{
    internal interface IClassService
    {
        public List<IStudent> GetStudents();
        public IClass GetClass();
        public void AddStudent(IStudent student);
        public void RemoveStudent(IStudent student);
        public void RemoveStudent(int index);
        public void ChangeTeacher(ITeacher teacher);

        //extesions
        public List<IStudent> GetStudentsHasHomework();
        public List<IStudent> GetStudentsHasNotHomework();
        public IStudent? GetById(int Id);
        public List<IStudent> GetByName(string Name);
        public List<IStudent> GetBySurname(string Surname);
    }
}
