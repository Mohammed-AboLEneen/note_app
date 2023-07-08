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
                      child: InkWell(
                          splashColor: Colors.grey,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return BlocProvider(
                                  create: (context) => AddNoteCubit(),
                                  child:
                                      BlocListener<AddNoteCubit, AddNoteStates>(
                                    listener: (context, state) {
                                      if (state is SuccessAddNoteState) {
                                        BlocProvider.of<NoteCubit>(context)
                                            .reBuildAgain(context);
                                        _listKey.currentState?.insertItem(
                                            BlocProvider.of<NoteCubit>(context)
                                                    .notes
                                                    .length -
                                                1,
                                            duration: const Duration(
                                                milliseconds: 500));

                                        _scrollController.animateTo(
                                          _scrollController
                                              .position.maxScrollExtent,
                                          duration: const Duration(
                                              milliseconds: 1000),
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
                          child: Container(
                            height: 65,
                            width: 65,
                            color: Colors.teal.withOpacity(.8),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ))
      ]),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return BlocProvider(
      //           create: (context) => AddNoteCubit(),
      //           child: BlocListener<AddNoteCubit, AddNoteStates>(
      //             listener: (context, state) {
      //               if (state is SuccessAddNoteState) {
      //                 BlocProvider.of<NoteCubit>(context).reBuildAgain(context);
      //                 _listKey.currentState?.insertItem(
      //                     BlocProvider.of<NoteCubit>(context).notes.length - 1,
      //                     duration: const Duration(milliseconds: 500));
      //
      //                 _scrollController.animateTo(
      //                   _scrollController.position.maxScrollExtent,
      //                   duration: const Duration(milliseconds: 1000),
      //                   curve: Curves.easeOut,
      //                 );
      //               }
      //             },
      //             child: WriteNoteContent(),
      //           ),
      //         );
      //       },
      //     );
      //   },
      //   backgroundColor: const Color(0xff52EFD8),
      //   child: const Icon(
      //     Icons.add,
      //     size: 30,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}

class BBNNCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.grey.withOpacity(.4);

    Path path = Path();
    // Draws a line from left top corner to right bottom
    path.lineTo(size.width * .694, 0);
    path.arcToPoint(Offset(size.width * .9, 0),
        clockwise: false, radius: Radius.circular(20));
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
