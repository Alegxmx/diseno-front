import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4353F7), // Fondo del color de los botones
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.rocket_launch,
              size: 60.0,
              color: Colors.white,
            ),
            SizedBox(height: 25.0),
            Text(
              'HOLA',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Agrega aquí la lógica para ir a la página de Login
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Fondo blanco
                onPrimary: Color(0xFF4353F7), // Letras del color del fondo de la página
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Ink(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 150.0, minHeight: 35.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Agrega aquí la lógica para ir a la página de Registro
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent, // Sin fondo
                onPrimary: Colors.white, // Letras blancas
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.white), // Borde blanco
                ),
              ),
              child: Ink(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 150.0, minHeight: 35.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Registrarse',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
