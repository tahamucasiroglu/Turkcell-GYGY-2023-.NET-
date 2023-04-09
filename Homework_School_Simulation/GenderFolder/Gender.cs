using Homework_School_Simulation.GenderFolder.Types;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.GenderFolder
{
    internal class Gender : IGender
    {
        private string HumanGender { get; set; }
        private bool isGirl { get; set; }
        public Gender(string gender, bool isGirl)  //burada is boy de bunu bool tut erke değilse kızdır onuda alttan döndür
        {
            this.HumanGender = gender;
            this.isGirl = isGirl;
        }
        public string GetGenderName() => HumanGender;

        public bool Is(IGender NewGender) => NewGender.GetGenderName() == HumanGender;
        public bool IsBoy() => !isGirl;
        public bool IsGirl() => isGirl;
    }
}
