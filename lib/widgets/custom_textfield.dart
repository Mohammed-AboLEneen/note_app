import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: 'Title',
          hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white.withOpacity(.5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.teal))),
    );
  }
}
