/*
 * senaryo
 * 
 * bir lise düşünüyoruz bu lisede belirsiz sınıf ve belirsiz öğrenci her sınıfta sorumlu öğretmen olacak
 * tüm sınıf öğrenci ve eğitmen atayan uygulama hangi eğitmen hangi sınıfta veya öğrenci görebilecem
 * öğrenci eğitmenine ödev göndersin
 * 
 * plan
 * 
 * bir tane tamamen rastgele olarak üretilmiş öğrenciler olacak ve içlerinde;
 * 1-) Öğrenci Numarası
 * 2-) isim
 * 3-) soyisim
 * 4-) cinsiyet
 * 5-) bölüm (Sayısal Sözel Eşit Ağırlık)
 * 
 * bilgileri bulunacak
 * 
 * aynı şekilde öğretmenler bulunacak bunlarda
 * 1-) isim
 * 2-) soyisim
 * 3-) cinsiyet
 * 4-) Dersi (verdiği ders)
 * 
 * bilgilerine sahip olacak
 * 
 * bir adet sınıf class ımız olacak ve içinde
 * 
 * 1-) öğretmen
 * 2-) öğrenciler
 * 3-) öğrenci ekle
 * 4-) öğrenci sil
 * 5-) bunlara ek get fonsiyonları oalcak
 * 6-) aklıma özellik gelirse eklerim
 * 
 * arama için ise ihtiyaca göre örneğin
 * öğrenci ara derse öğrencileri sırayla sınıflarda arayacak
 * şu öğretmenin sınıfındaki öğrencileri getir dersek önce öğretmeni bulacak sonra geri gelip o sınıfın öğrencilerini döndürecek
 * 
 * Ödev isteği olan öğrenci öğretmenine ödev göndersin kısmında ise kafamda iki senaryo var
 * 
 * 1-) kötü olan
 *      öğrenci sınıfına ödev sınıfı eklenir ve burasında ödev doldurulur. ödev yüklenince bir tane evetn fonsiyonu ödev gönderen öğrencinin bilgisi ile arama yapar
 *      aramada bulunca öğrenciden ödevi alıp öğretmeinine yükler
 * 
 * 2-) kötünün iyisi
 *      öğretmene bir tane ödevlere bak eklenir. bu çalışınca kendi öğrencilerinde arama yapar ve ödev sınıfı dolu olanlar döner
 * 
 * 3-) sonradan akla gelen belirsiz seçenek
 *      sınıf class ına ödev liste değişkeni eklenir. ödevler oraya eklenir hocada pop yapar.
 * 
 * 
 * tasarım (Burasına çok uyulamadı son yorum için 150. satıra atlaın)
 * 
 * bir tane insan klasörü ekleriz
 * bu klasörde öğrenci ve öğretmen olur
 * genel tanımlar bir arada tamamlanır
 * bir tane IHuman ve human olur
 * öğrenci ve öğretmen buradan türetilir
 * ayrıca bunlarda kendi içinde özel üretibilirlik olur örneğin SayısalErkekÖğrenci sınıfı isim ve soyisimle direk üretir
 *      
 * bunlarda rastgele isim için eğlence amaçlı iki yol hazırlayacağım
 * 1. yol
 *      python ile bir verisetinden rastgele 1000 civarı insan rastgele üretilen insan bilgisini yine pythonla c# ,çinde switch case ile bir sınıf hazırlatırım
 * 
 * 2. yol 
 *      üretilen tüm öğrenciler bir listede tanımlanır linq ile getirilir.
 *      
 * ikisinide eklerim arayüzde seçersiniz
 * 
 * OOP tasarım, Solid ve Clean kod kavramlarına uymak için için genel tasarım
 * Human
 *      -IHuman
 *      -Human
 * Student
 *      -IStudent
 *      -Student : Human, IStudent
 *          -Types
 *              -SayısalErkekÖğrenci
 *              -SayısalKızÖğrenci
 *              -SözelErkekÖğrenci
 *              -SözelKızÖğrenci
 *              -EşitAğırlıkErkekÖğrenci
 *              -EşitAğırlıkKızÖğrenci
 * Teacher
 *      -ITeacher
 *      -Teacher : Human, ITeacher
 *          -Types
 *              -MathBoyTeacher
 *              -PhysicalBoyTeacher
 *              -ChemicalBoyTeacher
 *              -GeographyBoyTeacher
 *              -PhilosophyBoyTeacher
 *              -GrammarBoyTeacher
 *              -MathGirlTeacher
 *              -PhysicalGirlTeacher
 *              -ChemicalGirlTeacher
 *              -GeographyGirlTeacher
 *              -PhilosophyGirlTeacher
 *              -GrammarGirlTeacher
 * RandomHuman
 *      - StaticRandomStudent.cs (switchcase ile olan)
 *      - RandomHuman (listenin temel sınıfı atama için listede tutulmalık tip)
 *      - RandomHumanService (linq ile arama ile getirilecek.)
 * Gender
 *      -IGender
 *      -Gender
 *          -Types
 *              -Girl
 *              -Boy
 * Lesson
 *      -ILesson
 *      -Lesson
 *          -Types
 *              -Math
 *              -Physical
 *              -Chemical
 *              -Geography
 *              -Philosophy
 *              -Grammar
 * Section
 *      -ISection
 *      -Section
 *          -Types
 *              -Sözel
 *              -Sayısal
 *              -EşitAğırlık
 * -SchoolClass
 *      -ISchoolClass {öğrenci ekle, öğrenci sil, öğrenci sınıf değiştir(bölüm değiştirme filan), öğretmen değiştir, }
 *      -SchoolClass : ISchoolClass
 *          -Types
 *              -SözelSınıf
 *              -SayısalSınıf
 *              -EşitAğırlıkSınıf
 * - School
 *      -ISchool.cs
 *      -School.cs
 *          -Types (burada fantezi olarak fen meslek anadolu lisesi ekleyebilirim ayrıca test için hazır şeylerde olabilir ama olmayabilride)
 * - Program.cs => School.cs
 * 
 *           
 * Sınıf işlemleri yapılır ama ödev için kesin bir yol yok kafamda bitince görücem
 * 
 * OOP ve Solid için kafamdaki dosya yapısı bu şekilde umarım clean olarak doldururum
 * 
 * 
 * 
 * 
 * 
 *  Son
 *  
 *  
 *  Solid ve OOP prensiplerinden dolayı bir sürü klasör ve dosya açtım ama prensiplerin arasında kayboldum. gelişime açık ve aslında güzel bir mimari oldu.
 *  bu kadar vakit alacağını düşünmedsiğim için zamandan dolayı içime tam sinmeden bırakmak zorundayım. 
 *  
 *  Klasörler
 *  Extensions: yazdığımız sınıfların listelerine hazırlanan extension methodlar bulunmakta
 *  GenderFolder: öğrencilerin cinsiyeti için açılmış klasör
 *  Homeworkfolder: öğrencilere eklenen ödevler için açılan klasör
 *  HumanFodler: öğrenci ve öğretmeni üretmek için base işlemlerin klasörü
 *  LessonFolder: öğretmenlere yönelik hangi branş olduğunu belirtiyor(aklımda farklı kullanımları vardı ama vakt yetmediği için kaldı)
 *  RandomHumanFolder: rastgele öğrenci ve öğretmen üretmekte kullandığım sınıf burada prensip aranmaz çünkü hayali üretim yapmakta solid veya oop için uğraşmadım
 *  SchoolClassFolder: okuldaki sınıflar için üretilmiş klasör
 *  SectionFolder: Sınıfların tipini belirtiyor eşit ağırlık sözel sayısal
 *  StudentFolder: Öğrencilerin tasarlandığı yer
 *  TeacherFolder: Öğretmenlerin tasarlandığı yer
 *  VirtualDatabase: sql ile alınması gereken şeylerin saklandığı yer
 *  StaticConsoleUI.cs: Konsol için Solid ve OOP bakılmaksızın yazı ile hazırlanan önyüz
 *  
 *  Olayın döndüğü yerler:
 *  StudentFolder
 *  TeacherFolder
 *  SchoolClassFolder
 *  SchoolFolder
 *  
 *  
 *  Bağ
 *  
 * Human:IHuman temel insan işlevelerine sahip
 * Student:Human ile ek özellikler eklenir
 * Teacher:Human aynı şekilde
 * Fakat IStudent ve ITeacher a hiç bir şey fark etmemesine rağmen IHuman ekledim örneğin interface IStudent : IHuman nedeni ise extensionlarda generic olanların görmemesiydi bu şekilde
 * çözebildim farklı yolu varsa ben bulamadım generic olmasa baya kopyala yapıştıur gerekecekti galiba yolu buydu
 * 
 *  Her sınıf örneğin Student kendi işlerini yapar Student Öğrencinin bilgilerini döndürür değişmesi gerekeni değiştiri filan başka işi yok işi öğrenci
 *  ISchoolClass işi sınıf ama sınıfta öğrencide olunca arada ona dokundu
 *  aslında bunların klasörlerinde birde service eklenmesi lazım eklemeler filan orada olmalı ama üşengeçliği ayrıda zaman kalmadı bu proje benim 7. projem
 *  beğenmedim hep sildim buda iyi değilde 7. kez yenileme ile olan bu oldu baya sağlam deneyim sağladı
 *  
 *  
 *  sonuç olarak olabildiğince değişime açık gelişime kapalı ayrıca bağımlılıkların düşük olduğu bir proje oldu. SRP yapısı içinde oldu diyebilirim.
 *  liskov beni bitirdi artık liskovun ne olduğunu anlayamıyacak kadar uğraştım :D
 *  ödev kısmı sona kaldığı için aceleye geldi özellikle solid i test etmek için ödevi sonraya bıraktım bozarsa yapıyı demekki solid sıkıntıda demekti lakin bunda ödev sistemi bozmadı
 *  diğer sınıflara bir kaç fonksyon ekleyerek iş çözüldü. 
 *  
 *  
 *  ekleme çıkarma gibi arayüz işlemleri
 *  
 *  bu kısımda yaptıklarım tam bir facia acele olduğu için StaticConsoleUI dosyasını es geçelim :D
 *  burada niyetim bir database ile çalışıyormuşuz gibi verileri al değişikliği yap verileri geri yükleydi öylede olduda istediğim gibi olmadı 1 tanesi için 30 tane veri onunla dolaşmamlı
 *  bu yüzden burada öğrenciyi dönüm işlemi yapıp o öğrenciyi id ile içerde bulup sadece onu değiştirecek bir sistem kurmam lazımdı.
 *  
 *  Son olarak eksiklerim var ama algoritmik olarak c# da bu sürede alınabilecek en iyi verimlerden birini aldığımı düşünüyorum. bu ödev geleceğimin temellerinden biri olacak.
 *  fakat projenin içinde kayboldum buda bir gerçek
 * 
 *  
 */



