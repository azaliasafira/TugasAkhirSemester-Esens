import 'package:esens/models/warga_baru.dart';
import 'package:esens/service/firestore_ser.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';


class WargaBaruProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _id;
  String _nik;
  String _noKK;
  String _nama;
  String _jk;
  var uuid = Uuid();

  //Getters
  String get nik => _nik;
  String get noKK => _noKK;
  String get nama => _nama;
  String get jk => _jk;

  //Setters
  changeNIK(String value) {
    _nik = value;
    notifyListeners();
  }

  changeNoKK(String value) {
    _noKK = value;
    notifyListeners();
  }

  changeNama(String value) {
    _nama= value;
    notifyListeners();
  }

  changeJk(String value) {
    _jk= value;
    notifyListeners();
  }

  //read
  loadValues(WargaB wargaBaru) {
    _id = wargaBaru.id;
    _nik = wargaBaru.nik;
    _noKK = wargaBaru.noKK;
    _nama = wargaBaru.nama;
    _jk = wargaBaru.jk;
  }

  //create/update
  saveWargaBaru() {
    print(_id);
    if (_id == null) {
      var newWargaBaru = WargaB(
        id: uuid.v4(),
        nik: nik,
        noKK: noKK,
        nama: nama,
        jk: jk,
      );
      firestoreService.saveWargabaru(newWargaBaru);
    } else {
      //Update
      var updatedWargaBaru = WargaB(
        id: uuid.v4(),
        nik: nik,
        noKK: noKK,
        nama: nama,
        jk: jk,
      );
      firestoreService.saveWargabaru(updatedWargaBaru);
    }
  }

  //delete
  removeWargaBaru(String nik) {
    firestoreService.removeWargaBaru(nik);
  }
}
