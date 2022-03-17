// See https://aka.ms/new-console-template for more information
string userInput = "1";// Console.ReadLine();
byte centuries = byte.Parse(userInput);
ushort years = (ushort) ((ushort)centuries * (ushort)100);
uint days = (uint)(years * 365.24);
uint hours = days * 24;
ulong minutes = (ulong)((ulong)hours * (ulong)60);
ulong seconds = minutes * 60;
decimal millisecons = seconds*1;       //not calulated to avoid overflow
decimal microseconds = millisecons*1;  //not calulated to avoid overflow
decimal nanoseconds = microseconds*1;  //not calulated to avoid overflow
Console.WriteLine(@"{0} centuries = {1} years = {2} days = {3} hours = {4} minutes = {5} seconds 
 = {6}000 milliseconds = {7}000000 micoseconds = {8}000000000 nanoseconds.",centuries,years,days,hours,minutes,seconds, millisecons, microseconds, nanoseconds);
int a = 2147483648;
a = 2147483648;
Console.WriteLine(a+2);