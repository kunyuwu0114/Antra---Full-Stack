for (byte i = 1; i <= 4; i++)
{
    for (byte j = 0; j < 24; j += i)
    {
        Console.Write("{0}, ",j);
    }
    Console.WriteLine(24);
}