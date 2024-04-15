import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prueba3/services/firestore.dart';
final TextEditingController textcontroller = TextEditingController();
final DocumentReference documentRef = FirebaseFirestore.instance.collection('notes').doc('doc1');
class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}
  void updateDocument() {
    documentRef.update({
      'ID': textcontroller.text,
    });
  }

class _IntroPageState extends State<IntroPage> {

  final FirestoreService fireStoreService = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("I N T R O P A G E")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
               controller: textcontroller,
              decoration: InputDecoration(
                hintText: 'ID Directo',
                border: OutlineInputBorder(),
              ),

            ),
          ),
          ElevatedButton(
            child: const Text("Go to Home"),
            onPressed: () {
              //go home
              Navigator.pushNamed(context, '/homepage');
            },
          ),
          ElevatedButton(
            child: const Text("Actualizar id"),
            onPressed:() {
              //enviar
              updateDocument();
            },
          ),
        ],
      ),
    );
  }

}