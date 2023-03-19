using Inheritance.Protections;
using Inheritance.Weapons;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Char = Inheritance.Chars.Core.Char;

namespace Inheritance.Chars.Core
{
    internal class CharGenerator : Char, IChar
    {
        internal CharGenerator(string name, int rarity, int attack, int defance, int healty, int criticalChance, int criticalStrength, IProtection protection, IWeapon weapon)
        {
            this.name = name;
            this.rarity = rarity;
            this.attack = attack;
            this.defance = defance;
            this.healty = healty;
            this.criticalChance = criticalChance;
            this.criticalStrength = criticalStrength;
            this.weapon = weapon;
            this.protection = protection;

        }
    }
}
