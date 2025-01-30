import 'package:flutter/material.dart';
import 'package:notes_online/services/firestore.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //firestorre
  final FirestoreService firestoreService = FirestoreService();
  // text controller to access the entered notes
  final TextEditingController noteController = TextEditingController();

  // open a dialog to add a new note
  void openNoteBox() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              controller: noteController,
            ),
            actions: [
              // save
              ElevatedButton(
                onPressed: () {
                  // add a new note to DB
                  firestoreService.addNote(noteController.text);

                  // clear the text controller
                  noteController.clear();

                  // pop the dialogbox
                  Navigator.pop(context);
                },
                child: Text('Add'),
              ),

              // cancel
            ],
          );
        });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: Icon(Icons.add),
      ),
    );
  }
}
