import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_cubit/add_cubit.dart';
import '../add_cubit/add_state.dart';
import '../note_cubit/note_cubit.dart';
import 'note_alert.dart';

class InkButton extends StatelessWidget {
  final scrollController;
  final listKey;

  const InkButton({super.key, this.scrollController, this.listKey});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.grey,
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return BlocProvider(
                create: (context) => AddNoteCubit(),
                child: BlocConsumer<AddNoteCubit, AddNoteStates>(
                    listener: (context, state) {
                  if (state is SuccessAddNoteState) {
                    BlocProvider.of<NoteCubit>(context).reBuildAgain(context);
                    listKey.currentState?.insertItem(
                        BlocProvider.of<NoteCubit>(context).notes.length - 1,
                        duration: const Duration(milliseconds: 500));

                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeOut,
                    );
                  }

                  print('lolo');
                }, builder: (context, state) {
                  return const WriteNoteContent();
                }),
              );
            },
          );
        },
        child: Container(
          height: 65,
          width: 65,
          color: Colors.teal.withOpacity(.8),
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ));
  }
}
