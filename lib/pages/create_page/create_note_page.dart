import 'package:flutter/material.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  String description = '';
  var textController = TextEditingController();
  var isEdit = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        if (ModalRoute.of(context)!.settings.arguments != null) {
          description = ModalRoute.of(context)!.settings.arguments as String;
          textController.text = description;
          isEdit = true;
          setState(() {});
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Note' : 'Create Note'),
        centerTitle: true,
        actions: [
          if (isEdit)
            IconButton(
              onPressed: () {
                Navigator.pop(context, '');
              },
              icon: Icon(Icons.delete),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              maxLines: null,
              maxLength: 240,
              autofocus: true,
              onChanged: (value) {
                description = value;
                setState(() {});
              },
              decoration: InputDecoration(labelText: "Descrição"),
            ),
            SizedBox(
              height: 40,
            ),
            if (description.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            description,
                          );
                        },
                        child: Text('salvar'),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
