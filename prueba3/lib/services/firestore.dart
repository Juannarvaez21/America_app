import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  //get
    final CollectionReference ides =
      FirebaseFirestore.instance.collection('notes');
  //CREATE: agregar cv
      Future<void> addNote(String id){
        return ides.add({
          "ID":id,
        });
      }
  //READ: tomar cv de la base de datos
      Stream<QuerySnapshot> getNotesStream(){
        final noteStream = ides.orderBy('timestamp', descending: true).snapshots();
        return noteStream;
      }
} 