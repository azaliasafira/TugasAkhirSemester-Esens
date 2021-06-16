import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esens/EntryFormBaru.dart';
import 'package:esens/models/warga_baru.dart';
import 'package:esens/service/dbHelper.dart';
import 'package:esens/service/firestore_ser.dart';
import 'package:flutter/material.dart';

class Wargabaru extends StatefulWidget {
  static const WargaB = '/wargaBaru';
  final id;
  Wargabaru(this.id);
  @override
  WargaBaruState createState() => WargaBaruState();
}

class WargaBaruState extends State < Wargabaru > {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<WargaB> wargabrList;
  @override
  Widget build(BuildContext context) {
    String warga = widget.id;
    print (warga);
    if (wargabrList == null) {
      wargabrList = List<WargaB>();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Data Warga Baru',
          style: TextStyle(
            fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: firestoreList(warga),
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var wrg = await navigateToEntryFormBaru(
          context, null, null, null,null, warga, null);

          if (wrg != null) {
              //TODO 2 Panggil Fungsi untuk Insert ke DB
                  int result = await dbHelper.insertWargaBaru(wrg);
                  if (result > 0) {
                  }
                }
        },
        
        label: const Text('Tambah Data'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.orange,
        ),
    );
  }
  Future < WargaB > navigateToEntryFormBaru(BuildContext context, String nik, String noKK, String nama, String jk, String id, String docId) async {
    var result = await Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
        return EntryFormBaru(nik, noKK, nama, jk, id, docId);
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
                      await Firestore.deleteItemWargaBaru(uid: s, docId: docID);
                    },
                  ),
                  onTap: () async {
                    var wrg = await navigateToEntryFormBaru(context, nik, noKK, nama,
                      jk, s, docID);
                    int result = await dbHelper.updateWargaBaru(wrg);
                    if (result > 0) {
                    }
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