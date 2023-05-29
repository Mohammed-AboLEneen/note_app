import 'package:flutter/material.dart';
import 'package:note/views/note_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            primary: Colors.white, onPrimary: Colors.white),
        useMaterial3: true,
        fontFamily: 'Poppins',
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.white,
            selectionHandleColor: Colors.teal,
            selectionColor: Colors.white.withOpacity(.5)),
      ),
      home: NoteView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
