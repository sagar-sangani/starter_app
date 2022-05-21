import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

import '../app/theme/tw_colors.dart';

class PasswordCheckFormat extends StatelessWidget {
  final bool condition;
  final String note;

  const PasswordCheckFormat({
    Key? key,
    required this.condition,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        condition
            ? const Icon(
                BootstrapIcons.check_circle_fill,
                size: 18,
                color: TWColors.green,
              )
            : const Icon(
                BootstrapIcons.x_circle_fill,
                size: 18,
                color: TWColors.red,
              ),
        const SizedBox(width: 10),
        Flexible(
          fit: FlexFit.tight,
          child: Text(
            note,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
