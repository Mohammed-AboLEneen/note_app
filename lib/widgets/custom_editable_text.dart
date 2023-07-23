import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/note_model.dart';

class CustomEditableText extends StatelessWidget {

  final NoteModel note;

  late final TextEditingController controller;
  final void Function(String)? onChange;

  CustomEditableText({super.key, required this.note, required this.controller, this.onChange}) {}

  @override
  Widget build(BuildContext context) {
    return EditableText(
      controller: controller,
      focusNode:
      FocusNode(), // Text(subtitle, style: TextStyle(fontSize: 20.0)),
      style: const TextStyle(fontSize: 20.0, fontFamily: 'Abel'),

      selectionControls: MaterialTextSelectionControls(),
      showCursor: true,

      cursorColor: Colors.white,
      maxLines: null,
      backgroundCursorColor: Colors.white,
      cursorRadius: const Radius.circular(20),
      cursorOpacityAnimates: true,

      selectionColor: Colors.black,

      onChanged: (value) {
        note.subTitle = value;
        try {
          note.date = DateFormat('yyyy-MM-dd HH:mm')
              .format(DateTime.now())
              .toString();
          note.save();
          print('Saved');
        } catch (e) {
          print('there is an error when save this changes: $e');
        }
      },
    );
  }
}
