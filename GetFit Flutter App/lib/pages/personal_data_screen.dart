import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_fit/adapter/user_adapter.dart';
import 'package:get_fit/widgets/my_date.dart';
import '../main.dart';

TextEditingController gendercontroller = TextEditingController();
TextEditingController datecontroller = TextEditingController();
TextEditingController heightcontroller = TextEditingController();
TextEditingController weightcontroller = TextEditingController();

class PersonalDataScreen extends StatelessWidget {
  PersonalDataScreen({Key? key}) : super(key: key);

  var useradapter = UserAdapter();
  var selecteddate = SelectedDate();

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
                'Enter your personal datas',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 50),
              const Text("Choose your gender: "),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: CupertinoButton(
                        onPressed: () {
                          showCupertinoModalPopup<void>(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoActionSheet(
                              title: const Text('Gender'),
                              actions: <CupertinoActionSheetAction>[
                                CupertinoActionSheetAction(
                                  child: const Text('Woman'),
                                  onPressed: () {
                                    Navigator.pop(context, 'Woman');
                                    user.Gender = true;
                                    gendercontroller.text = "Woman";
                                  },
                                ),
                                CupertinoActionSheetAction(
                                  child: const Text('Man'),
                                  onPressed: () {
                                    Navigator.pop(context, 'Man');
                                    user.Gender = false;
                                    gendercontroller.text = "Man";
                                  },
                                )
                              ],
                            ),
                          );
                        },
                        child: const Text('Choose Gender: '),
                      ),
                    ),
                    Container(
                      width: 120,
                      child: TextField(
                        controller: gendercontroller,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none),
                      ),
                    ),
                  ]),
              Column(children: const <Widget>[
                Text("Choose your birthdate:"),
                SizedBox(height: 10),
                MyDate(),
                SizedBox(height: 10),
              ]),
              Row(children: <Widget>[
                const SizedBox(width: 10),
                const Text(
                  'Height(cm): ',
                  textAlign: TextAlign.left,
                ),
                const SizedBox(width: 10),
                Flexible(
                    child: TextField(
                        controller: heightcontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Height',
                        ),
                        keyboardType: TextInputType.number)),
                const SizedBox(width: 10),
              ]),
              const SizedBox(height: 10),
              Row(children: <Widget>[
                const SizedBox(width: 10),
                const Text(
                  'Weight (kg):',
                  textAlign: TextAlign.left,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextField(
                      controller: weightcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Weight',
                      ),
                      keyboardType: TextInputType.number),
                ),
                SizedBox(width: 10),
              ]),
              const SizedBox(height: 50),
              TextButton(
                onPressed: () async {
                  if (heightcontroller.text.isNotEmpty &&
                      weightcontroller.text.isNotEmpty) {
                    user.Birthdate = selecteddate.selectedDate.millisecondsSinceEpoch;
                    user.Height = double.parse(heightcontroller.text);
                    user.Weight = double.parse(weightcontroller.text);

                    Random random = new Random();
                    int randomNumber = random.nextInt(100);
                    user.Id = randomNumber;
                    useradapter.newUser(user);

                    heightcontroller.clear();
                    weightcontroller.clear();

                    Navigator.pushNamed(
                      context,
                      "/loginpage",
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Add datas')),
                    );
                  }
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                child: const Text("Back"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(context);
                },
              ),
            ],
          )),
        ),
      ],
    );
  }
}
