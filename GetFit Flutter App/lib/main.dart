import 'package:flutter/material.dart';
import 'package:get_fit/pages/homescreen.dart';
import 'package:get_fit/pages/login_screen.dart';
import 'package:get_fit/pages/personal_data_screen.dart';
import 'package:get_fit/pages/register_screen.dart';
import 'package:dio/dio.dart';

import 'datas/User.dart';


void main() {
  runApp(const ImperativeNavigationApp());
}

User user = User( 0, "", "", "", "", 0, 0, "",0, 0, false);

class ImperativeNavigationApp extends StatelessWidget {
  const ImperativeNavigationApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

      },
    );
  }
}
