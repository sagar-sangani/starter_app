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

    Tree tree = Tree(
      count: 1,
      subTrees: [
        Tree(
          count: 2,
          subTrees: [
            Tree(
              count: 4,
              subTrees: [
                Tree(count: 0),
                Tree(
                  count: 2,
                  subTrees: [
                    Tree(
                      count: 2,
                      subTrees: [
                        Tree(
                          count: 4,
                          subTrees: [
                            Tree(count: 3),
                            Tree(
                              count: 2,
                              subTrees: [
                                Tree(
                                  count: 2,
                                  subTrees: [
                                    Tree(
                                      count: 2,
                                      subTrees: [
                                        Tree(count: 3),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Tree(
                              count: 3,
                              subTrees: [
                                Tree(
                                  count: 4,
                                  subTrees: [
                                    Tree(count: 0),
                                    Tree(
                                      count: 4,
                                      subTrees: [
                                        Tree(count: 0),
                                        Tree(
                                          count: 5,
                                          subTrees: [
                                            Tree(count: 0),
                                            Tree(count: 0),
                                            Tree(
                                              count: 2,
                                              subTrees: [
                                                Tree(
                                                  count: 3,
                                                  subTrees: [
                                                    Tree(
                                                      count: 3,
                                                      subTrees: [
                                                        Tree(count: 3),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Tree(count: 0),
                                      ],
                                    ),
                                  ],
                                ),
                                Tree(count: 4),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Tree(count: 4),
              ],
            )
          ],
        ),
      ],
    );

    final path = Path();

    path.drawCircle(radius);

    path.drawTree(tree: tree, line: line, radius: radius);

    path.shiftNode(
      radius: radius,
      line: line,
      moveCount: 0,
      totalCount: 2,
      varianceAngle: pi,
    );

    path.relativeLineTo(10, 10);
    path.relativeMoveTo(-10, -10);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
