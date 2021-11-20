
import 'package:dio/dio.dart';
import 'dart:convert';
import '../datas/Activity.dart';

Future<Activity> getActivityById(int i) async{
  Activity a;
  var response = await Dio().get('https://getfit-application.azurewebsites.net/ActivityController/' + i.toString());
  var responseBody = response.data;
  a =Activity.fromJson(responseBody);
  return a;
}

Future<List<Activity>> getActivities() async{
  var response = await Dio().get('https://getfit-application.azurewebsites.net/ActivityController/');
  var responseBody = response.data;
  Iterable l = responseBody;
  List<Activity> activities = List<Activity>.from(l.map((model)=> Activity.fromJson(model)));

  return activities;
}

void newActiviy( Activity a) async {
   var json = a.toJson();
  final response = await Dio().post('https://getfit-application.azurewebsites.net/ActivityController/', data: json);
}

Future<List<Activity>> getActivityByUserId(int id) async{
  var response = await Dio().get('https://getfit-application.azurewebsites.net/ActivityController/userId='+ id.toString());
  var responseBody = response.data;
  Iterable l = responseBody;
  List<Activity> activities = List<Activity>.from(l.map((model)=> Activity.fromJson(model)));

  return activities;
}

Future<List<Activity>> getActivityBySportId(int id) async{
  var response = await Dio().get('https://getfit-application.azurewebsites.net/ActivityController/sportId='+ id.toString());
  var responseBody = response.data;
  Iterable l = responseBody;
  List<Activity> activities = List<Activity>.from(l.map((model)=> Activity.fromJson(model)));

  return activities;
}

