import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_fit/datas/User.dart';

import '../main.dart';

TextEditingController fullnamecontroller = TextEditingController();
TextEditingController usernamecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();



// TODO letrehozni uj felhasznalot elmenteni az adatait, hibauzenet kuldese ha nem jo formatumba adott meg valamit
// TODO elkuldeni az uj adatokat
class RegisterScreen extends StatelessWidget{
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('Register',textAlign: TextAlign.center,style: TextStyle(fontSize: 30),),

            const SizedBox(height: 50),
            Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  Text('Full name ',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                      controller: fullnamecontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full name',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ]
            ),
            const SizedBox(height:  10),
            Row(
                children:  <Widget>[
                  SizedBox(width: 10),
                  Text("Username ",
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ]
            ),
            const SizedBox(height: 10),
            Row(
                children:  <Widget>[
                  SizedBox(width: 10),
                  Text("E-mail ",
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ]
            ),
            const SizedBox(height: 10),
            Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  Text("Password ",
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: TextField(
                      obscureText: true,
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ]
            ),
            const SizedBox(height: 50),
            TextButton(
              child: const Text("Submit"),
              onPressed: () {
                //user = Person(emailcontroller.text,passwordcontroller.text,usernamecontroller.text,fullnamecontroller.text);
                user.Email = emailcontroller.text;
                user.Password = passwordcontroller.text ;
                user.Name = fullnamecontroller.text;
                user.Username = usernamecontroller.text;
                Navigator.pushNamed(
                  context,
                  "/personaldatapage",
                );
              },
            ),
          ],
        ),
      )
    );
  }

}
