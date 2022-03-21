using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace generics03
{
    internal class GenericRepository<T> : IRepository<T> where T : class
    {
        List<T> list;

        public GenericRepository()
        {
            list = new List<T>(); 
        }

        public void Add(T item)
        {
            list.Add(item);
        }

        public IEnumerable<T> GetAll()
        {
            return list;
        }

        public T GetById(int id)
        {
            return list[id];
        }

        public void Remove(T item)
        {
            list.Remove(item);
        }

        public void Save()
        {
            Console.WriteLine("Update saved.");
        }
    }
}
