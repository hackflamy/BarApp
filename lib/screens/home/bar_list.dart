import 'package:demoapp/screens/home/bar_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demoapp/models/bar.dart';

class BarList extends StatefulWidget {
  @override
  _BarListState createState() => _BarListState();
}

class _BarListState extends State<BarList> {
  @override
  Widget build(BuildContext context) {
    final bars = Provider.of<List<Bar>>(context);
   // print(bar.documents);
  
    return ListView.builder(
      itemCount: bars.length,
      itemBuilder: (context,index){
        
        return BarTile(bar: bars[index]);
      },
    );
  }
}