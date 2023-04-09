using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Extension
{
    static public class ExtensionMethods
    {
        public static double GetMean(this List<int> value)
        {
            int sum = 0;
            foreach (int item in value) { sum += item; }
            return sum / value.Count;
        }

        public static double GetSTD(this List<int> value)
        {
            if (value.Count < 2) { return 0; }
            double mean = value.GetMean();
            List<double> doubleList = value.ToDoubleList();
            doubleList.SetMinusValueForAll(mean);
            doubleList.SetAllSquare();
            double squareSum = doubleList.GetSum();
            double std = Math.Sqrt(squareSum / (value.Count - 1));
            return std;
        }

        public static int GetMin(this List<int> value)
        {
            int res = int.MaxValue;
            foreach (int item in value)
            {
                if (item < res)
                {
                    res = item;
                }
            }
            return res;
        }

        public static int GetMax(this List<int> value)
        {
            int res = int.MinValue;
            foreach (int item in value)
            {
                if (item > res)
                {
                    res = item;
                }
            }
            return res;
        }

        public static void SetAllSquare(this List<double> value)
        {
            for(int i = 0; i < value.Count; i++)
            {
                value[i] = value[i] * value[i];
            }
        }

        public static double GetSum(this List<double> value)
        {
            double sum = 0.0;
            foreach (double item in value) { sum += item; }
            return sum;
        }

        public static List<double> ToDoubleList(this List<int> value)
        {
            List<double> list = new List<double>();
            foreach (int item in value) { list.Add(item); }
            return list;
        }

        public static void SetMinusValueForAll(this List<double> value, double minusValue)
        {
            for(int i = 0; i < value.Count; i++)
            {
                value[i] = minusValue - value[i];
            }
        }

        public static string ToStringForConsole(this List<int> value)
        {
            string text = "";
            foreach (int item in value) { text += item.ToString() + " "; }
            return text;
        }

        public static void WriteType<T>(this T obj)
        {

            if(obj.GetType() == typeof(string))
            {
                Console.WriteLine("bu bir string objesidir");
            }
            else if (obj.GetType() == typeof(int))
            {
                Console.WriteLine("bu bir int objesidir");
            }
            else if (obj.GetType() == typeof(double))
            {
                Console.WriteLine("bu bir double objesidir");
            }
            else if (obj.GetType() == typeof(float))
            {
                Console.WriteLine("bu bir float objesidir");
            }
            else if (obj.GetType() == typeof(decimal))
            {
                Console.WriteLine("bu bir decimal objesidir");
            }
            else if (obj.GetType() == typeof(char))
            {
                Console.WriteLine("bu bir char objesidir");
            }
            else if (obj.GetType() == typeof(byte))
            {
                Console.WriteLine("bu bir byte objesidir");
            }
            else
            {
                Console.WriteLine("Bu objeyi nerden buldun bilmiyom bunu");
            }
        }
        public static NewCustomFormat Is(this double obj) => new NewCustomFormat(obj);

        public static bool Equal(this NewCustomFormat obj, double value) => obj.Value == value;

        public static bool EqualOrBigger(this NewCustomFormat obj, double value) => obj.Value >= value;

        public static bool EqualOrLesser(this NewCustomFormat obj, double value) => obj.Value <= value;

        public static NewCustomFormat Is(this int obj) => new NewCustomFormat(obj);
        public static bool Equal(this NewCustomFormat obj, int value) => obj.Equal((double)value);

        public static bool EqualOrBigger(this NewCustomFormat obj, int value) => obj.EqualOrBigger((double)value);

        public static bool EqualOrLesser(this NewCustomFormat obj, int value) => obj.EqualOrLesser((double)value);
    }


    public class NewCustomFormat
    {
        public double Value { get; set; }
        public NewCustomFormat(double Value)
        {
            this.Value = Value;
        }
    }

}
