using Homework_School_Simulation_REMAKE.Entities.Core.Abstract;
using Homework_School_Simulation_REMAKE.Utils.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Entities.Abstract
{
    internal interface ITeacher : IEntity
    {
        public string GetName();
        public string GetSurame();
        public IGender GetGender();
        public void SetName(string name);
        public void SetSurame(string surname);
        public void SetGender(IGender gender);
    }
}
