using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace method01
{
    internal class method01
    {
        static int[] GenerateNumbers()
        {
            string[] arr = Console.ReadLine().Split(' ');
            int[] arry1 = new int[arr.Length];
            arry1 = Array.ConvertAll<string, int>(arr, value => int.Parse(value));
            return arry1;
        }

        static void Reverse(int[] a)
        {
            for (int i = 0; i < a.Length/2; i++)
            {
                int temp = a[i];
                a[i] = a[a.Length - i - 1];
                a[a.Length - i - 1] = temp;
            }
        }

        static void PrintNumbers(int[] a)
        {
            foreach (int i in a)
            {
                Console.Write("{0} ", i);
            }
            Console.WriteLine();
        }

        public static void Main(string[] args)
        {
            int[] numbers = GenerateNumbers();
            Reverse(numbers);
            PrintNumbers(numbers);
        }
    }
}
