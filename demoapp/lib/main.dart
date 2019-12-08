import 'package:demoapp/models/user.dart';
import 'package:demoapp/screens/wrapper.dart';
import 'package:demoapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: AuthSerice().user,
          child: MaterialApp(
          home: Wrapper(),
        ),
    );
  }
}

