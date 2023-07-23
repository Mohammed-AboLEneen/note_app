import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:note/models/note_model.dart';
import 'content_state.dart';

class NoteContentCubit extends Cubit<NoteContentStates> {
  NoteContentCubit() : super(InitAddNoteContentState());

  NoteContentCubit get(context) => BlocProvider.of<NoteContentCubit>(context);

  late NoteModel newNote;
  int selectedColorIndex = 0;

  void changeTheColorIndex(int index){

    selectedColorIndex = index;


    emit(ChangeTheBackgroundColorState());
  }

}
