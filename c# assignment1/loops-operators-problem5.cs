//DateTime current = new DateTime(2004, 1, 1, 19, 36, 05);
DateTime current = DateTime.Now;
byte hour = byte.Parse(current.Hour.ToString());
if ((hour > 23) && (hour <= 4)) Console.WriteLine("Good night");
if ((hour > 4) && (hour <= 11)) Console.WriteLine("Good morning");
if ((hour > 11) && (hour <= 19)) Console.WriteLine("Good afternoon");
if ((hour > 19) && (hour <= 23)) Console.WriteLine("Good evening");
