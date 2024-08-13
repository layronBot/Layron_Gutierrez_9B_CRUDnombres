import 'package:layrongutierrez9b/firebase_metodos.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AddNombre());

class AddNombre extends StatefulWidget {
  const AddNombre({super.key});

  @override
  State<AddNombre> createState() => _AddNombreState();
}

class _AddNombreState extends State<AddNombre> {
  //Controlador para guardar el valor de la columna
  TextEditingController nombreControlador = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Añadir Nombre'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column (
            children: [
              TextField(
                //Mando llamar al controlador
                controller: nombreControlador,
                decoration: const InputDecoration(
                  hintText: 'Ingresa un nombre',
                ),
              ),
              ElevatedButton(
                onPressed: () async{
                await leerNombre(nombreControlador.text).then((_) {
                  Navigator.pop(context);
                });
                //print(nombreControlador.text); //Corroborar que el controalador funciona en la consola de depuración
              }, child: const Text("Guardar"))
            ],
          ),
        )
      ),
    );
  }
}