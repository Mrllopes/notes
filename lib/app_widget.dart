import 'package:flutter/material.dart';
import 'package:notas/create_note_page.dart';
import 'package:notas/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      title: 'Notes',
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
        "/create-note": (context) => CreateNotePage()
      },
    );
  }
}
