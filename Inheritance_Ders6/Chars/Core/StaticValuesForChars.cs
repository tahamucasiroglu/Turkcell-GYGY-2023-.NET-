using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inheritance.Chars.Core
{
    static internal class StaticValuesForChars
    {
        static private int highAttackValue { get => 100; }
        static private int lowAttackValue { get => 50; }
        static private int highHealtyValue { get => 1000; }
        static private int lowHealtyValue { get => 500; }
        static private int highDefanceValue { get => 20; }
        static private int lowDefanceValue { get => 10; }
        static private int highRarityValue { get => 5; }
        static private int lowRarityValue { get => 1; }
        static private int highCriticalChanceValue { get => 10; }
        static private int lowCriticalChanceValue { get => 5; }
        static private int highCriticalStrengthValue { get => 20; }
        static private int lowCriticalStrengthValue { get => 10; }
        static private int getRandomRangeValue(int rarity, int value, int multiplier = 2) { return new Random().Next(value * rarity, value * rarity * multiplier); }
        static internal int getHighAttachValue(int rarity) { return getRandomRangeValue(rarity, highAttackValue); }
        static internal int getLowAttackValue(int rarity) { return getRandomRangeValue(rarity, lowAttackValue); }
        static internal int getHighHealtyValue(int rarity) { return getRandomRangeValue(rarity, highHealtyValue); }
        static internal int getLowHealtyValue(int rarity) { return getRandomRangeValue(rarity, lowHealtyValue); }
        static internal int getHighDefanceValue(int rarity) { return getRandomRangeValue(rarity, highDefanceValue); }
        static internal int getLowDefanceValue(int rarity) { return getRandomRangeValue(rarity, lowDefanceValue); }
        static internal int getHighRarityValue(int rarity) { return getRandomRangeValue(rarity, highRarityValue); }
        static internal int getLowRarityValue(int rarity) { return getRandomRangeValue(rarity, lowRarityValue); }
        static internal int getHighCriticalChanceValue(int rarity) { return getRandomRangeValue(rarity, highCriticalChanceValue); }
        static internal int getLowCriticalChanceValue(int rarity) { return getRandomRangeValue(rarity, lowCriticalChanceValue); }
        static internal int getHighCriticalStrengthValue(int rarity) { return getRandomRangeValue(rarity, highCriticalStrengthValue); }
        static internal int getLowCriticalStrengthValue(int rarity) { return getRandomRangeValue(rarity, lowCriticalStrengthValue); }
    }
}
