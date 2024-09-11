import 'package:basic_crud/components/my_app_bar.dart';
import 'package:basic_crud/components/my_floating_button.dart';
import 'package:basic_crud/components/my_text_field.dart';
import 'package:basic_crud/services/firestore.dart';
import 'package:flutter/material.dart';

class EditNotePage extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController detailController;
  final FirestoreService firestoreService;
  final String noteID;

  const EditNotePage({
    super.key,
    required this.titleController,
    required this.detailController,
    required this.firestoreService,
    required this.noteID,
  });

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.titleController.clear();
        widget.detailController.clear();
        return true;
      },
      child: Scaffold(
        appBar: MyAppBar(
          title: MyTextField(
            controller: widget.titleController,
            hintText: 'Title',
            color: Colors.transparent,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MyTextField(
                  maxLines: null,
                  controller: widget.detailController,
                  hintText: 'Write your note here...',
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: MyFloatingButton(
          icon: Icons.save_rounded,
          onPressed: () {
            if (widget.titleController.text.isNotEmpty && widget.detailController.text.isNotEmpty) {
              Navigator.pop(context);
              widget.firestoreService.updateNote(widget.noteID, widget.titleController.text, widget.detailController.text);
              widget.titleController.clear();
              widget.detailController.clear();
            }
          },
        ),
      ),
    );
  }
}
