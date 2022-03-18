using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace string03
{
    internal class string03
    {
        static bool IsPalind(string str)
        {
            for (int i = 0; i < str.Length/2; i++)
                if (str[i] != str[str.Length - i - 1])
                    return false;
            return true;
        }
        static void Main(string[] args)
        {
            char[] separators = { '.', ',', ':', ';', '=', '(', ')', '&', '[', ']', '"', '\'', '\\', '/', '!', '?', ' ' };
            string s = Console.ReadLine();
            string[] sArray = s.Split(separators);
            SortedSet<string> result = new SortedSet<string>();
            foreach (string str in sArray)
            {
                if ((str != "") && (str != " ") && (IsPalind(str)))
                    result.Add(str);
            }
            string[] arrResult = result.ToArray();
            Console.Write(arrResult[0]);
            for (int i = 1; i < arrResult.Length; i++)
            {
                Console.Write(", "+arrResult[i]);
            }
            Console.WriteLine();
        }
    }
}
