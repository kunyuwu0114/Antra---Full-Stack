using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace array03
{
    internal class array03
    {
        static bool IsPrime(int a)
        {
            for (int i = 2; i <= Math.Sqrt(a); i++)
            {
                if (a % i == 0) return false;
            }
            return true;
        }

        static int[] FindPrimesInRange(int startNum, int endNum) { 
            List<int> primes = new List<int>();
            for (int i = startNum; i <= endNum; i++)
            {
                if (IsPrime(i)) primes.Add(i);
            }
            return primes.ToArray();
        }

        static void Main(string[] args)
        {
            int[] priems = FindPrimesInRange(2, 100);
            foreach (int i in priems)
            {
                Console.Write("{0} ",i);
            }
            Console.WriteLine();
        }
    }
}
