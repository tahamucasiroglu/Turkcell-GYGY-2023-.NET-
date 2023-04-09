using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.VirtualDatabase
{
    static internal class StaticCounts
    {
        static private int humanCount = 0;
        static private int equalCount = 0;
        static private int languageCount = 0;
        static private int mathCount = 0;
        static private int classCount = 0;
        static private int homeworkCount = 0;

        static public int HumanCount { get { return humanCount++; } }
        static public int ClassCount { get { return classCount++; } }
        static public int HomeworkCount { get { return homeworkCount++; } }

    }
}
