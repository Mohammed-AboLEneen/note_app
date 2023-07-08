import 'package:flutter/material.dart';

class BBNNCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.grey.withOpacity(.4);

    Path path = Path();
    // Draws a line from left top corner to right bottom
    path.lineTo(size.width * .694, 0);
    path.arcToPoint(Offset(size.width * .9, 0),
        clockwise: false, radius: Radius.circular(20));
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
