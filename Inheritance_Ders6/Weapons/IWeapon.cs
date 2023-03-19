using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inheritance.Weapons
{
    internal interface IWeapon
    {
        /// <summary>
        /// silah sınıflarının bağlandığı interface
        /// <param name="getAttact"> karakterin attack değeri verilir silah özelliğine göre yükseltilmiş attack değeri döndürür</param>
        /// </summary>
        /// <param name="attack"> karakterin attack değeridir</param>
        /// <returns></returns>
        int getAttact(int attack);
        public string getInfo();
    }
}
