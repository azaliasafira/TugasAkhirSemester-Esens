import 'package:esens/SplashScreen.dart';
import 'package:esens/providers/wargaBaru_providers.dart';
import 'package:esens/providers/wargaLama_provider.dart';
import 'package:esens/service/firestore_ser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WargaLamaProvider()),
        StreamProvider(
          create: (context) => firestoreService.getWargabr(), 
          //inisialisasi data
        ),
        ChangeNotifierProvider(create: (context) => WargaBaruProvider()),
        StreamProvider(
          create: (context) => firestoreService.getWargalm(), 
          //inisialisasi data
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.orange),
        debugShowCheckedModeBanner: false,
        home: SplashScreenPage(),
      ),
    );
  }
}