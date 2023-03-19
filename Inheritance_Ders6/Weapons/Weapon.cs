using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inheritance.Weapons
{
    internal class Weapon
    {
        internal string name { get; set; }
        internal int weaponValue { get; set; } = 5;
        internal int rarity { get; set; }
        public string getInfo()
        {
            return $"   Name = {name}\n   Rarity = {rarity}\n   Strength = {weaponValue}";
        }
    }
}
