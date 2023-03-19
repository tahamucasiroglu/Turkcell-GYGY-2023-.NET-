using Inheritance.Chars.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Inheritance
{
    internal class Colosseum
    {
        private void sleep(int milliseconds) { Thread.Sleep(milliseconds); }
        IChar char1;
        IChar char2;
        bool animation;
        bool isChar1FirstAttacker;
        private void print(string text) { Console.WriteLine(text); }
        private void fight(IChar attacker, IChar defender)
        {
            int attackValue;
            attackValue = attacker.damage();
            defender.takeDamage(attackValue);

            print($"{attacker.getName()} (Attacker) hiting {attackValue} damage to {defender.getName()} (Defender)");
            print($"{attacker.getName()} (Attacker) has {attacker.getHealty()} healty and {defender.getName()} (Defender) has {defender.getHealty()} healty");
            if (animation) { sleep(500); }
        }

        private bool checkHealty() { return char1.isDead() || char2.isDead(); }

        internal Colosseum(IChar char1, IChar char2, bool animation) 
        {
            this.char1 = char1;
            this.char2 = char2;
            this.animation = animation;
            startFight();
        }

        private void startFight()
        {
            print("Welcome The Colosseum");
            print($"Char 1 = \n{char1.getInfo()}");
            print("----------------------------------------");
            print($"Char 2 = \n{char2.getInfo()}");
            print("The war is beginning");
            if (1 == new Random().Next(1, 3))
            {
                print($"{char1.getName()} (Char1) is the first attacker.");
                isChar1FirstAttacker = true;
            }
            else
            {
                print($"{char2.getName()} (Char2) is the first attacker.");
                isChar1FirstAttacker = false;
            }

            if (isChar1FirstAttacker)
            {
                while (true)
                {
                    fight(char1, char2);
                    if (checkHealty()) { break; }
                    fight(char2, char1);
                    if (checkHealty()) { break; }
                }
            }
            else
            {
                while (true)
                {
                    fight(char2, char1);
                    if (checkHealty()) { break; }
                    fight(char1, char2);
                    if (checkHealty()) { break; }
                }
            }
            if (char1.isDead()) { print($"{char2.getName()} (Char2) Won!"); }
            else if (char2.isDead()) { print($"{char1.getName()} (Char1) Won!"); }
            else { print("Colosseum da bir sıkıntı var"); }
        }
    }
}
