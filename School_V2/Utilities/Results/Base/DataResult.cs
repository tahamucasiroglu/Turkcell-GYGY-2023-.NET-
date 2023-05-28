using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Results.Abstract;

namespace Utilities.Results.Base
{
    public class DataResult<T> : Result, IDataResult<T>
    {
        public T Data { get; }
    public DataResult(T data, bool success, string message) : base(success, message)
        {
            Data = data;
        }

        public DataResult(T data, bool success) : base(success)
        {
            Data = data;
        }
        public override string ToString()
        {
            return "İşlem Durumu = " + (Success ? "Başarılı" : "Başarısız") + "\n" + "Data Tipi = " + Data?.GetType() ?? typeof(T) + "Mesaj = " + Message;
        }
    }
}
