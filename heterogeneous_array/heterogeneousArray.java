import java.util.Scanner;

public class heterogeneousArray {
    public static void main(String[] args) {
        // Create a Scanner object to read user input
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter the number of elements in the array
        System.out.print("Enter the number of elements: ");
        int numElements = scanner.nextInt();

        // Define an array of objects to store elements of different data types
        Object[] myArray = new Object[numElements];

        // Prompt the user to enter the elements of the array
        for (int i = 0; i < numElements; i++) {
            System.out.print("Enter element #" + (i + 1) + ": ");
            if (scanner.hasNextInt()) {
                myArray[i] = scanner.nextInt();
            } else if (scanner.hasNextDouble()) {
                myArray[i] = scanner.nextDouble();
            } else if (scanner.hasNextBoolean()) {
                myArray[i] = scanner.nextBoolean();
            } else {
                myArray[i] = scanner.next();
            }
        }

        // Print the elements of the array
        System.out.println("The elements of the array are:");
        for (int i = 0; i < myArray.length; i++) {
            System.out.println(myArray[i]);
        }

        // Close the Scanner object to free up resources
        scanner.close();
    }
}
