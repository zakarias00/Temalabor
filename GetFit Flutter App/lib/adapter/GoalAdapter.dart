import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/datas/Goal.dart';

class GoalAdapter extends ChangeNotifier{

  late List<Goal> goals = [];

  Future<Goal> getGoalById(int i) async{
    Goal g;
    var response = await Dio().get('https://getfit-application.azurewebsites.net/GoalController/' + i.toString());
    var responseBody = response.data;
    g = Goal.fromJson(responseBody);
    return g;
  }

  Future getGoals() async{
    var response = await Dio().get('https://getfit-application.azurewebsites.net/GoalController/');
    var responseBody = response.data;
    Iterable l = responseBody;
    List<Goal> goals = List<Goal>.from(l.map((model)=> Goal.fromJson(model)));
    this.goals = goals;
    notifyListeners();
  }

  Future getGoalByUserId(int id) async{
    var response = await Dio().get('https://getfit-application.azurewebsites.net/GoalController/userId='+ id.toString());
    var responseBody = response.data;
    Iterable l = responseBody;
    List<Goal> goals = List<Goal>.from(l.map((model)=> Goal.fromJson(model)));

    this.goals = goals;
    notifyListeners();
  }

  Future updateGoal ( Goal g, int goalId) async{
    var json = g.toJson();
    final response = await Dio().put('https://getfit-application.azurewebsites.net/GoalController/' + goalId.toString(), data: json);
  }


  Future getGoalByDate( int date, int id) async{

    var response = await Dio().get('https://getfit-application.azurewebsites.net/GoalController/date='+ date.toString()+ '/' + id.toString());
    var responseBody = response.data;
    Iterable l = responseBody;
    List<Goal> goals = List<Goal>.from(l.map((model)=> Goal.fromJson(model)));

    this.goals = goals;
    notifyListeners();
  }


void newGoal( Goal g) async {
  var json = g.toJson();
  final response = await Dio().post('https://getfit-application.azurewebsites.net/GoalController/', data: json);
}
}



