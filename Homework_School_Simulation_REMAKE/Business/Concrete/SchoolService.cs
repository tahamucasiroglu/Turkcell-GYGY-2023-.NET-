using Homework_School_Simulation_REMAKE.Business.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Business.Concrete
{
    internal class SchoolService : ISchoolService
    {
        private List<IClassService> classes;
        public SchoolService(List<IClassService>? classServices = null)
        {
            this.classes = classServices ?? new List<IClassService>();
        }

        public void AddClass(IClassService @class) => classes.Add(@class);
        public List<IClassService> GetClassesService() => classes;

        public List<IClass> GetClasses() => classes.Select(p => p.GetClass()).ToList();

        public void RemoveClass(IClass @class) => classes.RemoveAt(classes.FindIndex(p => p.Equals(@class)));
        public void RemoveClass(int index) => classes.RemoveAt(index);
        public List<IClass> GetByEqualOrBiggerStudentCount(int Count) => GetClasses().Where(p => p.GetStudents().Count >= Count).ToList();
        public List<IClass> GetByEqualOrSmallerStudentCount(int Count) => GetClasses().Where(p => p.GetStudents().Count <= Count).ToList();
        public int GetTotalStudentCount() => classes.Sum(p => p.GetStudents().Count);

        public override string ToString()
        {
            string text = "";
            foreach (IClassService item in classes)
            {
                text += item.ToString() + "\n";
            }
            return text;
        }
    }
}
