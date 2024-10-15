import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  /// Password should not be stored in the database.
  /// Authentication will handle login logout for us.
  /// So just use this variable to get data from user and pass it to authentication.
  final String? password;

  ///Constructor
  const UserModel({
    this.id,
    required  this.email,
    this.password,
    required this.fullName,
    required this.phoneNo,
  });

  /// convert model to Json structure so that you can use it to store data in Firebase
  toJson(){
    return{
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      //"Password": password,
    };
  }

  ///Step 1 - Map user fetched from Firebase to UserModel
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["Email"],
      //password: data["Password"],
      fullName: data["FullName"],
      phoneNo: data["Phone"],
    );
  }
}