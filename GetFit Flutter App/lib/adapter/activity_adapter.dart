
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import '../datas/activity.dart';


class ActivityAdapter extends ChangeNotifier{

  List<Activity> activities = [];

  Future<Activity> getActivityById(int i) async{
    Activity a;
    var response = await Dio().get('https://getfit-application.azurewebsites.net/ActivityController/' + i.toString());
    var responseBody = response.data;
    a = Activity.fromJson(responseBody);
    return a;
  }

  Future getActivities() async{
    var response = await Dio().get('https://getfit-application.azurewebsites.net/ActivityController/');
    var responseBody = response.data;
    Iterable l = responseBody;
    List<Activity> activities = List<Activity>.from(l.map((model)=> Activity.fromJson(model)));

    this.activities = activities;
    notifyListeners();
  }

 Future newActiviy( Activity a) async {
    var json = a.toJson();
    final response = await Dio().post('https://getfit-application.azurewebsites.net/ActivityController/', data: json);
  }

 Future getActivityByUserId(int id) async{
    var response = await Dio().get('https://getfit-application.azurewebsites.net/ActivityController/userId='+ id.toString());
    var responseBody = response.data;
    Iterable l = responseBody;
    List<Activity> activities = List<Activity>.from(l.map((model)=> Activity.fromJson(model)));

    this.activities = activities;
    notifyListeners();
  }

 Future getActivityBySportId(int sportid, int userid) async{
    var response = await Dio().get('https://getfit-application.azurewebsites.net/ActivityController/userId='+ userid.toString()+ "/sportId=" + sportid.toString());
    var responseBody = response.data;
    Iterable l = responseBody;
    List<Activity> activities = List<Activity>.from(l.map((model)=> Activity.fromJson(model)));

    this.activities = activities;
    notifyListeners();
  }

  Future getActivityByDate(int date, int userid) async{
    var response = await Dio().get('https://getfit-application.azurewebsites.net/ActivityController/week='+ date.toString() + '/' + userid.toString());
    var responseBody = response.data;
    Iterable l = responseBody;
    List<Activity> activities = List<Activity>.from(l.map((model)=> Activity.fromJson(model)));

    this.activities = activities;
    notifyListeners();
  }

}


