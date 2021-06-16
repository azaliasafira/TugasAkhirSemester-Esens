import 'package:esens/SignIn.dart';
import 'package:esens/models/userSql.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final UserLog user;
  Register(this.user);
  @override
  RegisterState createState() => RegisterState(this.user);
}

class RegisterState extends State < Register > {
  UserLog user;
  RegisterState(this.user);
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final email = TextFormField(

      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: usernameController,
      decoration: InputDecoration(
        hintText: 'username',
        icon: new Icon(Icons.email),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        icon: new Icon(Icons.lock),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final name = TextFormField(
      autofocus: false,
      controller: nameController,
      decoration: InputDecoration(
        hintText: 'Name',
        icon: new Icon(Icons.account_circle_outlined),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final buttonLogin = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          onPressed: () {
            //Navigator.of(context).pushNamed(Home.tag);
            createUserWithEmailAndPassword(
              usernameController.text, passwordController.text);
            // kembali ke layar sebelumnya dengan membawa objek item
            Navigator.pop(context);
          },
          color: Colors.orange,
          child: Text('Register', style: TextStyle(color: Colors.white)),
        ),
      ),
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
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 150),
          children: < Widget > [

            Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,

                children: < Widget > [

                  Container(
                    child: Image(
                      image: AssetImage("images/login.jpg"),
                      fit: BoxFit.fitHeight,
                      height: 250,
                      width: 200,
                    )),
                  new Text("Register",
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
            SizedBox(height: 8.0),
            name,
            SizedBox(height: 24.0),
            buttonLogin,

          ],
        ),
      ),
    );
  }
}