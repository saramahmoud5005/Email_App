import 'package:emails/screen_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sign_in.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
      //home: ContactScreen(),
      /*home:Scaffold(
        body: Center(
        ),*/
      );
  }
}
