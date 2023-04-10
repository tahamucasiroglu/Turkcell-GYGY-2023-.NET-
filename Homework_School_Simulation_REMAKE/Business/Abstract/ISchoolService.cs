using Homework_School_Simulation_REMAKE.Entities.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Business.Abstract
{
    internal interface ISchoolService
    {
        public List<IClassService> GetClassesService();
        public void AddClass(IClassService @class);
        public void RemoveClass(IClass @class);
        public void RemoveClass(int index);

        //extesions
        public List<IClass> GetByEqualOrBiggerStudentCount(int Count);
        public List<IClass> GetByEqualOrSmallerStudentCount(int Count);
        public int GetTotalStudentCount();
    }
}
