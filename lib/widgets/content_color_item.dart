import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/add_cubit/add_cubit.dart';
import 'package:note/add_cubit/add_state.dart';
import 'package:note/widgets/color_item.dart';

import '../note_content_cubit/content_cubit.dart';
import '../note_content_cubit/content_state.dart';

class ContentColorItem extends StatefulWidget {
  final int color;
  final int index;

  const ContentColorItem({super.key, required this.color, required this.index});

  @override
  State<ContentColorItem> createState() => _ContentColorItemState();
}

class _ContentColorItemState extends State<ContentColorItem> with SingleTickerProviderStateMixin {

  Color color1 = Colors.transparent;
  Color color2 = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<NoteContentCubit, NoteContentStates>(

      builder: (context, state){

        return ColorItem(color1, color2, mainColor: widget.color);
      },
      listener: (context, state){

        color1 = Colors.transparent;
        color2 = Colors.transparent;

        if(BlocProvider.of<NoteContentCubit>(context).selectedColorIndex == widget.index){

          color1 = Colors.transparent;
          color2 = Colors.white;
        }
      },
    );
  }
}
