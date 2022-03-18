using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace string02
{
    internal class string02
    {
        static void Main(string[] args)
        {
            char[] separators = {'.', ',', ':', ';', '=', '(', ')', '&', '[', ']', '"', '\'', '\\', '/', '!', '?', ' ' };
            string s = Console.ReadLine();
            string[] sArray = s.Split(separators);
            
            int f = 0; int r = sArray.Length-1;
            while (f < r)
            {
                if (sArray[f] == "") f++;
                else if (sArray[r] == "") r--;
                else
                {
                    string temp = sArray[f];
                    sArray[f] = sArray[r];
                    sArray[r] = temp;
                    f++;r--;
                }
            }
            int k = 0;
            foreach (string e in sArray)
            {
                Console.WriteLine("{0}:{1}",k++,e); 
            }
            int i = 0;
            for (int j = 0; j < s.Length-1;j++)
            {
                if (Array.IndexOf(separators, s[j]) > 0)
                {
                    //Console.WriteLine("{0}:{1}",j,s[j]);
                    while ((i < sArray.Length) && (sArray[i] == "")) i++;
                    Console.Write(sArray[i++]);
                    Console.Write(s[j]);
                }
                
            }
            Console.WriteLine(s[s.Length - 1]);
        }
    }
}
