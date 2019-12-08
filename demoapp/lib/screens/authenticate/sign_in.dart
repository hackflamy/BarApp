import 'package:demoapp/services/auth.dart';
import 'package:demoapp/shared/constants.dart';
import 'package:demoapp/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toogleview;
  SignIn({this.toogleview});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthSerice _auth = AuthSerice();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  // text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('LogIn to myBar'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toogleview();
            },
          )
        ],
  
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
       /*  child: RaisedButton(
          child: Text('sing in anon'),
          onPressed: () async{
           dynamic result = await _auth.signInAnon();
           if (result == null){
             print('error sinign in');
           } else{
             print('signed in ');
             print(result.uid);
           }

          },
        ), */
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                onChanged: (val){
                  setState(() => email = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                 decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6 ? 'password can not be less than 6 charectors' : null,
                onChanged:(val){
                  setState(() => password = val);

                } ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.green[400],
                  child: Text('SignIn', style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{
                         if (_formkey.currentState.validate()){
                           setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailPass(email, password) ;
                       if (result == null){
                        setState(() {
                          error = 'user does not exist';
                          loading = false;
                        }
                         );
                      } 
                    }
                    

                  }
                ),
                 SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red,fontSize: 14.0),

                )
            ],
          ),
        ),
      ),
    );
  }
}