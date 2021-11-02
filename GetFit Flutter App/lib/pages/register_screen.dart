import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

            Row(
                children: const <Widget>[
                  Text('Full name',
                    textAlign: TextAlign.left,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full name',
                      ),
                    ),
                  )
                ]
            ),

            Row(
                children: const <Widget>[
                  Text("Username",
                    textAlign: TextAlign.left,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                  )
                ]
            ),
            Row(
                children: const <Widget>[
                  Text("E-mail",
                    textAlign: TextAlign.left,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                      ),
                    ),
                  )
                ]
            ),
            Row(
                children: const <Widget>[
                  Text("Password",
                    textAlign: TextAlign.left,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  )
                ]
            ),
            ElevatedButton(
              child: const Text("Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      )
    );
  }

}