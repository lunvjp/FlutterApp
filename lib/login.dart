import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  _checkAccount() {
    print('Check User');
//    _testSignInWithGoogle();
  }

  _forgotPassword() {
    print('Forgot Password');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Gymie',
        ),
        centerTitle: true,
      ),
      body: new Container(
        padding: new EdgeInsets.all(25.0),
        child: new Column(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.only(
                bottom: 10.0
              ),
              alignment: Alignment.topLeft,
              child: new Text(
                'Log in',
                textAlign: TextAlign.left,
                style: new TextStyle(
                  fontFamily: 'HelveticaNeue',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: const Color(0xFF282828)
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(
                bottom: 20.0
              ),
              child: new Form(
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      autocorrect: false,
                      decoration: new InputDecoration(
                        labelText: 'EMAIL ADDRESS',
                        hintText: 'Your e-mail',
//                      counterText: 'Counter Text',
//                      errorText: 'Error',
//                      isDense: true,
//                      helperText: 'Helper Text'
                      ),
                    ),
                    new TextField(
                      autocorrect: false,
                      obscureText: true,
                      decoration: new InputDecoration(
                        labelText: 'PASSWORD',
                        hintText: 'Your password'
                      ),
                    )
                  ],
                )
              )
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new InkWell(
                  onTap: _forgotPassword,
                  child: new Text(
                    'Forgot password',
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF26cdfd),
                    )
                  )
                ),
                new Container(
                  alignment: Alignment.centerRight,
                  child: new DecoratedBox(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      gradient: new LinearGradient(
                        colors: [ const Color(0xFFaf1ef5), const Color(0xFF21d4fd)]
                      )
                    ),
                    child: new FloatingActionButton(
                      onPressed: _checkAccount,
                      backgroundColor: Colors.transparent,
                      tooltip: 'Send',
                      child: new Icon(
                        Icons.arrow_forward_ios,
                        size: 35.0
                      )
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}