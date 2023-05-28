using Business.Abstract;
using Business.Concrete;
using DataAccess.Abstract;
using DataAccess.Concrete.Dapper;
using DataAccess.Concrete.EfCore;
using Entities.Abstract;
using Entities.Concrete;
using Entities.Contexts;
using Entities.Tasks;
using Microsoft.EntityFrameworkCore;
using SchoolV2;
using System.Linq.Expressions;
using Utilities.Extensions;
using Utilities.Results.Abstract;
using static Dapper.SqlMapper;

internal class Program
{
    private static async Task Main(string[] args)
    {
        /*
         * dapper çok vakit almasın diye tam bir efcore alt yapısı eklemedim ama kendinizde uygulayacaksanız
         * hereket tablosunda kullanmayın
         * her tabloda otomatik artan Id private key olsun ki onlarla iş yapıyor
         * 
         * 
         * konsola basarken rame yükü azaltmak için sorgu ile sadece isimler getirilebilirdi ama günler sürdü artık yeter kafada bitirdim o kısımları kafamda compile ettim çalıştı :D
         * 
         * 
         */

        /*
         * DTO lar hazırlaancak
         * arayüz uygulanacak
         * async lar arayüze eklenecek
         * öğrenilince webapi ile birleştirilecek
         * business kısmı düzenlenecek
         * methodlar arttırılacak
         * task test edilecek (post yani ödev ilanında ödev bitiş tarihi geldi ise IsEnd değerini )
         * github kullanımını vs ile öğren bu projeyi bir dahakine git ile güncelle
         */

        if(!StaticConsolHelper.DbCheck())
        {
            Console.WriteLine("Database bulunamadı iznin olursa Database'i kurabilir miyim?   e/h");
            if(Console.ReadLine() == "e")
            {
                StaticConsolHelper.DbCreate();
                StaticConsolHelper.SelectDbContext();
                StaticConsolHelper.FirstSetup();
            }
        }

        StaticConsolHelper.SelectDbContext();

        while (true)
        {
            Console.WriteLine("1-) Öğrenci Ekle");
            Console.WriteLine("2-) Öğretmen Ekle");
            Console.WriteLine("3-) Sınıf Ekle");
            Console.WriteLine("4-) Veli Ekle");
            Console.WriteLine("5-) Ödev İlanı Ekle");
            Console.WriteLine("6-) Ödev Ekle");
            Console.WriteLine("7-) Ödeve Puan Ekle (Öğretmensin burada)");

            switch (Convert.ToInt32(Console.ReadLine()))
            {
                case 1: StaticConsolHelper.AddStudent(); break;
                case 2: StaticConsolHelper.AddTeacher(); break;
                case 3: StaticConsolHelper.AddClass(); break;
                case 4: StaticConsolHelper.AddParent(); break;
                case 5: StaticConsolHelper.AddPost(); break;
                case 6: StaticConsolHelper.AddHomework(); break;
                case 7: StaticConsolHelper.AddGradeHomework(); break;
            }
        }
    }
}