using Homework_School_Simulation_REMAKE.DatabaseManager.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Abstract;
using Homework_School_Simulation_REMAKE.Utils.Abstract;
using Homework_School_Simulation_REMAKE.Utils.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Entities.Concrete
{
    internal class Teacher : SchoolPerson, ITeacher
    {
        public Teacher(string name, string surname, IGender gender, IDatabaseManager databaseManager) : base(name, surname, gender, databaseManager) { }
        public override string ToString() => $"Öğretmen {Id} Ad = {Name} Soyad = {Surname} Cinsiyet = {gender.ToString()}";
        public IGender GetGender() => this.gender;
        public string GetName() => this.Name;
        public string GetSurame() => this.Surname;
        public void SetGender(IGender gender) => this.gender = gender;
        public void SetName(string name) => this.Name = name;
        public void SetSurame(string surname) => this.Surname = surname;
    }
}
