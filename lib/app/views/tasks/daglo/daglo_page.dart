import 'package:flutter/material.dart';
import 'package:starter_app/app/views/tasks/daglo/daglo.dart';

class DagloPage extends StatelessWidget {
  const DagloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aa maaro Daglo"),
      ),
      body: Daglo(),
    );
  }
}
