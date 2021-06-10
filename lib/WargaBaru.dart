import 'package:esens/EntryFormBaru.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esens/models/warga_baru.dart';

class Wargabr extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      final wargabr = Provider.of < List < WargaB>>(context);
      
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Data Warga Baru',
            style: TextStyle(
              fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68)),
          ),
        ),
      
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => EntryFormBaru()),
            );
          },
          label: const Text('Tambah Data Warga'),
            icon: const Icon(Icons.add),
              backgroundColor: Colors.orange,
        ),

        body:(wargabr != null)
            ?ListView.builder(
              itemCount: wargabr.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(
                    wargabr[index].nama,
                  ),
                  trailing: Text(wargabr[index].nik),
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EntryFormBaru(
                          wargabr[index],
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : Center(
            child: CircularProgressIndicator(),
          ),
      );
    }
  }