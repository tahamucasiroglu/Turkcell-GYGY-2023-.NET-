using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Results.Abstract;

namespace Utilities.Extensions
{
    static public class IDataResultExtensions
    {
        static public bool IsNull<T>(this IDataResult<T> res) => res.Data == null;
    }
}
