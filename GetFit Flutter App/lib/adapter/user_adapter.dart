import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_fit/datas/user.dart';

class UserAdapter extends ChangeNotifier {
  List<User> users = [];


  Future<User> getUserById(int i) async {
    User u;
    var response = await Dio().get(
        'https://getfit-application.azurewebsites.net/UserController/' +
            i.toString());
    var responseBody = response.data;
    u = User.fromJson(responseBody);
    return u;
  }

 Future getUsers() async {
    var response = await Dio().get(
        'https://getfit-application.azurewebsites.net/UserController/');
    var responseBody = response.data;
    Iterable l = responseBody;
    List<User> users = List<User>.from(l.map((model) => User.fromJson(model)));

    this.users = users;
    notifyListeners();
  }

  Future newUser(User u) async {
    var json = u.toJson();
    final response = await Dio().post(
        'https://getfit-application.azurewebsites.net/UserController/',
        data: json);
  }

  Future updateUser(User u, int userId) async {
    var json = u.toJson();
    final response = await Dio().put(
        'https://getfit-application.azurewebsites.net/UserController/' +
            userId.toString(), data: json);
  }

  Future getUserByName(String name) async {

    var response = await Dio().get(
        'https://getfit-application.azurewebsites.net/UserController/' +
            'name=' + name);
    var responseBody = response.data;
    Iterable l = responseBody;
    List<User> users = List<User>.from(l.map((model) => User.fromJson(model)));

    this.users = users;
    notifyListeners();
  }

}