class WargaB{
  int _id;
  String _nikWB;
  String _noKKWB;
  String _namaWB;
  String _jkWB;

  int get id => this._id;

  String get nikWB => this.nikWB;
  set nikWB(String value) => this._nikWB = value;

  String get noKKWB => this._noKKWB;
  set noKK(String value) => this._noKKWB = value;

  String get namaWB => this._namaWB;
  set namaWB(String value) => this._namaWB = value;

  String get jkWB => this._jkWB;
  set jkWB(String value) => this._jkWB = value;
  
  //Konstruktor 1 
  WargaB(this._nikWB, this._noKKWB, this._namaWB, this._jkWB);

  // Konstruktor 2 : Map -> Item 
  WargaB.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nikWB = map['nikWB'];
    this._noKKWB = map['noKKWB'];
    this._namaWB = map['namaWB'];
    this._jkWB = map['jkWB'];
  }

  //Konversi Item -> Map
  Map<String, dynamic>toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nikWB'] = this._nikWB;
    map['noKKWB'] = this._noKKWB;
    map['namaWB'] = this._namaWB;
    map['jkWB'] = this._jkWB;
    return map;
  }

}
