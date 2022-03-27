import 'dart:math' as math;

import 'package:flutter/material.dart';

class Pentagon extends StatelessWidget {
  const Pentagon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: 5,
      duration: const Duration(
        minutes: 1,
      ),
      child: Scaffold(
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
      ),
    );
  }
}

// FOR PAINTING PENTAGONS
extension CenterExtension on Path {
  moveCenter(double width, double height) {
    moveTo(width / 2, height / 2);
  }
}

extension PentagonExtension on Path {
  drawPantagonLineRight(double pside) {
    relativeLineTo(pside, 0);
  }

  drawPantagonLineLeft(double pside) {
    relativeLineTo(-pside, 0);
  }

  drawPantagonLineTop(double pside) {
    relativeLineTo(0, -pside);
  }

  drawPantagonLineBottom(double pside) {
    relativeLineTo(0, pside);
  }
}

extension VerticalPentagonExtension on Path {
  drawVtklPantagonLineTopRightWithAngle1(double px1, double py1) {
    relativeLineTo(px1, -py1);
  }

  drawVtklPantagonLineTopLeftWithAngle1(double px1, double py1) {
    relativeLineTo(-px1, -py1);
  }

  drawVtklPantagonLineBottomRightWithAngle1(double px1, double py1) {
    relativeLineTo(px1, py1);
  }

  drawVtklPantagonLineBottomLeftWithAngle1(double px1, double py1) {
    relativeLineTo(-px1, py1);
  }

  drawVtklPantagonLineTopRightWithAngle2(double px2, double py2) {
    relativeLineTo(px2, -py2);
  }

  drawVtklPantagonLineTopLeftWithAngle2(double px2, double py2) {
    relativeLineTo(-px2, -py2);
  }

  drawVtklPantagonLineBottomRightWithAngle2(double px2, double py2) {
    relativeLineTo(px2, py2);
  }

  drawVtklPantagonLineBottomLeftWithAngle2(double px2, double py2) {
    relativeLineTo(-px2, py2);
  }
}

extension HorizontalPentagonExtension on Path {
  drawHzntlPantagonLineTopRightWithAngle1(double py1, double px1) {
    relativeLineTo(py1, -px1);
  }

  drawHzntlPantagonLineTopLeftWithAngle1(double py1, double px1) {
    relativeLineTo(-py1, -px1);
  }

  drawHzntlPantagonLineBottomRightWithAngle1(double py1, double px1) {
    relativeLineTo(py1, px1);
  }

  drawHzntlPantagonLineBottomLeftWithAngle1(double py1, double px1) {
    relativeLineTo(-py1, px1);
  }

  drawHzntlPantagonLineTopRightWithAngle2(double py2, double px2) {
    relativeLineTo(py2, -px2);
  }

  drawHzntlPantagonLineTopLeftWithAngle2(double py2, double px2) {
    relativeLineTo(-py2, -px2);
  }

  drawHzntlPantagonLineBottomRightWithAngle2(double py2, double px2) {
    relativeLineTo(py2, px2);
  }

  drawHzntlPantagonLineBottomLeftWithAngle2(double py2, double px2) {
    relativeLineTo(-py2, px2);
  }
}

class MyTask extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    double width = size.width;
    double height = size.height;
    double minSize = size.width < size.height ? size.width : size.height;
    double pside = minSize / 6;

    double angle1 = 2 * math.pi / 5;
    double angle2 = math.pi / 5;

    double px1 = pside * math.cos(angle1);
    double py1 = pside * math.sin(angle1);

    double px2 = pside * math.cos(angle2);
    double py2 = pside * math.sin(angle2);

    final path = Path();

    //p1
    path.moveCenter(width, height);
    path.relativeMoveTo(-pside / 2, -height / 5);
    path.drawPantagonLineRight(pside);
    path.relativeMoveTo(-pside, 0);
    path.drawVtklPantagonLineTopLeftWithAngle1(px1, py1);
    path.drawVtklPantagonLineTopRightWithAngle2(px2, py2);
    path.drawVtklPantagonLineBottomRightWithAngle2(px2, py2);
    path.drawVtklPantagonLineBottomLeftWithAngle1(px1, py1);

    //p2
    path.moveCenter(width, height);
    path.relativeMoveTo(-pside / 2, 0);
    path.drawPantagonLineBottom(pside);
    path.drawHzntlPantagonLineBottomRightWithAngle1(py1, px1);
    path.drawHzntlPantagonLineTopRightWithAngle2(py2, px2);
    path.drawHzntlPantagonLineTopLeftWithAngle2(py2, px2);
    path.drawHzntlPantagonLineBottomLeftWithAngle1(py1, px1);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
