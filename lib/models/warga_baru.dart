class WargaB{
  final String id;
  final String nik;
  final String noKK;
  final String nama;
  final String jk;

  WargaB({
    this.id,
    this.nik,
    this.noKK,
    this.nama,
    this.jk,
  });

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nik': nik,
      'noKK': noKK,
      'jk': jk,
      'nama': nama,
    };
  }

  WargaB.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        nik = firestore['nik'],
        noKK = firestore['noKK'],
        jk = firestore['jk'],
        nama = firestore['nama'];
}
