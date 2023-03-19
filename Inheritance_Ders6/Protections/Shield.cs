using Inheritance.Protections;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace inheritance.Protections
{
    internal class Shield : Protection, IProtection  // kalkan savunma değerini belli roundlarda aşırı yükseltir
    {
        public Shield(int rarity)
        {
            this.name = "Shield";
            protectionValue *= rarity;
            this.rarity = rarity;
        }
        public int getTakeDamage(int damage)
        {
            if (rarity * 10 < new Random().Next(0, 100))
            {
                int takeDamage = (int)(damage - ((damage / 100) * (rarity + 1) * protectionValue));
                return takeDamage <= 0 ? 0 : takeDamage;
            }
            return damage;

        }
    }
}
