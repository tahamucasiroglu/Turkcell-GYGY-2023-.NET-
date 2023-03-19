using Inheritance.Weapons;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace inheritance.Weapons
{
    internal class Sword : Weapon, IWeapon 
    {
        /// <summary>
        /// kılıç saldırı değerini arttırır
        /// </summary>
        /// <param name="rarity"> nadirlik değerine göre karaktere temel değeri üzerinden yetenek ataması yapar</param>
        public Sword(int rarity) 
        {
            this.name = "Sword";
            weaponValue *= rarity;
            this.rarity = rarity;
        }
        public int getAttact(int attack)
        {
            return (int)(attack + ((double)(attack / 100) * (new Random().Next(0, weaponValue))));
        }
    }
}
