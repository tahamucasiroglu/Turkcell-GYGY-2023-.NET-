/*
 * Open/Close Prensibi 
 * Bir nesne gelişime açık değişime kapalı olmalı
 * bir özellik eklenmek istenirse veya bir özellik çıkarmak istenirse bu işlem diğer işlemleri etkilememeli
 * 
 * 
 * senaryo
 * yemek sipariş uygulaması yapıalcak
 * çeşitli durumlarda %5 %10 %20 indirim yapılacak
 * ayrıca mesafe 2km den fazla ise gönderim ücreti alınacak 2-5 arası 10 tl 5-10 arası 30 tl  10 ve üstünde 50 tl gönderim ücreti
 * indirim yemek parasına uygulanacak ve 2kmden fazla ise gönderim ücreti buna eklenecek
 * toplam fiyat geri dönecek
 * 
 * 
 * düzgün bir senaryo üretilemediği için open/closed oldu gibi ama kalan şeylerde ihlal var sadece mantık için iki durumla çalışılmaya çalışıldı
 * 
 */

public interface IDiscount
{
    public double GetPrice(double price);
}

public interface IDistance
{
    public double AddPrice(double price);
}
public class Discount0 : IDiscount
{
    public double GetPrice(double price) => price;
}
public class Discount5 : IDiscount
{
    public double GetPrice(double price) => price * 0.95;
}

public class Discount10 : IDiscount
{
    public double GetPrice(double price) => price * 0.9;
}

public class Discount20 : IDiscount
{
    public double GetPrice(double price) => price * 0.8;
}

public class Distance0_2 : IDistance
{
    public double AddPrice(double price) => price;
}
public class Distance2_5 : IDistance
{
    public double AddPrice(double price) => price + 10;
}
public class Distance5_10 : IDistance
{
    public double AddPrice(double price) => price + 30;
}
public class Distance10_ : IDistance
{
    public double AddPrice(double price) => price + 50;
}

public class Order
{
    public double Price { get; set; }
    public IDiscount Discount { get; set; }
    public IDistance Disctance { get; set; }
}

public class OrderManager
{
    private Order Order { get; set; }
    public OrderManager(Order order)
    {
        Order = order;
    }
    public double GetPrice() => Order.Disctance.AddPrice(Order.Discount.GetPrice(Order.Price));
}



internal class Program
{
    private static void Main(string[] args)
    {
        Order order = new Order { Price = 89.99, Discount = new Discount0(), Disctance = new Distance2_5()};
        OrderManager manager = new OrderManager(order);
        Console.WriteLine(manager.GetPrice());
    }
}