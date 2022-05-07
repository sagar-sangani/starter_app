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
    relativeMoveTo(-radius, 0);
  }

  drawAngleCircle({required double radius, required double angle}) {
    double circleX = radius * cos(angle - (2 * pi));
    double circleY = radius * sin(angle - (2 * pi));

    relativeArcToPoint(
      Offset(2 * circleX, 2 * circleY),
      radius: Radius.circular(radius),
    );
    relativeArcToPoint(
      Offset(-2 * circleX, -2 * circleY),
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
    double radius = line / 4;

    final c2 = Path();

    c2.drawCircle(radius);

    c2.drawSubNodes(count: 4, line: line, radius: radius);

    double v1 = c2.shiftNode(
      radius: radius,
      line: line,
      moveCount: 3,
      totalCount: 4,
    );

    c2.drawSubNodes(
      count: 3,
      line: line,
      radius: radius,
      varianceAngle: v1,
    );

    double v2 = c2.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 3,
      varianceAngle: v1,
    );

    c2.drawSubNodes(
      count: 6,
      line: line,
      radius: radius,
      varianceAngle: v2,
    );

    double v3 = c2.shiftNode(
      radius: radius,
      line: line,
      moveCount: 4,
      totalCount: 6,
      varianceAngle: v2,
    );

    c2.drawSubNodes(
      count: 4,
      line: line,
      radius: radius,
      varianceAngle: v3,
    );

    double v4 = c2.shiftNode(
      radius: radius,
      line: line,
      moveCount: 2,
      totalCount: 4,
      varianceAngle: v3,
    );

    c2.drawSubNodes(
      count: 8,
      line: line,
      radius: radius,
      varianceAngle: v4,
    );

    double v5 = c2.shiftNode(
      radius: radius,
      line: line,
      moveCount: 4,
      totalCount: 8,
      varianceAngle: v4,
    );

    c2.drawSubNodes(
      count: 3,
      line: line,
      radius: radius,
      varianceAngle: v5,
    );

    double v6 = c2.shiftNode(
      radius: radius,
      line: line,
      moveCount: 2,
      totalCount: 3,
      varianceAngle: v5,
    );

    c2.drawSubNodes(
      count: 4,
      line: line,
      radius: radius,
      varianceAngle: v6,
    );

    double v7 = c2.shiftNode(
      radius: radius,
      line: line,
      moveCount: 2,
      totalCount: 4,
      varianceAngle: v6,
    );

    c2.relativeLineTo(10, 10);
    c2.relativeMoveTo(-10, -10);

    canvas.drawPath(c2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

extension SubNodeExtension on Path {
  void drawSubNodes({
    required int count,
    required double line,
    required double radius,
    int ignorePlace = 0,
    double varianceAngle = 0,
  }) {
    var angle = ((pi * 2) / count);

    for (var i = 0; i < count; i++) {
      if (i + 1 == ignorePlace || (varianceAngle != 0 && i == 0)) {
        continue;
      }
      var drawAngle = angle * i + (varianceAngle);
      double circleX = radius * cos(drawAngle);
      double circleY = radius * sin(drawAngle);

      double lineX = line * cos(drawAngle);
      double lineY = line * sin(drawAngle);

      relativeMoveTo(circleX, circleY);
      relativeLineTo(lineX, lineY);
      drawAngleCircle(radius: radius, angle: drawAngle);

      relativeMoveTo(-lineX - circleX, -lineY - circleY);
    }
  }

  double shiftNode({
    required double radius,
    required double line,
    required int moveCount,
    required int totalCount,
    double varianceAngle = 0,
  }) {
    double angle = 2 * pi / totalCount;
    double moveAngle = angle * moveCount;

    relativeMoveTo(
      (2 * radius + line) * cos((2 * pi) - (varianceAngle + moveAngle)),
      (-2 * radius - line) * sin((2 * pi) - (varianceAngle + moveAngle)),
    );

    return (varianceAngle + pi) + (angle * moveCount);
  }
}

extension DoubleExtension on double {
  double get radians => this * pi / 180;

  double get degrees => this * 180 / pi;
}
