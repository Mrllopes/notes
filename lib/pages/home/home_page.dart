import 'package:flutter/material.dart';
import 'package:notas/pages/home/widgets/notes_list/note_list_widget.dart';

enum ActionTypes { create, update }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>[];

  navigateToCreateNotePage({
    required ActionTypes action,
    int? index,
  }) async {
    switch (action) {
      case ActionTypes.create:
        final response = await Navigator.pushNamed(
          context,
          '/create-note',
        );
        if (response != null) {
          notes.add(response as String);
          setState(() {});
        }
        break;
      case ActionTypes.update:
        if (index != null) {
          final response = await Navigator.pushNamed(
            context,
            '/create-note',
            arguments: notes[index],
          );
          if (response != null) {
            updateNote(
              description: response as String,
              index: index,
            );
          }
        }
        break;
    }
    setState(() {});
  }

  updateNote({
    String description = "",
    required int index,
  }) {
    if (description.isEmpty) {
      notes.removeAt(index);
    } else {
      notes[index] = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
      ),
      body: Container(
        child: NotesListWidget(
          notes: notes,
          onTap: navigateToCreateNotePage,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToCreateNotePage(
            action: ActionTypes.create,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
