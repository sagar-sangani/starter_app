import 'dart:math';

import 'package:flutter/material.dart';

class Chitrakala extends StatelessWidget {
  const Chitrakala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      duration: const Duration(
        minutes: 30,
      ),
      turns: 250,
      child: CustomPaint(
        painter: MyTask(),
        size: MediaQuery.of(context).size,
      ),
    );
  }
}

class MyTask extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    double minSize = size.width < size.height ? size.width : size.height;

    double tSide = minSize * 0.2;
    final tdy = sqrt(tSide * tSide - tSide / 2 * tSide / 2);

    // Traiangle
    final t1 = Path();
    final t2 = Path();
    final t3 = Path();
    final t4 = Path();
    final t5 = Path();
    final t6 = Path();
    final t7 = Path();
    final t8 = Path();
    final t9 = Path();
    final t10 = Path();
    final t11 = Path();
    final t12 = Path();
    final arc1 = Path();
    final arc2 = Path();
    final arc3 = Path();
    final arc4 = Path();
    final arc5 = Path();
    final arc6 = Path();

    //t1
    t1.moveTo(size.width / 2, size.height / 2);
    t1.relativeLineTo(tSide, 0);
    t1.relativeLineTo(-tSide / 2, -tdy);
    t1.relativeLineTo(-tSide / 2, tdy);

    // t2
    t2.moveTo(size.width / 2, size.height / 2);
    t2.relativeMoveTo(tSide / 2, -tdy);
    t2.relativeLineTo(-tSide, 0);
    t2.relativeLineTo(tSide / 2, tdy);

    //t3
    t3.moveTo(size.width / 2, size.height / 2);
    t3.relativeLineTo(-tSide, 0);
    t3.relativeLineTo(tSide / 2, -tdy);

    //t4
    t4.moveTo(size.width / 2, size.height / 2);
    t4.relativeLineTo(tSide / 2, tdy);
    t4.relativeLineTo(-tSide, 0);
    t4.relativeLineTo(tSide / 2, -tdy);

    //t5
    t5.moveTo(size.width / 2, size.height / 2);
    t5.relativeLineTo(tSide / 2, tdy);
    t5.relativeLineTo(tSide / 2, -tdy);

    //t6
    t6.moveTo(size.width / 2, size.height / 2);
    t6.relativeLineTo(-tSide / 2, tdy);
    t6.relativeLineTo(-tSide / 2, -tdy);

    //t7
    t7.moveTo(size.width / 2, size.height / 2);
    t7.relativeMoveTo(tSide, 0);
    t7.relativeLineTo(tSide / 2, -tdy);
    t7.relativeLineTo(-tSide, 0);

    //t8
    t8.moveTo(size.width / 2, size.height / 2);
    t8.relativeMoveTo(tSide, 0);
    t8.relativeLineTo(tSide / 2, tdy);
    t8.relativeLineTo(-tSide, 0);

    //t9
    t9.moveTo(size.width / 2, size.height / 2);
    t9.relativeMoveTo(-tSide, 0);
    t9.relativeLineTo(-tSide / 2, -tdy);
    t9.relativeLineTo(tSide, 0);

    //t10
    t10.moveTo(size.width / 2, size.height / 2);
    t10.relativeMoveTo(-tSide, 0);
    t10.relativeLineTo(-tSide / 2, tdy);
    t10.relativeLineTo(tSide, 0);

    //t11
    t11.moveTo(size.width / 2, size.height / 2);
    t11.relativeMoveTo(-tSide / 2, tdy);
    t11.relativeLineTo(tSide / 2, tdy);
    t11.relativeLineTo(tSide / 2, -tdy);

    //t12
    t11.moveTo(size.width / 2, size.height / 2);
    t11.relativeMoveTo(tSide / 2, -tdy);
    t11.relativeLineTo(-tSide / 2, -tdy);
    t11.relativeLineTo(-tSide / 2, tdy);

    //arc1
    arc1.moveTo(size.width / 2, size.height / 2);
    arc1.relativeMoveTo(tSide, 0);
    arc1.relativeLineTo(tSide / 2, -tdy);
    arc1.relativeQuadraticBezierTo(tSide / 2, tdy, 0, 2 * tdy);

    //arc2
    arc2.moveTo(size.width / 2, size.height / 2);
    arc2.relativeMoveTo(-tSide / 2, -tdy);
    arc2.relativeLineTo(tSide / 2, -tdy);
    arc2.relativeQuadraticBezierTo(
      -tSide,
      0,
      -tSide - tSide / 2,
      tdy,
    );

    //arc3
    arc3.moveTo(size.width / 2, size.height / 2);
    arc3.relativeMoveTo(-tSide / 2, tdy);
    arc3.relativeLineTo(-tSide, 0);
    arc3.relativeQuadraticBezierTo(tSide / 2, tdy, tSide + tSide / 2, tdy);

    //arc4

    arc4.moveTo(size.width / 2, size.height / 2);
    arc4.relativeMoveTo(tSide / 2, -tdy);
    arc4.relativeLineTo(-tSide / 2, -tdy);
    arc4.relativeQuadraticBezierTo(tSide / 2, tdy, tSide + tSide / 2, tdy);

    //arc5
    arc5.moveTo(size.width / 2, size.height / 2);
    arc5.relativeMoveTo(tSide / 2, tdy);
    arc5.relativeLineTo(tSide, 0);
    arc5.relativeQuadraticBezierTo(-tSide, 0, -tSide - tSide / 2, tdy);

    //arc6
    arc6.moveTo(size.width / 2, size.height / 2);
    arc6.relativeMoveTo(-tSide, 0);
    arc6.relativeLineTo(-tSide / 2, -tdy);
    arc6.relativeQuadraticBezierTo(tSide / 2, tdy, 0, 2 * tdy);

    canvas.drawPath(t1, paint..color = Colors.green);
    canvas.drawPath(t2, paint..color = Colors.pink);
    canvas.drawPath(t3, paint..color = Colors.green);
    canvas.drawPath(t4, paint..color = Colors.green);
    canvas.drawPath(t5, paint..color = Colors.pink);
    canvas.drawPath(t6, paint..color = Colors.pink);
    canvas.drawPath(t7, paint..color = Colors.yellow);
    canvas.drawPath(t8, paint..color = Colors.yellow);
    canvas.drawPath(t9, paint..color = Colors.yellow);
    canvas.drawPath(t10, paint..color = Colors.yellow);
    canvas.drawPath(t11, paint..color = Colors.yellow);
    canvas.drawPath(t12, paint..color = Colors.yellow);
    canvas.drawPath(arc1, paint..color = Colors.blue);
    canvas.drawPath(arc2, paint..color = Colors.blue);
    canvas.drawPath(arc3, paint..color = Colors.blue);
    canvas.drawPath(arc4, paint..color = Colors.red);
    canvas.drawPath(arc5, paint..color = Colors.red);
    canvas.drawPath(arc6, paint..color = Colors.red);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
