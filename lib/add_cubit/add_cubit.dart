import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:note/models/note_model.dart';

import '../constants.dart';
import 'add_state.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(InitAddNoteState());

  AddNoteCubit get(context) => BlocProvider.of<AddNoteCubit>(context);

  late NoteModel newNote;
  int color = Colors.blueGrey.value;
  int selectedColorIndex = 0;

  void addNote({
    required String title,
    required String subtitle,
  }) async {
    var hiveBox = Hive.box<NoteModel>(noteBox);

    var note = NoteModel(
        title: title,
        subTitle: subtitle,
        date: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()).toString(),
        color: color);

    int key = await hiveBox.add(note);

    newNote = note;

    print(key);
    emit(SuccessAddNoteState());
  }

  void changeTheColorIndex(int index, int selectedColor) {
    selectedColorIndex = index;
    color = selectedColor;

    emit(ChangeTheBackgroundColorState());
  }
}
