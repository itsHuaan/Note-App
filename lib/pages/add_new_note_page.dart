import 'package:basic_crud/components/my_app_bar.dart';
import 'package:basic_crud/components/my_floating_button.dart';
import 'package:basic_crud/components/my_text_field.dart';
import 'package:basic_crud/provider/theme_provider.dart';
import 'package:basic_crud/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewNotePage extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController detailController;
  final FirestoreService firestoreService;

  const AddNewNotePage({
    super.key,
    required this.titleController,
    required this.detailController,
    required this.firestoreService,
  });

  @override
  _AddNewNotePageState createState() => _AddNewNotePageState();
}

class _AddNewNotePageState extends State<AddNewNotePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        widget.titleController.clear();
        widget.detailController.clear();
        return true;
      },
      child: Scaffold(
        appBar: MyAppBar(
          actions: [
            IconButton(
              onPressed: () {
                themeProvider.changeTheme();
              },
              icon: Icon(
                themeProvider.isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
              ),
            )
          ],
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
              widget.firestoreService.addNote(widget.titleController.text, widget.detailController.text);
              widget.titleController.clear();
              widget.detailController.clear();
            }
          },
        ),
      ),
    );
  }
}
