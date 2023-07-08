import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/note_cubit/note_cubit.dart';

import '../widgets/custom_paint.dart';
import '../widgets/ink_button.dart';
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
      body: Stack(children: [
        Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(children: [
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
            ),
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
        Positioned(
            bottom: 0,
            child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                      bottom: 0,
                      child: SizedBox(
                        height: 60,
                        child: CustomPaint(
                          size: Size(MediaQuery.of(context).size.width,
                              MediaQuery.of(context).size.height),
                          painter: BBNNCustomPaint(),
                        ),
                      )),
                  Positioned(
                    right: 40,
                    bottom: 25,
                    child: Material(
                      borderRadius: BorderRadius.circular(40),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkButton(
                        listKey: _listKey,
                        scrollController: _scrollController,
                      ),
                    ),
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}

