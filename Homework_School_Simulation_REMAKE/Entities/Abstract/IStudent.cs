using Homework_School_Simulation_REMAKE.Entities.Core.Abstract;
using Homework_School_Simulation_REMAKE.Utils.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Entities.Abstract
{
    internal interface IStudent : IEntity
    {
        public IHomework GetHomework();
        public void SetHomework(IHomework homework);
        public string GetName();
        public string GetSurname();
        public IGender GetGender();
        public void SetName(string name);
        public void SetSurname(string surname);
        public void SetGender(IGender gender);
    }
}
