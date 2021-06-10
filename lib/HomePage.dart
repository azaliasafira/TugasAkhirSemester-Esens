import 'package:carousel_pro/carousel_pro.dart';
import 'package:esens/WargaBaru.dart';
import 'package:esens/WargaLama.dart';
import 'package:esens/Start.dart';
import 'package:esens/models/warga_lama.dart';
import 'package:esens/providers/wargaLama_provider.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Start()),
              );
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
              BottomNavigationBarItem(icon: Icon(Icons.logout_rounded), title: Text("Logout"),
              ),
            ]
          ),
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
                                builder: (context) => Wargalama()),
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
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Wargabr()),
                            );
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