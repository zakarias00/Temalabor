import 'package:flutter/material.dart';
import 'package:get_fit/pages/add_activity.dart';
import 'package:get_fit/pages/admin_screen.dart';
import 'package:get_fit/pages/homescreen.dart';
import 'package:get_fit/pages/login_screen.dart';
import 'package:get_fit/pages/personal_data_screen.dart';
import 'package:get_fit/pages/register_screen.dart';
import 'package:dio/dio.dart';

import 'datas/Activity.dart';
import 'datas/Goal.dart';
import 'datas/Sport.dart';
import 'datas/User.dart';


void main() {
  runApp(const ImperativeNavigationApp());
}
late List<User> users;
late List<Activity> activities = [];
late List<Goal> goals = [];
late List<Sport> sports;
User user = User( 0, "", "", "", "", 0, 0, null,0, 0, false);

class ImperativeNavigationApp extends StatelessWidget {
  const ImperativeNavigationApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screens Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
      routes: {
        "/loginpage": (context) => const LoginScreen(),
        "/registerpage": (context) => const RegisterScreen(),
        "/personaldatapage": (context) => const PersonalDataScreen(),
        "/homepage": (context) =>  const HomeScreen(),
        "/addactivity": (context) =>  const AddActivity(),
        "/adminscreen": (context) => const AdminActivity(),
        "/app": (context) => const ImperativeNavigationApp(),


      },
    );
  }
}
