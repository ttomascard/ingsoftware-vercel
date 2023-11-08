import 'package:flutter/material.dart';

class ResultadoPositivoPage extends StatelessWidget {
  const ResultadoPositivoPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: const Color(0xFF025951),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
              height: 20), // Agrega un espacio en blanco en la parte superior
          Center(
            child: Container(
              width: 800,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFFB1F5C0),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: const Center(
                child: Center(
                  child: Text(
                    'Predicción: Positivo para problemas cardiacos',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50), // Espacio de 50 de altura
          Padding(
            padding:
                const EdgeInsets.all(16.0), // Espaciado para el campo de texto
            child: Container(
              height: 300, // Ajusta la altura deseada
              decoration: BoxDecoration(
                color: Colors.white, // Color de fondo blanco
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Escribe la historia del paciente...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.0),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
