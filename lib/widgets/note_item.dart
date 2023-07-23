import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note/note_cubit/note_cubit.dart';
import 'package:note/note_cubit/note_state.dart';
import 'package:note/views/note_content.dart';

class ItemNote extends StatefulWidget {
  final int ind;

  const ItemNote({super.key, required this.ind});

  @override
  State<ItemNote> createState() => _ItemNoteState();
}

class _ItemNoteState extends State<ItemNote> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteStates>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(7),
            child: Hero(
              tag: 'index:${widget.ind}',
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoteContent(
                                note: BlocProvider.of<NoteCubit>(context)
                                    .notes[widget.ind],
                              )));
                },
                child: Card(
                    color: Color(BlocProvider.of<NoteCubit>(context)
                            .notes[widget.ind]
                            .color)
                        .withOpacity(.7),
                    margin: const EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 15,
                        bottom: 25,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ListTile(
                            title: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20.0, top: 25),
                              child: Text(
                                BlocProvider.of<NoteCubit>(context)
                                    .notes[widget.ind]
                                    .title,
                                maxLines: 1,
                                style: const TextStyle(
                                    fontSize: 25,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            subtitle: Text(
                              BlocProvider.of<NoteCubit>(context)
                                  .notes[widget.ind]
                                  .subTitle,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black.withOpacity(.5),
                                  overflow: TextOverflow.ellipsis),
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 7.0, top: 25, bottom: 5),
                            child: Text(
                                DateFormat('yyyy-MM-dd').format(DateTime.parse(
                                    BlocProvider.of<NoteCubit>(context)
                                        .notes[widget.ind]
                                        .date)),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(.5))),
                          )
                        ],
                      ),
                    )),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
