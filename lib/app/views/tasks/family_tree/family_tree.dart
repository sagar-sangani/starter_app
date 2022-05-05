import 'dart:math';

import 'package:flutter/material.dart';

class FamilyTree extends StatelessWidget {
  const FamilyTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      constrained: false,
      alignPanAxis: false,
      boundaryMargin: const EdgeInsets.all(double.infinity),
      minScale: 0.1,
      maxScale: double.infinity,
      child: CustomPaint(
        size: MediaQuery.of(context).size,
        painter: MyTask(),
      ),
    );
  }
}

extension CenterExtension on Path {
  moveCenter(double width, double height) {
    moveTo(width / 2, height / 2);
  }
}

extension LineExtension on Path {
  drawLineRight(double line) {
    relativeLineTo(line, 0);
  }

  drawLineLeft(double line) {
    relativeLineTo(-line, 0);
  }

  drawLineTop(double line) {
    relativeLineTo(0, -line);
  }

  drawLineBottom(double line) {
    relativeLineTo(0, line);
  }
}

extension CircleExtension on Path {
  drawCircle(double radius) {
    relativeMoveTo(radius, 0);
    relativeArcToPoint(
      Offset(-radius * 2, 0),
      radius: Radius.circular(radius),
    );
    relativeArcToPoint(
      Offset(radius * 2, 0),
      radius: Radius.circular(radius),
    );
    // relativeMoveTo(radius, 0);
  }

  drawAngleCircle({required double radius, required double angle}) {
    double circleX = radius * cos(angle);
    double circleY = radius * sin(angle);

    relativeArcToPoint(
      Offset(2 * circleX, 2 * circleY),
      radius: Radius.circular(radius),
    );
    relativeArcToPoint(
      Offset(-2 * circleX, -2 * circleY),
      radius: Radius.circular(radius),
    );
  }

  // drawCircleLeft(double radius) {
  //   relativeArcToPoint(
  //     Offset(-radius * 2, 0),
  //     radius: Radius.circular(radius),
  //   );
  //   relativeArcToPoint(
  //     Offset(radius * 2, 0),
  //     radius: Radius.circular(radius),
  //   );
  // }

  drawCircleRight(double radius) {
    relativeArcToPoint(
      Offset(radius * 2, 0),
      radius: Radius.circular(radius),
    );
    relativeArcToPoint(
      Offset(-radius * 2, 0),
      radius: Radius.circular(radius),
    );
  }

  drawCircleTop(double radius) {
    relativeArcToPoint(
      Offset(0, -radius * 2),
      radius: Radius.circular(radius),
    );
    relativeArcToPoint(
      Offset(0, radius * 2),
      radius: Radius.circular(radius),
    );
  }

  drawCircleBottom(double radius) {
    relativeArcToPoint(
      Offset(0, radius * 2),
      radius: Radius.circular(radius),
    );
    relativeArcToPoint(
      Offset(0, -radius * 2),
      radius: Radius.circular(radius),
    );
  }
}

class MyTask extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double minSize = size.width < size.height ? size.width : size.height;
    double line = minSize * 0.2;
    double width = size.width;
    double height = size.height;
    double radius = 30.0;

    final c2 = Path();

    c2.drawCircle(radius);
    c2.relativeMoveTo(-radius, 0);

    var value1 = c2.drawSubNodes(count: 3, line: line, radius: radius);
    c2.relativeMoveTo(2 * radius + line, 0);

    var angle = ((pi * 2)) / 4;
    double circleX = radius * cos(angle);
    double circleY = radius * sin(angle);

    double lineX = line * cos(angle);
    double lineY = line * sin(angle);

    var value2 =
        c2.drawSubNodes(count: 4, line: line, radius: radius, varianceAngle: 0);
    c2.relativeMoveTo(0, -2 * radius - line);

    var value3 = c2.drawSubNodes(
        count: 3, line: line, radius: radius, varianceAngle: value2);

    c2.relativeMoveTo(
      (2 * radius + line) * cos(pi / 6),
      (-2 * radius - line) * sin(pi / 6),
    );

    var value4 = c2.drawSubNodes(
        count: 3, line: line, radius: radius, varianceAngle: value3);

    c2.relativeMoveTo(
      (2 * radius + line) * cos(pi / 6),
      (-2 * radius - line) * sin(pi / 6),
    );

    var value5 = c2.drawSubNodes(
        count: 4, line: line, radius: radius, varianceAngle: value4);

    c2.relativeMoveTo(
      (2 * radius + line) * cos(pi / 3),
      (2 * radius + line) * sin(pi / 3),
    );

    // c2.relativeLineTo(10, 10);
    line = 40;

    var value6 = c2.drawSubNodes(
        count: 5, line: line, radius: radius, varianceAngle: value5);

    canvas.drawPath(c2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

extension SubNodeExtension on Path {
  double drawSubNodes({
    required int count,
    required double line,
    required double radius,
    int ignorePlace = 0,
    double varianceAngle = 0,
  }) {
    var angle = ((pi * 2) / count);
    // relativeLineTo(lineX, lineY);
    // path.drawAngleCircle(radius: radius, angle: angle);

    // 1. Move to line 1 initial point
    // 2. Draw line 1
    // 3. Draw angle circle
    // 4. Move back to line's initial point

    for (var i = 0; i < count; i++) {
      if (i + 1 == ignorePlace) {
        continue;
      }
      var drawAngle = angle * i + (varianceAngle);
      double circleX = radius * cos(drawAngle);
      double circleY = radius * sin(drawAngle);

      double lineX = line * cos(drawAngle);
      double lineY = line * sin(drawAngle);

      print('circleX: ${circleX * 180 / pi}');
      print('circleY: ${circleY * 180 / pi}');
      print('lineX: ${lineX * 180 / pi}');
      print('lineY: ${lineY * 180 / pi}');

      relativeMoveTo(circleX, circleY);
      relativeLineTo(lineX, lineY);
      drawAngleCircle(radius: radius, angle: drawAngle);

      relativeMoveTo(-lineX - circleX, -lineY - circleY);
    }
    return angle + varianceAngle;
  }
}
