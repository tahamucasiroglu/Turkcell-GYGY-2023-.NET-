using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace S
{
    static internal class Wallet
    {
        static private int Balance = 0;
        static public void AddBalance(int price) => Balance += price; 
        static public int GetBalance() => Balance;
    }
}
