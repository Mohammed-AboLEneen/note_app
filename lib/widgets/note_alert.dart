import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_cubit/add_cubit.dart';
import 'custom_textfield.dart';

class WriteNoteContent extends StatefulWidget {
  final ScrollController scrollController;

  const WriteNoteContent({super.key, required this.scrollController});

  @override
  State<WriteNoteContent> createState() => _WriteNoteContentState();
}

class _WriteNoteContentState extends State<WriteNoteContent> {
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String title;
  late String subtitle;

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
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  CustomTextField(
                    hint: 'Title',
                    onSaved: (value) {
                      title = value!;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hint: 'Content',
                    maxLines: 8,
                    onSaved: (value) {
                      subtitle = value!;
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState?.save();
              BlocProvider.of<AddNoteCubit>(context).addNote(
                  title: title,
                  subtitle: subtitle,
                  scrollController: widget.scrollController);

              Navigator.pop(context);
            } else {
              autovalidateMode = AutovalidateMode.always;
              setState(() {});
            }
          },
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
