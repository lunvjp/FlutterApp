import 'package:flutter/material.dart';

//class HomePage extends StatelessWidget {
//  @override
//  Widget build (BuildContext context) {
//
//    return new Scaffold(
//      backgroundColor: const Color(0xFFe4b6fc),
//      body: new Center(
//        child: new Container(
//          decoration: new BoxDecoration(
//            gradient: new LinearGradient(
//              colors: [ Colors.purple[500],Colors.deepPurple[700] ],
//              begin: const FractionalOffset(0.5, 0.0),
//              end: const FractionalOffset(0.0, 0.5),
//              stops: [0.0,1.0],
//              tileMode: TileMode.clamp
//            ),
//          ),
//          child: new Home()
//        )
//      ),
//    );
//  }
//}

class Home extends StatelessWidget {
  BuildContext context;

  void _loginOnPressed () {
    Navigator.of(context).pushNamed('/login');
  }

  void _signInOnPressed() {
    Navigator.of(context).pushNamed('/signup');
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    final Size screenSize = MediaQuery
        .of(context)
        .size;

    _createButton(String title,
        VoidCallback function, {
          Color textColor = Colors.black,
          Color backgroundColor = Colors.white
        }) {
      return new DecoratedBox(
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(30.0),
//          gradient:
        ),
        child: new ClipRRect(
          borderRadius: new BorderRadius.circular(30.0),
          child: new MaterialButton(
            color: backgroundColor,
            textColor: textColor,
            child: new Text(
                title,
                style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HelveticaNeue',
                    letterSpacing: -0.2
                )
            ),
            onPressed: function
          )
        )
      );
    }
    // ClipRRect

//    var textStyleButton = new TextStyle(
//      fontFamily: 'HelveticaNeue',
//      fontSize: 20.0,
//      fontWeight: FontWeight.bold,
//      letterSpacing: -0.2,
//      color: Colors.white
//    );

    var actionButtons = new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new DecoratedBox(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(30.0),
            gradient: new LinearGradient(
                colors: [const Color(0xFFaf1ef5), const Color(0xFF21d4fd)]
            )
          ),
          child: new ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: new MaterialButton(
              minWidth: screenSize.width - 60.0,
              padding: const EdgeInsets.all(12.0),
              color: Colors.transparent,
              onPressed: _loginOnPressed,
              child: new Text(
                'Log in',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontFamily: 'HelveticaNeue',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.2,
                  color: Colors.white
                )
              ),
            ),
          )
        ),
        new Container(
          margin: new EdgeInsets.only(
              top: 20.0
          ),
          child: new DecoratedBox(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            child: new ClipRRect(
              borderRadius: new BorderRadius.circular(30.0),
              child: new MaterialButton(
                minWidth: screenSize.width - 60.0,
                padding: const EdgeInsets.all(12.0),
                color: Colors.white,
                onPressed: _signInOnPressed,
                child: new Text(
                  'Create an account',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontFamily: 'HelveticaNeue',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.2,
                      color: const Color(0xFF4a4a4a)
                  )
                ),
              ),
            )
          )
        )
      ],
    );

    return new Stack(
      children: <Widget>[
        new Align(
        alignment: Alignment.bottomLeft,
          child: new DecoratedBox(
            position: DecorationPosition.foreground,
            decoration: new BoxDecoration(color: Colors.transparent),
            child: new Image.asset(
                'assets/imgs/home_background.png',
                width: screenSize.width / 2,
                height: screenSize.height / 3,
                fit: BoxFit.fill
            ),
          ),
        ),
        new Align(
          child: new Column(
            children: <Widget>[
              new Container(
                height: screenSize.height / 3 * 2,
                  width: screenSize.width / 1.2,
                  child: new Image.asset('assets/imgs/logo_des.png')
              ),
              new Container(
                height: screenSize.height / 3,
                width: screenSize.width,
                child: actionButtons
              ),
            ],
          )
        ),
      ]
    );


  }
}