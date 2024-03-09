import 'package:flutter/material.dart';
import 'package:trafficticket_management/model/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    fullname: '',
    email: '',
    token: '',
    mobile: '',
    tickets: [],
  );

  User get user => _user;

  void setUser(String userData) {
    _user = User.fromJson(userData);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

  // Add a method to get tickets from the user
}
