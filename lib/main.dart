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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // Variable para el contador

  void _incrementCounter() {
    /*El setState se usa dentro de esta funcion para indicar a flutter que debe
      redibujar la pantalla con el valor de _counter, si no se utiliza al aumen-
      tar- el contador no se vera reflejado en la pantalla hasta que se haga un
      hot reload */
    setState(() {
      _counter++; // Incrementa el contador
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(//El container se encarga de envolver al texto "Hola Flutter"
              color: Colors.green,
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'Hola, Flutter',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Text(
              'Veces presionado: $_counter', // Muestra el valor del contador
              style: const TextStyle(fontSize: 20,
              color: Colors.blue),
            ),
            const SizedBox(height: 30), // Espacio entre el texto y el botón
            ElevatedButton(
              onPressed:
                  _incrementCounter, // Llama a la función para incrementar
              child: const Text('Presionar'),
            ),
          ],
        ),
      ),
    );
  }
}
