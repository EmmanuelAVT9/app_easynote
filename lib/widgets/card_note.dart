import 'package:flutter/material.dart';
import 'package:app_easynote/models/note.dart';

class NoteElement extends StatelessWidget {
  final Note note;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const NoteElement(
      {required this.note,
        required this.onDelete,
        required this.onEdit,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(note.content),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.star),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red[400]),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}