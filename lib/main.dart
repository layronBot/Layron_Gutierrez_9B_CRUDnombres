import 'package:layrongutierrez9b/paginas/pagina_add_nombre.dart';
import 'package:layrongutierrez9b/paginas/pagina_edit_nombre.dart';
import 'package:layrongutierrez9b/paginas/pagina_inicio.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  //Sin este codigo, no se puede depurarar la aplicación
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase App',
      //Sistema de rutas
      routes: {
        '/': (context) => const Home(), 
        '/add': (context) => const AddNombre(),
        '/edit': (context) => const EditNombre(),
      },
    );
  }
}
