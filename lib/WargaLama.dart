import 'package:esens/EntryFormLama.dart';
import 'package:esens/models/warga_lama.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wargalama extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      final wargalm = Provider.of < List < WargaL>>(context);
      
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Data Warga Lama',
            style: TextStyle(
              fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68)),
          ),
        ),
      
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => EntryFormLama()),
            );
          },
          label: const Text('Tambah Data Warga'),
            icon: const Icon(Icons.add),
              backgroundColor: Colors.orange,
        ),

        body:(wargalm!= null)
            ?ListView.builder(
              itemCount: wargalm.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(
                    wargalm[index].nama,
                  ),
                  trailing: Text(wargalm[index].nik),
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EntryFormLama(
                          wargalm[index],
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