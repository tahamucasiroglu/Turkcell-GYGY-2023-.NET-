using Homework_School_Simulation.Extensions;
using Homework_School_Simulation.GenderFolder;
using Homework_School_Simulation.GenderFolder.Types;
using Homework_School_Simulation.HomeworkFolder;
using Homework_School_Simulation.LessonFolder;
using Homework_School_Simulation.RandomHumanFolder;
using Homework_School_Simulation.SchoolClassFolder;
using Homework_School_Simulation.SchoolFolder;
using Homework_School_Simulation.SectionFolder;
using Homework_School_Simulation.StudentFolder;
using Homework_School_Simulation.TeacherFolder;
using Homework_School_Simulation.VirtualDatabase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation
{
    static internal class StaticConsoleUI
    {
        static private ISchool school;
        static private string schoolName;
        static private List<string> schoolNameList = new List<string>() { "Anadolu Lisesi", "Öğretmen Lisesi", "Fen Lisesi"};
        static private List<IGender> genders = new List<IGender>()
        {
            new Boy(),
            new Girl(),
        };
        static private List<ISection> sections = new List<ISection>() 
        {
            new Section("Eşit Ağırlık"),
            new Section("Sayısal"),
            new Section("Sözel"),
        };
        static private List<ILesson> lessons = new List<ILesson>()
        {
            new Lesson("Matematik"),
            new Lesson("Türkçe"),
            new Lesson("Felsefe"),
            new Lesson("İngilizce"),
            new Lesson("Fizik"),
            new Lesson("Biyoloji"),
            new Lesson("Kimya"),
        };
        static private IGender randomGender() => genders[new Random().Next(0, genders.Count)];
        static private ISection randomSection() => sections[new Random().Next(0, sections.Count)];
        static private ILesson randomLesson() => lessons[new Random().Next(0, lessons.Count)];
        static public void WelcomeAndChooseSchool()
        {
            try
            {
                int counter = 1;
                Console.WriteLine("Hoş Geldin Okulu seçimini yapınız (Sadece ad İçin)");
                foreach (string schoolname in schoolNameList) { Console.WriteLine($"{counter++}-) {schoolname}"); }
                schoolName = schoolNameList[Convert.ToInt32( Console.ReadLine())-1];
                school = new School(schoolName, new List<ISchoolClass>());
            }
            catch (Exception)
            {
                Console.Clear();
                Console.WriteLine("Hatalı Giriş");
                WelcomeAndChooseSchool();
            } 
        }

        static public void GetClassFromUser()
        {
            int classCount = 0;
            int stundentCount = 0;
            try
            {
                Console.WriteLine("Sınıf Ayarlama kısmı");
                Console.WriteLine("Kaç Sınıf İstersin");
                classCount = Convert.ToInt32( Console.ReadLine() );
                Console.WriteLine("Kaçar Öğrenci Olsun");
                stundentCount = Convert.ToInt32( Console.ReadLine() );
            }
            catch (Exception)
            {
                Console.Clear();
                Console.WriteLine("Hatalı Giriş");
                GetClassFromUser();
            }
            ISection classSection = randomSection();
            for (int cls = 0; cls < classCount; cls++)
            {
                List<IStudent> students = new List<IStudent>();
                for (int std = 0; std < stundentCount; std++)
                {
                    students.Add(RandomHuman.GetRandomStudent(null, null, randomGender(), classSection));
                }
                ITeacher newTeacher = RandomHuman.GetRandomTeacher(null,null,randomGender(),randomLesson());
                ISchoolClass newclass = new SchoolClass($"Sınıf {cls+1}", classSection, newTeacher, students);
                school.AddClass(newclass);
            } 
        }

        static public void GetSchoolInfos()
        {
            string text = "";
            text += $"Okul Adı: {school.GetName()}\n";
            foreach (ISchoolClass cls in school.GetClasses())
            {
                text += $"Sınıf adı = {cls.GetName()}\nSınıf Öğretmeni = {cls.GetTeacherName()}\nSınıf Mevcudu = {cls.GetStudentsCount()}\nSınıf Branşı = {cls.GetSection().GetSection()}\nErkek Sayısı = {cls.GetStudents().GetBoyCount()}\nKız Sayısı = {cls.GetStudents().GetGirlCount()}\n\n\n";
            }
            Console.WriteLine(text);
        }

        static public void AddClass()
        {
            try
            {
            int stundentCount = 0;
            Console.WriteLine("KaçÖğrenci Olsun");
            stundentCount = Convert.ToInt32(Console.ReadLine());
            ISection classSection = randomSection();
            List<IStudent> students = new List<IStudent>();
            for (int std = 0; std < stundentCount; std++)
            {
                students.Add(RandomHuman.GetRandomStudent(null, null, randomGender(), classSection));
            }
            ITeacher newTeacher = RandomHuman.GetRandomTeacher(null, null, randomGender(), randomLesson());
            ISchoolClass newclass = new SchoolClass($"Sınıf {school.GetClassesCount()}", classSection, newTeacher, students);
            school.AddClass(newclass);
            }
            catch (Exception) 
            {
                Console.Clear();
                Console.WriteLine("Hatalı İşlem");
                AddClass();
            }
        }
        static public void DeleteClass()
        {
            if(school.GetClassesCount() == 0)
            {
                Console.WriteLine("Silinicek Sınıf yok");
            }
            else
            {
                try
                {
                    int selectedClass = 0;
                    List<ISchoolClass> classes = school.GetClasses();
                    Console.WriteLine("Silinecek sınıfı seçiniz");
                    for (int i = 0; i < classes.Count; i++)
                    {
                        Console.WriteLine($"{i}-) {classes[i].GetName()} öğrenci sayısı = {classes[i].GetStudentsCount()}");
                    }
                    selectedClass = Convert.ToInt32(Console.ReadLine());
                    school.DeleteClass(selectedClass);
                }
                catch (Exception)
                {
                    Console.Clear();
                    Console.WriteLine("Hatalı İşlem");
                    DeleteClass();
                }
            }
        }
        static public void AddStudent()
        {
            if (school.GetClassesCount() == 0)
            {
                Console.WriteLine("eklenecek Sınıf yok");
            }
            else
            {
                try
                {
                    List<ISchoolClass> schoolClasses = school.GetClasses();
                    Console.WriteLine("Hangi Sınıfa Ekelyeceksin");
                    int selectedClass = 0;
                    for (int std = 0; std < schoolClasses.Count; std++)
                    {
                        Console.WriteLine($"{std}-) {schoolClasses[std].GetName()}");
                    }
                    selectedClass = Convert.ToInt32(Console.ReadLine());
                    Console.WriteLine("1-) Elle Gir\n2-)Otomatik Ekle");
                    if (Console.ReadLine() == "1")
                    {
                        Console.WriteLine("Adı:");
                        string name = Console.ReadLine() ?? "";
                        Console.WriteLine("Sotadı:");
                        string surname = Console.ReadLine() ?? "";
                        Console.WriteLine("cinsiyet: e/k");
                        string gender = Console.ReadLine() ?? "e";
                        IStudent newstudent = RandomHuman.GetRandomStudent(name, surname, gender == "e" ? new Boy() : new Girl(), schoolClasses[selectedClass].GetSection());
                        schoolClasses[selectedClass].AddStudent(newstudent);
                        school.SetClasses(schoolClasses);
                        Console.WriteLine($"{newstudent.GetName()} {newstudent.GetSurname()} {newstudent.GetGenderName()} {newstudent.GetSection()} EKLENDİ");
                    }
                    else
                    {
                        IStudent newstudent = RandomHuman.GetRandomStudent(null, null, randomGender(), schoolClasses[selectedClass].GetSection());
                        schoolClasses[selectedClass].AddStudent(newstudent);
                        school.SetClasses(schoolClasses);
                        Console.WriteLine($"{newstudent.GetName()} {newstudent.GetSurname()} {newstudent.GetGenderName()} {newstudent.GetSection()} EKLENDİ");
                    }
                }
                catch (Exception)
                {
                    Console.Clear();
                    Console.WriteLine("Hatalı İşlem");
                    AddStudent();
                }
            }
        }

        static public void DeleteStudent()
        {
            if (school.GetClassesCount() == 0)
            {
                Console.WriteLine("Silinicek öğrenci Sınıf yok");
            }
            else
            {
                try
                {
                    List<ISchoolClass> schoolClasses = school.GetClasses();
                    Console.WriteLine("Hangi Sınıfatan sileceksin");
                    int selectedClass = 0;
                    for (int std = 0; std < schoolClasses.Count; std++)
                    {
                        Console.WriteLine($"{std}-) {schoolClasses[std].GetName()}");
                    }
                    selectedClass = Convert.ToInt32(Console.ReadLine());
                    List<IStudent> students = schoolClasses[selectedClass].GetStudents();
                    if(students.Count == 0)
                    {
                        Console.WriteLine("Burada Öğrenci Yok");
                    }
                    else
                    {
                        Console.WriteLine("Öğrenciyi seç");
                        for (int std = 0; std < students.Count; std++)
                        {
                            Console.WriteLine($"{std}-) {students[std].GetName()} {students[std].GetSurname()}");
                        }
                        int selectedStudent = Convert.ToInt32(Console.ReadLine());
                        schoolClasses[selectedClass].DeleteStudent(students[selectedStudent]);
                        school.SetClasses(schoolClasses);
                    }
                }
                catch (Exception)
                {
                    Console.Clear();
                    Console.WriteLine("Hatalı İşlem");
                    DeleteStudent();
                }
            }
        }

        static public void ChangeTeacher()
        {
            try
            {
                List<ISchoolClass> schoolClasses = school.GetClasses();
                Console.WriteLine("Hangi Sınıfta öğretmen değişecek");
                int selectedClass = 0;
                for (int std = 0; std < schoolClasses.Count; std++)
                {
                    Console.WriteLine($"{std}-) {schoolClasses[std].GetName()}");
                }
                selectedClass = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("1-)Elle gir\n2-)otomatik ata");
                if (Console.ReadLine() == "1")
                {
                    Console.WriteLine("Adı:");
                    string name = Console.ReadLine() ?? "";
                    Console.WriteLine("Sotadı:");
                    string surname = Console.ReadLine() ?? "";
                    Console.WriteLine("cinsiyet: e/k");
                    string gender = Console.ReadLine() ?? "e";
                    schoolClasses[selectedClass].ChangeTeacher(RandomHuman.GetRandomTeacher(name, surname, gender == "e" ? new Boy() : new Girl(), randomLesson()));
                }
                else
                {
                    schoolClasses[selectedClass].ChangeTeacher(RandomHuman.GetRandomTeacher(null, null, randomGender(), randomLesson()));
                }
                school.SetClasses(schoolClasses);
            }
            catch (Exception)
            {
                Console.Clear();
                Console.WriteLine("Hatalı İşlem");
                ChangeTeacher();
            }
        }

        static public void AddHomework()
        {
            try
            {
                if(school.GetClassesCount() == 0)
                {
                    Console.WriteLine("Sınıf Olmadan Nasıl Ödev Göndercen");
                }
                else
                {
                    List<ISchoolClass> schoolClasses = school.GetClasses();
                    Console.WriteLine("Hangi Sınıf");
                    int selectedClass = 0;
                    for (int std = 0; std < schoolClasses.Count; std++)
                    {
                        Console.WriteLine($"{std}-) {schoolClasses[std].GetName()}");
                    }
                    selectedClass = Convert.ToInt32(Console.ReadLine());
                    if (schoolClasses[selectedClass].GetStudentsCount() == 0)
                    {
                        Console.WriteLine("Burada Öğrenci Yok ");
                    }
                    else
                    {
                        List<IStudent> students = schoolClasses[selectedClass].GetStudents();
                        Console.WriteLine("Öğrenciyi seç");
                        for (int std = 0; std < students.Count; std++)
                        {
                            Console.WriteLine($"{std}-) {students[std].GetName()} {students[std].GetSurname()}");
                        }
                        int selectedStudent = Convert.ToInt32(Console.ReadLine());

                        ILesson lesson = randomLesson();
                        IHomework homework = new HomeWork($"{lesson.GetLesson()}-{StaticCounts.HomeworkCount}", lesson);
                        students[selectedStudent].SetHomework(homework);
                        schoolClasses[selectedClass].SetStudents(students);
                        school.SetClasses(schoolClasses);
                    }
                }
            }
            catch (Exception)
            {
                Console.Clear();
                Console.WriteLine("Hatalı İşlem");
                AddHomework();
            }
        }

        static public void CheckClassHomework()
        {
            if (school.GetClassesCount() == 0)
            {
                Console.WriteLine("Sınıf yok Aküde yok");
            }
            else
            {
                try
                {
                    List<ISchoolClass> schoolClasses = school.GetClasses();
                    Console.WriteLine("Hangi Sınıfın ödevlerini kontrol edeceksin");
                    int selectedClass = 0;
                    for (int std = 0; std < schoolClasses.Count; std++)
                    {
                        Console.WriteLine($"{std}-) {schoolClasses[std].GetName()}");
                    }
                    selectedClass = Convert.ToInt32(Console.ReadLine());
                    List<IStudent> students = schoolClasses[selectedClass].GetStudents();
                    if (students.Count == 0)
                    {
                        Console.WriteLine("Burada Öğrenci Yok");
                    }
                    else
                    {
                    
                        List<IStudent> homeworkStudents = students.GetHomeworkStudents();
                        Console.WriteLine($"Ödev Gönderen Öğrenci Sayısı:{homeworkStudents.Count}");
                        for (int std = 0; std < homeworkStudents.Count; std++)
                        {
                            Console.WriteLine($"{std}-) {homeworkStudents[std].GetName()} {homeworkStudents[std].GetSurname()}\nÖdev Konusu: {homeworkStudents[std].GetHomework().GetHomeworkLesson().GetLesson()}\nÖdev Metni: {homeworkStudents[std].GetHomework().GetHomework()}");
                        }
                    }
                }
                catch (Exception)
                {
                    Console.Clear();
                    Console.WriteLine("Hatalı İşlem");
                    DeleteStudent();
                }
            }
        }
    }
}
