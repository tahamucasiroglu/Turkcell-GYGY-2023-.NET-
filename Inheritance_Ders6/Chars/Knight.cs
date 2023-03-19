using Inheritance.Chars.Core;
using Inheritance.Protections;
using Inheritance.Weapons;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Char = Inheritance.Chars.Core.Char;

namespace inheritance.Chars
{
    internal class Knight : CharGenerator
    {
        /// <summary>
        /// knight saldırı ve kritik yüksek        can ve savunma düşük
        /// </summary>
        /// <param name="rarity"> karakterin nadirlik değeri</param>
        /// <param name="protection"> karakterin nasıl zırh değişkenidir</param>
        /// <param name="weapon"> karakterin silah değişkenidir</param>
        public Knight(int rarity, IProtection protection, IWeapon weapon) : 
        base
            (
                "Knight",
                rarity,
                StaticValuesForChars.getHighAttachValue(rarity),
                StaticValuesForChars.getHighDefanceValue(rarity),
                StaticValuesForChars.getLowHealtyValue(rarity),
                StaticValuesForChars.getLowCriticalChanceValue(rarity),
                StaticValuesForChars.getLowCriticalStrengthValue(rarity),
                protection,
                weapon
            )
        {}


        /* older Version ---------------------------------------------------------------------
        /// <summary>
        /// knight saldırı ve kritik yüksek        can ve savunma düşük
        /// </summary>
        /// <param name="rarity"> karakterin nadirlik değeri</param>
        /// <param name="protection"> karakterin nasıl zırh değişkenidir</param>
        /// <param name="weapon"> karakterin silah değişkenidir</param>
        public Knight(int rarity, IProtection protection, IWeapon weapon) 
        {
            this.name = "Knight";
            this.rarity = rarity;
            this.protection = protection;
            this.weapon = weapon;
            this.attack = StaticValuesForChars.getHighAttachValue(rarity);
            this.healty = StaticValuesForChars.getLowHealtyValue(rarity);
            this.defance = StaticValuesForChars.getHighDefanceValue(rarity);
            this.criticalChance = StaticValuesForChars.getLowCriticalChanceValue(rarity);
            this.criticalStrength = StaticValuesForChars.getLowCriticalStrengthValue(rarity);

        }
        */
    }
}
