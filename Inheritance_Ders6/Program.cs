/*
Senaryo
Inheritance kavramı için basit bir oyun yapılacak
karakter silah ve koruma ile savaş yapılacak
karakterlerde
    - saldırı
    - savunma
    - kritik şansı
    - kritik değeri
    - can 
    - bu değerlerin savaşta değişip takibi için fonksiyonlar olacak

silahlar 
    - kılıç saldırı değerini arttırır
    - mızrak saldırı değerini belli roundlarda aşırı arttırır

korumalar
    - kalkan savunma değerini belli roundlarda aşırı yükseltir
    - zırh savunma değerini yükseltir

karakterler
    - Giant savunma ve saldırı yüksek        can ve kritik düşük
    - knight saldırı ve kritik yüksek        can ve savunma düşük
    - wizard kritik ve can yüksek            saldırı ve savunma düşük
    - robot saldırı ve can yüksek            savunma ve kritik düşük

pvp ve bilgisayara karşı mod olacak 

*/
using inheritance.Chars;
using inheritance.Protections;
using inheritance.Weapons;
using Inheritance;
using Inheritance.Chars.Core;
using Inheritance.Protections;
using Inheritance.Weapons;

internal class Program
{
    
    private static void Main(string[] args)
    {
        while (true)
        {
            Console.WriteLine("The Colosseum");

            int character;
            int weapon;
            int protection;
            bool animation;

            Console.WriteLine("Select Your Character\n1 = Giant\n2 = Knight\n3 = Robot\n4 = Wizard\n5 = Get Random\n");
            character = Convert.ToInt16(Console.ReadLine());

            if (character == 5)
            {
                character = new Random().Next(1, 5);
                weapon = new Random().Next(1, 3);
                protection = new Random().Next(1, 3);
            }
            else
            {
                Console.WriteLine("Select Your Weapon\n1 = Sword\n2 = Spear\n");
                weapon = Convert.ToInt16(Console.ReadLine());

                Console.WriteLine("Select Your Protection\n1 = Armor\n2 = Shield\nn");
                protection = Convert.ToInt16(Console.ReadLine());
            }


            Console.WriteLine("Do you want animation e/h");
            animation = Console.ReadLine() == "e";

            IChar char1, char2;
            char1 = getChar(character, weapon, protection);
            char2 = getChar(new Random().Next(1, 5), new Random().Next(1, 3), new Random().Next(1, 3), char1.getRarity());

            new Colosseum(char1, char2, animation);

            Console.WriteLine("Do you want to play again e/h");
            if(Console.ReadLine() != "e") { break; }
        }
        
    }

    private static IChar getChar(int characterNumber, int weaponNumber, int protectionNumber, int rarity = 0)
    {
        rarity = rarity == 0 ? new Random().Next(1, 6) : rarity;
        IWeapon weapon;
        IProtection protection;
        switch (weaponNumber)
        {
            case 1: weapon = new Sword(rarity); break;
            case 2: weapon = new Spear(rarity); break;
            default: weapon = new Spear(rarity); break; // hata önleme için null olmayacak amaçlı eklendi
        }

        switch (protectionNumber)
        {
            case 1: protection = new Armor(rarity); break;
            case 2: protection = new Shield(rarity); break;
            default: protection = new Shield(rarity); break;// hata önleme için null olmayacak amaçlı eklendi
        }


        switch (characterNumber)
        {
            case 1: return new Giant(rarity, protection, weapon);
            case 2: return new Knight(rarity, protection, weapon);
            case 3: return new Robot(rarity, protection, weapon);
            case 4: return new Wizard(rarity, protection, weapon);
            default: return new Wizard(rarity, protection, weapon);// hata önleme için null olmayacak amaçlı eklendi
        }
    }
}