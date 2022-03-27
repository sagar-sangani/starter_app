import 'dart:math' as math;

import 'package:flutter/material.dart';

class Triangle extends StatelessWidget {
  const Triangle({Key? key}) : super(key: key);

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

extension CenterExtension on Path {
  moveCenter(double width, double height) {
    moveTo(width / 2, height / 2);
  }
}

// FOR TRIANGLE
extension TriangleExtension on Path {
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
}

extension VerticalTriangleExtension on Path {
  drawVtklLineTopRight(double tWidth, double tHeight) {
    relativeLineTo(tWidth, -tHeight);
  }

  drawVtklLineTopLeft(double tWidth, double tHeight) {
    relativeLineTo(-tWidth, -tHeight);
  }

  drawVtklLineBottomRight(double tWidth, double tHeight) {
    relativeLineTo(tWidth, tHeight);
  }

  drawVtklLineBottomLeft(double tWidth, double tHeight) {
    relativeLineTo(-tWidth, tHeight);
  }
}

extension HorizontalTriangleExtension on Path {
  drawHzntlLineTopRight(double tHeight, double tWidth) {
    relativeLineTo(tHeight, -tWidth);
  }

  drawHzntlLineTopLeft(double tHeight, double tWidth) {
    relativeLineTo(-tHeight, -tWidth);
  }

  drawHzntlLineBottomRight(double tHeight, double tWidth) {
    relativeLineTo(tHeight, tWidth);
  }

  drawHzntlLineBottomLeft(double tHeight, double tWidth) {
    relativeLineTo(-tHeight, tWidth);
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

    var triangleSides = 3;
    var tSide = minSize / 4;
    var tradians = math.pi / triangleSides;
    var tWidth = tSide * math.cos(tradians);
    var tHeight = tSide * math.sin(tradians);

    //Triangle path
    final tpath = Path();

    //1 tpath Vertical

    tpath.moveCenter(width, height);
    tpath.drawTriangleLineRight(tSide);
    tpath.drawVtklLineTopLeft(tWidth, tHeight);
    tpath.drawVtklLineBottomLeft(tWidth, tHeight);

    //2 tpath Horizontal
    tpath.moveCenter(width, height);
    tpath.relativeMoveTo(-tSide / 2, 0);
    tpath.drawTriangleLineBottom(tSide);
    tpath.relativeMoveTo(0, -tSide);
    tpath.drawHzntlLineBottomLeft(tHeight, tWidth);
    tpath.drawHzntlLineBottomRight(tHeight, tWidth);

    tpath.close();
    canvas.drawPath(tpath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
