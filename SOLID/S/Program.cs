/*
 * SOLID'in S'si SRP(Single Responsibility Principle)
 * Her nesnenin bir sorumluluğu olmalıdır
 * İhlal Koşulları:
 *     1-) Bir nesnede değişiklik yapmak için birden fazla sebebiniz varsa bu prensibi ihlal ediyorsunuz demektir.
 *     2-) ilk madde için fonsiyona sorun sen ne yapıyorsun diye ben şunu şunu  yapıyorum derse tamam fakat şunu şunu ve şunu derse yani birden fazla iş yapıyorum derse sorun var
 * 
 * 
 * Senaryo 
 * Basit bir stok uygulaması olacak
 * veritabanı static bir sınıf ile sağlanacak
 * ürün girişi ve çıkışı olacak
 * girişte ürün ile alakalı - id - adet - fiyat(adet fiyatı) - olacak
 * çıkıştada aynı değerler olacak
 * ürünü statik stoklayan yerde bir adette kasa olacak giren ürün 5 tl girmiş çıkarken 6 tl çıkarsa kasaya 1 tl eklenecek.
 * bu sadece çıkışta yapılacak basitlik için girişte ödeme filan olmayacak çıkışta kar veya zarar olarak cüzdana yansıyacak
 * içerden fazla ürün çıkışı gibi şeyleride göz ardı ettim amaç iskelet
 * 
 * 
 * 
 * yapılanlar
 * store sadece kendi amacını yapmakta ürün gelince ekler çıkınca siler çıkarken fiyat farkını ise cüzdana gönderir ve cüzdan onu balance olarak ekler (gerçi burada farklı sistemle cüzdana ürün farkını günderip orada hesaplatabiliriz s prensibi için)
 * product sadece ürün için ihtiyaç olunacak fonksiyonları ve değişkenleri içerir
 * store içindeki ek sınıf üşengeçlikten ürünlri tutuması için ekledim başka amacı yok store içinede konulurdu ama bu sefer store hem ürünleri alıp çıkartan hemde ütünlerin listesini tutan olurdu
 * console ui switc içindeki karmaşayı önlemek için yapıldı fakat onunda amacı istenilen işleme göre kullanıcıdan veri almak işlemini ise program.cs istenilen yere göndermekte 
 * %100 S prensibi olmadı bence ama bir %80 var gibi
 * 

 */


using S;

internal class Program
{
    public static void print(string text) => Console.WriteLine(text);  //python alışkanlıkları
    private static void Main(string[] args)
    {
        ConsoleUI consoleUI = new ConsoleUI();
        Store store = new Store();
        print("Depoya Hoş Geldiniz. ");
        while (true)
        {
            print("-------------------------------------------------------------------");
            print("İşleminizi Seçiniz");
            print("1- Ürün Ekle");
            print("2- Ürün Çıkar");
            print("3- Ürünleri Göster");
            print("4- Cüzdanı Göster");
            print("5- Çıkış");
            int input = Convert.ToInt32(Console.ReadLine());
            switch (input)
            {
                case 0:break;
                case 1:
                    int productCount = store.GetProductCount();
                    Product newProduct = consoleUI.GetAddProductDetailsFromCustomer(productCount);
                    store.AddProduct(newProduct); 
                    break;
                case 2: 
                    Product subProduct = consoleUI.GetSubtrackProductDetailsFromCustomer();
                    store.SubtractProduct(subProduct);
                    print("New Product List:");
                    foreach (Product item in store.GetProductsList())
                    {
                        Console.WriteLine(item.getProductInfo());
                    }
                    break;
                case 3: 
                    foreach (Product item in store.GetProductsList())
                    { 
                        print(item.getProductInfo()); 
                    } 
                    break;
                case 4: Console.WriteLine(Wallet.GetBalance()); break;
                case 5: System.Environment.Exit(1); break;
            }
        }
    }
}