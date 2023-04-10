using Homework_School_Simulation_REMAKE.Utils.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Utils.Concrete
{
    internal class Gender : IGender
    {
        private bool isMan;
        public Gender(bool isMan) 
        {
            this.isMan = isMan;
        }
        public override string ToString()
        {
            return isMan ? "Erkek" : "Kız";
        }
        public override bool Equals(object? obj)
        {
            return obj?.ToString() == this.ToString();
        }
    }
}
