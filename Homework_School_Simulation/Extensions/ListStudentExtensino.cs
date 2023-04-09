using Homework_School_Simulation.StudentFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.Extensions
{
    static internal class ListStudentExtensino
    {
        public static List<IStudent> GetHomeworkStudents(this List<IStudent> value) => value.Where(value => !value.GetHomework().IsEmpyt()).ToList();
    }
}
