import 'package:flutter/material.dart';
import 'package:app_easynote/provider/note_provider.dart';
import 'package:app_easynote/services/database_service.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
//import 'screens/home_screen.dart';
import 'views/home/home_view.dart';
import 'views/home/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await createDatabase(); // start database
  runApp(
    Provider<Database>(
      create: (context) => database,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyNote',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.limeAccent),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => ChangeNotifierProvider(
          create: (context) => NoteProvider(
              db: Provider.of<Database>(context, listen: false)),
          child: const HomeScreen(),
        ),
      },
    );
  }
}