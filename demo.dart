// // ##General>>>
// void main() {
//   var name = "Sarthak";
//   print(name);

//   final age = 20;
//   print(age + 2);

//   dynamic namee = 'sarthak';
//   print(namee);
//   namee = 20;
//   print(namee);

//   print("my name is $name");

//   int a = 5;
//   print(a);

//   int? x;
//   print(x);

//   // greet("Sarthak", 20);
//   final greeting = greet("Sarthak", 20);
//   print(greeting);

//   String greeting2 = greet2();
//   print(greeting2);

//   // var list = [10, 20, 30];
//   List l = [10, 20, 30];
//   l.add('Sarthak');
//   l.remove(20);
//   print(l);
//   print(l.length);

//   Set<String> names = {"Sarthak", "apple", "apple"};
//   print(names);

//   var map = {};
//   map["name"] = "Sarthak";
//   map["age"] = 20;
//   print(map);
//   print(map["age"]);

//   for (int i = 0; i < 5; i++) {
//     if (i == 4) {
//       print(i);
//     }
//   }
// }

// //##Functions>>>
// greet(String name, age) {
//   // print("hello $name your age is $age");
//   return "hello $name your age is $age";
// }

// String greet2() => 'Hello';

// // ##CLASSES AND OOP>>>>>

// void main() {
//   User userOne = User('Sarthak', 25);
//   print(userOne.name);

//   User userTwo = User('ram', 22);
//   print(userTwo.name);

//   superUser userThree = superUser('jodu', 23);
//   print(userThree.name);
//   userThree.publish();
//   userThree.login();
// }

// class User {
//   // String name = 'Sarthak';
//   // int age = 25;
//   String name;
//   int age;

//   User(String name, int a)
//       : this.name = name,
//         this.age = a;

//   void login() {
//     print('User logged in');
//   }
// }

// class superUser extends User {
//   superUser(String name, int age) : super(name, age);
//   void publish() {
//     print('User published');
//   }
// }

// //Another Example>>>>

// void main() {
//   var noodles = Menultem('veg noodles', 9.99);
//   var pizza = Menultem('volcano pizza', 11.99);
//   // print(noodles.title);
//   // print(noodles.price);
//   // print(pizza.title);
//   // print(pizza.price);

//   // print(noodles.format());
//   // print(pizza.format());

//   // var pizzaa = Pizza(["mushrooms ", " peppers"], 'veg volcano ', 12.99);
//   // print(pizzaa.format());

//   // var foods = Collection<Menultem>
//   // ('Menu Items', [noodles, pizza]);
//   // var random = foods.randomltem();
//   // print(random);

// }

// class Menultem {
//   String title;
//   double price;
//   Menultem(this.title, this.price);

//   String format() {
//     return '$title— > $price';
//   }
// }

// class Pizza extends Menultem {
//   List<String> toppings;
//   Pizza(this.toppings, String title, double price) : super(title, price);

//   @override
//   String format() {
//     var formattedToppings = ' Contains:';
//     for (final t in toppings) {
//       formattedToppings = '$formattedToppings $t';
//     }
//     return '$title -> É$price \n$formattedToppings';
//   }
// }

// class Collection<T> {
//   String name;
//   List data;
//   Collection(this.name, this.data);

//   randomltem() {
//     data.shuffle();
//     return data[0];
//   }
// }

// // ##ASYNC & AWAIT & FUTURES >>>>>

// //main for FutureClass
// void main() {
//   fetchPost().then((p) {
//     print(p.title);
//     print(p.userId);
//   });
// }

// //main for async-await
// void main() async {
//   final p = await fetchPost();
//     print(p.title);
//     print(p.userId);
// }

// Future<post> fetchPost() {
//   const delay = Duration(seconds: 3);
//   return Future.delayed(delay, () {
//     return post("myPost", 123);
//   });
// }
// class post {
//   String title;
//   int userId;
//   post(this.title, this.userId);
// }



// //##Fetching Data>>>>
// https://youtu.be/v-2rWplEDoA?si=LHuxNp6m6k4kN3O3
