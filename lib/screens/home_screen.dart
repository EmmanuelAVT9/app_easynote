import 'package:flutter/material.dart';
import 'package:app_easynote/models/note.dart';
import 'package:app_easynote/widgets/note_element.dart';
import 'package:app_easynote/widgets/custom_botton_navigation_bar.dart';
import 'package:app_easynote/widgets/hamburguer_menu.dart';
import 'package:app_easynote/widgets/reusable_button.dart';
import 'package:provider/provider.dart';

import '../provider/note_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addNote(BuildContext context) async {
    final TextEditingController controller = TextEditingController();
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Añadir Nota'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: "Introduce el contenido de la nota"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Añadir'),
              onPressed: () {
                Provider.of<NoteProvider>(context, listen: false)
                    .insert(controller.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editNote(BuildContext context, Note note) async {
    final TextEditingController controller =
    TextEditingController(text: note.content);
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Editar Nota'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: "Edita el contenido de la nota"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Guardar'),
              onPressed: () {
                Provider.of<NoteProvider>(context, listen: false)
                    .update(note.id, controller.text);
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteNote(BuildContext context, Note note) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Eliminar Nota'),
          content:
          const Text("¿Estás seguro de que quieres eliminar esta nota?"),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Eliminar'),
              onPressed: () {
                Provider.of<NoteProvider>(context, listen: false)
                    .delete(note.id);
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'EasyNotes',
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.normal),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.supervised_user_circle_outlined),
            onPressed: () {
              // Navegar a la pantalla de Notas
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navegar a la pantalla de Notas
            },
          ),
          IconButton(
            icon: Icon(Icons.folder),
            onPressed: () {
              // Navegar a la pantalla de Carpetas
            },
          ),
        ],
      ),
      drawer: HamburgerMenu(), // Menú
      body: Consumer<NoteProvider>(
        builder: (context, noteProvider, child) {
          // list empty
          if (noteProvider.notes.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'EasyNote',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150, // Ancho del botón
                          height: 50, // Alto del botón
                          child: ElevatedButton(
                            onPressed: () {
                              // Acción para el botón Notas
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFBCB4FF), // Color de fondo
                              onPrimary: Colors.black, // Color de la letra
                            ),
                            child: Text(
                              'Notas',
                              style: TextStyle(fontSize: 18), // Tamaño de fuente
                            ),
                          ),
                        ),
                        SizedBox(width: 20), // Espacio horizontal entre columnas
                        Container(
                          width: 150, // Ancho del botón
                          height: 50, // Alto del botón
                          child: ElevatedButton(
                            onPressed: () {
                              // Acción para el botón Notas
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFBCB4FF), // Color de fondo
                              onPrimary: Colors.black, // Color de la letra
                            ),
                            child: Text(
                              'Carpetas',
                              style: TextStyle(fontSize: 18), // Tamaño de fuente
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '¡Tu espacio está listo para llenarse de ideas!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    // Asegúrate de tener una imagen con este nombre en la carpeta de assets
                    Image.asset('assets/img2.png'),
                  ],
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: noteProvider.notes.length,
                  itemBuilder: (context, index) {
                    final note = noteProvider.notes[index];
                    return NoteElement(
                        note: note,
                        onDelete: () => _deleteNote(context, note),
                        onEdit: () => _editNote(context, note));
                  },
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNote(context),
        backgroundColor: Colors.lime,
        child: const Icon(Icons.add),
      ),
    );
  }
}