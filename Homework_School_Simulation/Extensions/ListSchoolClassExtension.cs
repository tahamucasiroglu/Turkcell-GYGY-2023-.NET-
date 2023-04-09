using Homework_School_Simulation.HumanFolder;
using Homework_School_Simulation.SchoolClassFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.Extensions
{
    static internal class ListSchoolClassExtension
    {
        static public bool RemoveByName<T>(this List<T> value, string name) where T : ISchoolClass => value.RemoveAll(p => p.GetName() == name) > 0;
        static public bool RemoveByItem<T>(this List<T> value, ISchoolClass cls) where T : ISchoolClass => value.RemoveAll(p => p.Is(cls)) > 0;
        static public List<string> GetNameList<T>(this List<T> value) where T : ISchoolClass => value.Select(p => p.GetName()).ToList();
    }
}
