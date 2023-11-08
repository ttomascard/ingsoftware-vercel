/*import 'package:flutter/material.dart';

class SistemaPrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Principal'),
      ),
      body: Center(
        child: Text('Esta es la página principal'),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_application_1/prediccion_page.dart';
import 'login_page.dart'; // Importa la página de inicio de sesión para volver atrás
import 'ingresar_datos.dart'; // Importa la página de inicio de sesión para volver atrás

class SistemaPrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.5; // Ancho máximo de los botones
    double verticalPadding = 15.0; // Aumento vertical del padding de los botones

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF025951),
        title: const Center(
          child: Text(
            'Sistema para la prevención de problemas cardíacos',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Menú Principal',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF025951),
                ),
              ),
            ),
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  // Navegar a la página "IngresarDatosPage" cuando se presiona el botón "Registrar Paciente"
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const IngresarDatosPage()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: verticalPadding),
                  child: const Text(
                    'Registrar Paciente',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF025951),
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrediccionPage()));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: verticalPadding),
                  child: const Text(
                    'Predicción',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF025951),
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  print('Botón "Historia Paciente" presionado');
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: verticalPadding),
                  child: const Text(
                    'Historia Paciente',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF025951),
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Image.asset('assets/pablo.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
