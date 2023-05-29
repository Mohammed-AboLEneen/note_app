import 'package:flutter/material.dart';

class WriteNoteContent extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  WriteNoteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff303030),
      content: SizedBox(
        width: 350,
        height: 350,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.white.withOpacity(.5))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.teal))),
                ),
                const SizedBox(height: 15),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: controller,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 110.0),
                      hintText: 'Content',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.white.withOpacity(.5))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.teal))),
                ),
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
