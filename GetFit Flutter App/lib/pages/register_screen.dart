import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

TextEditingController fullnamecontroller = TextEditingController();
TextEditingController usernamecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                  const Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 50),
                  Row(children: <Widget>[
                    SizedBox(width: 10),
                    const Text(
                      'Full name ',
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: TextField(
                        controller: fullnamecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Full name',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ]),
                  const SizedBox(height: 10),
                  Row(children: <Widget>[
                    const SizedBox(width: 10),
                    const Text(
                      "Username ",
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: TextField(
                        controller: usernamecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ]),
                  const SizedBox(height: 10),
                  Row(children: <Widget>[
                    const SizedBox(width: 10),
                    const Text(
                      "E-mail ",
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: TextField(
                        controller: emailcontroller,
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
                        controller: passwordcontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ]),
                  const SizedBox(height: 50),
                  TextButton(
                    child: const Text("Submit", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      if (usernamecontroller.text.isNotEmpty &&
                          emailcontroller.text.isNotEmpty &&
                          fullnamecontroller.text.isNotEmpty &&
                          passwordcontroller.text.isNotEmpty) {
                        user.Email = emailcontroller.text;
                        user.Password = passwordcontroller.text;
                        user.Name = fullnamecontroller.text;
                        user.Username = usernamecontroller.text;

                        emailcontroller.clear();
                        passwordcontroller.clear();
                        fullnamecontroller.clear();
                        usernamecontroller.clear();

                        Navigator.pushNamed(
                          context,
                          "/personaldatapage",
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Add datas')),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    child: const Text("Back"),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop(context);
                    },
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
