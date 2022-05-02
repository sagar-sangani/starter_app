// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'color_shadding.dart';

class ColorShaddingPage extends StatelessWidget {
  const ColorShaddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Shaddings"),
      ),
      body: ColorShadding(),
    );
  }
}
