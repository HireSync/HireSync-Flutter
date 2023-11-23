import 'package:flutter/material.dart';

class User{
   final int id;
  final String email;
  final String firstName;
  final String password;
  final int phone;
  
 const User.empty()
      : id = 0,
        email = '',
        firstName = '',
        password = '',
        phone = 0;

  const User(
      {
         required this.id,
        required this.email,
      required this.firstName,
      required this.password,
      required this.phone,
      });

  User.fromJson(Map<String, dynamic> json)
      : id = json ['id'],
        email = json['email'],
        firstName = json['firstName'],
        password = json['password'],
        phone=json['phone'];

int get getId => id;

  
}

class UserState extends ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  void setCurrentUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

}