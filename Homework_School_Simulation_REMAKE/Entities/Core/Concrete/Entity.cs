using Homework_School_Simulation_REMAKE.Database;
using Homework_School_Simulation_REMAKE.DatabaseManager.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Core.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Entities.Core.Concrete
{
    internal class Entity : IEntity
    {
        public int Id;
        public Entity(IDatabaseManager databaseManager)
        {
            Id = databaseManager.GetId();
        }
        public override string ToString()
        {
            return Id.ToString();
        }
        public override bool Equals(object? obj)
        {
            return this.ToString() == obj?.ToString();
        }

        public int GetId() => Id;
    }
}
