using Homework_School_Simulation_REMAKE.DatabaseManager.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Core.Concrete;
using Homework_School_Simulation_REMAKE.Utils.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Entities.Abstract
{
    internal class SchoolPerson : Entity
    {
        protected string Name { get; set; }
        protected string Surname { get; set; }
        protected IGender gender { get; set; }

        public SchoolPerson(string name, string surname, IGender gender, IDatabaseManager databaseManager) : base(databaseManager)
        {
            this.Name = name;
            this.Surname = surname;
            this.gender = gender;
        }

        public override string ToString()
        {
            return Id.ToString() + " " + Name + " " + Surname + " " + gender.ToString();
        }
        //public override bool Equals(object? obj)
        //{
        //    return obj?.ToString() == this.ToString();
        //}
    }
}
