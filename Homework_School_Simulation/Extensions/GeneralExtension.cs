using Homework_School_Simulation.HumanFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.Extensions
{
    static internal class GeneralExtension
    {
        public static bool IsDefault<T>(this T value)
        {
            return value == null || value.Equals(default(T));
        }
    }
}
