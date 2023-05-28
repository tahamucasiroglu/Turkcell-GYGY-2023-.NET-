using Business.Abstract;
using Business.Concrete;
using Dapper;
using DataAccess.Concrete.Dapper;
using DataAccess.Concrete.EfCore;
using Entities.Abstract;
using Entities.Concrete;
using Entities.Contexts;
using Entities.Tasks;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities.Constants;
using Utilities.Extensions;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using Utilities.Results.Abstract;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace SchoolV2
{
    static public class StaticConsolHelper
    {
        static private int postsCounter = 1;

        static private string Woman = "Kadın";
        static private string Man = "Erkek";
        static private string Sayisal = "Sayısal";
        static private string Sozel = "Sözel";
        static private string Esit = "Eşit Ağırlık";
        static private string Matematik = "Matematik";
        static private string Fizik = "Fizik";
        static private string Kimya = "Kimya";
        static private string Biyoloji = "Biyoloji";
        static private string Turkce = "Türkçe";

        static private ITask postIsEndTask;
        static private IClassService classService;
        static private IGenderService genderService;
        static private IHomeworkService homeworkService;
        static private ILessonService lessonService;
        static private IParentService parentService;
        static private IPostService postService;
        static private ISectionService sectionService;
        static private IStudentService studentService;
        static private ITeacherService teacherService;

        static private Random random = new Random();
        static public void Test()
        {
            using (var context = new SqlConnection(ContextConstant.DapperConnectionString))
            {
                int count = 0;
                try
                {
                    context.Open();
                    count = context.ExecuteScalar<int>($"SELECT COUNT(*) FROM {new Lesson().GetTableName()}");
                }
                catch (Exception)
                {
                    count = 0;
                }
               Console.WriteLine( count );
            }
        }

        static private void SetEfCore()
        {
            classService = new ClassManager(new EfClassDal());
            genderService = new GenderManager(new EfGenderDal());
            homeworkService = new HomeworkManager(new EfHomeworkDal());
            lessonService = new LessonManager(new EfLessonDal());
            parentService = new ParentManager(new EfParentDal());
            postService = new PostManager(new EfPostDal());
            sectionService = new SectionManager(new EfSectionDal());
            studentService = new StudentManager(new EfStudentDal());
            teacherService = new TeacherManager(new EfTeacherDal());
        }

        static private void SetDapper()
        {
            classService = new ClassManager(new DapperClassDal());
            genderService = new GenderManager(new DapperGenderDal());
            homeworkService = new HomeworkManager(new DapperHomeworkDal());
            lessonService = new LessonManager(new DapperLessonDal());
            parentService = new ParentManager(new DapperParentDal());
            postService = new PostManager(new DapperPostDal());
            sectionService = new SectionManager(new DapperSectionDal());
            studentService = new StudentManager(new DapperStudentDal());
            teacherService = new TeacherManager(new DapperTeacherDal());
        }
        static private int SelectClass(List<Class> classes)
        {
            Console.WriteLine("Hangi sınıf");
            for (int i = 0; i < classes.Count; i++)
            {
                Console.WriteLine(i.ToString() + "-) " + classes[i].Number.ToString() + "-" + classes[i].Name);
            }
            return Convert.ToInt32(Console.ReadLine());
        }

        static private int SelectParent(List<Parent> parents)
        {
            Console.WriteLine("Hangi veli");
            for (int i = 0; i < parents.Count; i++)
            {
                Console.WriteLine(i.ToString() + "-) " + parents[i].Name);
            }
            return Convert.ToInt32(Console.ReadLine());
        }

        static private int SelectSection(List<Section> sections)
        {
            Console.WriteLine("Hangi bölüm");
            for (int i = 0; i < sections.Count; i++)
            {
                Console.WriteLine(i.ToString() + "-) " + sections[i].Name);
            }
            return Convert.ToInt32(Console.ReadLine());
        }

        static private int SelectTeacher(List<Teacher> teachers)
        {
            Console.WriteLine("Hangi öğrentmen");
            for (int i = 0; i < teachers.Count; i++)
            {
                Console.WriteLine(i.ToString() + "-) " + teachers[i].Name);
            }
            return Convert.ToInt32(Console.ReadLine());
        }
        static private int SelectPost(List<Post> posts)
        {
            Console.WriteLine("Hangi post");
            for (int i = 0; i < posts.Count; i++)
            {
                Console.WriteLine(i.ToString() + "-) " + posts[i].Title + "  Kalan süre = " + posts[i].EndDate.Subtract(posts[i].StartDate).ToString());
            }
            return Convert.ToInt32(Console.ReadLine());
        }

        static private int SelectHomework(List<Homework> homeworks)
        {
            Console.WriteLine("Hangi post");
            for (int i = 0; i < homeworks.Count; i++)
            {
                Console.WriteLine(i.ToString() + "-) " + homeworks[i].Title);
            }
            return Convert.ToInt32(Console.ReadLine());
        }

        static public bool DbCreate()
        {
            using (var context = new EfSchoolContext())
            {
                context.Database.EnsureCreated();
                if (!context.Database.CanConnect())
                {
                    return false;
                }
            }
            return true;
            
        }

        static public bool DbCheck()
        {
            using (var context = new EfSchoolContext())
            {
                if (!context.Database.CanConnect())
                {
                    return false;
                }
            }
            using (var context = new SqlConnection(ContextConstant.DapperConnectionString))
            {
                try
                {
                    context.Open();
                }
                catch (Exception)
                {
                    return false;
                }
            }
            return true;
        }

        static public bool TableCheck() 
        {
            using (var context = new SqlConnection(ContextConstant.DapperConnectionString))
            {
                int count = 0;
                try
                {
                    context.Open();
                    count = context.ExecuteScalar<int>($"SELECT COUNT(*) FROM {new Class().GetTableName()}");
                }
                catch (Exception)
                {
                    count = 0;
                }
                return count > 0;
            }
        }

        static public void SelectDbContext()
        {
            Console.WriteLine("Hangi Veritabanı ile iş yapmak istersin");
            Console.WriteLine("1-) Ef Core");
            Console.WriteLine("2-) Dapper");
            int dbSelection = 0;
            try
            {
                dbSelection = Convert.ToInt32(Console.ReadLine());
            }
            catch (Exception)
            {
                dbSelection = 0;
            }

            postIsEndTask = dbSelection switch
            {
                1 => new EfCoreCheckHomeworkIsEndTask<EfSchoolContext>(true, 1000),
                2 => new DapperCheckHomeworkIsEndTask(true, 1000),
                _ => new EfCoreCheckHomeworkIsEndTask<EfSchoolContext>(true, 1000),
            };

            if (dbSelection == 1)
            {
                SetEfCore();
            }
            else if (dbSelection == 2)
            {
                SetDapper();
            }
            else
            {
                SetEfCore();
            }
        }

        static public void FirstSetup()
        {

            Console.WriteLine("Kaç Sınıf istersin");
            int classNumber = 10;
            try
            {
                classNumber = Convert.ToInt32(Console.ReadLine());
            }
            catch (Exception)
            {
                classNumber = 10;
            }

            Console.WriteLine("Kaçar Öğrenci istersin");

            int studentNumber = 10;
            try
            {
                studentNumber = Convert.ToInt32(Console.ReadLine());
            }
            catch (Exception)
            {
                studentNumber = 10;
            }

            genderService.Add(new() {Name = Man });
            genderService.Add(new() { Name = Woman });

            var genders = genderService.GetAll();

            int ManId = genders.Data.First(g => g.Name == Man).Id;
            int WomanId = genders.Data.First(g => g.Name == Woman).Id;

            Console.WriteLine("Erkek = " + ManId.ToString());
            Console.WriteLine("Kadın = " + WomanId.ToString());

            sectionService.Add(new() { Name = Sayisal });
            sectionService.Add(new() { Name = Sozel });
            sectionService.Add(new() { Name = Esit });

            var sections = sectionService.GetAll();

            IResult lessonaddmulti = lessonService.AddMultiple(
                new()
                {
                    new() { Name = Matematik, SectionId = sections.Data.First(s => s.Name ==  Sayisal).Id },            
                    new() { Name = Matematik, SectionId = sections.Data.First(s => s.Name == Esit).Id },
                    new() { Name = Fizik, SectionId = sections.Data.First(s => s.Name == Sayisal).Id },
                    new() { Name = Kimya, SectionId = sections.Data.First(s => s.Name == Sayisal).Id },
                    new() { Name = Biyoloji, SectionId = sections.Data.First(s => s.Name == Sayisal).Id },
                    new() { Name = Turkce, SectionId = sections.Data.First(s => s.Name == Esit).Id },
                    new() { Name = Turkce, SectionId = sections.Data.First(s => s.Name == Sozel).Id }
                });

            var lessons = lessonService.GetAll();

            for (int i = 0; i < classNumber; i++)
            {
                string name = StaticRandomName.GetRandomGirlName();
                string surname = StaticRandomName.GetRandomSurname();
                int gId = i >= 5 ? WomanId : ManId;
                DateTime bd = DateTime.Now.AddDays(-random.Next(30)).AddMonths(-random.Next(12)).AddYears(-random.Next(25, 50)).AddHours(-random.Next(100));
                string email = name + "_" + surname + "@" + (i % 2 == 0 ? "gmail.com" : "outlook.com");
                teacherService.Add(new()
                {
                    Name = name,
                    Surname = surname,
                    GenderId = gId,
                    Birthdate = bd,
                    Email = email,
                    Address = "Türkiye"
            });
            }

            var teachers = teacherService.GetAll();

            for (int i = 0; i  < classNumber * studentNumber; i++)
            {
                string name = StaticRandomName.GetRandomGirlName();
                string surname = StaticRandomName.GetRandomSurname();
                int genderId = random.Next(100) % 2 == 0 ? WomanId : ManId;
                string phone = "0" + random.NextInt64(5001111111, 6000000000).ToString();
                parentService.Add(new()
                {
                    Name = name,
                    Surname = surname,
                    GenderId = genderId,
                    Phone = phone,
                });
            }

            var parents = parentService.GetAll();

            for (int i = 0; i < classNumber; i++)
            {
                IResult resClassService = classService.Add(new()
                {
                    Name = i % 5 == 0 ? "A" : i % 5 == 1 ? "B" : i % 5 == 2 ? "C" : i % 5 == 3 ? "D" : "E",
                    SectionId = sections.Data[i % sections.Data.Count].Id,
                    TeacherId = teachers.Data[i].Id,
                    Size = 30,
                    Number = (int)i/5 + 1,
                });
                Console.WriteLine(resClassService.Message);
            }

            var classes = classService.GetAll();

            Console.WriteLine("class size = " + classes.Data.Count);
            Console.WriteLine("parent size = " + parents.Data.Count);
            for (int i = 0; i < classNumber;i++)
            {
                for (int j = 0; j < studentNumber; j++)
                {
                    string name = StaticRandomName.GetRandomGirlName();
                    string surname = StaticRandomName.GetRandomSurname();
                    studentService.Add(new()
                    {
                        Name = name,
                        Surname = surname,
                        GenderId = (10 * i + j) % 2 == 0 ? WomanId : ManId,
                        Bırthdate = DateTime.Now.AddDays(-random.Next(30)).AddMonths(-random.Next(12)).AddYears(-random.Next(7, 14)).AddHours(-random.Next(100)),
                        Email = name + "_" + surname + "@" + (i % 2 == 0 ? "gmail.com" : "outlook.com"),
                        Address = "Türkiye",
                        ClassId = classes.Data[i].Id,
                        ParentId = parents.Data[10 * i + j].Id
                    });
                }
            }
        }

        static public void AddStudent()
        {
            var classes = classService.GetAll().Data;
            var parents = parentService.GetAll().Data;
            if (classes.Count == 0)
            {
                Console.WriteLine("Önce Sınıf ekle");
                return;
            }
            if (parents.Count == 0)
            {
                Console.WriteLine("Önce Veli ekle");
                return;
            }
            int selectedClass = SelectClass(classes);
            int selectedParent = SelectParent(parents);

            string name = StaticRandomName.GetRandomGirlName();
            string surname = StaticRandomName.GetRandomSurname();
            IResult res = studentService.Add(new()
            {
                Name = name,
                Surname = surname,
                GenderId = genderService.GetAll().Data.First(g => random.Next(100) % 2 == 0 ? g.Name == Woman : g.Name == Man).Id,
                Bırthdate = DateTime.Now.AddDays(-random.Next(30)).AddMonths(-random.Next(12)).AddYears(-random.Next(7, 14)).AddHours(-random.Next(100)),
                Email = name + "_" + surname + "@" + (random.Next(100) % 2 == 0 ? "gmail.com" : "outlook.com"),
                Address = "Türkiye",
                ClassId = classes[selectedClass].Id,
                ParentId = parents[selectedParent].Id
            });

            Console.WriteLine(res.Message);
        }

        static public void AddParent()
        {
            string name = StaticRandomName.GetRandomGirlName();
            string surname = StaticRandomName.GetRandomSurname();
            IResult res = parentService.Add(new()
            {
                Name = name,
                Surname = surname,
                GenderId = genderService.GetAll().Data.First(g => (random.Next(100) % 2 == 0 ? g.Name == Woman : g.Name == Man)).Id,
                Phone = "0" + random.NextInt64(5001111111, 6000000000).ToString()
            });
            Console.WriteLine(res.Message);
        }

        static public void AddTeacher()
        {
            string name = StaticRandomName.GetRandomGirlName();
            string surname = StaticRandomName.GetRandomSurname();
            IResult res = teacherService.Add(new()
            {
                Name = name,
                Surname = surname,
                GenderId = genderService.GetAll().Data.First(g => (random.Next(100) % 2 == 0 ? g.Name == Woman : g.Name == Man)).Id,
                Birthdate = DateTime.Now.AddDays(-random.Next(30)).AddMonths(-random.Next(12)).AddYears(-random.Next(25, 50)).AddHours(-random.Next(100)),
                Email = name + "_" + surname + "@" + (random.Next(100) % 2 == 0 ? "gmail.com" : "outlook.com"),
                Address = "Türkiye"
            });
            Console.WriteLine(res.Message);
        }

        static public void AddClass()
        {
            int randomNumber = random.Next(4);
            var sections = sectionService.GetAll();
            var teachers = teacherService.GetAll();
            IResult res = classService.Add(new() 
            { 
                Name = randomNumber % 4 == 0 ? "A" : randomNumber % 4 == 1 ? "B" : randomNumber % 4 == 3 ? "C" : "D",
                SectionId = sections.Data[random.Next(sections.Data.Count)].Id,
                TeacherId = teachers.Data[random.Next(teachers.Data.Count)].Id,
                Size = random.Next(25,35),
                Number = random.Next(1,8)
            });
            Console.WriteLine(res.Message);
        }

        static public void AddPost()
        {
            var sections = sectionService.GetAll().Data;
            var teachers = teacherService.GetAll().Data;
            if (sections.Count == 0)
            {
                Console.WriteLine("önce Alan ekle");
                return;
            }
            if (teachers.Count == 0)
            {
                Console.WriteLine("önce öğretmen ekle");
                return;
            }
            int selectedSection = SelectSection(sections);
            int selectedTeacher = SelectTeacher(teachers);
            Console.WriteLine("Kaç Saniye Açık Kalsın(Zaman kontrolü yapan şeyi test etmek için)");
            int time = Convert.ToInt32(Console.ReadLine());
            IResult res = postService.Add(new()
            {
                Title = $"Ödev - {postsCounter++}",
                SectionId = selectedSection,
                TeacherId = selectedTeacher,
                IsEnd = false,
                StartDate = DateTime.Now,
                EndDate = DateTime.Now.AddSeconds(time),
            });
            Console.WriteLine(res.Message);
        }

        static public void AddHomework()
        {
            var sections = sectionService.GetAll().Data;
            int selectedSection = SelectSection(sections);
            var posts = postService.GetByNonEnding(selectedSection).Data;
            if(posts.Count == 0)
            {
                Console.WriteLine("Açık ödev konusu yok lütfen sonra tekrar deneyin");
                return; 
            }
            int selectedPost = SelectPost(posts);
            var students = studentService.GetAll().Data;
            var classes = classService.GetAll().Data.Where(c => c.SectionId == posts[selectedPost].Id).ToList();
            var st = students.Where(s => classes.Any(c => c.Id == s.ClassId)).ToList();
            IResult res = homeworkService.Add(new()
            {
                Title = "Ödev - " + random.Next(1000).ToString(),
                Text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vel venenatis nisl. Nulla turpis lectus, bibendum non elit sed, volutpat faucibus justo. Suspendisse quis metus placerat, egestas donec.",
                PostId = posts[selectedPost].Id,
                Date = DateTime.Now,
                StudentId = st[random.Next(st.Count())].Id,
                Grade = null,
            });
            Console.WriteLine(res.Message);
        }

        static public void AddGradeHomework()
        {
            var teachers = teacherService.GetAll().Data;
            int selectedTeacher = SelectTeacher(teachers);
            var posts = postService.GetByTeacherId(teachers[selectedTeacher].Id).Data;
            int selectedPost = SelectPost(posts);
            var homeworks = homeworkService.GetByPostingId(posts[selectedPost].Id).Data;
            int selectedHomework = SelectHomework(homeworks.Where(h => h.Grade == null).ToList()); //grade eklenecekse null olmalı
            Console.WriteLine("Notu giriniz:");
            int grade = Convert.ToInt32(Console.ReadLine());
            Homework homework = homeworks[selectedHomework];
            homework.Grade = grade;
            IResult res = homeworkService.Update(homework);
            Console.WriteLine(res.Message);
        }




    }
}
