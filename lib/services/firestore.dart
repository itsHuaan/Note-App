import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(String title, String detail) {
    return notes.add({
      'title': title,
      'detail': detail,
      'timestamp': Timestamp.now()
    });
  }

  Future<DocumentSnapshot> getNoteByID(String noteID) async {
    return await notes.doc(noteID).get();
  }

  Stream<QuerySnapshot> readNotes() {
    return notes.orderBy('timestamp', descending: true).snapshots();
  }

  Future<void> updateNote(String docID, String title, String detail) {
    return notes.doc(docID).update({
      'title': title,
      'detail': detail,
      'timestamp': Timestamp.now()
    });
  }
}
