import 'package:layrongutierrez9b/firebase_metodos.dart';
import 'package:flutter/material.dart';

void main() => runApp(const EditNombre());

class EditNombre extends StatefulWidget {
  const EditNombre({super.key});

  @override
  State<EditNombre> createState() => _EditNombreState();
}

class _EditNombreState extends State<EditNombre> {
  //Controlador para guardar el valor de la columna
  TextEditingController nombreControlador = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {

    final Map argumentos = ModalRoute.of(context)!.settings.arguments as Map;
    nombreControlador.text = argumentos['nombre'];

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Editar Nombre'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column (
            children: [
              TextField(
                //Mando llamar al controlador
                controller: nombreControlador,
                decoration: const InputDecoration(
                  hintText: 'Modifica el nombre',
                ),
              ),
              ElevatedButton(
                onPressed: () async{
                  //print(argumentos['id']);
                  await actualizarNombre(argumentos['uid'], nombreControlador.text).then((_){
                    Navigator.pop(context);
                  });
              }, child: const Text("Actualizar"))
            ],
          ),
        )
      ),
    );
  }
}