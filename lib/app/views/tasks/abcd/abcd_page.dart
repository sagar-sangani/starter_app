import 'package:flutter/material.dart';
import 'package:starter_app/app/views/tasks/abcd/abcd.dart';

class AbcdPage extends StatelessWidget {
  const AbcdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aa maari ABCD"),
      ),
      body: const Abcd(),
    );
  }
}
