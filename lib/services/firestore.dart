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

  Stream<QuerySnapshot> getNotes() {
    final note = notes.orderBy('timestamp', descending: true).snapshots();
    return note;
  }
}
