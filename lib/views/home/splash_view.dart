import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.lime,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bienvenido a EasyNote',
              style: TextStyle(fontSize: 35.0, color: Colors.black),
            ),
            const SizedBox(height: 20.0),
            Image.asset('assets/img2.png'),
            const SizedBox(height: 70.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFBCB4FF), // Color de fondo
                onPrimary: Colors.black,
                elevation: 5,
                padding: const EdgeInsets.symmetric(
                    horizontal: 100.0, vertical: 15.0),
              ),
              child: const Text(
                  'Empieza..!!',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}