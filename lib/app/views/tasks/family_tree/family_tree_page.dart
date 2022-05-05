import 'package:flutter/material.dart';
import 'package:starter_app/app/theme/tw_colors.dart';

import 'package:starter_app/app/views/tasks/family_tree/family_tree.dart';

class FamilyTreePage extends StatelessWidget {
  const FamilyTreePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aa maru Family"),
        backgroundColor: TWColors.blue[400],
      ),
      body: const FamilyTree(),
    );
  }
}
