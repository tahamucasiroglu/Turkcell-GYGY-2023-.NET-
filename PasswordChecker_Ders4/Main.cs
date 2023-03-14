/*
 senaryo 
şifre kontrolü hazırlanacak
- 6 karakter ve üstünde kontrol yapılacak
- 3 tip karakter var sayı, harf ve alfanumeric
- sadece tek tipe sahip ise zayıf, iki tipe sahipse orta ve üç tipede sahipse güçlü olacak
 */

internal class Program
{
    private static void Main(string[] args)
    {
        while (true)
        {
            string message = "";
            Console.WriteLine("Password: for exit enter 'q'");
            message = Console.ReadLine();
            if (message == "q") { break; }
            bool isBigger = isLengthBiggerThanOrEqualSix(message);
            if (isBigger)
            {
                int count = 0;
                count += haveLetter(message) ? 1 : 0;
                count += haveNumber(message) ? 1 : 0;
                count += haveAlphanumeric(message) ? 1 : 0;
                // 1 tip 2 tip 3 tip sayımını count üzerinden gerçekleştirdim
                switch (count)
                {
                    case 0: undefinedPassword(); break;
                    case 1: weakPassword(); break;
                    case 2: middlePassword(); break;
                    case 3: strongPassword(); break;
                    default: undefinedPassword(); break;
                }
            }
            else { shortPassword(); }
        }
    }

    private static bool haveAlphanumeric(string message)
    {
        foreach (char letter in message) { if (char.IsPunctuation(letter)) { return true; } } return false;
    }

    private static bool haveNumber(string message)
    {
        foreach (char letter in message) { if (char.IsNumber(letter)) { return true; } } return false;
    }

    private static bool haveLetter(string message)
    {
        foreach (char letter in message) { if (char.IsLetter(letter)) { return true; } } return false;
    }

    private static bool isLengthBiggerThanOrEqualSix(string message)
    {
        return (message != null && message.Length >= 6);
    }

    private static void strongPassword()
    {
        Console.WriteLine("Strong");
    }
    private static void middlePassword()
    {
        Console.WriteLine("Middle");
    }
    private static void weakPassword()
    {
        Console.WriteLine("Weak");
    }
    private static void shortPassword()
    {
        Console.WriteLine("Password must be bigger than 6");
    }

    private static void undefinedPassword()
    {
        Console.WriteLine("Password must be bigger than 6");
    }
}