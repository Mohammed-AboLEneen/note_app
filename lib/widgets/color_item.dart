import 'package:flutter/cupertino.dart';

class ColorItem extends StatelessWidget {
  final int color;

  const ColorItem({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Color(color)),
      ),
    );
  }
}
