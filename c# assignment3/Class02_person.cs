using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace class02
{
    public abstract class Class02_person
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public int Age { get; set; }

        public Class02_person()
        {

        }

        public Class02_person(int id, string name, int age)
        {
            Id = id;
            Name = name;
            Age = age;
        }
        public abstract void Activity();
    }

    public class Class02_student : Class02_person
    {
        public override void Activity()
        {
            Console.WriteLine("Student will have to attend classes on time.");
        }

        public void DoingHw()
        {
            Console.WriteLine("Student will have to finish the homework.");
        }
    }

    public class Class02_instructor : Class02_person
    {
        public override void Activity()
        {
            Console.WriteLine("Instructor will have to prepare well for the classes.");
        }

        public void Report()
        {
            Console.WriteLine("Instructor will have to report to the professor.");
        }
    }
}
