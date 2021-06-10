import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esens/models/warga_baru.dart';
import 'package:esens/models/warga_lama.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //warga baru
  Future<void> saveWargabaru(WargaB wargaBaru) {
    return _db.collection('wargabr').doc(wargaBaru.id).set(wargaBaru.toMap());
  }

  Stream<List<WargaB>> getWargabr() {
    return _db.collection('wargabr').snapshots().map((snapshot) => snapshot.docs
        .map((document) => WargaB.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeWargaBaru(String wargaBaruId) {
    return _db.collection('wargabr').doc(wargaBaruId).delete();
  }

  //warga lama
  Future<void> saveWargaLama(WargaL wargaLama) {
    return _db.collection('wargalm').doc(wargaLama.wargaLamaId).set(wargaLama.toMap());
  }

  Stream<List<WargaL>> getWargalm() {
    return _db.collection('wargalm').snapshots().map((snapshot) => snapshot.docs
        .map((document) => WargaL.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeWargaLama(String wargaLamaId) {
    return _db.collection('wargalm').doc(wargaLamaId).delete();
  }

  
}
