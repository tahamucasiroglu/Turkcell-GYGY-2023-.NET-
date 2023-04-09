/*
 * Dependency Inversion
 * bağımlılık demektir A olmadan B olmazsa => B A'ya dependency'dir(bağımlıdır)
 * Dependency Bir nesnenin varlığının başka nesneye bağlı olmasıdır.
 * Inversion: büyük sistem, bağımlısı olduğu nesneyi oluşturmamalı dışarıdan almalı
 * 
 * 1 dependency yi fark et
 * 2 dependency yi dışardan aktar
 * 
 * senaryo
 * hardisk - ekran kartı - işlemci ve ramden oluşan bilgisayar tasarımı olsun
 * sonunda bilgisayarın özelliklerini döndürsün
 * 
 * aşağıdaki sistem sayesinde bilgisayara başka parçalar takılabilecek
 * bu yöntemle birlikte sadece sınıfın constructor ında diğer sınıflar verildi bu sayede fonksiyonlarda sırayla üretilmedi
 * sınıflar bağlılıklarını içlerinde üretmemiş oldu
 * 
 * 
 * 
 */

public interface IDisk
{
    public string GetType();
    public string GetSize();
}

public interface IGpu
{
    public string GetVRamSize();
    public string GetVersion();
}

public interface ICpu
{
    public string GetGHZ();
    public string GetNM();
}
public interface IRam
{
    public string GetMHZ();
    public string GetSize();
}

public class HDD : IDisk
{
    public string GetSize() => "1 Tb";
    string IDisk.GetType() => "HDD";
}
public class SSD : IDisk
{
    public string GetSize() => "500 gb";
    string IDisk.GetType() => "SSD";
}

public class RTX4090 : IGpu
{
    public string GetVersion() => "RTX 4090";

    public string GetVRamSize() => "24Gb";
}

public class IntelI7 : ICpu
{
    public string GetGHZ() => "3.7GHZ";

    public string GetNM() => "14NM";
}

public class Samsung32GBRam : IRam
{
    public string GetMHZ() => "3200MHZ";

    public string GetSize() => "32 GB";
}

public class Computer
{
    private IDisk disk;
    private ICpu cpu;
    private IRam ram;
    private IGpu gpu;
    public Computer(IDisk disk, IGpu gpu, ICpu cpu, IRam ram)
    {
        this.disk = disk;
        this.cpu = cpu;
        this.ram = ram;
        this.gpu = gpu;
    }

    public void GetInfo()
    {
        Console.WriteLine("Disk:");
        Console.WriteLine("Size: "+disk.GetSize());
        Console.WriteLine("Type: "+disk.GetType());
        Console.WriteLine("Gpu:");
        Console.WriteLine("Size: " + gpu.GetVRamSize());
        Console.WriteLine("Model: " + gpu.GetVersion());
        Console.WriteLine("Cpu:");
        Console.WriteLine("MHZ: " + cpu.GetGHZ());
        Console.WriteLine("NM: " + cpu.GetNM());
        Console.WriteLine("Ram:");
        Console.WriteLine("MHZ: " + ram.GetMHZ());
        Console.WriteLine("Size: " + ram.GetSize());
    }   

}


internal class Program
{
    private static void Main(string[] args)
    {
        Computer computer = new Computer(new SSD(), new RTX4090(), new IntelI7(), new Samsung32GBRam());
        computer.GetInfo();
    }
}