import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Sagar Sangani",
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Sagar Sangani"),
      ),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("Hi!"),
              ),
              CupertinoButton(
                onPressed: () {
                  print("Size is: ${context.size}");
                },
                child: Text("Click me to get size"),
              ),
              ...[Colors.red, Colors.blue, Colors.pink, Colors.yellow]
                  .map(
                    (e) => Container(
                      width: double.infinity,
                      height: 500,
                      color: e,
                      child: Center(
                        child: Text("Hi"),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
