using Homework_School_Simulation.GenderFolder;
using Homework_School_Simulation.GenderFolder.Types;
using Homework_School_Simulation.LessonFolder;
using Homework_School_Simulation.SectionFolder;
using Homework_School_Simulation.StudentFolder;
using Homework_School_Simulation.TeacherFolder;
using Homework_School_Simulation.VirtualDatabase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Collections.Specialized.BitVector32;

namespace Homework_School_Simulation.RandomHumanFolder
{
    static internal class RandomHuman
    {
        static public Student GetRandomStudent(string? name, string? surname, IGender gender, ISection section) =>
            new Student(
                string.IsNullOrEmpty(name) ? (gender.Is(new Boy()) ? StaticFullNamesDataset.GetRandomBoyName() : StaticFullNamesDataset.GetRandomGirlName()) : name,
                string.IsNullOrEmpty(surname) ? StaticFullNamesDataset.GetRandomSurname() : surname,
                gender,
                section
                );
        static public Teacher GetRandomTeacher(string? name, string? surname, IGender gender, ILesson lesson) =>
            new Teacher
            (
                string.IsNullOrEmpty(name) ? (gender.Is(new Boy()) ? StaticFullNamesDataset.GetRandomBoyName() : StaticFullNamesDataset.GetRandomGirlName()) : name,
                string.IsNullOrEmpty(surname) ? StaticFullNamesDataset.GetRandomSurname() : surname,
                gender,
                lesson
            );
        static public List<IStudent>  GetRandomListStudent(int count, string? name, string? surname, IGender gender, ISection section)
        {
            if (count <= 1) { return new List<IStudent> () { GetRandomStudent(name, surname, gender, section) }; }
            List<IStudent>  students = new List<IStudent> ();
            for (int i = 0; i < count; i++)
            {
                students.Add(GetRandomStudent(name, surname, gender, section));
            }
            return students;
        }

        static public List<Teacher> GetRandomListTeacher(int count, string? name, string? surname, IGender gender, ILesson lesson)
        {
            if (count <= 1) { return new List<Teacher>() { GetRandomTeacher(name, surname, gender, lesson) }; }
            List<Teacher> teachers = new List<Teacher>();
            for (int i = 0; i < count; i++)
            {
                teachers.Add(GetRandomTeacher(name, surname, gender, lesson));
            }
            return teachers;
        }
    }
}
