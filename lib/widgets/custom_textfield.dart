import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String? hint;
  final EdgeInsetsGeometry? padding;
  final int? maxLines;
  final void Function(String?)? onSaved;

  const CustomTextField(
      {super.key, this.hint, this.padding, this.maxLines, this.onSaved});

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
        onSaved: onSaved,
        maxLines: maxLines,
        style: TextStyle(
          color: Colors.white.withOpacity(.7), // Set the color of the text
        ),
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
            contentPadding: padding,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white.withOpacity(.5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.teal,
                  width: 2.0,
                  // Set the thickness of the underline
                  style: BorderStyle.solid,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.teal,
                  width: 2.0,
                  // Set the thickness of the underline
                  style: BorderStyle.solid,
                ))));
  }
}
