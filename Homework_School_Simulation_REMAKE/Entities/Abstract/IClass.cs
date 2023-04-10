using Homework_School_Simulation_REMAKE.Entities.Core.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Entities.Abstract
{
    internal interface IClass : IEntity
    {
        public List<IStudent> GetStudents();
        public void SetStudents(List<IStudent> students);
        public ITeacher GetTeacher();
        public void SetTeacher(ITeacher teacher);
    }
}
