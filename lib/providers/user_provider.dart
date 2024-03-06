import 'package:flutter/material.dart';
import 'package:trafficticket_management/model/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(id: '', fullname: '', email: '', mobile: '', token: '');

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
