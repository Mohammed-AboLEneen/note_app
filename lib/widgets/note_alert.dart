import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/widgets/color_item.dart';

import '../add_cubit/add_cubit.dart';
import '../add_cubit/add_state.dart';
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

  int mainColor = Colors.blueGrey.value;
  int newColor = Colors.blueGrey.value;
  List<int> colors = [
    Colors.white.value,
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
        builder: (context, state) => TweenAnimationBuilder(
            tween: ColorTween(
              begin: Color(mainColor),
              end: Color(newColor),
            ),
            duration: const Duration(milliseconds: 500),
            builder: (_, color, __) {
              return AlertDialog(
                // Color(BlocProvider.of<AddNoteCubit>(context).color),

                backgroundColor: color,
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
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    mainColor = newColor;
                                    newColor = colors[index];

                                    BlocProvider.of<AddNoteCubit>(context)
                                        .changeTheColorOfAddScreen(
                                            colors[index]);
                                  },
                                  child: ColorItem(
                                    color: colors[index],
                                  ),
                                ),
                                itemCount: 9,
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
                            title: controller1.text,
                            subtitle: controller2.text,
                            color: newColor);

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
            }),
        listener: (context, state) {});
  }
}
