import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_fit/datas/User.dart';

Future<User> getUserById(int i) async{
  User u;
  var response = await Dio().get('https://getfit-application.azurewebsites.net/UserController/' + i.toString());
  var responseBody = response.data;
  u = User.fromJson(responseBody);
  return u;
}

Future<List<User>> getUsers() async{
  var response = await Dio().get('https://getfit-application.azurewebsites.net/UserController/');
  var responseBody = response.data;
  Iterable l = responseBody;
  List<User> users = List<User>.from(l.map((model)=> User.fromJson(model)));

  return users;
}

void newUser( User u) async {
  var json = u.toJson();
  final response = await Dio().post('https://getfit-application.azurewebsites.net/UserController/', data: json);
}

/*
Future<User> getUserByName(String name) async{
  User u;
  var response = await Dio().get('https://getfit-application.azurewebsites.net/UserController/' + 'name=' + name);
  var responseBody = response.data;
  u = User.fromJson(responseBody);
  return u;
}
 */


