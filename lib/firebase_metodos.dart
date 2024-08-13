//import 'dart:js_interop_unsafe';

import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Regresa una lista de datos
Future<List> obtenerDatos() async {
  List gente = [];
  CollectionReference collectionReferenceGente = db.collection('001');

  QuerySnapshot queryGente = await collectionReferenceGente.get();
  for (var documento in queryGente.docs) {
    final Map<String, dynamic> datos = documento.data() as Map<String, dynamic>;
    final persona = {
      "nombre": datos['nombre'],
      "uid": documento.id,
    };
    gente.add(persona);
  }
  //Dar una duracion de 4 segundos para mostrar que el circulo funciona
  await Future.delayed(const Duration(seconds: 2));
  return gente;
}

//Leer datos
Future<void> leerNombre(String nombre) async {
  await db.collection("001").add({"nombre": nombre});
}

//Sintaxis de una base de datos NoSQL de Firebase
/*
"bd_usuarios":
 [
    {
      "nombre": "Oscar",
    },
    {
      "nombre": "irene",
    },
    {
      "nombre": "Ulises",
    },
    ...
 ]
*/

//Actualizar datos
Future<void> actualizarNombre(String uid, String nuevonombre) async {
  await db.collection("001").doc(uid).set({"nombre": nuevonombre});
}

//Eliminar datos
Future<void> eliminarNombre(String uid) async{
  await db.collection("001").doc(uid).delete();
}