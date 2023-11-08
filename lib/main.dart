import "dart:io";
import "dart:math";

void main() {
  Introduction introduction = Introduction();
  introduction.introductionText();
  GuessBlock guessBlock = GuessBlock();
  guessBlock.guess();
}

// This is the class that contains the introduction and continue or exit options
class Introduction {
  introductionText() {
    print("-------------------------------------------");
    print("----------Welcome to Guess Wrld------------");
    print("-------------------------------------------");
    print('');
    print("Please enter your user name");
    print("");
    String userName = stdin.readLineSync()!;
    print("--------------------------------------");
    print("Welcome to Guess Wrld, $userName");
    print("");
  }

  continueExit() {
    print("Do you want to continue: Enter (y/n)");
    String option = stdin.readLineSync()!;

    if (option == "y" || option == "Y") {
      GuessBlock().guess();
    } else if (option == "n" || option == "N") {
      exitSure();
    } else {
      print("Ooops...Invalid input");
    }
  }

  exitSure() {
    print("Are you sure you want to exit guess wrld: Enter (y/n)");
    String select = stdin.readLineSync()!;
    if (select == "y" || select == "Y") {
      print("---------------------------------");
      print("Thanks for trying out Guess Wrld");
      print("---------------------------------");
    } else if (select == "n" || select == "N") {
      GuessBlock().guess();
    } else {
      print("Invalid Entry");
    }
  }
}

// This class contains the guess function which houses the user's input and the shuffle and also the exception handler...
class GuessBlock extends Introduction {
  guess() {
    print("Please select an integer number from 1 to 9");
    print("");
    String inputNumber = stdin.readLineSync()!;
    int minNumber = 1;
    int maxNumber = 9;
    Random random = Random();
    int randomNumber = minNumber + random.nextInt((maxNumber + 1) - minNumber);

    exceptionHandler(inputNumber, randomNumber);
  }

  exceptionHandler(inputNumber, randomNumber) {
    try {
      int inputNumberCheck = int.parse(inputNumber);
      if (inputNumberCheck == randomNumber) {
        print("You have won #100 🏆🏆🏆");
        print('');
        continueExit();
      } else if (inputNumberCheck <= 9 && inputNumberCheck != 0) {
        print("Unlucky 😟😟😟, please try again...");
        print('');
        guess();
      } else if (inputNumberCheck > 9 || inputNumber == 0) {
        print("Ooops!!!....You have entered an invalid input.....Try again");
        print('');
        guess();
      } else {
        print("Please enter an integer number from 1 to 5");
      }
    } catch (e) {
      guess();
    }
  }
}
