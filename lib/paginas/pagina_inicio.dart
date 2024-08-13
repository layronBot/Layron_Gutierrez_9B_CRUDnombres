import 'package:layrongutierrez9b/firebase_metodos.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase con Operaciones CRUD'),
      ),
      body: FutureBuilder(
        future: obtenerDatos(), 
        builder: (context, snapshot){
          //Se aplica una condicion para quitar la excepcion de datos nulos en metodos future
          if(snapshot.hasData) {
            //Lista de elementos
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) async {
                      await eliminarNombre(snapshot.data?[index]['uid']);
                      snapshot.data?.removeAt(index);
                  },
                  confirmDismiss: (direction) async{
                      bool resultado = false;
                      resultado = await showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("¿Quieres eliminar a ${snapshot.data?[index]['nombre']}?"),
                          actions: [
                            TextButton(onPressed: () {
                              return Navigator.pop(context,false);
                            }, child: const Text("Cancelar", style: TextStyle(color: Colors.red))),
                            TextButton(onPressed: () {
                              return Navigator.pop(context,true);
                            }, child: const Text("Si"))
                          ],
                        );
                      });
                      return resultado;
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete),
                  ),
                  direction: DismissDirection.endToStart,
                  key: Key(snapshot.data?[index]['uid']),
                  child: ListTile(
                    title: Text(snapshot.data?[index]['nombre']),
                    onTap: (() async{
                      await Navigator.pushNamed(context, "/edit", arguments: {
                        "nombre": snapshot.data?[index]['nombre'],
                        "uid": snapshot.data?[index]['uid']
                        });
                        setState(() {});
                    }),
                  ),
                );
              },
            );
            //En caso contrario, mostrar simplemente un circulo de carga
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
        ),
    );
  }
}