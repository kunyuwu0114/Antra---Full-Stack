using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace array04
{
    internal class array04
    {
        static int[] InputArray()
        {
            string[] arr = Console.ReadLine().Split(' ');
            int[] arry1 = new int[arr.Length];
            arry1 = Array.ConvertAll<string, int>(arr, value => int.Parse(value));
            return arry1;
        }
        static void Main(string[] args)
        {
            int[] myArray = InputArray();
            int k = int.Parse(Console.ReadLine());
            int[] sum = new int[myArray.Length];
            for (int r = 1; r <= k; r++)
            {
                for (int l = 0; l < myArray.Length; l++)
                {
                    sum[(l + r) % myArray.Length] += myArray[l];
                }
            }
            foreach (int s in sum)
            {
                Console.Write("{0} ",s);
            }
            Console.WriteLine();
        }
    }
}
