﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Utils.Abstract
{
    internal interface IHomework
    {
        public string GetTitle();
        public string GetText();
        public bool IsEmpty();
    }
}
