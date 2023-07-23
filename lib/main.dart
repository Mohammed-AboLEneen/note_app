import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note/constants.dart';
import 'package:note/models/note_model.dart';
import 'package:note/views/note_app.dart';
import 'package:note/widgets/observer.dart';

import 'note_cubit/note_cubit.dart';
import 'note_cubit/note_state.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();

  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(noteBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit()..fetchAllNotes(),
      child: BlocConsumer<NoteCubit, NoteStates>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: const ColorScheme.light(
                  primary: Colors.white, onPrimary: Colors.white),
              useMaterial3: true,
              fontFamily: 'Poppins',
            ),
            home: const NoteView(),
            debugShowCheckedModeBanner: false,
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
