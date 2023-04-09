using Homework_School_Simulation.GenderFolder;
using Homework_School_Simulation.GenderFolder.Types;
using Homework_School_Simulation.HumanFolder;
using Homework_School_Simulation.SchoolClassFolder;
using Homework_School_Simulation.StudentFolder;
using Homework_School_Simulation.TeacherFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Homework_School_Simulation.Extensions
{
    static internal class ListHumanExtension
    {
        static public T GetById<T>(this List<T> value, int id) where T : IHuman => value.FirstOrDefault(p => p.GetId() == id, default(T));
        static public T GetByItem<T>(this List<T> value, IHuman human) where T : IHuman => value.FirstOrDefault(p => p.Is(human), default(T));
        static public bool RemoveById<T>(this List<T> value, int id) where T : IHuman => value.RemoveAll(p => p.GetId() == id) > 0;
        static public bool RemoveByItem<T>(this List<T> value, IHuman human) where T : IHuman => value.RemoveAll(p => p.Is(human)) > 0;
        static public int GetIndexById<T>(this List<T> value, int id) where T : IHuman => value.FindIndex(p => p.GetId() == id);
        static public int GetIndexByItem<T>(this List<T> value, IHuman human) where T : IHuman => value.FindIndex(p => p.Is(human));
        static public T GetAndRemoveById<T>(this List<T> value, int id) where T : IHuman
        {
            T human = value.GetById(id);
            if (!human.IsDefault()) { value.RemoveByItem(human); }
            return human;
        }
        static public T GetAndRemoveByItem<T>(this List<T> value, IHuman human) where T : IHuman
        {
            T hmn = value.GetByItem(human);
            if (!hmn.IsDefault()) { value.RemoveByItem(hmn); }
            return hmn;
        }
        static public bool SetById<T>(this List<T> value, int id, T NewHuman) where T : IHuman
        {
            int index = value.GetIndexById(id);
            if (index < 0) { return false; }
            value[index] = NewHuman;
            return true;
        }
        static public bool SetByItem<T>(this List<T> value, T human, T NewHuman) where T : IHuman
        {
            int index = value.GetIndexByItem(human);
            if (index < 0) { return false; }
            value[index] = NewHuman;
            return true;
        }

        static public List<string> GetNameList<T>(this List<T> value) where T : IHuman => value.Select(p => p.GetName()).ToList();

        static public int GetBoyCount<T>(this List<T> value) where T : IHuman => value.Where(p => p.GetGender().IsBoy()).ToList().Count;
        static public int GetGirlCount<T>(this List<T> value) where T : IHuman => value.Where(p => p.GetGender().IsGirl()).ToList().Count;





    }
}
