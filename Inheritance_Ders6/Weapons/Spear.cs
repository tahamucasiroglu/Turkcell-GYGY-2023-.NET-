using Inheritance.Weapons;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace inheritance.Weapons
{
    internal class Spear : Weapon, IWeapon // mızrak saldırı değerini belli roundlarda aşırı arttırır
    {
        public Spear(int rarity)
        {
            this.name = "Spear";
            weaponValue *= rarity;
            this.rarity = rarity;
        }
        public int getAttact(int attack)
        {
            if (rarity*10 < new Random().Next(0,100))
            {
                return (int)(attack + ((double)(attack / 100) * (rarity + 1) * (new Random().Next(0, weaponValue))));
            }
            return attack;
            
        }
    }
}
