using Homework_School_Simulation_REMAKE.Utils.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.Utils.Concrete
{
    internal class Homework : IHomework
    {
        private string HomeworkTitle = "";
        private string HomeworkText = "";
        public Homework(string title = "", string text = "") 
        {
            HomeworkTitle = title;
            HomeworkText = text;
        }
        public override string ToString()
        {
            return HomeworkTitle + "\n" + HomeworkText;
        }
        public override bool Equals(object? obj)
        {
            return obj?.ToString() == this.ToString();
        }
        public string GetTitle() => HomeworkTitle;
        public string GetText() => HomeworkText;
        public bool IsEmpty() => HomeworkText.Length == 0 && HomeworkTitle.Length == 0;

    }
}
