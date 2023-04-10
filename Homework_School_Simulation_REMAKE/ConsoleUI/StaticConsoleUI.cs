using Homework_School_Simulation_REMAKE.Business.Abstract;
using Homework_School_Simulation_REMAKE.Business.Concrete;
using Homework_School_Simulation_REMAKE.DatabaseManager.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Abstract;
using Homework_School_Simulation_REMAKE.Entities.Concrete;
using Homework_School_Simulation_REMAKE.Utils.Abstract;
using Homework_School_Simulation_REMAKE.Utils.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation_REMAKE.ConsoleUI
{
    static internal class StaticConsoleUI
    {
        static private IDatabaseManager databaseManager = new DatabaseManager.Concrete.DatabaseManager();
        static private ISchoolService schoolService = new SchoolService();
        static public IHomework GetRandomHomework()
        {
            return new Homework(DateTime.Now.ToString(),databaseManager.GetId().ToString());
        }
        static public IStudent GetRandomStudent()
        {
            int rand = new Random().Next(0, 2);
            string name = rand == 0 ? databaseManager.GetRandomBoyName() : databaseManager.GetRandomGirlName();
            string surname = databaseManager.GetRandomSurname();
            IGender gender = rand == 0 ? new Gender(true) : new Gender(false);
            return new Student(name, surname, gender, databaseManager);
        }
        static public ITeacher GetRandomTeacher()
        {
            int rand = new Random().Next(0, 2);
            string name = rand == 0 ? databaseManager.GetRandomBoyName() : databaseManager.GetRandomGirlName();
            string surname = databaseManager.GetRandomSurname();
            IGender gender = rand == 0 ? new Gender(true) : new Gender(false);
            return new Teacher(name, surname, gender, databaseManager);
        }
        static public void FirstSetup()
        {
            try
            {
                Console.WriteLine("Hoşgeldiniz kaç sınıf istersiniz");
                int classCount = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Kaçar Öğrenci olsun");
                int studentCount = Convert.ToInt32(Console.ReadLine());
                for (int i = 0; i < classCount; i++)
                {
                    List<IStudent> students = new List<IStudent>();
                    for (int j = 0; j < studentCount; j++)
                    {
                        students.Add(GetRandomStudent());
                    }
                    IClass @class = new Class(GetRandomTeacher(), students, databaseManager);
                    IClassService classService = new ClassService(@class);
                    schoolService.AddClass(classService);
                }
            }
            catch (Exception e)
            {
                Console.Clear();
                Console.WriteLine("Hatalı giriş" + e.Message);
                FirstSetup();
            }
        }

        static public void AddClass() 
        {
            try
            {
                Console.WriteLine("Kaç Öğrenci olsun");
                int studentCount = Convert.ToInt32(Console.ReadLine());
                List<IStudent> students = new List<IStudent>();
                for (int j = 0; j < studentCount; j++)
                {
                    students.Add(GetRandomStudent());
                }
                IClass @class = new Class(GetRandomTeacher(), students, databaseManager);
                IClassService classService = new ClassService(@class);
                schoolService.AddClass(classService);
            }
            catch (Exception e)
            {
                Console.Clear();
                Console.WriteLine("Hatalı giriş" + e.Message);
                AddClass();
            }
        }


        static public void DeleteClass() 
        {
            try
            {
                Console.WriteLine("Hangi Sınıf Silinsin");
                List<IClassService> classes = schoolService.GetClassesService();
                for (int i = 0; i < classes.Count; i++)
                {
                    Console.WriteLine($"{i}-)\n{classes[i].ToString()}");
                }
                int index = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine(index);

                schoolService.RemoveClass(index);
            }
            catch (Exception e)
            {
                Console.Clear();
                Console.WriteLine("Hatalı giriş" + e.Message);
                DeleteClass();
            }

        }
        static public void AddStudent() 
        {
            try
            {
                Console.WriteLine("Hangi Sınıfa eklenecek");
                List<IClassService> classesService = schoolService.GetClassesService();
                for (int i = 0; i < classesService.Count; i++)
                {
                    Console.WriteLine($"{i}-)\n{classesService[i].ToString()}");
                }
                int index = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("1-) Elle\n2-)Otomatik");
                string input = Console.ReadLine();
                IStudent student;
                if(input == "1")
                {
                    Console.WriteLine("Adı");
                    string name = Console.ReadLine() ?? "";
                    Console.WriteLine("Soyadı");
                    string surname = Console.ReadLine() ?? "";
                    Console.WriteLine("cinsiyet e/k");
                    IGender gender = Console.ReadLine() == "e" ? new Gender(true) : new Gender(false);
                    student = new Student(name, surname, gender, databaseManager);
                }
                else
                {
                    student = GetRandomStudent();
                }
                schoolService.GetClassesService()[index].AddStudent(student);
            }
            catch (Exception e)
            {
                Console.Clear();
                Console.WriteLine("Hatalı giriş" + e.Message);
                AddStudent();
            }
        }
        static public void DeleteStudent() 
        {
            try
            {
                Console.WriteLine("Hangi Sınıfan silinecek");
                List<IClassService> classes = schoolService.GetClassesService();
                for (int i = 0; i < classes.Count; i++)
                {
                    Console.WriteLine($"{i}-)\n{classes[i].ToString()}");
                }
                int index = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Hangi Öğrenci");
                List<IStudent> students = classes[index].GetStudents();
                for (int i = 0; i < students.Count; i++)
                {
                    Console.WriteLine($"{i}-)\n{students[i].ToString()}");
                }
                int studentIndex = Convert.ToInt32(Console.ReadLine());
                schoolService.GetClassesService()[index].RemoveStudent(studentIndex);
            }
            catch (Exception e)
            {
                Console.Clear();
                Console.WriteLine("Hatalı giriş" + e.Message);
                DeleteStudent();
            }
        }
        static public void AddHomework() 
        {
            try
            {
                Console.WriteLine("Hangi Sınıfa Ödev ekleyeceksin ekleyeceksin");
                List<IClassService> classes = schoolService.GetClassesService();
                for (int i = 0; i < classes.Count; i++)
                {
                    Console.WriteLine($"{i}-)\n{classes[i].ToString()}");
                }
                int index = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Hangi Öğrenci");
                List<IStudent> students = classes[index].GetStudents();
                for (int i = 0; i < students.Count; i++)
                {
                    Console.WriteLine($"{i}-)\n{students[i].ToString()}");
                }
                int studentIndex = Convert.ToInt32(Console.ReadLine());
                schoolService.GetClassesService()[index].GetStudents()[studentIndex].SetHomework(GetRandomHomework());
            }
            catch (Exception e)
            {
                Console.Clear();
                Console.WriteLine("Hatalı giriş" + e.Message);
                AddHomework();
            }
        }
        static public void CheckHomework() 
        {
            foreach (IClassService item in schoolService.GetClassesService())
            {
                List<IStudent> students = item.GetStudentsHasHomework();
                Console.WriteLine(item.GetClass().GetTeacher().ToString());
                Console.WriteLine("Ödev veren sayısı = " + students.Count.ToString());
                Console.WriteLine("Öğrenciler:");
                foreach (IStudent student in students) 
                {
                    Console.WriteLine(student.ToString());
                }
            }
        }
        static public void WriteInfos() 
        {
            Console.WriteLine(schoolService.ToString());
        }
        static public void ChangeTeacher() 
        {
            try
            {
                Console.WriteLine("Hangi Sınıftan değiştireceksin");
                List<IClassService> classes = schoolService.GetClassesService();
                for (int i = 0; i < classes.Count; i++)
                {
                    Console.WriteLine($"{i}-)\n{classes[i].ToString()}");
                }
                int index = Convert.ToInt32(Console.ReadLine());
                ITeacher oldTeacher = schoolService.GetClassesService()[index].GetClass().GetTeacher();
                ITeacher newTeacher = GetRandomTeacher();
                schoolService.GetClassesService()[index].ChangeTeacher(newTeacher);
                Console.WriteLine(oldTeacher.ToString()+ "\n olan öğretmen \n" + newTeacher.ToString() + "\n oalrak değişti,");
            }
            catch (Exception e)
            {
                Console.Clear();
                Console.WriteLine("Hatalı giriş" + e.Message);
                DeleteStudent();
            }
        }
        static public void UpdateStudent() 
        {
            try
            {
                Console.WriteLine("Hangi Sınıfan Değiştirecen");
                List<IClassService> classes = schoolService.GetClassesService();
                for (int i = 0; i < classes.Count; i++)
                {
                    Console.WriteLine($"{i}-)\n{classes[i].ToString()}");
                }
                int index = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Hangi Öğrenci");
                List<IStudent> students = classes[index].GetStudents();
                for (int i = 0; i < students.Count; i++)
                {
                    Console.WriteLine($"{i}-)\n{students[i].ToString()}");
                }
                int studentIndex = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine(schoolService.GetClassesService()[index].GetStudents()[studentIndex].ToString());
                Console.WriteLine("Olan Öğrenci");
                schoolService.GetClassesService()[index].GetStudents()[studentIndex].SetSurname(databaseManager.GetRandomSurname());
                Console.WriteLine(schoolService.GetClassesService()[index].GetStudents()[studentIndex].ToString());
                Console.WriteLine("Olarak Değişti");
            }
            catch (Exception e) 
            {
                Console.Clear();
                Console.WriteLine("Hatalı giriş" + e.Message);
                DeleteStudent();
            }
        }

    }
}
