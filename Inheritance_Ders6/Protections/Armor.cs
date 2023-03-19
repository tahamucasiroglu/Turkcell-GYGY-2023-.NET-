using Inheritance.Protections;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace inheritance.Protections
{
    internal class Armor : Protection, IProtection // zırh savunma değerini yükseltir
    {
        public Armor(int rarity)
        {
            this.name = "Armor";
            protectionValue *= rarity;
            this.rarity = rarity;
        }
        public int getTakeDamage(int damage)
        {
            return (int)(damage - ((damage / 100) * protectionValue));
        }
    }
}
