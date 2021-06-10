
import 'package:esens/models/warga_lama.dart';
import 'package:flutter/material.dart';
import 'package:esens/service/firestore_ser.dart';
import 'package:uuid/uuid.dart';


class WargaLamaProvider with ChangeNotifier {
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
  loadValues(WargaL wargaLama) {
    _id = wargaLama.id;
    _nik = wargaLama.nik;
    _noKK = wargaLama.noKK;
    _nama = wargaLama.nama;
    _jk = wargaLama.jk;
  }

  //create/update
  saveWargaLama() {
    print(_id);
    if (_id == null) {
      var newWargaLama = WargaL(
        id: uuid.v4(),
        nik: nik,
        noKK: noKK,
        nama: nama,
        jk: jk,
      );
      firestoreService.saveWargaLama(newWargaLama);
    } else {
      //Update
      var updatedWargaLama = WargaL(
        id: uuid.v4(),
        nik: nik,
        noKK: noKK,
        nama: nama,
        jk: jk,
      );
      firestoreService.saveWargaLama(updatedWargaLama);
    }
  }

  //delete
  removeWargaLama(String nik) {
    firestoreService.removeWargaLama(nik);
  }
}
