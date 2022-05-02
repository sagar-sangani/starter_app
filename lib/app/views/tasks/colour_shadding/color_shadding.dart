import 'package:flutter/material.dart';

import '../../../theme/tw_colors.dart';

class ColorShadding extends StatelessWidget {
  const ColorShadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorList = [
      TWColors.pink,
      TWColors.fuchsia,
      TWColors.red,
      TWColors.blue,
      TWColors.amber,
      TWColors.slate,
      TWColors.cyan,
      TWColors.orange,
      TWColors.teal,
      TWColors.purple,
    ];
    final colorVariant = [
      50,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900,
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: colorList
              .map(
                (colorName) => Row(
                  children: colorVariant
                      .map(
                        (variant) => Container(
                          height: (constraints.maxHeight) / colorList.length,
                          width: (constraints.maxWidth) / 10,
                          color: colorName[variant],
                        ),
                      )
                      .toList(),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
