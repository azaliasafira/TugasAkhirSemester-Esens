import 'package:esens/HomePage.dart';
import 'package:flutter/material.dart';
// import 'package:esens/Start.dart';
// import 'package:esens/HomePage.dart';
// import 'package:esens/SignIn.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
            height: 400,
            child: Image(
              height: 250,
              image: AssetImage(
                "images/undefined.png",
                ),
              fit: BoxFit.contain,
            ),
            ),
            Padding(padding: EdgeInsets.all(12.0)),
            Text("Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email ID",
                icon: new Icon(Icons.email),
              ),
            ),

            SizedBox(height: 12),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: "Password",
                icon: new Icon(Icons.lock),
              ),
            ),
            
            SizedBox(height: 12),
            FlatButton(
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
              onPressed: () {},
            ),

            ],
          ),
        
      ),
      
    );
  }
}
