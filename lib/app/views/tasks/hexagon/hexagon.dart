import 'dart:math' as math;

import 'package:flutter/material.dart';

class Hexagon extends StatelessWidget {
  const Hexagon({Key? key}) : super(key: key);

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
extension CenterExtension on Path {
  moveCenter(double width, double height) {
    moveTo(width / 2, height / 2);
  }
}

extension HexagonExtension on Path {
  drawLineTopRight(double hx, double hy) {
    relativeLineTo(hx, -hy);
  }

  drawLineTopLeft(double hx, double hy) {
    relativeLineTo(-hx, -hy);
  }

  drawLineBottomRight(double hx, double hy) {
    relativeLineTo(hx, hy);
  }

  drawLineBottomLeft(double hx, double hy) {
    relativeLineTo(-hx, hy);
  }

  drawHorizontalLineRight(double hSide) {
    relativeLineTo(hSide, 0);
  }

  drawHorizontalLineLeft(double hSide) {
    relativeLineTo(-hSide, 0);
  }

  drawVerticalLineTop(double hSide) {
    relativeLineTo(0, -hSide);
  }

  drawVerticalLineBottom(double hSide) {
    relativeLineTo(0, hSide);
  }
}

class MyTask extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    var width = size.width;
    var height = size.height;
    var minSize = size.width < size.height ? size.width : size.height;

    var hexagonSides = 6;
    var hSide = minSize / 7;
    var hradians = math.pi / hexagonSides;
    var hx = hSide * math.cos(hradians);
    var hy = hSide * math.sin(hradians);

    //p1
    final hpath = Path();
    hpath.moveCenter(width, height);
    hpath.relativeMoveTo(-2 * hx, 35);
    hpath.drawVerticalLineTop(hSide);
    hpath.drawLineTopRight(hx, hy);
    hpath.drawLineBottomRight(hx, hy);
    hpath.drawVerticalLineBottom(hSide);
    hpath.drawLineBottomLeft(hx, hy);
    hpath.drawLineTopLeft(hx, hy);
    //p2
    hpath.relativeMoveTo(2 * hx, 0);
    hpath.drawLineBottomRight(hx, hy);
    hpath.drawLineTopRight(hx, hy);
    hpath.drawVerticalLineTop(hSide);
    hpath.drawLineTopLeft(hx, hy);
    hpath.drawLineBottomLeft(hx, hy);
    //p3
    hpath.relativeMoveTo(hx, -hy);
    hpath.drawVerticalLineTop(hSide);
    hpath.drawLineTopLeft(hx, hy);
    hpath.drawLineBottomLeft(hx, hy);
    hpath.drawVerticalLineBottom(hSide);
    hpath.relativeMoveTo(2 * hx, 0);
    hpath.close();
    canvas.drawPath(hpath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
