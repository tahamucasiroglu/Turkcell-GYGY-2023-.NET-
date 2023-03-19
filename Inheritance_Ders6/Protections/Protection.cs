using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Inheritance.Protections
{
    internal class Protection
    {
        internal string name;
        internal int rarity;
        internal int protectionValue { get; set; } = 5;
        public string getInfo()
        {
            return $"   Name = {name}\n   Rarity = {rarity}\n   Strength = {protectionValue}";
        }
    }
}
