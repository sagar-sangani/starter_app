import 'package:flutter/material.dart';
import 'package:starter_app/app/views/tasks/hexagon/hexagon.dart';

class HexagonPage extends StatelessWidget {
  const HexagonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aa maru Hexagon"),
      ),
      body: const Hexagon(),
    );
  }
}
