import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/add_cubit/add_cubit.dart';
import 'package:note/models/note_model.dart';
import 'package:note/note_cubit/note_cubit.dart';

import '../add_cubit/add_state.dart';
import '../widgets/note_alert.dart';
import '../widgets/note_item.dart';
import '../widgets/search_icon.dart';

class NoteView extends StatefulWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  late BuildContext noteContext;
  final _scrollController = ScrollController();
  NoteModel? note;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NoteCubit>(context);
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
              padding: EdgeInsets.zero, // 0xffFFCA78
              controller: _scrollController,
              itemBuilder: (context, index) => ItemNote(ind: index),
              itemCount: cubit.notes?.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return BlocProvider(
                create: (context) => AddNoteCubit(),
                child: BlocListener<AddNoteCubit, AddNoteStates>(
                  listener: (context, state) {
                    if (state is SuccessAddNoteState) {
                      BlocProvider.of<NoteCubit>(context).reBuildAgain(context);
                    }
                  },
                  child: WriteNoteContent(
                    scrollController: _scrollController,
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: const Color(0xff52EFD8),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
