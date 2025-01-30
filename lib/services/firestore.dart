import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get the collection of note from database
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  //create : add a new note to DB
  Future<void> addNote(String note) {
    return notes.add({
      'notes': note,
      'timestamp': Timestamp.now(),
    });
  }

  // read : get notes from DB

  // update : a note i DB

  // delete : a note frrm DB
}
