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
    internal class Robot : CharGenerator
    {
        /// <summary>
        /// robot saldırı ve can yüksek            savunma ve kritik düşük
        /// </summary>
        /// <param name="rarity"> karakterin nadirlik değeri</param>
        /// <param name="protection"> karakterin nasıl zırh değişkenidir</param>
        /// <param name="weapon"> karakterin silah değişkenidir</param>
        public Robot(int rarity, IProtection protection, IWeapon weapon) : 
        base
            (
            "Robot",
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
    }
}
