import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/add_cubit/add_cubit.dart';
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
  final _scrollController = ScrollController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

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
              child: AnimatedList(
                key: _listKey,
                controller: _scrollController,
                initialItemCount: cubit.notes.length,
                itemBuilder: (BuildContext context, int index,
                    Animation<double> animation) {
                  return SlideTransition(
                      position: animation.drive(Tween<Offset>(
                          begin: const Offset(-1, 0), end: const Offset(0, 0))),
                      child: ItemNote(ind: index, listKey: _listKey));
                },
              ),
            )
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
                      _listKey.currentState?.insertItem(
                          BlocProvider.of<NoteCubit>(context).notes.length - 1,
                          duration: const Duration(milliseconds: 500));

                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                  child: WriteNoteContent(),
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
