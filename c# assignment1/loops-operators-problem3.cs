int correctNumber = new Random().Next(3) + 1;
Console.Write("Guess a number between 1 and 3.");
int guessedNumber = int.Parse(Console.ReadLine());
if ((guessedNumber < 1) || (guessedNumber > 3)) Console.WriteLine("Your answer is outside of the range of numbers that are valid guesses");
else if (guessedNumber == correctNumber) Console.WriteLine("Your guess is correct.");
else if (guessedNumber < correctNumber) Console.WriteLine("Your guees is lower.");
else Console.WriteLine("Your guess is higher.");