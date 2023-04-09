using Homework_School_Simulation.GenderFolder;
using Homework_School_Simulation.SectionFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.HumanFolder
{
    internal class Human : IHuman
    {
        private int HumanId {  get; set; }
        private string HumanName {  get; set; }
        private string HumanSurname { get; set; }
        private IGender HumanGender { get; set; }

        public Human(int humanid, string name, string surname, IGender gender)
        {
            HumanId = humanid;
            this.HumanName = name;
            this.HumanSurname = surname;
            this.HumanGender = gender;
        }

        public bool Is(IHuman NewHuman) => NewHuman.GetId() == HumanId;
        public int GetId() => HumanId;
        public void SetName(string NewName) => HumanName = NewName;
        public void SetSurname(string NewSurame) => HumanSurname = NewSurame;
        public void SetGender(IGender NewGender) => HumanGender = NewGender;
        public string GetGenderName() => HumanGender.GetGenderName();
        public string GetName() => HumanName;
        public string GetSurname() => HumanSurname;
        public IGender GetGender() => HumanGender;

    }
}
