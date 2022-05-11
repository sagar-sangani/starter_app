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

    // List<Tree> trees = [
    //   Tree(count: 4, startPoint: 4),
    //   Tree(
    //     count: 3,
    //     startPoint: 1,
    //     subTrees: [
    //       Tree(count: 3),
    //       // Tree(count: 4),
    //     ],
    //   ),
    //   // Tree(count: 4, startPoint: 2),
    // ];

    final path = Path();

    path.drawCircle(radius);

    path.drawSubNodes(count: 1, line: line, radius: radius);

    final v1 =
        path.shiftNode(radius: radius, line: line, moveCount: 1, totalCount: 1);

    path.drawSubNodes(
      count: 2,
      line: line,
      radius: radius,
      varianceAngle: v1,
    );

    final v2 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 2,
      varianceAngle: v1,
    );

    path.drawSubNodes(count: 4, line: line, radius: radius, varianceAngle: v2);

    final v3 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 4,
      varianceAngle: v2,
    );

    final v4 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 4,
      varianceAngle: v3,
    );

    final v5 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 2,
      totalCount: 4,
      varianceAngle: v2,
    );

    path.drawSubNodes(count: 2, line: line, radius: radius, varianceAngle: v5);

    final v6 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 2,
      varianceAngle: v5,
    );

    path.drawSubNodes(count: 2, line: line, radius: radius, varianceAngle: v6);

    final v7 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 2,
      varianceAngle: v6,
    );

    path.drawSubNodes(count: 4, line: line, radius: radius, varianceAngle: v7);

    final v8 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 4,
      varianceAngle: v7,
    );

    path.drawSubNodes(count: 3, line: line, radius: radius, varianceAngle: v8);

    final v9 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 3,
      varianceAngle: v8,
    );

    final v10 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 3,
      varianceAngle: v9,
    );

    final v11 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 2,
      totalCount: 3,
      varianceAngle: v8,
    );

    final v12 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 3,
      varianceAngle: v11,
    );

    final v13 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 3,
      varianceAngle: v8,
    );

    final v14 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 2,
      totalCount: 4,
      varianceAngle: v7,
    );

    path.drawSubNodes(count: 2, line: line, radius: radius, varianceAngle: v14);

    final v15 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 2,
      varianceAngle: v14,
    );

    path.drawSubNodes(count: 2, line: line, radius: radius, varianceAngle: v15);

    final v16 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 2,
      varianceAngle: v15,
    );

    path.drawSubNodes(count: 2, line: line, radius: radius, varianceAngle: v16);

    final v17 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 2,
      varianceAngle: v16,
    );

    path.drawSubNodes(count: 3, line: line, radius: radius, varianceAngle: v17);

    final v18 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 3,
      varianceAngle: v17,
    );

    final v19 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 3,
      varianceAngle: v18,
    );

    final v20 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 2,
      totalCount: 3,
      varianceAngle: v17,
    );

    final v21 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 3,
      varianceAngle: v20,
    );

    final v22 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 3,
      varianceAngle: v17,
    );

    final v23 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 2,
      varianceAngle: v16,
    );

    final v24 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 2,
      varianceAngle: v15,
    );

    final v26 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 2,
      varianceAngle: v14,
    );

    final v27 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 3,
      totalCount: 4,
      varianceAngle: v7,
    );

    path.drawSubNodes(count: 3, line: line, radius: radius, varianceAngle: v27);

    final v28 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 3,
      varianceAngle: v27,
    );

    path.drawSubNodes(count: 4, line: line, radius: radius, varianceAngle: v28);

    final v29 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 4,
      varianceAngle: v28,
    );

    final v30 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 4,
      varianceAngle: v29,
    );

    final v31 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 2,
      totalCount: 4,
      varianceAngle: v28,
    );

    final v32 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 4,
      varianceAngle: v31,
    );

    final v33 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 3,
      totalCount: 4,
      varianceAngle: v28,
    );

    final v34 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 4,
      varianceAngle: v33,
    );

    final v35 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 3,
      varianceAngle: v28,
    );

    final v36 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 2,
      totalCount: 3,
      varianceAngle: v27,
    );

    // 2nd

    path.drawSubNodes(count: 4, line: line, radius: radius, varianceAngle: v36);

    final v37 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 4,
      varianceAngle: v36,
    );

    final v38 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 4,
      varianceAngle: v37,
    );

    final v39 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 2,
      totalCount: 4,
      varianceAngle: v36,
    );

    final v40 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 4,
      varianceAngle: v39,
    );

    final v41 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 3,
      totalCount: 4,
      varianceAngle: v36,
    );

    final v42 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 4,
      varianceAngle: v41,
    );

    final v43 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 4,
      varianceAngle: v36,
    );

    final v44 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 3,
      varianceAngle: v27,
    );

    final v45 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 4,
      varianceAngle: v7,
    );

    final v46 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 2,
      varianceAngle: v6,
    );

    final v47 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 2,
      varianceAngle: v5,
    );

    final v48 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 3,
      totalCount: 4,
      varianceAngle: v2,
    );

    path.drawSubNodes(count: 4, line: line, radius: radius, varianceAngle: v48);

    final v49 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 1,
      totalCount: 4,
      varianceAngle: v48,
    );

    final v50 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 4,
      varianceAngle: v49,
    );

    final v51 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 2,
      totalCount: 4,
      varianceAngle: v48,
    );

    final v52 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 4,
      varianceAngle: v51,
    );

    final v53 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 3,
      totalCount: 4,
      varianceAngle: v48,
    );

    final v54 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 4,
      varianceAngle: v53,
    );

    final v55 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 4,
      varianceAngle: v48,
    );

    final v56 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 2,
      varianceAngle: v2,
    );

    final v57 = path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 1,
      varianceAngle: v1,
    );

    // drawTree(
    //   path,
    //   trees: trees,
    //   line: line,
    //   radius: radius,
    // );

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
