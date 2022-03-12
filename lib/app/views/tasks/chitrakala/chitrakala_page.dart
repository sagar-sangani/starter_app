import 'package:flutter/material.dart';
import 'package:starter_app/app/views/tasks/chitrakala/chitrakala.dart';

class ChitrakalaPage extends StatelessWidget {
  const ChitrakalaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aa maru Chitra"),
      ),
      body: const Chitrakala(),
    );
  }
}
