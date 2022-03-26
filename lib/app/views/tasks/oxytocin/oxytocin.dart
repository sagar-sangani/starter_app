import 'dart:math' as math;

import 'package:flutter/material.dart';

class Oxytocin extends StatelessWidget {
  const Oxytocin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: CustomPaint(
              painter: MyTask(),
              size: MediaQuery.of(context).size,
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}

// FOR PAINTING POLYGONS
extension PathExtension on Path {
  moveCenter(double width, double height) {
    moveTo(width / 2, height / 2);
  }
}

extension PolygonExtension on Path {
  drawLineTopRight(double x, double y) {
    relativeLineTo(x, -y);
  }

  drawLineTopLeft(double x, double y) {
    relativeLineTo(-x, -y);
  }

  drawLineBottomRight(double x, double y) {
    relativeLineTo(x, y);
  }

  drawLineBottomLeft(double x, double y) {
    relativeLineTo(-x, y);
  }

  drawHorizontalLineFromLeftToRight(double hSide) {
    relativeLineTo(hSide, 0);
  }

  drawHorizontalLineFromRightToLeft(double hSide) {
    relativeLineTo(-hSide, 0);
  }

  drawVerticalLineFromBottomToTop(double hSide) {
    relativeLineTo(0, -hSide);
  }

  drawVerticalLineFromTopToBottom(double hSide) {
    relativeLineTo(0, hSide);
  }
}

class MyTask extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var polygonSides = 6;
    var width = size.width;
    var height = size.height;
    var minSize = size.width < size.height ? size.width : size.height;
    var hSide = minSize / 6; //hexagon sides length

    var radians = math.pi / polygonSides;
    var x = hSide * math.cos(radians);
    var y = hSide * math.sin(radians);
    //path
    final path = Path();

    //p1
    path.moveCenter(width, height);
    path.relativeMoveTo(-2 * x, 35);
    path.drawVerticalLineFromBottomToTop(hSide);
    path.drawLineTopRight(x, y);
    path.drawLineBottomRight(x, y);
    path.drawVerticalLineFromTopToBottom(hSide);
    path.drawLineBottomLeft(x, y);
    path.drawLineTopLeft(x, y);
    //p2
    path.relativeMoveTo(2 * x, 0);
    path.drawLineBottomRight(x, y);
    path.drawLineTopRight(x, y);
    path.drawVerticalLineFromBottomToTop(hSide);
    path.drawLineTopLeft(x, y);
    path.drawLineBottomLeft(x, y);
    //p3
    path.relativeMoveTo(x, -y);
    path.drawVerticalLineFromBottomToTop(hSide);
    path.drawLineTopLeft(x, y);
    path.drawLineBottomLeft(x, y);
    path.drawVerticalLineFromTopToBottom(hSide);
    path.relativeMoveTo(2 * x, 0);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
