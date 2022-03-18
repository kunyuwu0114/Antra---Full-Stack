using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace string01
{
    internal class string01
    {
        static void Main(string[] args)
        {
            string s = Console.ReadLine();
            Console.WriteLine("method 1: Convert the string to char array, reverse it, then convert it to string again:");
            char[] c = s.ToCharArray();
            int n = c.Length;
            for (int i = 0; i < n/2; i++)
            {
                char temp = c[i];
                c[i] = c[n - i - 1];
                c[n - i - 1] = temp;
            }
            string m1str = new string(c);
            Console.WriteLine(m1str);
            Console.WriteLine("Print the letters of the string in back direction (from the last to the first) in a for-loop:");
            for (int i = n-1; i >= 0; i--)
            {
                Console.Write(s[i]);
            }
            Console.WriteLine();
        }
    }
}
