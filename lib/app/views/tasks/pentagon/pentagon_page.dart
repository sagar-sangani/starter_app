// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:starter_app/app/views/tasks/pentagon/pentagon.dart';

class PentagonPage extends StatelessWidget {
  const PentagonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aa maru Pentagon"),
      ),
      body: Pentagon(),
    );
  }
}
