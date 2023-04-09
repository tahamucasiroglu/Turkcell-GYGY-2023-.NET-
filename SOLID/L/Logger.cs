using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace L
{
    internal class Logger
    {
        public bool Status { get; set; }
        public string Message { get; set; }
        public Logger(bool Status, string Message) 
        {
            this.Status = Status;
            this.Message = Message;
        }
    }
}
