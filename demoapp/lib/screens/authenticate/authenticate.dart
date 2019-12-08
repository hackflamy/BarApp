import 'package:demoapp/screens/authenticate/register.dart';
import 'package:demoapp/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate  extends StatefulWidget {
  @override
  _Authenticate createState() => _Authenticate();
}

class _Authenticate extends State<Authenticate> {
  bool showSignIn = true;
  void toogleView(){
    setState(() => showSignIn = !showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return SignIn( toogleview: toogleView);
    } else{
      return Register(toogleview: toogleView);
    }

  }
}