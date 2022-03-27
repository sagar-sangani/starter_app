import 'package:flutter/material.dart';
import 'package:starter_app/app/views/tasks/oxytocin/oxytocin.dart';

class OxytocinPage extends StatelessWidget {
  const OxytocinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aa maru Oxytocin"),
      ),
      body: const Oxytocin(),
    );
  }
}
