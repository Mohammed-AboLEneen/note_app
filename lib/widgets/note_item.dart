import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/note_cubit/note_cubit.dart';

class ItemNote extends StatelessWidget {
  final int ind;

  const ItemNote({super.key, required this.ind});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color(BlocProvider.of<NoteCubit>(context).notes![ind].color),
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
                  padding: const EdgeInsets.only(bottom: 20.0, top: 25),
                  child: Text(
                    BlocProvider.of<NoteCubit>(context).notes![ind].title,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 25, overflow: TextOverflow.ellipsis),
                  ),
                ),
                subtitle: Text(
                  BlocProvider.of<NoteCubit>(context).notes![ind].subTitle,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black.withOpacity(.5),
                      overflow: TextOverflow.ellipsis),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(left: 3.0, bottom: 10),
                  child: IconButton(
                    onPressed: () {
                      BlocProvider.of<NoteCubit>(context).deleteNote(ind);
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.zero,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 7.0, top: 25, bottom: 5),
                child: Text(
                    BlocProvider.of<NoteCubit>(context).notes![ind].data,
                    style: TextStyle(
                        fontSize: 15, color: Colors.black.withOpacity(.5))),
              )
            ],
          ),
        ));
  }
}
