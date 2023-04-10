using Homework_School_Simulation_REMAKE.Database;
using Homework_School_Simulation_REMAKE.DatabaseManager.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Core.Concrete;
using Homework_School_Simulation_REMAKE.Utils.Abstract;
using Homework_School_Simulation_REMAKE.Utils.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Entities.Concrete
{
    internal class Student : SchoolPerson, IStudent
    {
        private IHomework homework = new Homework();
        public Student(string name, string surname, IGender gender, IDatabaseManager databaseManager) : base(name, surname, gender, databaseManager) { }

        public IGender GetGender() => this.gender;

        public IHomework GetHomework() => homework;

        public string GetName() => this.Name;

        public string GetSurname() => this.Surname;

        public void SetGender(IGender gender) => this.gender = gender;

        public void SetHomework(IHomework homework) => this.homework = homework;

        public void SetName(string name) => this.Name = name;

        public void SetSurname(string surname) => this.Surname = surname;

        public override string ToString() => $"Öğrenci {Id} Ad = {Name} Soyad = {Surname} Cinsiyet = {gender.ToString()}\n";
    }
}
