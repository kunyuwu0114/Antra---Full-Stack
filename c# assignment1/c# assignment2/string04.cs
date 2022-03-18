using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace string04
{
    internal class string04
    {
        static void Main(string[] args)
        {
            string s = Console.ReadLine();
            string protocal,ssr,server,resourse;
            int ps = s.IndexOf("://");
            if (ps == -1)
            {
                protocal = "";
                ssr = s;
            }
            else
            {
                string[] s1 = s.Split("://");
                protocal = s1[0];
                ssr = s1[1];
            }
            int sr = ssr.IndexOf("/");
            if (sr == -1)
            {
                resourse = "";
                server = ssr;
            }
            else
            {
                string[] s2 = ssr.Split('/');
                server = s2[0];
                resourse = s2[1];
            }
            if (protocal == "") Console.WriteLine("[protocal] = \"\"");
            else Console.WriteLine("[protocal] = {0}", protocal);
            Console.WriteLine("[server] = {0}", server);
            if (resourse == "") Console.WriteLine("[resourse] = \"\"");
            else Console.WriteLine("[resourse] = {0}", resourse);
        }
    }
}
