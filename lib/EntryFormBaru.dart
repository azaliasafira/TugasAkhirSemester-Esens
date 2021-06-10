import 'dart:ffi';
import 'package:esens/models/warga_baru.dart';
import 'package:esens/providers/wargaBaru_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

class EntryFormBaru extends StatefulWidget {
  final WargaB wargaBaru;
  EntryFormBaru([this.wargaBaru]);

  @override
  EntryFormBaruState createState() => EntryFormBaruState();
}

class EntryFormBaruState extends State<EntryFormBaru> {
  final nikController = TextEditingController();
  final noKKController = TextEditingController();
  final namaController = TextEditingController();
  final jkController = TextEditingController();

  @override
  void dispose() {
    nikController.dispose();
    noKKController.dispose();
    namaController.dispose();
    jkController.dispose();
    super.dispose();
  }

  @override
  void initState(){
    if(widget.wargaBaru == null){
      nikController.text = "";
      noKKController.text = "";
      namaController.text = "";
      jkController.text = "";
      new Future.delayed(Duration.zero, () {
        final wargaBaruProvider =
            Provider.of<WargaBaruProvider>(context, listen: false);
        wargaBaruProvider.loadValues(WargaB());
      });
    } else {
      //Controller Update
      nikController.text = widget.wargaBaru.nik;
      noKKController.text = widget.wargaBaru.noKK;
      namaController.text = widget.wargaBaru.nama;
      //State Update
      new Future.delayed(Duration.zero, () {
        final mapelProvider =
            Provider.of<WargaBaruProvider>(context, listen: false);
        mapelProvider.loadValues(widget.wargaBaru);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wargaBaruProvider = Provider.of<WargaBaruProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('Entry Form Data Warga Baru',
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
                  labelText: 'NIK'
                ),
                onChanged: (value) => wargaBaruProvider.changeNIK(value),
              ),
            ),
            //noKK
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nomor Kartu Keluarga'
                ),
                onChanged: (value) => wargaBaruProvider.changeNoKK(value),
              ),
            ),
            //nama
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama'
                ),
                onChanged: (value) => wargaBaruProvider.changeNama(value),
              ),
            ),
            //jenis kelamin
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Jenis Kelamin'
                ),
                onChanged: (value) => wargaBaruProvider.changeJk(value),
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
                          wargaBaruProvider.saveWargaBaru();
                          Navigator.of(context).pop();
                        },
                      ),
                    ),

                    // tombol batal
                      (widget.wargaBaru != null)
                      ? ElevatedButton(
                        child: Text(
                          'Delete',
                          style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        ),
                        onPressed: () {
                          wargaBaruProvider.removeWargaBaru(widget.wargaBaru.id);
                          Navigator.of(context).pop();
                        },
                      )
                      : Container(),
                  ]
                ),
              ),
          ],
        ),
        ),
    );
  }
}