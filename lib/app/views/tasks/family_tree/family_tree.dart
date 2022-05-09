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

class Tree {
  int count;
  int startPoint;
  double variance;

  Tree({
    required this.count,
    required this.startPoint,
    this.variance = 0,
  }) : assert(startPoint > 0);
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

    List<Tree> trees = [
      Tree(count: 3, startPoint: 2),
      Tree(count: 4, startPoint: 3),
      Tree(count: 3, startPoint: 1),
    ];

    final c2 = Path();

    c2.drawCircle(radius);

    double variance = 0;

    for (var tree in trees) {
      c2.drawSubNodes(
        count: tree.count,
        line: line,
        radius: radius,
        varianceAngle: variance,
      );

      variance = c2.shiftNode(
        radius: radius,
        line: line,
        moveCount: tree.startPoint,
        totalCount: tree.count,
        varianceAngle: variance,
      );

      tree.variance = variance;
    }

    for (var tree in trees.reversed) {
      c2.shiftNode(
        radius: radius,
        line: line,
        moveCount: 0,
        totalCount: tree.count,
        varianceAngle: tree.variance,
      );
    }

    // c2.drawSubNodes(count: 3, line: line, radius: radius);

    // double v1 = c2.shiftNode(
    //   radius: radius,
    //   line: line,
    //   moveCount: 2,
    //   totalCount: 3,
    // );

    // c2.drawSubNodes(
    //   count: 4,
    //   line: line,
    //   radius: radius,
    //   varianceAngle: v1,
    // );

    // double v2 = c2.shiftNode(
    //   radius: radius,
    //   line: line,
    //   moveCount: 3,
    //   totalCount: 4,
    //   varianceAngle: v1,
    // );

    // c2.drawSubNodes(
    //   count: 3,
    //   line: line,
    //   radius: radius,
    //   varianceAngle: v2,
    // );

    // double v3 = c2.shiftNode(
    //   radius: radius,
    //   line: line,
    //   moveCount: 1,
    //   totalCount: 3,
    //   varianceAngle: v2,
    // );

    // c2.shiftNode(
    //   radius: radius,
    //   line: line,
    //   moveCount: 0,
    //   totalCount: 3,
    //   varianceAngle: v3,
    // );

    // c2.shiftNode(
    //   radius: radius,
    //   line: line,
    //   moveCount: 0,
    //   totalCount: 4,
    //   varianceAngle: v2,
    // );

    // c2.shiftNode(
    //   radius: radius,
    //   line: line,
    //   moveCount: 0,
    //   totalCount: 3,
    //   varianceAngle: v1,
    // );

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
