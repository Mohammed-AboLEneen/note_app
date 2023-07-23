import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_cubit/add_cubit.dart';
import '../add_cubit/add_state.dart';
import 'add_color_item.dart';
import 'custom_textfield.dart';

class WriteNoteContent extends StatefulWidget {
  const WriteNoteContent({super.key});

  @override
  State<WriteNoteContent> createState() => _WriteNoteContentState();
}

class _WriteNoteContentState extends State<WriteNoteContent> {
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  List<int> colors = [
    Colors.blueGrey.value,
    Colors.orange.value,
    Colors.blue.value,
    Colors.teal.value,
    Colors.grey.value,
    Colors.cyan.value,
    Colors.cyanAccent.value,
    Colors.deepOrange.value,
    Colors.green.value,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteStates>(
        builder: (context, state) => AlertDialog(
              // Color(BlocProvider.of<AddNoteCubit>(context).color),

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
                            controller: controller1,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            hint: 'Content',
                            maxLines: 8,
                            controller: controller2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  BlocProvider.of<AddNoteCubit>(context)
                                      .changeTheColorIndex(
                                          index, colors[index]);
                                },
                                child: AddColorItem(
                                  color: colors[index],
                                  index: index,
                                ),
                              ),
                              itemCount: colors.length,
                            ),
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
                      BlocProvider.of<AddNoteCubit>(context).addNote(
                          title: controller1.text, subtitle: controller2.text);

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
            ),
        listener: (context, state) {});
  }
}
