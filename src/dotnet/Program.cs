using System.Runtime.InteropServices;

class Program
{
    static void Main()
    {
        Console.WriteLine("Hello, World!");
        Console.WriteLine($"Platform: {RuntimeInformation.OSArchitecture}");
        Console.WriteLine($"Sum: {Sum(1,4)}");
    }
    static double Sum(double a, double b) {
        return (a+b);
    }
}
