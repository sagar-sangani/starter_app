import 'dart:math';

import 'package:flutter/material.dart';
part 'family_tree_extensions.dart';

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
  List<Tree> subTrees;

  Tree({
    required this.count,
    this.startPoint = 1,
    this.variance = 0,
    this.subTrees = const [],
  }) : assert(startPoint > 0);

  @override
  String toString() {
    return {
      'count': count,
      'startPoint': startPoint,
      'variance': variance,
      'subTrees': subTrees,
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
      Tree(count: 4, startPoint: 4),
      Tree(
        count: 3,
        startPoint: 1,
        subTrees: [
          Tree(count: 3),
          // Tree(count: 4),
        ],
      ),
      // Tree(count: 4, startPoint: 2),
    ];

    final path = Path();

    drawTree(
      path,
      trees: trees,
      line: line,
      radius: radius,
    );

    // final remainingTrees = backTo(
    //   path,
    //   trees: trees,
    //   line: line,
    //   radius: radius,
    //   reverseCount: 1,
    // );

    // backTo(
    //   path,
    //   trees: remainingTrees,
    //   line: line,
    //   radius: radius,
    //   reverseCount: 1,
    // );

    path.relativeLineTo(10, 10);
    path.relativeMoveTo(-10, -10);

    canvas.drawPath(path, paint);
  }

  // Method declarations

  drawTree(
    Path path, {
    required List<Tree> trees,
    required double line,
    required double radius,
    double variance = 0,
  }) {
    path.drawCircle(radius);

    for (var tree in trees) {
      path.drawSubNodes(
        count: tree.count,
        line: line,
        radius: radius,
        varianceAngle: variance,
      );

      if (tree.subTrees.isNotEmpty) {
        variance = path.shiftNode(
          radius: radius,
          line: line,
          moveCount: tree.startPoint,
          totalCount: tree.count,
          varianceAngle: variance,
        );

        drawTree(
          path,
          trees: tree.subTrees,
          line: line,
          radius: radius,
          variance: variance,
        );

        backTo(
          path,
          trees: tree.subTrees,
          line: line,
          radius: radius,
          reverseCount: tree.subTrees.length,
        );

        tree.variance = variance;
      } else {
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