using Homework_School_Simulation;
using Homework_School_Simulation.Extensions;
using Homework_School_Simulation.GenderFolder;
using Homework_School_Simulation.GenderFolder.Types;
using Homework_School_Simulation.HomeworkFolder;
using Homework_School_Simulation.HumanFolder;
using Homework_School_Simulation.LessonFolder;
using Homework_School_Simulation.StudentFolder;
using Homework_School_Simulation.VirtualDatabase;

internal class Program
{
    private static void Main(string[] args)
    {
        StaticConsoleUI.WelcomeAndChooseSchool();
        StaticConsoleUI.GetClassFromUser();
        StaticConsoleUI.GetSchoolInfos();
        while(true)
        {
            try
            {
                Console.WriteLine("*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*");
                Console.WriteLine("İşlem Seçin");
                Console.WriteLine("1-) Bilgileri Göster");
                Console.WriteLine("2-) Öğrenci Ekle");
                Console.WriteLine("3-) öğrenci sil");
                Console.WriteLine("4-) sınıf ekle");
                Console.WriteLine("5-) sınıf Sil");
                Console.WriteLine("6-) Ödev Ekle");
                Console.WriteLine("7-) Ödev Kontrol Et");
                Console.WriteLine("8-) comingsoon");
                switch (Convert.ToInt32(Console.ReadLine()))
                {
                    case 1: Console.Clear(); StaticConsoleUI.GetSchoolInfos(); break;
                    case 2: Console.Clear(); StaticConsoleUI.AddStudent(); break;
                    case 3: Console.Clear(); StaticConsoleUI.DeleteStudent(); break;
                    case 4: Console.Clear(); StaticConsoleUI.AddClass(); break;
                    case 5: Console.Clear(); StaticConsoleUI.DeleteClass(); break;
                    case 6: Console.Clear(); StaticConsoleUI.AddHomework(); break;
                    case 7: Console.Clear(); StaticConsoleUI.CheckClassHomework(); break;
                }
            }
            catch (Exception)
            {
                Console.Clear();
                Console.WriteLine("Hatalı İşlem");
            }

        }
    }
}