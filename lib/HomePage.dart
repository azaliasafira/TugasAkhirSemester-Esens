import 'package:carousel_pro/carousel_pro.dart';
import 'package:esens/SignIn.dart';
import 'package:esens/WargaBaru.dart';
import 'package:esens/WargaLama.dart';
import 'package:esens/Start.dart';
import 'package:esens/drawerNav.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:esens/models/warga_lama.dart';
// import 'package:esens/providers/wargaLama_provider.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  final id;
  static String tag = 'home';
  HomePage(this.id);
  _HomePageState createState() => _HomePageState();
  }
  
  class _HomePageState extends State<HomePage> {
    int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
}
  @override
  Widget build(BuildContext context) {
    String s;
    final User userArgs = ModalRoute.of(context).settings.arguments;
    if (userArgs != null) {
      s = userArgs.uid;
    }
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            elevation: 0.0,
            centerTitle: true,
            title: Text('E-Sens',
              style: TextStyle(
                fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68))
            ),
            actions: < Widget > [
              IconButton(
                icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
                onPressed: () {})
            ],
          ),
          drawer: DrawerNav(),
          body: ListView(
            children: < Widget > [
              SizedBox(
                height: 250.0,
                width: double.infinity,
                child: Carousel(
                  dotSize: 4.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.lightGreenAccent,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.transparent,
                  dotVerticalPadding: 5.0,
                  dotPosition: DotPosition.bottomCenter,
                  onImageTap: (index) {
                    setState(() {
                    _current = index;
                  });
                  },
                  images: [
                    Image.asset(
                      'images/1.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'images/2.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'images/3.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ],

                ),
              ),
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Text("Selamat Datang!\ndi Aplikasi E-Sens \nSilahkan Memilih Menu",
                  style:
                  TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Wrap(
                    children: < Widget > [
                      SizedBox(
                        width: 140.0,
                        height: 140.0,
                        child: Card(
                          color: Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: InkWell(
                            splashColor: Colors.orange[50].withAlpha(30),
                            onTap: (){
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Wargalama(id)),
                            );
                            },
                          
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: < Widget > [
                                Image.asset('images/entry.png', width: 64.0, ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Data Warga Lama",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(12.0)),
                      SizedBox(
                        width: 140.0,
                        height: 140.0,
                        child: Card(
                          color: Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: InkWell(
                            splashColor: Colors.orange[50].withAlpha(30),
                            onTap: (){
                              Navigator.push(context,
                              MaterialPageRoute(
                              builder: (context) => Wargabaru(id),
                            ));
                            },
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: < Widget > [
                                Image.asset('images/result.png', width: 64.0, ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Data Warga Baru",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      )],
                  ),
                ),
                
              ),
              
              ],
                ),
              );
            }
  }