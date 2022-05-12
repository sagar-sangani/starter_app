part of 'family_tree.dart';

extension TreeExtension on Path {
  drawTree({
    required Tree tree,
    required double line,
    required double radius,
  }) {
    drawSubNodes(
      count: tree.count,
      line: line,
      radius: radius,
      varianceAngle: tree.variance,
    );

    for (var subTree in tree.subTrees) {
      var index = tree.subTrees.indexOf(subTree);

      subTree.variance = shiftNode(
        radius: radius,
        line: line,
        moveCount: index + 1,
        totalCount: tree.count,
        varianceAngle: tree.variance,
      );

      if (subTree.count == 0) {
        shiftNode(
          radius: radius,
          line: line,
          moveCount: 0,
          totalCount: tree.count,
          varianceAngle: subTree.variance,
        );
      } else {
        drawTree(
          tree: subTree,
          line: line,
          radius: radius,
        );
      }
    }

    shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: tree.count,
      varianceAngle: tree.variance,
    );
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
