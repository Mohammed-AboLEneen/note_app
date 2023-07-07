import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note/models/note_model.dart';

import '../add_cubit/add_cubit.dart';
import '../constants.dart';
import 'note_state.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(InitFetchNoteState());

  static NoteCubit get(context) => BlocProvider.of<NoteCubit>(context);

  List<NoteModel>? notes = [];
  bool animateList = false;

  void fetchAllNotes() {
    var hiveBox = Hive.box<NoteModel>(noteBox);
    notes?.addAll(hiveBox.values.toList());
  }

  void reBuildAgain(context) {
    notes?.add(BlocProvider.of<AddNoteCubit>(context).newNote);
    emit(AddAndFetchState());
  }

  void deleteNote(index) async {
    var hiveBox = Hive.box<NoteModel>(noteBox);
    var hiveKeys = hiveBox.keys.toList();

    try {
      await hiveBox.delete(hiveKeys[index]);
      notes!.removeAt(index);
    } catch (e) {
      print('there is error when try to delete this note: $e');
    }

    emit(RemoveAndFetchState());
  }
}
