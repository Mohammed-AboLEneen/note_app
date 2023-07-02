import 'package:flutter/material.dart';

import '../widgets/note_alert.dart';
import '../widgets/note_item.dart';
import '../widgets/search_icon.dart';

class NoteView extends StatelessWidget {
  const NoteView({Key? key}) : super(key: key);

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

                  padding: EdgeInsets.zero,
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
