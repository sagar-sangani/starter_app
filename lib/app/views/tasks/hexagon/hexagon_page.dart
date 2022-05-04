import 'package:flutter/material.dart';
import 'package:starter_app/app/theme/tw_colors.dart';
import 'package:starter_app/app/views/tasks/hexagon/hexagon.dart';

class HexagonPage extends StatelessWidget {
  const HexagonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aa maru Hexagon"),
        backgroundColor: TWColors.blue[400],
      ),
      body: const Hexagon(),
    );
  }
}
