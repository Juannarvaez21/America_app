import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba3/firebase_options.dart';
import 'package:prueba3/pag2.dart';
import 'package:prueba3/pag1.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const IntroPage(),
      routes: {
        '/homepage':(context) => const HomePage(),
        'intropage':(context) => const IntroPage()
      } ,
    );
  }
}