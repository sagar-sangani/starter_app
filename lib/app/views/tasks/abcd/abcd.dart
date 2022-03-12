import 'package:flutter/material.dart';

class Abcd extends StatefulWidget {
  const Abcd({Key? key}) : super(key: key);

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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            nextText[textIndex],
            style: TextStyle(
              fontSize: 100,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => changeText(),
          child: Text('Next'),
        ),
      ],
    );
  }
}
