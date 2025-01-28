// Calculator using classes,constructor and methods and method overloading for diff data types predefined data

// void main() {
//   var calculator = Calculator();

//   print('Integer Addition: ${calculator.addInt(2, 3)}'); // 5
//   print('Integer Subtraction: ${calculator.subtractInt(5, 2)}'); // 3
//   print('Integer Multiplication: ${calculator.multiplyInt(4, 3)}'); // 12
//   print('Integer Division: ${calculator.divideInt(10, 2)}'); // 5

//   print('Double Addition: ${calculator.addDouble(2.5, 3.7)}'); // 6.2
//   print('Double Subtraction: ${calculator.subtractDouble(5.3, 2.1)}'); // 3.2
//   print('Double Multiplication: ${calculator.multiplyDouble(4.2, 3.0)}'); // 12.6
//   print('Double Division: ${calculator.divideDouble(10.5, 2.5)}'); // 4.2
// }

// class Calculator {

//   int addInt(int a, int b) {
//     return a + b;
//   }

//   int subtractInt(int a, int b) {
//     return a - b;
//   }

//   int multiplyInt(int a, int b) {
//     return a * b;
//   }

//   double divideInt(int a, int b) {
//     return a / b;
//   }

//   double addDouble(double a, double b) {
//     return a + b;
//   }

//   double subtractDouble(double a, double b) {
//     return a - b;
//   }

//   double multiplyDouble(double a, double b) {
//     return a * b;
//   }

//   double divideDouble(double a, double b) {
//     return a / b;
//   }
// }



// //switch case for comparing even odd

// void main() {
//   int number = 13;
//   switch (number % 2) {
//     case 0:
//       print('Even');
//     case 1:
//       print('Odd');
//     default:
//       print('NaN');
//   }
// }




// calender class 
// sunday>print holiday
// mon> print routine
// tues>print routine

// void main() {
//   var calendar = Calendar();

//   calendar.printDayMessage('Sunday');
// }

// class Calendar {
//   void printDayMessage(String day) {
//     switch (day) {
//       case 'Sunday':
//         print('Sunday: Holiday');
//         break;

//       case 'Monday':
//       case 'Tuesday':
//       case 'Wednesday':
//       case 'Thursday':
//       case 'Friday':
//         print('$day: Routine');
//         break;

//       case 'Saturday':
//         print('Saturday: Weekend');
//         break;

//       default:
//         print('Invalid day');
//     }
//   }
// }
