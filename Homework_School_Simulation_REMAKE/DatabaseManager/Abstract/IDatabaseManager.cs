﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.DatabaseManager.Abstract
{
    internal interface IDatabaseManager
    {
        public int GetId();
        public string GetRandomGirlName();
        public string GetRandomBoyName();
        public string GetRandomSurname();
    }
}
