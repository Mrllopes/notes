import 'package:flutter/material.dart';

import '../../home_page.dart';

class NotesListWidget extends StatelessWidget {
  final List<String> notes;
  final Function onTap;
  const NotesListWidget({
    Key? key,
    required this.notes,
    required this.onTap,
  }) : super(key: key);

  List<Widget> renderItem() {
    var cards = <Widget>[];
    for (var i = 0; i < notes.length; i++)
      cards.add(
        Card(
          child: ListTile(
            title: Text(notes[i]),
            onTap: () {
              onTap(
                action: ActionTypes.update,
                index: i,
              );
            },
          ),
        ),
      );
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: renderItem(),
      ),
    );
  }
}
