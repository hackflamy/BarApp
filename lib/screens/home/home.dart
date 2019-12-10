import 'package:demoapp/screens/home/bar_list.dart';
import 'package:demoapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:demoapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:demoapp/models/bar.dart';


class Home extends StatelessWidget {
  final AuthSerice _auth = AuthSerice();
  @override
  Widget build(BuildContext context) {
    // edit menu

    void _showEditPanel(){
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: Text('bottom sheet'),
        );
          
        }
      );
    }

   return StreamProvider<List<Bar>>.value(
     value: DatabaseService().bar,
        child: Scaffold(
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
           ),
           FlatButton.icon(
             icon: Icon(Icons.edit),
             label: Text('Edit'),
             onPressed: () => _showEditPanel(),
           )
         ],
       ),
       body: BarList(),
     ),
   ); 
  }
}