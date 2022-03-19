using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace class01
{
    public abstract class class01_SPCA
    {
        //it is a class for SPCA animals
        public int Id { get; set; }
        public string Name { get; set; }

        public string Classify { get; set; } //1 is cat, 2 is dog, 3 is bird

        public class01_SPCA()
        {
                
        }

        public class01_SPCA(int id, string name, string classify)
        {
            Id = id;
            Name = name;
            Classify = classify;
        }

        public class01_SPCA(int id, string classify)
        {
            Id = id;
            Classify = classify;
        }

        public abstract void sell();
    }

    public class class01_cat : class01_SPCA
    {
        public override void sell()
        {
            Console.WriteLine("A cat is sold");
        }
    }



}
