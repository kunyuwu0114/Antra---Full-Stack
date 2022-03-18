using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace array07
{
    internal class array07
    {
        static int[] InputArray()
        {
            string[] arr = Console.ReadLine().Split(' ');
            int[] arry1 = new int[arr.Length];
            arry1 = Array.ConvertAll<string, int>(arr, value => int.Parse(value));
            return arry1;
        }
        static Dictionary<int,int> counts(int[] arry)
        {
            Dictionary<int, int> myDictionary = new Dictionary<int, int>();
            for (int i = 0; i < arry.Length; i++)
            {
                if (!myDictionary.ContainsKey(arry[i]))
                {
                    int count = 0;
                    for (int j = 0; j < arry.Length; j++)
                        if (arry[i] == arry[j]) count++;
                    myDictionary[arry[i]] = count;
                }
            }
            return myDictionary;
        }
        static void Main(string[] args)
        {
            int[] myArray = InputArray();
            Dictionary<int, int> myDictionary = counts(myArray);
            int[] ele = myDictionary.Keys.ToArray();
            int[] count = myDictionary.Values.ToArray();
            int max = count.Max();
            List<int> maxAppear = new List<int>();
            for (int i = 0; i < ele.Length; i++)
            {
                if (count[i] == max)
                    maxAppear.Add(ele[i]);
            }
            if (maxAppear.Count == 1)
            {
                Console.WriteLine("The number {0} is the most frequent (occurs {1} times)", maxAppear[0], max);
            }
            else
            {
                Console.Write("The numbers {0}",maxAppear[0]);
                for (int i = 1; i < maxAppear.Count; i++)
                {
                    Console.Write(", {0}",maxAppear[i]);
                }
                Console.WriteLine(" have the same maximal frequence (each occurs {0} times). The leftmost of them is {1}.", max, maxAppear[0]);
            }
        }
    }
}
