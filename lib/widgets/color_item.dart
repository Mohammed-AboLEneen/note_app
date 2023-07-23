import 'package:flutter/cupertino.dart';

class ColorItem extends StatefulWidget {
  final Color color1;
  final Color color2;
  final int mainColor;

  const ColorItem(this.color1, this.color2,
      {super.key, required this.mainColor});

  @override
  State<ColorItem> createState() => _ColorItemState();
}

class _ColorItemState extends State<ColorItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            TweenAnimationBuilder(
                tween: ColorTween(begin: widget.color1, end: widget.color2),
                duration: const Duration(seconds: 1),
                builder: (_, value, __) {
                  return Container(
                    height: 65,
                    width: 65,
                    decoration:
                        BoxDecoration(color: value, shape: BoxShape.circle),
                  );
                }),
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(widget.mainColor)),
            ),
          ],
        ));
  }
}