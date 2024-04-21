import 'package:americastereo/DirectPage.dart';
import 'package:americastereo/RadioPage.dart';
import 'package:americastereo/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blue,
          animationDuration: Duration(milliseconds: 300),
          items: const <Widget>[
            Icon(Icons.tv),
            Icon(Icons.radio)
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          }
        ),
        body: _getBody(_page),
      ),
    );
  }
  @override
  void dispose() {
  
    // TODO: implement dispose
    super.dispose();
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return DirectPage();
      case 1:
        return AnimatedLogo();
      default:
        return Container();
    }
  }
}