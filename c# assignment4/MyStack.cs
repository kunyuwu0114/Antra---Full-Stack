using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace generics01
{
    public class MyStack<T>
    {
        public Stack<T> stack { get; set; }

        public MyStack()
        {
            stack = new Stack<T>();
        }

        private int Count()
        {
            return stack.Count;
        }

        private T Pop()
        {
            return stack.Pop();
        }

        private void Push(T item)
        {
            stack.Push(item);
        }

    }
}
