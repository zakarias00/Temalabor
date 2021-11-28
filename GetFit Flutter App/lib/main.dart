import 'package:flutter/material.dart';
import 'package:get_fit/adapter/ActivityAdapter.dart';
import 'package:get_fit/adapter/GoalAdapter.dart';
import 'package:get_fit/adapter/UserAdapter.dart';
import 'package:get_fit/pages/add_activity.dart';
import 'package:get_fit/pages/admin_screen.dart';
import 'package:get_fit/pages/homescreen.dart';
import 'package:get_fit/pages/login_screen.dart';
import 'package:get_fit/pages/personal_data_screen.dart';
import 'package:get_fit/pages/register_screen.dart';
import 'package:dio/dio.dart';
import 'package:get_fit/widgets/MyDate.dart';
import 'package:provider/provider.dart';

import 'datas/Activity.dart';
import 'datas/Goal.dart';
import 'datas/Sport.dart';
import 'datas/User.dart';

void main() {
  runApp(const GetFitApp());
}


late List<Sport> sports;
User user = User(0, "", "", "", "", 0, 0, DateTime.now().millisecondsSinceEpoch, 0, 0, false);

class GetFitApp extends StatelessWidget {
  const GetFitApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ActivityAdapter>(
            create: (_) => ActivityAdapter()),
        ChangeNotifierProvider<UserAdapter>(create: (_) => UserAdapter()),
        ChangeNotifierProvider<GoalAdapter>(create: (_) => GoalAdapter()),
        ChangeNotifierProvider<SelectedDate>(create: (_) => SelectedDate())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Get Fit',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
        routes: {
          "/loginpage": (context) => LoginScreen(),
          "/registerpage": (context) => const RegisterScreen(),
          "/personaldatapage": (context) => PersonalDataScreen(),
          "/homepage": (context) => const HomeScreen(),
          "/addactivity": (context) => AddActivity(),
          "/adminscreen": (context) => const AdminActivity(),
          "/app": (context) => const GetFitApp(),
        },
      ),
    );
  }
}
