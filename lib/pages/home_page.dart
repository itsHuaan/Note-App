import 'package:basic_crud/components/my_app_bar.dart';
import 'package:basic_crud/components/my_floating_button.dart';
import 'package:basic_crud/components/my_note_tile.dart';
import 'package:basic_crud/provider/note_provider.dart';
import 'package:basic_crud/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context, listen: false);
    final titleController = TextEditingController();
    final detailController = TextEditingController();
    final firestoreService = FirestoreService();
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          'Notes',
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      floatingActionButton: MyFloatingButton(
        icon: Icons.add,
        onPressed: () {
          noteProvider.addNote(
            context,
            titleController,
            detailController,
            firestoreService,
          );
        },
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: firestoreService.readNotes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List noteList = snapshot.data!.docs;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: noteList.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot document = noteList[index];
                        String docID = document.id;
                        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                        String noteTitle = data['title'];
                        String noteCreated = DateFormat('MMM dd, yyyy').format(data['timestamp'].toDate());
                        return MyNoteTile(
                          noteTitle: noteTitle,
                          noteCreated: noteCreated,
                          onPressed: () {
                            noteProvider.fetchNote(context, titleController, detailController, firestoreService, docID);
                            noteProvider.updateNote(
                              context,
                              titleController,
                              detailController,
                              firestoreService,
                              docID,
                            );
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return const Text('No note!');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
