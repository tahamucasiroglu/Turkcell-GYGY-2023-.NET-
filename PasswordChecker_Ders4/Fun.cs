/*
 senaryo 
şifre kontrolü hazırlanacak
- 6 karakter ve üstünde kontrol yapılacak
- 3 tip karakter var sayı, harf ve alfanumeric
- sadece tek tipe sahip ise zayıf, iki tipe sahipse orta ve üç tipede sahipse güçlü olacak
 */

internal class Program2 // eğlenmek için yapılan hali 
{
    private static void Main2(string[] args)
    {
        Console.WriteLine("Password:");
        passwordChecker(Console.ReadLine());
    }

    private static void passwordChecker(string? message){if (message != null && message.Length >= 6){passwordPowerCheck(message);}else{Console.WriteLine("Undefined");}}

    private static void passwordPowerCheck(string message, int isletter = 0, int isnumber = 0, int isalphanumeric = 0)
    {
        foreach (char letter in message){ if (char.IsLetter(letter)) { isletter = 1; } if (char.IsNumber(letter)) { isnumber = 1; } if (char.IsPunctuation(letter)) { isalphanumeric = 1; } }
        switch (isletter+isalphanumeric+isnumber) { case 1: Console.WriteLine("Weak"); break; case 2: Console.WriteLine("Middle"); break; case 3: Console.WriteLine("Strong"); break; default:Console.WriteLine("Undefined");break;}
    }
}