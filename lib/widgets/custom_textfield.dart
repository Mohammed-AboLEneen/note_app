import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String? hint;
  final EdgeInsetsGeometry? padding;
  final int? maxLines;
  final TextEditingController controller;

  const CustomTextField(
      {super.key,
      this.hint,
      this.padding,
      this.maxLines,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
        textInputAction: TextInputAction.next,
        textAlignVertical: TextAlignVertical.top,
        validator: (value) {
          if (value!.isEmpty) {
            return 'This Field Is Required';
          }
          return null;
        },
        controller: controller,
        maxLines: maxLines,
        style: TextStyle(
            color: Colors.white.withOpacity(.8), // Set the color of the text
            fontFamily: 'Abel'),
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black.withOpacity(.5)),
            contentPadding: padding,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.withOpacity(.7))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.7),
                  width: 2.0,
                  // Set the thickness of the underline
                  style: BorderStyle.solid,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(0.7),
                  width: 2.0,
                  // Set the thickness of the underline
                  style: BorderStyle.solid,
                ))));
  }
}
