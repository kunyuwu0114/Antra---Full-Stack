byte lines = 5;
for (byte i = 0; i < lines; i++)
{
    for (byte j = 0; j < lines - i - 1; j++)
    {
        Console.Write(" ");
    }
    for (byte j = 0; j < i * 2 + 1; j++)
    {
        Console.Write("*");
    }
    Console.WriteLine();
}