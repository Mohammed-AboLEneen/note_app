import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/add_cubit/add_cubit.dart';
import 'package:note/add_cubit/add_state.dart';
import 'package:note/widgets/color_item.dart';

import '../note_content_cubit/content_cubit.dart';
import '../note_content_cubit/content_state.dart';

class AddColorItem extends StatefulWidget {
  final int color;
  final int index;

  const AddColorItem({super.key, required this.color, required this.index,});

  @override
  State<AddColorItem> createState() => _AddColorItemState();
}

class _AddColorItemState extends State<AddColorItem> with SingleTickerProviderStateMixin {

  Color color1 = Colors.transparent;
  Color color2 = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<AddNoteCubit, AddNoteStates>(

      builder: (context, state){

        return ColorItem(color1, color2, mainColor: widget.color);
      },
      listener: (context, state){

        color1 = Colors.transparent;
        color2 = Colors.transparent;

        if(BlocProvider.of<AddNoteCubit>(context).selectedColorIndex == widget.index){

          color1 = Colors.transparent;
          color2 = Colors.white;
        }
      },
    );
  }
}
