DateTime birthDate = new DateTime(2004, 1, 1);
DateTime currentDate = new DateTime(2022, 3, 16);
TimeSpan diffDate = currentDate.Subtract(birthDate);
string result = "diff days: " + diffDate.Days.ToString() + " days";
Console.WriteLine(result);
