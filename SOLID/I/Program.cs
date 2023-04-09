/*
 * Interface Segregation
 * bir sınıf bir interface i implemente etmiş ise implemente ettiği tüm methodları kullanmalıdır.
 * gereksiz ve kullanılmayan methodlar tek bir interface e bağlanmak zorunda değildir.
 * 
 * senaryo
 * girilen objeyi .eşitli formatta dosya olarak kaydeden bir program tasarımı yapalım
 * .txt  .json ve .xml tipleri olacak
 * .txt direk kaydedecek
 * .json önce json yapacak
 * .xml önce xml yapacak
 * bunlar dönüştürme sonrası kaydedilecek
 * 
 * Sonuç
 * 
 * İnterface'leri tek interface de toplasak, bunu implement eden sınıflar hepsini kullanamyacaktı bu sayede sadece tüm fonsiyonlarını kullanacakları interfaceleri almış oldular
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 */

public interface IWriteFile
{
    public void WriteFile();
}

public interface IConvertJSON
{
    public void ConvertJSON();
}

public interface IConvertXML
{
    public void ConvertXML();
}

public class WriteTXT : IWriteFile
{
    public void WriteFile()
    {
        Console.WriteLine("TXT yazildi");
    }
}

public class WriteJSON : IWriteFile, IConvertJSON
{
    public void ConvertJSON()
    {
        Console.WriteLine("Json'a dönüştürüldü");
    }

    public void WriteFile()
    {
        ConvertJSON();
        Console.WriteLine("JSON yazildi");
    }
}

public class WriteXML : IWriteFile, IConvertXML
{
    public void ConvertXML()
    {
        Console.WriteLine("Xml'e dönüştürüldü");
    }

    public void WriteFile()
    {
        ConvertXML();
        Console.WriteLine("XML yazildi");
    }
}

internal class Program
{
    private static void Main(string[] args)
    {
        IWriteFile TxtFile = new WriteTXT();
        IWriteFile JsonFile = new WriteJSON();
        IWriteFile XmlFile = new WriteXML();

        TxtFile.WriteFile();
        JsonFile.WriteFile();
        XmlFile.WriteFile();
    }
}