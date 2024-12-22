import 'dart:io';
import 'dart:async';

class Calculator {
  double num_1;
  double num_2;

  Calculator(this.num_1, this.num_2);

  double add() => num_1 + num_2;

  double subtract() => num_1 - num_2;

  double multiply() => num_1 * num_2;

  double divide() {
    if (num_2 == 0) {
      throw Exception("Cannot divide by zero.");
    }
    return num_1 / num_2;
  }
}


Future<void> delayedResult(double result) async {
  await Future.delayed(Duration(seconds: 5));
  print("Result: $result");
}

void main() async {
  try {
    print("Enter the first number: ");
    double num_1 = double.parse(stdin.readLineSync()!);

    print("Enter the second number: ");
    double num_2 = double.parse(stdin.readLineSync()!);

    Calculator calculator = Calculator(num_1, num_2);

    print("1. Sum");
    print("2. Difference");
    print("3. Product");
    print("4. Divide");
    print("Select an option: ");
    String choice = stdin.readLineSync()!;

    double result;

    switch (choice) {
      case "1":
        result = calculator.add();
        break;
      case "2":
        result = calculator.subtract();
        break;
      case "3":
        result = calculator.multiply();
        break;
      case "4":
        result = calculator.divide();
        break;
      default:
        print("Invalid input.");
        return;
    }

    print("Calculating...");
    await delayedResult(result); 
  } catch (e) {
    print("Invalid input or error: ${e.toString()}");
  }
}
