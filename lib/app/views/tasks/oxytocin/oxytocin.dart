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
extension CenterExtension on Path {
  moveCenter(double width, double height) {
    moveTo(width / 2, height / 2);
  }
}

extension HolygonExtension on Path {
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

// FOR TRIANGLE
extension VerticalTriangleExtension on Path {
  drawTriangleLineRight(double tSide) {
    relativeLineTo(tSide, 0);
  }

  drawTriangleLineLeft(double tSide) {
    relativeLineTo(-tSide, 0);
  }

  drawTriangleLineTop(double tSide) {
    relativeLineTo(0, -tSide);
  }

  drawTriangleLineBottom(double tSide) {
    relativeLineTo(0, tSide);
  }

  drawVTLineTopRight(double tWidth, double tHeight) {
    relativeLineTo(tWidth, -tHeight);
  }

  drawVTLineTopLeft(double tWidth, double tHeight) {
    relativeLineTo(-tWidth, -tHeight);
  }

  drawVTLineBottomRight(double tWidth, double tHeight) {
    relativeLineTo(tWidth, tHeight);
  }

  drawVTLineBottomLeft(double tWidth, double tHeight) {
    relativeLineTo(-tWidth, tHeight);
  }
}

extension HorizontalTriangleExtension on Path {
  drawHTLineTopRight(double tHeight, double tWidth) {
    relativeLineTo(tHeight, -tWidth);
  }

  drawHTLineTopLeft(double tHeight, double tWidth) {
    relativeLineTo(-tHeight, -tWidth);
  }

  drawHTLineBottomLeftt(double tHeight, double tWidth) {
    relativeLineTo(-tHeight, tWidth);
  }

  drawHTLineBottomRight(double tHeight, double tWidth) {
    relativeLineTo(tHeight, tWidth);
  }
}

class MyTask extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    // ..strokeCap = StrokeCap.round;
    var width = size.width;
    var height = size.height;
    var minSize = size.width < size.height ? size.width : size.height;
//FOR HEXAGON
    var hexagonSides = 6;
    var hSide = minSize / 7;
    var hradians = math.pi / hexagonSides;
    var hx = hSide * math.cos(hradians);
    var hy = hSide * math.sin(hradians); //FOR HEXAGON

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
    // hpath.close();
    canvas.drawPath(hpath, paint);

//FOR TRIANGLE
    var triangleSides = 3;
    var tSide = minSize / 5;
    var tradians = math.pi / triangleSides;
    var tWidth = tSide * math.cos(tradians);
    var tHeight = tSide * math.sin(tradians);

    //Triangle path
    final tpath = Path();

    //1 tpath Vertical
    tpath.moveCenter(width, height);
    tpath.relativeMoveTo(0, 2 * tSide);
    tpath.drawTriangleLineRight(tSide);
    tpath.drawVTLineTopLeft(tWidth, tHeight);
    tpath.drawVTLineBottomLeft(tWidth, tHeight);

    //2 tpath Horizontal
    tpath.moveCenter(width, height);
    tpath.relativeMoveTo(0, tSide);
    tpath.relativeMoveTo(-tSide / 2, 0);
    tpath.drawTriangleLineBottom(tSide);
    tpath.relativeMoveTo(0, -tSide);
    tpath.drawHTLineBottomLeftt(tHeight, tWidth);
    tpath.drawHTLineBottomRight(tHeight, tWidth);

    tpath.close();
    canvas.drawPath(tpath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
