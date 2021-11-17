import 'package:dio/dio.dart';
import 'package:get_fit/datas/Goal.dart';
import 'package:get_fit/datas/Sport.dart';

Future<Goal> getGoalById(int i) async{
  Goal g;
  var response = await Dio().get('https://getfit-application.azurewebsites.net/GoalController/' + i.toString());
  var responseBody = response.data;
  g = Goal.fromJson(responseBody);
  return g;
}

Future<List<Goal>> getGoals() async{
  var response = await Dio().get('https://getfit-application.azurewebsites.net/GoalController/');
  var responseBody = response.data;
  Iterable l = responseBody;
  List<Goal> goals = List<Goal>.from(l.map((model)=> Goal.fromJson(model)));

  return goals;
}

Future<List<Goal>> getGoalByUserId(int id) async{
  var response = await Dio().get('https://getfit-application.azurewebsites.net/GoalController/userId='+ id.toString());
  var responseBody = response.data;
  Iterable l = responseBody;
  List<Goal> goals = List<Goal>.from(l.map((model)=> Goal.fromJson(model)));

  return goals;
}

void updateGoal ( Goal g, int goalId) async{
  var json = g.toJson();
  final response = await Dio().put('https://getfit-application.azurewebsites.net/GoalController/' + goalId.toString(), data: json);
}
/*

void newGoal( Goal g) async {
  var json = g.toJson();
  final response = await Dio().post('https://getfit-application.azurewebsites.net/GoalController/', data: json);
}

 */

