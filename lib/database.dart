import 'dart:developer';
//import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/DocUser.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');
final CollectionReference _pacienteCollection = _firestore.collection('PACIENTES');
final CollectionReference _userCollection = _firestore.collection('user');

class Database {
  static String? userUid;

  static Future<void> addUser(
    DocUser docUser,
  ) async {
    //Hacemos una DocumentReference pues queremos crear un documento, y le pasamos el ID (ese ID se metió antes en el user auto desde FirebaseAuth)
    DocumentReference documentReferencer = _userCollection.doc(docUser.id);

    //Mapeamos los datos para que Firebase los entienda
    Map<String, dynamic> data = <String, dynamic>{
      "nombre": docUser.nombre,
      "edad": docUser.edad,
      "correo": docUser.correo,
    };

    //Mandamos la función .set que es la que envía los datos
    await documentReferencer
        .set(data)
        .whenComplete(() => log("User agregado correctamente a la DB"))
        .catchError((e) => log(e));
  }

  static Future getUser({required String id, required String nombre, required String correo, required int edad}) async {
    //En esta solo necesitamos el ID para ir a buscarlo a la db
    //Nuevamente hacemos un DocumentReference y le decimos q busque el doc con el id
    DocumentReference documentReference = _userCollection.doc(id);
    //Creamos una nueva instancia de CustomUser que es la que devolveremos
    DocUser user = DocUser(id: id,nombre: nombre,correo: correo,edad: edad);
    await documentReference.get().then(
      //Ya sabemos que con .then() podemos hacer algo después de que la función termine
      //En este caso nos devuelve una DocumentSnapshot
      (DocumentSnapshot doc) {
        //Mapeamos esa data del snapshot para que sea más fácil sacarle los campos específicos
        final data = doc.data() as Map<String, dynamic>;
        user.nombre = data['nombre'];
        user.edad = data['edad'];
        user.correo = data['correo'];
        user.id = data['id'];
      },
    );
    //Devolvemos un objeto User full instanciado
    return user;
  }

  static Future<void> addPaciente(String nombre, String cedula, String correo, String celular, String sexo,
  String edad, String fechaNacimiento, String direccion) async {
    DocumentReference documentReferencer =
        _pacienteCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "nombre": nombre,
      "cedula": cedula,
      "correo": correo,
      "celular": celular,
      "sexo": sexo,
      "edad": edad,
      "fechaNacimiento": fechaNacimiento,
      "direccion": direccion
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => log("Note item added to the database"))
        .catchError((e) => log(e));
  }

  static Future<void> updateItem(
      {required String title,
      required String note,
      required String docId}) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "note": note,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => log("Note item updated in the database"))
        .catchError((e) => log(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('items');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({required String docId}) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => log('Note item deleted from the database'))
        .catchError((e) => log(e));
  }
}
