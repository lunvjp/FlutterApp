import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/signup.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

Future<String> _testSignInWithGoogle() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth =
  await googleUser.authentication;
  final FirebaseUser user = await _auth.signInWithGoogle(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  assert(user.email != null);
  assert(user.displayName != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  print('This is user: $user');

  return 'signInWithGoogle succeeded: $user';
}

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build (BuildContext context) {

    return new MaterialApp(
      title: 'Gymie',
//      home: new HomePage(),
      home: new MyHomePage(),
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => new Login(),
        '/signup': (BuildContext context) => new Signup()
      }
    );
  }
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Firebase Auth Demo',
////      home: new MyHomePage(title: 'Firebase Auth Demo'),
//      home: new HomeTest(),
//      routes: <String, WidgetBuilder> {
//        '/login': (BuildContext context) => new Login(),
//        '/signup': (BuildContext context) => new Signup()
//      }
//    );
//  }
//}

class HomeTest extends StatelessWidget {

  _checkTest() {
    _testSignInWithGoogle();
  }

  @override
  Widget build (BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(

      ),
      body: new Container(
        child: new RaisedButton(
          child: new Text(
            'Check Sign in'
          ),
          onPressed: _checkTest
        )
      ),
    );
  }
}
/****************************************************/
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  _testButton() {
    _testSignInWithGoogle();
  }

  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      backgroundColor: const Color(0xFFe4b6fc),
      body: new Center(
        child: new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [ Colors.purple[500],Colors.deepPurple[700] ],
              begin: const FractionalOffset(0.5, 0.0),
              end: const FractionalOffset(0.0, 0.5),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp
            ),
          ),
          child: new Column(
            children: <Widget>[
              new Center(
                child: new RaisedButton(
                  child: new Text(
                      'LunVJp'
                  ),
                  onPressed: _testButton
                )
              )
            ],
          )
//          child: new Home()
        )
      ),
    );
  }
}