import 'package:flutter/material.dart';
import 'package:notas/create_note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              Card(
                child: ListTile(
                  title: Text(notes[i]),
                  onTap: () async {
                    final response = await Navigator.pushNamed(
                      context,
                      '/create-note',
                      arguments: notes[i],
                    );
                    if (response != null) {
                      var description = response as String;
                      if (response.isEmpty) {
                        notes.removeAt(i);
                      } else {
                        notes[i] = description;
                      }
                      setState(() {});
                    }
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final description = await Navigator.pushNamed(
            context,
            '/create-note',
          );
          if (description != null) {
            notes.add(description as String);
            setState(() {});
            print(description);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
