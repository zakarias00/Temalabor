import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/adapter/activity_adapter.dart';
import 'package:get_fit/adapter/goal_adapter.dart';
import 'package:get_fit/adapter/sport_adapter.dart';
import 'package:get_fit/adapter/user_adapter.dart';
import 'package:get_fit/datas/goal.dart';
import 'package:get_fit/datas/user.dart';
import '../main.dart';
import 'homedata_screen.dart';

TextEditingController passwordcontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var activityadapter = ActivityAdapter();
  var useradapter = UserAdapter();
  var goaladapter = GoalAdapter();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/back.jpeg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30)),
                    const SizedBox(height: 30),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset("assets/images/cover.jpeg"),
                    ),
                    const SizedBox(height: 50),
                    Row(children: <Widget>[
                      const SizedBox(width: 10),
                      const Text(
                        'E-mail ',
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: TextField(
                          controller: emailcontroller,
                          cursorColor: Color.fromRGBO(82, 82, 82, 1.0),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'E-mail',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ]),
                    const SizedBox(height: 10),
                    Row(children: <Widget>[
                      const SizedBox(width: 10),
                      const Text(
                        "Password ",
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: TextField(
                          obscureText: true,
                          cursorColor: Color.fromRGBO(82, 82, 82, 1.0),
                          controller: passwordcontroller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ]),
                    TextButton(
                      onPressed: () async {
                        await useradapter.getUsers();
                        bool valid = await validateLogin();
                        if (valid == true) {
                          user = await validatedUser();
                          await useradapter.getUsers();
                          await activityadapter.getActivityByUserId(user.Id);
                          sports = await getSports();
                         await goaladapter.getGoalByDate(DateTime.now().millisecondsSinceEpoch,user.Id);
                         if( goaladapter.goals.isEmpty){
                            goaladapter.newGoal(Goal(0,0,user.Id,DateTime.now().millisecondsSinceEpoch,0,0));
                          }
                          emailcontroller.clear();
                          passwordcontroller.clear();
                          if(user.Points == 0 && user.Level == 0){
                            percent = 0;
                          } else{
                            percent = (user.Points - user.Level* 10)*10.roundToDouble() ;
                          }

                          if (user.Email == "admin" &&
                              user.Password == "admin") {
                            Navigator.pushNamed(
                              context,
                              "/adminscreen",
                            );
                          } else {
                            Navigator.pushNamed(
                              context,
                              "/homepage",
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Not a valid data')),
                          );
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const Text('-Or-'),
                    TextButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, "/registerpage");
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ]),
            )),
      ],
    );
  }

  Future<bool> validateLogin() async {
    bool find = false;
    useradapter.users.forEach((element) async {
      if (element.Email == emailcontroller.text &&
          element.Password == passwordcontroller.text) {
        find = true;
        user = await useradapter.getUserById(element.Id);
      }
    });

    if (find == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<User> validatedUser() async {
    useradapter.getUsers();
    useradapter.users.forEach((element) async {
      if (element.Email == emailcontroller.text &&
          element.Password == passwordcontroller.text) {
        user = await useradapter.getUserById(element.Id);
      }
    });
    print(user.Id);
    return user;
  }
}
