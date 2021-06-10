import 'package:esens/models/warga_lama.dart';
import 'package:esens/providers/wargaLama_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:ffi';


class EntryFormLama extends StatefulWidget {
  final WargaL wargaLama;
  EntryFormLama([this.wargaLama]);

  @override
  EntryFormLamaState createState() => EntryFormLamaState();
}

class EntryFormLamaState extends State<EntryFormLama> {
  final nikController = TextEditingController();
  final noKKController = TextEditingController();
  final namaController = TextEditingController();
  final jkController = TextEditingController();
  String _uploadedFileURL; 
  FileImage _image;
  
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
      if(widget.wargaLama == null){
        nikController.text = "";
        noKKController.text = "";
        namaController.text = "";
        jkController.text = "";
        new Future.delayed(Duration.zero, () {
          final wargaBaruProvider =
              Provider.of<WargaLamaProvider>(context, listen: false);
          wargaBaruProvider.loadValues(WargaL());
        });
      } else {
        //Controller Update
        nikController.text = widget.wargaLama.nik;
        noKKController.text = widget.wargaLama.noKK;
        namaController.text = widget.wargaLama.nama;
        //State Update
        new Future.delayed(Duration.zero, () {
          final mapelProvider =
              Provider.of<WargaLamaProvider>(context, listen: false);
          mapelProvider.loadValues(widget.wargaLama);
        });
      }
      super.initState();
    }
  
    @override
    Widget build(BuildContext context) {
      final wargaLamaProvider = Provider.of<WargaLamaProvider>(context);
  
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
                    labelText: 'NIK'
                  ),
                  onChanged: (value) => wargaLamaProvider.changeNIK(value),
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
                  onChanged: (value) => wargaLamaProvider.changeNoKK(value),
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
                  onChanged: (value) => wargaLamaProvider.changeNama(value),
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
                  onChanged: (value) => wargaLamaProvider.changeJk(value),
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
                            wargaLamaProvider.saveWargaLama();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
  
                      // tombol batal
                        (widget.wargaLama != null)
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
                            wargaLamaProvider.removeWargaLama(widget.wargaLama.id);
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
  