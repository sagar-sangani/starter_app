import 'dart:math' as math;

import 'package:flutter/material.dart';

class Polygon extends StatelessWidget {
  const Polygon({Key? key}) : super(key: key);

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

// FOR PAINTING POLYGONS

class MyTask extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    double minSize = size.width < size.height ? size.width : size.height;

    int sides = 6;
    double radius = minSize / 3;
    double radians = 0.0;

    var path = Path();

    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);

    // FOR DRAW CIRCLE
    final circle = Path();

    final Offset c = Offset(size.width / 2, size.height / 2);
    circle.moveTo(c.dx, c.dy);
    canvas.drawCircle(
      c,
      radius,
      paint
        ..color = Colors.blue
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
