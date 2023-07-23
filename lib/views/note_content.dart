import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note/models/note_model.dart';
import 'package:note/note_content_cubit/content_cubit.dart';
import 'package:note/note_content_cubit/content_state.dart';
import 'package:note/note_cubit/note_cubit.dart';
import 'package:note/widgets/content_color_item.dart';
import 'package:note/widgets/custom_editable_text.dart';

import '../add_cubit/add_cubit.dart';
import '../widgets/color_item.dart';

class NoteContent extends StatefulWidget {
  final NoteModel note;

  late final TextEditingController controller1;
  late final TextEditingController controller2;

  late final time;
  late final date;

  NoteContent({super.key, required this.note}) {
    controller1 = TextEditingController(text: note.title);
    controller2 = TextEditingController(text: note.subTitle);
  }

  @override
  State<NoteContent> createState() => _NoteContentState();
}

class _NoteContentState extends State<NoteContent> {

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

    late String time;
    late String date;

  @override
  void initState() {
    super.initState();

    DateTime dateTime = DateTime.parse(widget.note.date); // Convert string to DateTime object

    date = DateFormat('yyyy-MM-dd').format(dateTime); // Extract date component
    time = DateFormat('HH:mm').format(dateTime); // Extract time component
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteContentCubit(),
      child: BlocConsumer<NoteContentCubit, NoteContentStates>(

        listener: (context, state){},
        builder: (context, state){

          return Scaffold(
            backgroundColor: const Color(0xff303030),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      CustomEditableText(

                        note: widget.note,
                        onChange: (value) {
                          widget.note.title = value;
                          try {
                            widget.note.date = DateFormat('yyyy-MM-dd HH:mm')
                                .format(DateTime.now())
                                .toString();
                            widget.note.save();
                            print('Saved');
                          } catch (e) {
                            print('there is an error when save this changes: $e');
                          }
                        },
                        controller: widget.controller1,

                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomEditableText(

                        note: widget.note,
                        onChange: (value) {
                          widget.note.subTitle = value;
                          try {
                            widget.note.date = DateFormat('yyyy-MM-dd HH:mm')
                                .format(DateTime.now())
                                .toString();
                            widget.note.save();
                            print('Saved');
                          } catch (e) {
                            print('there is an error when save this changes: $e');
                          }
                        },
                        controller: widget.controller2,
                      ),
                    ],
                  ),
                ),
                const Spacer(),

                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('last update: $date', style: const TextStyle(color: Colors.white),)
                  ],
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          GestureDetector(

                            onTap: () {

                              BlocProvider.of<NoteContentCubit>(context).changeTheColorIndex(index);
                              widget.note.color = colors[index];
                              widget.note.save();
                              print('done');
                              BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                            },
                            child: ContentColorItem(

                              color: colors[index],
                              index: index,
                            ),
                          ),
                      itemCount: colors.length,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
