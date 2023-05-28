using Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities.Extensions
{
    static public class IEntityExtensions
    {
        static public string GetTableName(this IEntity t) => t.GetType().Name.EndsWith("ss") ? t.GetType().Name + "es" : t.GetType().Name + "s";
        static public string GetColumns(this IEntity t) => string.Join(",", t.GetType().GetProperties().Where(p => !p.GetGetMethod().IsVirtual).Select(p => p.Name));
        static public string GetValues(this IEntity t) => string.Join(",", t.GetType().GetProperties().Where(p => !p.GetGetMethod().IsVirtual).Select(p => "@" + p.Name));
        static public string GetClassName(this IEntity t) => t.GetType().Name;

    }
}
