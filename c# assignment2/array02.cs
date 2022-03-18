Dictionary<string, int> myDictionary = new Dictionary<string, int>();
for ( ; ; )
{
    Console.WriteLine("Enter command:\n+ item\n— item\n—— to clear");
    string userInput = Console.ReadLine();
    Console.WriteLine(userInput.Length);
    if (userInput[0] == '+')
    {
        Console.WriteLine("You choose to add an item.");
        string item = userInput.Substring(2,userInput.Length-2);
        if (myDictionary.ContainsKey(item))
        {
            int quanties = myDictionary[item];
            myDictionary.Remove(item);
            myDictionary.Add(item, quanties + 1);
        }
        else
        {
            myDictionary.Add(item, 1);
        }
    }
    else if ((userInput[0] == '-') && (userInput[1] != '-'))
    {
        Console.WriteLine("You choose to remove an item.");
        string item = userInput.Substring(2, userInput.Length-2);
        if (myDictionary.ContainsKey(item))
        {
            int quanties = myDictionary[item];
            myDictionary.Remove(item);
            myDictionary.Add(item, quanties -1);
        }
        else
        {
            Console.WriteLine("Do not contain any of the item");
            myDictionary.Clear();
        }
    }
    else if ((userInput[0] == '-') && (userInput[1] == '-'))
    {
        Console.WriteLine("You choose to clear the entire list.");
    }
    foreach (KeyValuePair<string, int> kvp in myDictionary)
    {
        Console.WriteLine("item = {0}, quanties = {1}", kvp.Key, kvp.Value);
    }
}
