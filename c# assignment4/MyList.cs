using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace generics02
{
    public class MyList<T>
    {
        public List<T> List { get; set; }

        public MyList()
        {
            List = new List<T>();
        }

        public void Add(T element)
        {
            List.Add(element);
        }

        public T Remove(int index)
        {
            T item = List[index];
            List.RemoveAt(index);
            return item;
        }

        public bool Contains(T element)
        {
            return List.Contains(element);
        }

        public void Clear()
        {
            List.Clear();
        }

        public void InsertAt(T element, int index)
        {
            if (index < 0) { throw new ArgumentOutOfRangeException("index"); }
            else
            {
                List.Insert(index, element);
            }
        }

        public void DeleteAt(int index)
        {
            if (index < 0) { throw new ArgumentOutOfRangeException("index"); }
            else
            {
                List.RemoveAt(index);
            }
        }

        public T Find(int index)
        {
            return List[index];            
        }

    }
}
