class WargaL{
  int _id;
  String _nikWL;
  String _noKKWL;
  String _namaWL;
  String _jkWL;

  int get id => this._id;

  String get nikWL => this.nikWL;
  set nikWL(String value) => this._nikWL = value;

  String get noKKWL => this._noKKWL;
  set noKK(String value) => this._noKKWL = value;

  String get namaWL => this._namaWL;
  set namaWL(String value) => this._namaWL = value;

  String get jkWL => this._jkWL;
  set jkWL(String value) => this._jkWL = value;
  
  //Konstruktor 1 
  WargaL(this._nikWL, this._noKKWL, this._namaWL, this._jkWL);

  // Konstruktor 2 : Map -> Item 
  WargaL.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nikWL = map['nikWL'];
    this._noKKWL = map['noKKWL'];
    this._namaWL = map['namaWL'];
    this._jkWL = map['jkWL'];
  }

  //Konversi Item -> Map
  Map<String, dynamic>toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nikWL'] = this._nikWL;
    map['noKKWL'] = this._noKKWL;
    map['namaWL'] = this._namaWL;
    map['jkWL'] = this._jkWL;
    return map;
  }

}
