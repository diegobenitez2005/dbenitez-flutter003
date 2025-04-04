import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.green,
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'Hola, Flutter',
                style: TextStyle(fontSize: 24),
                
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                print('Botón presionado');
              },
              child: const Text('Toca aquí'),
            ),
          ],
        ),
      ),
    );
  }
}
