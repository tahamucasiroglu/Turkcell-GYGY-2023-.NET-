using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inheritance.Protections
{
    internal interface IProtection
    {
        /// <summary>
        /// silah sınıflarının bağlandığı interface
        /// <param name="getTakeDamage"> karakterin aldığı hasarı koruma gücüne göre azaltarak geri döndürür</param>
        /// </summary>
        /// <param name="damage"> karakterin aldığı hasar değeridir</param>
        /// <returns></returns>
        int getTakeDamage(int damage);
        public string getInfo();
    }
}
