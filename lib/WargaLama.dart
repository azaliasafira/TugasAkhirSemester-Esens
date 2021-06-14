// import 'package:esens/EntryFormLama.dart';
// import 'package:esens/models/warga_lama.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esens/EntryFormLama.dart';
import 'package:esens/models/warga_lama.dart';
import 'package:esens/service/firestore_ser.dart';
import 'package:flutter/material.dart';
import 'package:esens/service/dbHelper.dart';

class Wargalama extends StatefulWidget {
  static const WargaL = '/wargaLama';
  final id;
  Wargalama(this.id);
  @override
  WargaLamaState createState() => WargaLamaState();
}

class WargaLamaState extends State < Wargalama > {
  DbHelper dbHelper = DbHelper();
  int count = 0;
    @override
    Widget build(BuildContext context) {
      String warga = widget.id;
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Data Warga Lama',
            style: TextStyle(
              fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68)),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: firestoreList(warga),
            ),
            Container(
              child: FloatingActionButton(
                backgroundColor: Colors.orange,
                child: Text("Tambah Data Warga"),
                onPressed: () async {
                  var wrg = await navigateToEntryFormLama(
                    context, null, null, null,null, warga, null);
                }),
            ),
          ]
        ),
      );
    }
    Future < WargaL > navigateToEntryFormLama(BuildContext context, String nik, String noKK, String nama, String jk, String id, String docId) async {
      var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
          return EntryFormLama(nik, noKK, nama, jk, id, docId);
        }));
      return result;
    }
    StreamBuilder firestoreList(String s) {
      TextStyle textStyle = Theme.of(context).textTheme.headline5;
      return StreamBuilder < QuerySnapshot > (
        stream: Firestore.readItemWargaBaru(s),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              alignment: Alignment.center,
              child: Text('Loading',
                style: TextStyle(fontWeight: FontWeight.bold)));
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                var noteInfo = snapshot.data.docs[index].data();
                String docID = snapshot.data.docs[index].id;
                String nik = noteInfo['nik'];
                String noKK = noteInfo['noKK'];
                String nama = noteInfo['nama'];
                String jk = noteInfo['jk'];

                return Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange,
                    ),
                    title: Text(
                      nik,
                      style: textStyle,
                    ),
                    subtitle: Text(noKK + "\n" + nama),
                    trailing: GestureDetector(
                      child: Icon(Icons.delete),
                      onTap: () async {
                        await Firestore.deleteItemWargaLama(uid: s, docId: docID);
                      },
                    ),
                    onTap: () async {
                      var wrg = await navigateToEntryFormLama(context, nik, noKK, nama, 
                      jk, s, docID);
                    },
                  ),
                );
              },
            );
          }
        },
      );
    }
  }
