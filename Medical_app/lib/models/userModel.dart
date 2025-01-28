import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  const Usermodel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNo,
  });

  toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNo': phoneNo,
      'password': password,
    };
  }

  factory Usermodel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Usermodel(
        id: document.id,
        email: data["email"],
        password: data["password"],
        fullName: data["fullNamee"],
        phoneNo: data["phoneNo"]);
  }
}
