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
      home: const ColorChangerScreen(),
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  final List<Color> _colors = [
    Colors.white,
    Colors.blue,
    Colors.red,
    Colors.green,
  ];
  //Esta variable se usa para cambiar el color del texto cuando el container
  //esta en blanco.
  late Color colorTexto = Colors.black;
  int _currentColorIndex = 0;
  void _changeColor() {
    if (_currentColorIndex == 3) {
      _currentColorIndex += 1;
    }
    //El setState notifica a Flutter un cambio en el estado del widget. Dentro de
    //él se realiza una operacion matemática que devuelve el index al que se
    //debe acceder en el array de colores
    setState(() {
      _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
    });
    if (_currentColorIndex != 0) {
      colorTexto = Colors.white;
    } else {
      colorTexto = Colors.black;
    }
  }

  void _resetColor() {
    setState(() {
      _currentColorIndex = 0;
      colorTexto = Colors.black;
    });
  }

  // void _showBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Container(
  //         height: 200,
  //         color: Colors.white,
  //         child: Center(child: Text('Este es un Modal BottomSheet')),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi App'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: colorTexto,
          fontSize: 20,
          fontFamily: 'Roboto', // Especifica la fuente 'Roboto'
        ),
        backgroundColor: _colors[_currentColorIndex],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              color: _colors[_currentColorIndex],
              alignment: Alignment.center,
              child: Text(
                '¡Cambio de color!',
                style: TextStyle(fontSize: 18, color: colorTexto),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeColor,
              child: const Text('Cambiar color'),
            ),
            ElevatedButton(
              onPressed: _resetColor,
              child: const Text('Resetear color'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: _colors[_currentColorIndex],
        child: 
        Center(child: Text('!!También cambio de color!!',
        style: TextStyle(
          fontSize: 20.0,
          color: colorTexto,
           ),
          ),
        ),
      ),
    );
  }
}
