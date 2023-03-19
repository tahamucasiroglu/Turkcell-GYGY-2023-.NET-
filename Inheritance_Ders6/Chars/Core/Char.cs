using Inheritance.Protections;
using Inheritance.Weapons;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inheritance.Chars.Core
{
    internal class Char
    {
        internal string name { get; set; }
        internal int attack { get; set; }
        internal int healty { get; set; }
        internal int defance { get; set; }
        internal int rarity { get; set; }
        internal int criticalChance { get; set; }
        internal int criticalStrength { get; set; }
        internal IProtection protection { get; set; }
        internal IWeapon weapon { get; set; }
        public string getInfo()
        {
            return $"Name = {name}\nRarity = {rarity}\nAttach = {attack}\nHealty = {healty}\nDefance = {defance}\nCritical Chance = {criticalChance}\nCritical Strength = {criticalStrength}\nWeapon = \n{weapon.getInfo()}\nProtection = \n{protection.getInfo()}";
        }
        public int damage()
        {
            return weapon.getAttact(attack);
        }
        public bool isDead()
        {
            return healty <= 0;
        }

        public int takeDamage(int damage)
        {
            healty -= protection.getTakeDamage(damage);
            return healty;
        }
        public int getHealty() { return healty; }
        public string getName() { return name; }
        public int getRarity() { return rarity; }
    }
}
