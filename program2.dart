
void main() {
  List list = [1, 2, 3, 4];
  // for (var i in list) {
  for (var i = 0; i < 5; i++) {
    String line = '';
    for (var j in list.take(i)) {
      line = line + j.toString();
    }
    print(line);
  }
  print('\n');

  List list2 = [1, 0, 1, 0];
  for (var a in list2) {
    String line2 = '';
    for (var b in list2.take(a)) {
      line2 = line2 + b.toString();
    }
    print(line2);
  }
}



















// void main() {  
//   List<int> numbers = [1, 0]; 
  
//   for (var i = 1; i <5; i++) {
//     String line = '';
    
//     List<int> indices = [for (var j = 0; j < i; j++) j];
    
//     for (var index in indices) {
//       line += numbers[index % 2].toString();
//     }
    
//     print(line);
//   }
// }


// void main() {
//   int n = 4; // Number of lines
//   List<int> pattern = [1, 0]; // Pattern numbers

//   for (var i = 1; i <= n; i++) {
//     String line = '';
    
//     for (var j in List.generate(i, (index) => index)) {
//       line += pattern[j % 2].toString();
//     }
    
//     print(line);
//   }
// }
