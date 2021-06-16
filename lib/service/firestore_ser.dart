import 'package:cloud_firestore/cloud_firestore.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Firestore {  
  static String userUid;
  static Future<void> addItemWargaLama({
     String id,
     String nik,
     String noKK,
     String nama,
     String jk,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(id).collection('wargaLama').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "nik": nik,
      "noKK": noKK,
      "nama": nama,
      "jk": jk,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> addItemWargaBaru({
     String id,
     String nik,
     String noKK,
     String nama,
     String jk,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(id).collection('wargaBaru').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "nik": nik,
      "noKK": noKK,
      "nama": nama,
      "jk": jk,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItemWargaLama(
    {
      String uid,
      String nik,
      String noKK,
      String nama,
      String jk,
      String docId,
    }
  ) async {
    DocumentReference documentReferencer = 
    _mainCollection.doc(uid).collection('wargaLama').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      
      "nik": nik,
      "noKK": noKK,
      "nama": nama,
      "jk": jk,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItemWargaBaru(
    {
      String uid,
      String nik,
      String noKK,
      String nama,
      String jk,
      String docId,
    }
  ) async {
    DocumentReference documentReferencer = 
    _mainCollection.doc(uid).collection('wargaBaru').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "nik": nik,
      "noKK": noKK,
      "nama": nama,
      "jk": jk,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItemWargaLama(
    String uid
  ) {
    CollectionReference notesItemCollection =
        _mainCollection.doc(uid).collection('wargaLama');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readItemWargaBaru(
    String uid
  ) {
    CollectionReference notesItemCollection =
        _mainCollection.doc(uid).collection('wargaBaru');

    return notesItemCollection.snapshots();
  }


  static Future<void> deleteItemWargaLama({
     String uid,
     String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(uid).collection('wargaLama').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItemWargaBaru({
     String uid,
     String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(uid).collection('wargaBaru').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
  
}