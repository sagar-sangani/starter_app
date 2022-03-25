import 'package:flutter/material.dart';

class Abcd extends StatefulWidget {
  final bool showButton;
  const Abcd({Key? key, this.showButton = true}) : super(key: key);

  @override
  State<Abcd> createState() => _AbcdState();
}

class _AbcdState extends State<Abcd> {
  var textIndex = 0;
  void changeText() {
    setState(() {
      if (textIndex < 25) {
        textIndex = textIndex + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var nextText = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z',
    ];

    return LayoutBuilder(builder: (context, constraints) {
      double size = constraints.maxWidth;

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              nextText[textIndex],
              style: TextStyle(
                fontSize: size * 0.8,
              ),
            ),
          ),
          if (widget.showButton)
            ElevatedButton(
              onPressed: () => changeText(),
              child: const Text('Next'),
            ),
        ],
      );
    });
  }
}
