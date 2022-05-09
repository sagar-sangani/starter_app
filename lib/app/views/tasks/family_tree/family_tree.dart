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

  @override
  String toString() {
    return {
      'count': count,
      'startPoint': startPoint,
      'variance': variance,
    }.toString();
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

    List<Tree> trees = [
      Tree(count: 3, startPoint: 2),
      Tree(count: 4, startPoint: 3),
      Tree(count: 3, startPoint: 1),
    ];

    final path = Path();

    drawTree(
      path,
      trees: trees,
      line: line,
      radius: radius,
    );

    final remainingTrees = backTo(
      path,
      trees: trees,
      line: line,
      radius: radius,
      reverseCount: 1,
    );

    backTo(
      path,
      trees: remainingTrees,
      line: line,
      radius: radius,
      reverseCount: 1,
    );

    path.relativeLineTo(10, 10);
    path.relativeMoveTo(-10, -10);

    canvas.drawPath(path, paint);
  }

  drawTree(
    Path path, {
    required List<Tree> trees,
    required double line,
    required double radius,
  }) {
    path.drawCircle(radius);

    double variance = 0;
    for (var tree in trees) {
      path.drawSubNodes(
        count: tree.count,
        line: line,
        radius: radius,
        varianceAngle: variance,
      );

      variance = path.shiftNode(
        radius: radius,
        line: line,
        moveCount: tree.startPoint,
        totalCount: tree.count,
        varianceAngle: variance,
      );

      tree.variance = variance;
    }
  }

  List<Tree> backTo(
    Path path, {
    required List<Tree> trees,
    required double line,
    required double radius,
    required int reverseCount,
  }) {
    final reverseTrees = trees.reversed;

    final treesToMoveBack = reverseTrees.where(
      (element) => trees.reversed.toList().indexOf(element) < reverseCount,
    );

    // remaining trees
    final remainingTrees = reverseTrees.where(
      (element) => !treesToMoveBack.toList().contains(element),
    );

    for (var tree in treesToMoveBack) {
      path.shiftNode(
        radius: radius,
        line: line,
        moveCount: 0,
        totalCount: tree.count,
        varianceAngle: tree.variance,
      );
    }

    return remainingTrees.toList().reversed.toList();
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
