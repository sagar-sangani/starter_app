import 'package:flutter/material.dart';
import 'package:starter_app/app/views/tasks/polygon/polygon.dart';

class PolygonPage extends StatelessWidget {
  const PolygonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aa maru Polygon"),
      ),
      body: Polygon(),
    );
  }
}