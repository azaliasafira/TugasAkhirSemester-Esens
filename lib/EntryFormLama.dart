// import 'package:esens/models/warga_lama.dart';
// import 'package:esens/providers/wargaLama_provider.dart';
import 'package:esens/service/firestore_ser.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:ffi';


class EntryFormLama extends StatefulWidget {
  final String nik;
  final String noKK;
  final String nama;
  final String jk;
  final String id;
  final String docId;
  EntryFormLama(this.nik, this.noKK, this.nama, this.jk, this.id, this.docId);
  @override
  EntryFormLamaState createState() => EntryFormLamaState(this.nik, this.noKK, this.nama, this.jk, id, docId);
}

class EntryFormLamaState extends State<EntryFormLama> {
  String nik;
  String noKK;
  String nama;
  String jk;
  String id;
  String docId;
  EntryFormLamaState(String nik, String noKK, String nama, String jk, String id, String docId);
  TextEditingController nikController = TextEditingController();
  TextEditingController noKKController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController jkController = TextEditingController();
  
    @override
    void dispose() {
      nikController.dispose();
      noKKController.dispose();
      namaController.dispose();
      jkController.dispose();
      super.dispose();
    }
    
    @override
    Widget build(BuildContext context) {
      //kondisi
        if (nik != null) {
          nikController.text = nik;
          noKKController.text = noKK;
          namaController.text = nama;
          jkController.text = jk;
        }
  
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text('Entry Form Data Warga Lama',
          style: TextStyle(fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68)),),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0), 
          child: ListView(
            children: <Widget>[
              //nik
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'NIK',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {

                  }
                ),
              ),
              //noKK
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nomor Kartu Keluarga',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {

                  }
                ),
              ),
              //nama
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {

                  }
                ),
              ),
              //jenis kelamin
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Jenis Kelamin',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {

                  }
                ),
              ),

              //button
              Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    children: <Widget>[
                      // tombol simpan
                      Expanded(
                        child: ElevatedButton(
                          // color: Theme.of(context).primaryColorDark,
                          // textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Save',
                          style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                          ),
                          onPressed: () {
                            if (nik == null) {
                              Firestore.addItemWargaLama(
                                id: id.toString(),
                                nik: nikController.text,
                                noKK: noKKController.text,
                                nama: namaController.text,
                                jk: jkController.text);
                            } else {
                              Firestore.updateItemWargaLama(
                                uid: id.toString(),
                                nik: nikController.text,
                                noKK: noKKController.text,
                                nama: namaController.text,
                                jk: jkController.text,
                                docId: docId);
                            }
                            Navigator.pop(context);
                          },
                        ),
                      ),
                        Container(
                          width: 5.0,
                        ),
                      // tombol batal
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorLight,
                            textColor: Theme.of(context).primaryColorDark,
                            child: Text(
                              'Cancel',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }
                            ),
                          ),
                    ]
                  ),
                ),
            ],
          ),
          ),
      );
    }
  }
  