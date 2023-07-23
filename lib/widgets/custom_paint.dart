import 'package:flutter/material.dart';

class BBNNClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print(size.width);
    print(size.height);
    Path path = Path();
    path.lineTo(size.width * 0.74, 0);
    path.arcToPoint(
      Offset(size.width * 0.92, 0),
      clockwise: false,
      radius: const Radius.circular(35),
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.grey;
    canvas.drawPath(getClip(size), paint);
    canvas.save();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}