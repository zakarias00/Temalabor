
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  final items = List<String>.generate(100, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  <Widget> [
            const Text("History", style: TextStyle(fontSize: 30)),
            CupertinoButton(
              onPressed: () {
                showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) => CupertinoActionSheet(
                    title: const Text('Sports'),
                    actions: <CupertinoActionSheetAction>[
                      CupertinoActionSheetAction(
                        child: const Text('Swimming'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: const Text('Running'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: const Text('Dancing'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                );
              }, child: Text("Search"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index]),
                  );
                },
              ),
            ),
          CupertinoButton(
          onPressed: () {
            showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: const Text('Title'),
                message: const Text('Message'),
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    child: const Text('Action One'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: const Text('Action Two'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          }, child: Text("Add activity"),
      ),
          ]
      ),
    );
  }
}


