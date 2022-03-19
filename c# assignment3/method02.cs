using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace method02
{
    internal class method02
    {

        static int Fibonacci(int n)
        {
            if ((n == 1) || (n == 2)) return 1;
            else return Fibonacci(n - 1) + Fibonacci(n - 2);
        }

        public static void Main(string[] args)
        {
            for (int i = 1; i <= 10; i++)
            {
                Console.WriteLine("the {0}th number of Fibonacci sequence is {1}.",i,Fibonacci(i));
            }
        }
    }
}
