// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:starter_app/app/theme/tw_colors.dart';

import 'color_shadding.dart';

class ColorShaddingPage extends StatelessWidget {
  const ColorShaddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Shaddings"),
        backgroundColor: TWColors.blue[400],
      ),
      body: ColorShadding(),
    );
  }
}
