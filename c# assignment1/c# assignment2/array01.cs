int[] myArray = {0,1,2,3,4,5,6,7,8,9};
int[] newArray = new int[myArray.Length];
for(int i = 0; i < myArray.Length; i++)
{
    newArray[i] = myArray[i];
}
Console.Write("Original array: {0}",myArray[0]);
for (int i = 1; i < myArray.Length; i++) 
    Console.Write(", {0}",myArray[i]);
Console.Write("\nCopied array: {0}", newArray[0]);
for (int i = 1; i < newArray.Length; i++)
    Console.Write(", {0}", newArray[i]);