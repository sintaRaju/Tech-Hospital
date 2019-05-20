import 'package:flutter/material.dart';
import '../home.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }

}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Login Page'),
        backgroundColor: Color(0xff212121),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login Screen to be appended here!',
              style: new TextStyle(
                color: Colors.black,
              ),
            ),
            RaisedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[Colors.black, Colors.blue],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text('Home Page'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
