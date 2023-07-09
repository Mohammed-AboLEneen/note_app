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
  late int color = Colors.blueGrey.value;

  void addNote(
      {required String title,
      required String subtitle,
      required int color}) async {
    var hiveBox = Hive.box<NoteModel>(noteBox);

    var note = NoteModel(
        title: title,
        subTitle: subtitle,
        data:
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()).toString(),
        color: color);

    int key = await hiveBox.add(note);

    newNote = note;

    print(key);
    emit(SuccessAddNoteState());
  }

  void changeTheColorOfAddScreen(int comingColor) {
    color = comingColor;
    emit(ChangeTheBackgroundColorState());
  }
}
