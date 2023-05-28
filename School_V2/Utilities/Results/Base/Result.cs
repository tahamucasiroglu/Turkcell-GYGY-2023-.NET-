using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Results.Abstract;

namespace Utilities.Results.Base
{
    public class Result : IResult
    {
        public bool Success { get; }

        public string Message { get; }
        public Result(bool success, string message) : this(success)
        {
            Message = message;
        }

        public Result(bool success)
        {
            Success = success;
        }

        public override string ToString()
        {
            return "İşlem Durumu = " + (Success ? "Başarılı" : "Başarısız") + "\n" + "Mesaj = " + Message;
        }
    }
}
