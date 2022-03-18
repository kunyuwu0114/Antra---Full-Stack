using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace array05
{
    internal class array05
    {
        static int[] InputArray()
        {
            string[] arr = Console.ReadLine().Split(' ');
            int[] arry1 = new int[arr.Length];
            arry1 = Array.ConvertAll<string, int>(arr, value => int.Parse(value));
            return arry1;
        }

        static int LongestElement(int[] arry, out int len)
        {
            len = 0;
            int ele = 0;
            for (int i = 0; i < arry.Length; i++)
            {
                int currentElement = arry[i++];
                int currentLen = 1;
                while ((i < arry.Length) && (currentElement == arry[i]))
                {
                    currentLen++;
                    i++;
                }
                i--;
                if (len < currentLen)
                {
                    len = currentLen;
                    ele = currentElement;
                }
            }
            return ele;
        }
        static void Main(string[] args)
        {
            int[] myArray = InputArray();
            int len = 0;
            int ele = LongestElement(myArray, out len);
            for (int i = 0; i < len; i++)
            {
                Console.Write("{0} ",ele);
            }
            Console.WriteLine();
        }
    }
}
