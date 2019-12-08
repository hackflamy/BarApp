import 'package:flutter/material.dart';
import 'package:demoapp/models/bar.dart';

class BarTile extends StatelessWidget {
  final Bar bar;
  BarTile({this.bar});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[bar.strength],

          ),
          title: Text(bar.name),
          subtitle: Text('Ice Cubes ${bar.ice}'),

        ),
      )
    );
  }
}