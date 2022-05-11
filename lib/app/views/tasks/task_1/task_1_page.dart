// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:starter_app/app/views/tasks/task_1/task_1.dart';

class Task1Page extends StatelessWidget {
  const Task1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Task1(),
    );
  }
}
