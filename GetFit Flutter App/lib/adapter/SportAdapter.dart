import 'package:dio/dio.dart';
import 'package:get_fit/datas/Sport.dart';

Future<Sport> getSportById(int i) async{
  Sport s;
  var response = await Dio().get('https://getfit-application.azurewebsites.net/SportController/' + i.toString());
  var responseBody = response.data;
  s = Sport.fromJson(responseBody);
  return s;
}

Future<List<Sport>> getSports() async{
  var response = await Dio().get('https://getfit-application.azurewebsites.net/SportController/');
  var responseBody = response.data;
  Iterable l = responseBody;
  List<Sport> sports = List<Sport>.from(l.map((model)=> Sport.fromJson(model)));

  return sports;
}

void newSport( Sport s) async {
  var json = s.toJson();
  final response = await Dio().post('https://getfit-application.azurewebsites.net/SportController/', data: json);
}



