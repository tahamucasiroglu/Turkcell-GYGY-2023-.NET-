using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inheritance.Chars.Core
{
    internal interface IChar
    {
        public int damage();
        public bool isDead();
        public int takeDamage(int damage);
        public int getHealty();
        public string getInfo();
        public string getName();
        public int getRarity();
    }
}
