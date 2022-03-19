using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class05
{
    public abstract class Class05_person
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public int Age { get; set; }

        public Class05_person()
        {

        }

        public Class05_person(int id, string name, int age)
        {
            Id = id;
            Name = name;
            Age = age;
        }
        public abstract void Activity();
    }

    public class Class05_student : Class05_person
    {
        public int Credits { get; set; }
        public double GPA { get; set; }

        public override void Activity()
        {
            Console.WriteLine("Student will have to attend classes on time.");
        }

        public void DoingHw()
        {
            Console.WriteLine("Student will have to finish the homework.");
        }
    }

    public class Class05_instructor : Class05_person
    {
        public int Salary { get; set; }
        public int Benifits { get; set; }

        public override void Activity()
        {
            Console.WriteLine("Instructor will have to prepare well for the classes.");
        }

        public void Report()
        {
            Console.WriteLine("Instructor will have to report to the professor.");
        }

        public virtual int CalSalary() {
            return 50000;
        }
    }

    public class Class05_instructor_level1 : Class05_instructor
    {
        public override int CalSalary()
        {
            return 80000;
        }
    }

    public class Class05_instructor_level2 : Class05_instructor
    {
        public override int CalSalary()
        {
            return 100000;
        }
    }

}
