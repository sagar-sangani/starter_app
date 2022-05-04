import 'package:flutter/material.dart';

import '../../../theme/tw_colors.dart';

class NumPad extends StatelessWidget {
  final int digit;
  final Function(int digit) onTap;
  const NumPad({
    Key? key,
    required this.digit,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: InkWell(
        onTap: () {
          onTap(digit);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Text(
              digit.toString(),
              style: TextStyle(
                color: TWColors.slate[800],
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
