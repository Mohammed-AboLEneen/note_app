import 'package:flutter/material.dart';

import '../widgets/note_item.dart';
import '../widgets/search_icon.dart';

class NoteView extends StatelessWidget {
  NoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff303030),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Row(children: [
              Text(
                'Notes',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconSearch(),
            ]),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => ItemNote(),
              itemCount: 10,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return WriteNoteContent();
            },
          );
        },
        backgroundColor: const Color(0xff52EFD8),
        child: const Icon(Icons.add),
      ),
    );
  }
}

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
