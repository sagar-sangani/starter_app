// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:starter_app/app/views/tasks/triangle/triangle.dart';

class TrianglePage extends StatelessWidget {
  const TrianglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aa maru Triangle"),
      ),
      body: Triangle(),
    );
  }
}
