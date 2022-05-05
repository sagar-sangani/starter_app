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
    double circleX = -radius * cos(angle);
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

    final c1 = Path();
    c1.moveCenter(width, height);
    c1.drawCircle(radius);

    c1.drawLineRight(line);
    c1.drawCircleRight(radius);

    c1.relativeMoveTo(radius, -radius);
    c1.drawLineTop(line);
    c1.drawCircleTop(radius);

    c1.relativeMoveTo(0, radius * 2 + line);
    c1.drawLineBottom(line);
    c1.drawCircleBottom(radius);

    c1.relativeMoveTo(radius, -radius - line);
    c1.drawLineRight(line);
    c1.drawCircleRight(radius);

    c1.relativeMoveTo(radius, -radius);
    c1.drawLineTop(line);
    c1.drawCircleTop(radius);

    c1.relativeMoveTo(0, radius * 2 + line);
    c1.drawLineBottom(line);
    c1.drawCircleBottom(radius);

    c1.relativeMoveTo(radius, -radius - line);
    c1.drawLineRight(line);
    c1.drawCircleRight(radius);

    c1.relativeMoveTo(radius, 0);

    int lines = 3;

    var angle = ((pi * 2) / lines);

    double circleX = -radius * cos(angle);
    double circleY = radius * sin(angle);

    double lineX = -line * cos(angle);
    double lineY = line * sin(angle);

    c1.relativeMoveTo(circleX, -circleY);
    c1.relativeLineTo(lineX, -lineY);

    c1.relativeMoveTo(circleX, -circleY);
    c1.drawCircle(radius);

    c1.relativeMoveTo(-radius, 0);
    c1.relativeMoveTo(-circleX * 2 - lineX, circleY * 2 + lineY);

    c1.relativeMoveTo(circleX, circleY);
    c1.relativeLineTo(lineX, lineY);

    c1.relativeMoveTo(circleX, circleY);
    c1.drawCircle(radius);

    c1.relativeLineTo(line, 0);

    canvas.drawPath(c1, paint);

    final c2 = Path();

    c2.drawCircle(radius);
    c2.drawSubNodes(count: 4, line: line, radius: radius);

    c2.relativeMoveTo(3 * radius + line, 0);
    // c2.relativeLineTo(line, 0);
    // c2.relativeMoveTo(10, 0);
    c2.drawSubNodes(count: 3, line: line, radius: radius, ignorePlace: 1);

    canvas.drawPath(c2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

extension SubNodeExtension on Path {
  drawSubNodes({
    required int count,
    required double line,
    required double radius,
    int ignorePlace = 0,
  }) {
    var angle = ((pi * 2) / count);
    // relativeLineTo(lineX, lineY);
    // path.drawAngleCircle(radius: radius, angle: angle);

    // 1. Move to line 1 initial point
    // 2. Draw line 1
    // 3. Draw angle circle
    // 4. Move back to line's initial point
    relativeMoveTo(-radius, 0);

    for (var i = 0; i < count; i++) {
      if (i + 1 == ignorePlace) {
        continue;
      }
      double circleX = -radius * cos(angle * i);
      double circleY = radius * sin(angle * i);

      double lineX = -line * cos(angle * i);
      double lineY = line * sin(angle * i);

      relativeMoveTo(circleX, circleY);
      relativeLineTo(lineX, lineY);
      drawAngleCircle(radius: radius, angle: angle * i);

      relativeMoveTo(-lineX - circleX, -lineY - circleY);
    }
  }
}
