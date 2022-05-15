import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({Key? key}) : super(key: key);

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
        painter: CirclesPainter(
          circles: 6,
          progress: 100,
          showDots: true,
          showPath: true,
        ),
      ),
    );
  }
}

class CirclesPainter extends CustomPainter {
  CirclesPainter(
      {required this.circles,
      required this.progress,
      required this.showDots,
      required this.showPath});

  final double circles, progress;
  bool showDots, showPath;

  var myPaint = Paint()
    ..color = Colors.purple
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5.0;

  double radius = 50;

  @override
  void paint(Canvas canvas, Size size) {
    var path = createPath();
    PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      Path extractPath = pathMetric.extractPath(
        0.0,
        pathMetric.length * progress,
      );
      if (showPath) {
        canvas.drawPath(extractPath, myPaint);
      }
      if (showDots) {
        try {
          var metric = extractPath.computeMetrics().first;
          final offset = metric.getTangentForOffset(metric.length)?.position ??
              Offset.zero;

          canvas.drawCircle(offset, 8.0, Paint());
        } catch (e) {}
      }
    }
  }

  Path createPath() {
    var path = Path();
    int n = circles.toInt();
    var range = List<int>.generate(n, (i) => i);
    double angle = 2 * pi / n;
    for (int i in range) {
      double x = radius * cos(i * angle);
      double y = radius * sin(i * angle);
      path.addOval(Rect.fromCircle(center: Offset(x, y), radius: radius));
    }
    return path;
  }

  @override
  bool shouldRepaint(CirclesPainter oldDelegate) {
    return true;
  }
}

// class FamilyTree extends StatelessWidget {
//   const FamilyTree({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InteractiveViewer(
//       constrained: false,
//       alignPanAxis: false,
//       boundaryMargin: const EdgeInsets.all(double.infinity),
//       minScale: 0.1,
//       maxScale: double.infinity,
//       child: CustomPaint(
//         size: MediaQuery.of(context).size,
//         painter: MyTask(),
//       ),
//     );
//   }
// }

// extension CenterExtension on Path {
//   moveCenter(double width, double height) {
//     moveTo(width / 2, height / 2);
//   }
// }

// extension LineExtension on Path {
//   drawLineRight(double line) {
//     relativeLineTo(line, 0);
//   }

//   drawLineLeft(double line) {
//     relativeLineTo(-line, 0);
//   }

//   drawLineTop(double line) {
//     relativeLineTo(0, -line);
//   }

//   drawLineBottom(double line) {
//     relativeLineTo(0, line);
//   }
// }

// extension CircleExtension on Path {
//   drawCircle(double radius) {
//     relativeMoveTo(radius, 0);
//     relativeArcToPoint(
//       Offset(-radius * 2, 0),
//       radius: Radius.circular(radius),
//     );
//     relativeArcToPoint(
//       Offset(radius * 2, 0),
//       radius: Radius.circular(radius),
//     );
//     relativeMoveTo(-radius, 0);
//   }

//   drawAngleCircle({required double radius, required double angle}) {
//     double circleX = radius * cos(angle - (2 * pi));
//     double circleY = radius * sin(angle - (2 * pi));

//     relativeArcToPoint(
//       Offset(2 * circleX, 2 * circleY),
//       radius: Radius.circular(radius),
//     );
//     relativeArcToPoint(
//       Offset(-2 * circleX, -2 * circleY),
//       radius: Radius.circular(radius),
//     );
//   }


// }

// class MyTask extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.red
//       ..strokeWidth = 2
//       ..style = PaintingStyle.stroke;

//     double minSize = size.width < size.height ? size.width : size.height;
//     double line = minSize * 0.2;
//     double width = size.width;
//     double height = size.height;
//     double radius = 30.0;

//     final c2 = Path();
//     var angle = ((pi * 2)) / 4;
//     double circleX = radius * cos(angle);
//     double circleY = radius * sin(angle);

//     double lineX = line * cos(angle);
//     double lineY = line * sin(angle);

//     c2.drawCircle(radius);

//     c2.drawSubNodes(
//       count: 3,
//       line: line,
//       radius: radius,
//       varianceAngle: pi / 2,
//     );

//     c2.shiftNode(
//       moveCount: 3,
//       totalCount: 3,
//       line: line,
//       radius: radius,
//       varianceAngle: pi / 2,
//     );

//     c2.drawSubNodes(
//       count: 3,
//       line: line,
//       radius: radius,
//       varianceAngle: (2 * pi) - (pi / 2),
//     );

//     c2.shiftNode(
//       moveCount: 3,
//       totalCount: 3,
//       line: line,
//       radius: radius,
//       varianceAngle: (2 * pi) - (pi / 2),
//     );



//     c2.relativeLineTo(10, 10);
//     c2.relativeMoveTo(-10, -10);

//     canvas.drawPath(c2, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

// extension SubNodeExtension on Path {
//   double drawSubNodes({
//     required int count,
//     required double line,
//     required double radius,
//     int ignorePlace = 0,
//     double varianceAngle = 0,
//   }) {
//     var angle = ((pi * 2) / count);

//     for (var i = 0; i < count; i++) {
//       if (i + 1 == ignorePlace) {
//         continue;
//       }
//       print('varianceAngle ${varianceAngle * 180 / pi}');
//       var drawAngle = angle * i + (varianceAngle);
//       double circleX = radius * cos(drawAngle);
//       double circleY = radius * sin(drawAngle);

//       double lineX = line * cos(drawAngle);
//       double lineY = line * sin(drawAngle);

//       relativeMoveTo(circleX, circleY);
//       relativeLineTo(lineX, lineY);
//       drawAngleCircle(radius: radius, angle: drawAngle);

//       relativeMoveTo(-lineX - circleX, -lineY - circleY);
//     }
//     return angle + varianceAngle;
//   }

//   double shiftNode({
//     required double radius,
//     required double line,
//     required int moveCount,
//     required int totalCount,
//     double varianceAngle = 0,
//   }) {
//     assert(moveCount <= totalCount,
//         "Move count can not be more than total count.");
//     double angle = 2 * pi / totalCount;
//     double moveAngle = angle * moveCount;

//     print('------------');
//     print({
//       'moveCount': moveCount,
//       'totalCount': totalCount,
//       'angle': angle.degrees,
//       'moveAngle': moveAngle.degrees,
//       'varianceAngle': varianceAngle.degrees,
//     });

//     relativeMoveTo(
//       (2 * radius + line) *
//           cos(((2 * pi) - ((varianceAngle) + (angle * (moveCount - 1))))),
//       (-2 * radius - line) *
//           sin(((2 * pi) - ((varianceAngle) + (angle * (moveCount - 1))))),
//     );

//     return angle;
//   }
// }

// extension DoubleExtension on double {
//   double get radians => this * pi / 180;

//   double get degrees => this * 180 / pi;
// }
