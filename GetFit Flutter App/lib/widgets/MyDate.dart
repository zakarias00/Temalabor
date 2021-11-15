
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class MyDate extends StatefulWidget {
  @override
  _MyDateState createState()
  {
    return _MyDateState();
  }
}

class _MyDateState extends State<MyDate> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return
      TextButton(
        child: Text("Choose a date"),
        onPressed: (){
          showDatePicker();
        },
      );
  }

  void showDatePicker()
  {  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height*0.25,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              if (value != null && value != selectedDate)
                setState(() {
                  selectedDate = value;
                  user.Birthdate = selectedDate.toString();
                  print(user.Birthdate);
                });
            },
            initialDateTime: DateTime.now(),
            minimumYear: 1900,
            maximumYear: 2021,
          ),
        );
      }
  );
  }
}