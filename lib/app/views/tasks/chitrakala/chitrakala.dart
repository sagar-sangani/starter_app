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

    //tvertical

    //t1
    final t1 = Path();
    t1.moveTo(size.width / 2, size.height / 2);
    t1.relativeLineTo(tSide, 0);
    t1.relativeLineTo(-tSide / 2, -tdy);
    t1.relativeLineTo(-tSide / 2, tdy);
    canvas.drawPath(t1, paint..color = Colors.green);

    // t2
    final t2 = Path();
    t2.moveTo(size.width / 2, size.height / 2);
    t2.relativeMoveTo(tSide / 2, -tdy);
    t2.relativeLineTo(-tSide, 0);
    t2.relativeLineTo(tSide / 2, tdy);
    canvas.drawPath(t2, paint..color = Colors.pink);

    //t3
    final t3 = Path();
    t3.moveTo(size.width / 2, size.height / 2);
    t3.relativeLineTo(-tSide, 0);
    t3.relativeLineTo(tSide / 2, -tdy);
    canvas.drawPath(t3, paint..color = Colors.green);

    //t4
    final t4 = Path();
    t4.moveTo(size.width / 2, size.height / 2);
    t4.relativeLineTo(tSide / 2, tdy);
    t4.relativeLineTo(-tSide, 0);
    t4.relativeLineTo(tSide / 2, -tdy);
    canvas.drawPath(t4, paint..color = Colors.green);

    //t5
    final t5 = Path();
    t5.moveTo(size.width / 2, size.height / 2);
    t5.relativeLineTo(tSide / 2, tdy);
    t5.relativeLineTo(tSide / 2, -tdy);
    canvas.drawPath(t5, paint..color = Colors.pink);

    //t6
    final t6 = Path();
    t6.moveTo(size.width / 2, size.height / 2);
    t6.relativeLineTo(-tSide / 2, tdy);
    t6.relativeLineTo(-tSide / 2, -tdy);
    canvas.drawPath(t6, paint..color = Colors.pink);

    //t7
    final t7 = Path();
    t7.moveTo(size.width / 2, size.height / 2);
    t7.relativeMoveTo(tSide, 0);
    t7.relativeLineTo(tSide / 2, -tdy);
    t7.relativeLineTo(-tSide, 0);
    canvas.drawPath(t7, paint..color = Colors.yellow);

    //t8
    final t8 = Path();
    t8.moveTo(size.width / 2, size.height / 2);
    t8.relativeMoveTo(tSide, 0);
    t8.relativeLineTo(tSide / 2, tdy);
    t8.relativeLineTo(-tSide, 0);
    canvas.drawPath(t8, paint..color = Colors.yellow);

    //t9
    final t9 = Path();
    t9.moveTo(size.width / 2, size.height / 2);
    t9.relativeMoveTo(-tSide, 0);
    t9.relativeLineTo(-tSide / 2, -tdy);
    t9.relativeLineTo(tSide, 0);
    canvas.drawPath(t9, paint..color = Colors.yellow);

    //t10
    final t10 = Path();
    t10.moveTo(size.width / 2, size.height / 2);
    t10.relativeMoveTo(-tSide, 0);
    t10.relativeLineTo(-tSide / 2, tdy);
    t10.relativeLineTo(tSide, 0);
    canvas.drawPath(t10, paint..color = Colors.yellow);

    //t11
    final t11 = Path();
    t11.moveTo(size.width / 2, size.height / 2);
    t11.relativeMoveTo(tSide / 2, -tdy);
    t11.relativeLineTo(-tSide / 2, -tdy);
    t11.relativeLineTo(-tSide / 2, tdy);
    canvas.drawPath(t11, paint..color = Colors.yellow);

    //t12
    final t12 = Path();
    t12.moveTo(size.width / 2, size.height / 2);
    t12.relativeMoveTo(tSide / 2, tdy);
    t12.relativeLineTo(-tSide / 2, tdy);
    t12.relativeLineTo(-tSide / 2, -tdy);
    canvas.drawPath(t12, paint..color = Colors.yellow);

    //arc1
    final arc1 = Path();
    arc1.moveTo(size.width / 2, size.height / 2);
    arc1.relativeMoveTo(tSide, 0);
    arc1.relativeLineTo(tSide / 2, -tdy);
    arc1.relativeQuadraticBezierTo(tSide / 2, tdy, 0, 2 * tdy);
    canvas.drawPath(arc1, paint..color = Colors.blue);

    //arc2
    final arc2 = Path();
    arc2.moveTo(size.width / 2, size.height / 2);
    arc2.relativeMoveTo(-tSide / 2, -tdy);
    arc2.relativeLineTo(tSide / 2, -tdy);
    arc2.relativeQuadraticBezierTo(-tSide, 0, -tSide - tSide / 2, tdy);
    canvas.drawPath(arc2, paint..color = Colors.blue);

    //arc3
    final arc3 = Path();
    arc3.moveTo(size.width / 2, size.height / 2);
    arc3.relativeMoveTo(-tSide / 2, tdy);
    arc3.relativeLineTo(-tSide, 0);
    arc3.relativeQuadraticBezierTo(tSide / 2, tdy, tSide + tSide / 2, tdy);
    canvas.drawPath(arc3, paint..color = Colors.blue);

    //arc4
    final arc4 = Path();
    arc4.moveTo(size.width / 2, size.height / 2);
    arc4.relativeMoveTo(tSide / 2, -tdy);
    arc4.relativeLineTo(-tSide / 2, -tdy);
    arc4.relativeQuadraticBezierTo(tSide / 2, tdy, tSide + tSide / 2, tdy);
    canvas.drawPath(arc4, paint..color = Colors.red);

    //arc5
    final arc5 = Path();
    arc5.moveTo(size.width / 2, size.height / 2);
    arc5.relativeMoveTo(tSide / 2, tdy);
    arc5.relativeLineTo(tSide, 0);
    arc5.relativeQuadraticBezierTo(-tSide, 0, -tSide - tSide / 2, tdy);
    canvas.drawPath(arc5, paint..color = Colors.red);

    //arc6
    final arc6 = Path();
    arc6.moveTo(size.width / 2, size.height / 2);
    arc6.relativeMoveTo(-tSide, 0);
    arc6.relativeLineTo(-tSide / 2, -tdy);
    arc6.relativeQuadraticBezierTo(tSide / 2, tdy, 0, 2 * tdy);
    canvas.drawPath(arc6, paint..color = Colors.red);

    //Circle
    final circle = Path();
    circle.moveTo(size.width / 2, size.height / 2);
    circle.relativeMoveTo(0, -tdy * 2);

    var circleBoundry = circle.getBounds();

    canvas.drawCircle(
      Offset(circleBoundry.left, circleBoundry.top),
      tdy / 2,
      paint..color = Colors.teal,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
