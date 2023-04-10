/*
 * 
 * ödevi attıktan sonra chatgbt :) ve başka yapanlarınkine bakınca "aaaa böyle mi oluyormuş" dedikten sonra önceki ödevin felaketliğinin nam olarak kurtarma projesi
 * puan olarak geçtide bari bakanlar ayıplamasın dedim
 * 
 * gereksiz ders bölüm çıktı
 * dosya sayısı azaldı ağaç yapısı genişledi
 * bu tam oldumu bilmemde bu oldu bence hızlıca fonksiyon içi doldurdum ama genel yapı iyi ödev geçtiği içinde çok fakit harcayasım gelmedi
 * tabi ödev geçti maksat itibar düzelsin :D
 * 
 */



using Homework_School_Simulation_REMAKE.Business.Abstract;
using Homework_School_Simulation_REMAKE.Business.Concrete;
using Homework_School_Simulation_REMAKE.ConsoleUI;
using Homework_School_Simulation_REMAKE.DatabaseManager.Abstract;
using Homework_School_Simulation_REMAKE.DatabaseManager.Concrete;
using Homework_School_Simulation_REMAKE.Entities.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Concrete;
using Homework_School_Simulation_REMAKE.Utils.Abstract;
using Homework_School_Simulation_REMAKE.Utils.Concrete;

internal class Program
{

    private static void Main(string[] args)
    {
        StaticConsoleUI.FirstSetup();

        while (true) 
        {
            Console.WriteLine("1-) Sınıf Ekle");
            Console.WriteLine("2-) Sınıf Sil");
            Console.WriteLine("3-) Öğrenci Ekle");
            Console.WriteLine("4-) Öğrenci Sil");
            Console.WriteLine("5-) Ödev Ekle");
            Console.WriteLine("6-) Ödev Kontrol Et");
            Console.WriteLine("7-) Öğretmen Değiştir");
            Console.WriteLine("8-) Öğrenci Güncelle");
            Console.WriteLine("9-) Bilgileri Göster");
            int index = Convert.ToInt32(Console.ReadLine());
            Console.Clear();
            switch (index)
            {
                case 1: StaticConsoleUI.AddClass() ; break;
                case 2: StaticConsoleUI.DeleteClass() ; break;
                case 3: StaticConsoleUI.AddStudent() ; break;
                case 4: StaticConsoleUI.DeleteStudent() ; break;
                case 5: StaticConsoleUI.AddHomework() ; break;
                case 6: StaticConsoleUI.CheckHomework() ; break;
                case 7: StaticConsoleUI.ChangeTeacher() ; break;
                case 8: StaticConsoleUI.UpdateStudent() ; break;
                case 9: StaticConsoleUI.WriteInfos() ; break;
            }
        }
    }
}