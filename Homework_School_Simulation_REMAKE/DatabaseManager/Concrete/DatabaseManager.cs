using Homework_School_Simulation_REMAKE.Database;
using Homework_School_Simulation_REMAKE.DatabaseManager.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.DatabaseManager.Concrete
{
    internal class DatabaseManager : IDatabaseManager
    {
        public int GetId() => StaticDatabase.IdCounter++;

        public string GetRandomBoyName() => StaticDatabase.BoyNames[new Random().Next(StaticDatabase.BoyNames.Count)];

        public string GetRandomGirlName() => StaticDatabase.GirlNames[new Random().Next(StaticDatabase.GirlNames.Count)];

        public string GetRandomSurname() => StaticDatabase.Surnames[new Random().Next(StaticDatabase.Surnames.Count)];
    }
}
