import 'package:demoapp/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthSerice _auth = AuthSerice();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.blue[50],
     appBar: AppBar(
       title: Text('myBar'),
       backgroundColor: Colors.blue[400],
       elevation: 0.0,
       actions: <Widget>[
         FlatButton.icon(
           icon: Icon(Icons.person),
           label: Text('logout'),
           onPressed: () async {
             await _auth.signOut();
           },
         )
       ],
     ),
   ); 
  }
}