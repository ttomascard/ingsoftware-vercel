import 'package:flutter/material.dart';
import 'package:flutter_application_1/database.dart';
import 'package:flutter_application_1/models/Paciente.dart';

TextEditingController direc = TextEditingController();
TextEditingController fechaNac = TextEditingController();
TextEditingController cel = TextEditingController();
TextEditingController cor = TextEditingController();
TextEditingController ced = TextEditingController();
TextEditingController sex = TextEditingController();
TextEditingController age = TextEditingController();
TextEditingController name = TextEditingController();

class IngresarDatosPage extends StatelessWidget {
  const IngresarDatosPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width60Percent = MediaQuery.of(context).size.width * 0.6;
    double columnWidth = MediaQuery.of(context).size.width * 0.3;

    OutlineInputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(color: Colors.white),
    );

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
      body: Column(children: [
        // Fila superior (blanco)
        Container(
          color: Colors.white,
          height: 100,
        ),
        // Fila del medio (verde dividido en 3 columnas)
        Container(
          color: const Color(0xFF025951),
          height: MediaQuery.of(context).size.height * 0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Columna izquierda para foto
              Container(
                width: columnWidth,
                color: const Color(0xFF025951),
                child: Center(
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text('Foto'),
                    ),
                  ),
                ),
              ),
              // Columna central para campos de Nombre, Edad, Sexo y Cédula
              Container(
                width: columnWidth,
                color: const Color(0xFF025951),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: width60Percent,
                      height: 60,
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                          border: inputBorder,
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      width: width60Percent,
                      height: 60,
                      child: TextFormField(
                        controller: age,
                        decoration: InputDecoration(
                          labelText: 'Edad',
                          border: inputBorder,
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      width: width60Percent,
                      height: 60,
                      child: TextFormField(
                        controller: sex,
                        decoration: InputDecoration(
                          labelText: 'Sexo',
                          border: inputBorder,
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      width: width60Percent,
                      height: 60,
                      child: TextFormField(
                        controller: ced,
                        decoration: InputDecoration(
                          labelText: 'Cédula',
                          border: inputBorder,
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              // Columna derecha para campos de Correo electrónico, Número de celular, Fecha de nacimiento y Dirección
              Container(
                width: columnWidth,
                color: const Color(0xFF025951),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width60Percent,
                      height: 60,
                      child: TextFormField(
                        controller: cor,
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          border: inputBorder,
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Container(
                      width: width60Percent,
                      height: 60,
                      child: TextFormField(
                        controller: cel,
                        decoration: InputDecoration(
                          labelText: 'Número de celular',
                          border: inputBorder,
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Container(
                      width: width60Percent,
                      height: 60,
                      child: TextFormField(
                        controller: fechaNac,
                        decoration: InputDecoration(
                          labelText: 'Fecha de nacimiento',
                          border: inputBorder,
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    Container(
                      width: width60Percent,
                      height: 60,
                      child: TextFormField(
                        controller: direc,
                        decoration: InputDecoration(
                          labelText: 'Dirección',
                          border: inputBorder,
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Fila inferior (blanco)
        SizedBox(
          child: Container(
            color: Colors.white,
            height: 70,
            child: ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                Paciente paciente = Paciente(
                  nombre: name.text,
                  edad: age.text,
                  sexo: sex.text,
                  cedula: ced.text,
                  correo: cor.text,
                  celular: cel.text,
                  fechaNacimiento: fechaNac.text,
                  direccion: direc.text,
                );
                Database.addPaciente(
                  paciente.nombre,
                  paciente.cedula,
                  paciente.correo,
                  paciente.celular,
                  paciente.sexo,
                  paciente.edad,
                  paciente.fechaNacimiento,
                  paciente.direccion,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB1F5C0),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: Colors.white, width: 1),
                ),
                minimumSize: const Size(100, 10),
              ),
              child: const Text(
                'Registrar',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
