class WargaL{
  final String id;
  final String nik;
  final String noKK;
  final String nama;
  final String jk;

  WargaL({
    this.id,
    this.nik,
    this.noKK,
    this.nama,
    this.jk,
  });

  String get wargaLamaId => null;

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nik': nik,
      'noKK': noKK,
      'jk': jk,
      'nama': nama,
    };
  }

  WargaL.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        nik = firestore['nik'],
        noKK = firestore['noKK'],
        jk = firestore['jk'],
        nama = firestore['nama'];
}