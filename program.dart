// import 'dart:io';

void main(){
// palindrome,calculator,factorial
  
//String? input = stdin.readLineSync();
var input=3;
  
  switch (input){
    case 1:
      var n=232;
      var m=n;
      var r=0;
      var s=0;
      for (var i=0;i<=n;i++){
        r=n%10;
        s=s*10+r;
        n=n~/10;
      }
      if (s==m){
        print("Number is palindrome");
      }
      else{
        print("Number is not Palindrome");
      }
      break;
      
    case 2:
      var a=1;
      var b=2;
      // calculate=[add,substract,multiply,divide]
      String calculate="add";
      switch(calculate){
        case "add":
          var sum=a+b;
          print("Sum of the numbers=$sum");
          break;
        case "substract":
          var sub=(a>b)?a-b:b-a;
          print("Difference of two numbers=$sub");
          break;
        case "multiply":
          var mul=a*b;
          print("Multiplication of two numbers=$mul");
          break;
        case "divide":
          var div=(a>b)?a/b:b/a;
          print("Division of two numbers=$div");
          break;
        }
      break;
      
    case 3:
        var num = 5;
        var fact = 1;
        for (var i = 1; i <= num; i++) {
          fact =fact* i;
        }
        print("The factorial of $num is $fact");
        break;
      
    default:
      print("Invalid Input");
  }
}

