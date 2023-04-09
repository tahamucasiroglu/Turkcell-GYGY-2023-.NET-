using Extension;

internal class Program
{
    private static void Main(string[] args)
    {
        List<int> intList = new List<int>() { 23, 27, 34, 35, 35, 35, 43, 45, 67};
        int intSayi = 5;
        double doubleSayi = 5.5;
        decimal decimalSayi = 3;
        float floatSayi = 3.14F;
        string stringYazi = "taha";
        char charKarakter = 't';

        Console.WriteLine(intList.ToStringForConsole());
        Console.WriteLine(intList.GetMax());
        Console.WriteLine(intList.GetMin());
        Console.WriteLine(intList.GetMean());
        Console.WriteLine(intList.GetSTD());
        intSayi.WriteType();
        doubleSayi.WriteType();
        decimalSayi.WriteType();
        floatSayi.WriteType();
        stringYazi.WriteType();
        charKarakter.WriteType();
        intList.WriteType();
        Console.WriteLine(intList.GetMax().Is().Equal(100));
        Console.WriteLine(intList.GetMax().Is().EqualOrBigger(100));
        Console.WriteLine(intList.GetMax().Is().EqualOrLesser(100));
        Console.WriteLine(doubleSayi.Is().Equal(5.5));
        Console.WriteLine(intSayi.Is().Equal(5));
    }

    
}