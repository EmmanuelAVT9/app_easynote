import 'package:app_easynote/widgets/hamburguer_menu.dart';
import 'package:flutter/material.dart';
import 'package:app_easynote/widgets/reusable_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyNote',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.limeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'EasyNote'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.note),
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
      drawer: HamburgerMenu(), // Menú hamburguesa

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      height: 100,
                      child: const Center(child: Text('Fila 1, Columna 1')),
                    ),
                  ),
                  SizedBox(width: 20), // Espacio horizontal entre columnas
                  Expanded(
                    child: Container(
                      color: Colors.deepPurpleAccent,
                      height: 100,
                      child: const Center(child: Text('Fila 1, Columna 2')),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Espacio vertical entre filas
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      height: 100,
                      child: const Center(child: Text('Fila 2, Columna 1')),
                    ),
                  ),
                  const SizedBox(width: 20), // Espacio horizontal entre columnas
                  Expanded(
                    child: Container(
                      color: Colors.orange,
                      height: 100,
                      child: const Center(child: Text('Fila 2, Columna 2')),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Espacio vertical entre fila
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.purple,
                      height: 100,
                      child: const Center(child: Text('Fila 3, Columna 1')),
                    ),
                  ),
                  SizedBox(width: 20), // Espacio horizontal entre columnas
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      height: 100,
                      child: Center(child: Text('Fila 3, Columna 2')),
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
        )

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción para agregar una nueva nota
        },
        backgroundColor: Colors.yellow,
        child: Icon(Icons.add),
      ),

    );
  }
}
