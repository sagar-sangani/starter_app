import 'package:flutter/material.dart';
import 'package:starter_app/app/theme/tw_colors.dart';
import 'package:starter_app/app/views/tasks/daglo/daglo.dart';

class DagloPage extends StatelessWidget {
  const DagloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aa maaro Daglo"),
        backgroundColor: TWColors.blue[400],
      ),
      body: const Daglo(),
    );
  }
}
