import 'package:flutter/material.dart';

import 'custom_textfield.dart';

class WriteNoteContent extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  WriteNoteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff303030),
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 290,
        height: 350,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  hint: 'Title',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    hint: 'Content',
                    padding:
                        const EdgeInsets.only(bottom: 200, top: 20, left: 10)),
              ],
            ),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.teal, // Set the background color of the button
          ),
          child: const Text('Create'),
        ),
      ],
    );
  }
}
