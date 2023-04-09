using Events;

internal class Program
{
    static public void KeyServiceFunc(object? sender, KeyCreatedEventArgs e)
    {
        switch(e.KeyName)
        {
            case "1":
            case "2":
            case "3":
            case "4":
            case "5":
            case "6":
            case "7":
            case "8":
            case "9":
            case "0":
                Console.WriteLine("sayı olmaz"); break;
        }
        Console.WriteLine($"{e.KeyName} basıldı.");

    }

    private static void Main(string[] args)
    {
        KeyService keyService = new KeyService();
        keyService.KeyBuild += KeyServiceFunc;
        keyService.CreateKey(Console.ReadLine());
    }
}