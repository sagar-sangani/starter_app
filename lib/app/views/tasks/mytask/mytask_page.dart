import 'package:flutter/material.dart';
import 'package:starter_app/app/views/tasks/mytask/mytask.dart';

class MyTaskPage extends StatelessWidget {
  const MyTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aa maaro MyTask"),
      ),
      body: MyTask(),
    );
  }
}
