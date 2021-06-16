import 'package:esens/HomePage.dart';
import 'package:esens/SignIn.dart';
import 'package:esens/models/userSql.dart';
import 'package:esens/register.dart';
import 'package:esens/service/dbHelper.dart';
import 'package:flutter/material.dart';
// import 'package:esens/models/userSql.dart'

class Login extends StatefulWidget {
  @override
  static String tag = 'login';
  _LoginState createState() => _LoginState();
}

class _LoginState extends State < Login > {
  BuildContext cont;
  DbHelper dbHelper = DbHelper();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _loading = false;
  final formKey = new GlobalKey < FormState > ();
  final scaffoldKey = new GlobalKey < ScaffoldState > ();


  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      controller: usernameController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Email ID",
        icon: new Icon(Icons.email),
      ),
    );


    final password = TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        icon: new Icon(Icons.lock),
      ),
    );

    cont = context;
    final buttonLogin = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: FlatButton(
        color: Colors.orange,
        padding: EdgeInsets.all(16),
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
       onPressed: () async {
          signInWithEmailAndPassword(
                  usernameController.text, passwordController.text)
              .then((result) {
            if (result != null) {
              Navigator.pushNamed(context, HomePage.tag, arguments: result);
            }
          });
        },
      ),
    );

    final forgotLabel = FlatButton(
      color: Colors.orange,
      padding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      child: Text(
        'Register',
        style: TextStyle(color: Colors.white),
      ),
      
      onPressed: () async {
        var user = await navigateToRegister(context, null);
        if (user != null) {
          int result = await dbHelper.insertUser(user);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 150),
          children: < Widget > [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: < Widget > [
                  Container(
                    child: Image(
                      image: AssetImage("images/undefined.png"),
                      fit: BoxFit.contain,
                      height: 250,
                      width: 200,
                    )),
                  new Text("Login",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    )),
                ]),
            ),
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            buttonLogin,
            Container(
              alignment: Alignment.center,
              child: Text("or"),
            ),
            SizedBox(
              height: 20,
            ),
            forgotLabel,
          ],
        ),
      ),
    );
  }

}
Future<UserLog> navigateToRegister(BuildContext context, UserLog user) async {
  var result = await Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return Register(user);
  }));
  return result;
}