import 'package:flutter/material.dart';
import 'package:starter_app/app/theme/tw_colors.dart';
import 'package:starter_app/app/views/tasks/abcd/abcd.dart';

class AbcdPage extends StatelessWidget {
  const AbcdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aa maari ABCD"),
        backgroundColor: TWColors.blue[400],
      ),
      body: const Abcd(),
    );
  }
}
