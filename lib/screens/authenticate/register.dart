import 'package:demoapp/shared/constants.dart';
import 'package:demoapp/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:demoapp/services/auth.dart';

class Register extends StatefulWidget {
  final Function toogleview;
  Register({this.toogleview});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text('Signup to myBar'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              widget.toogleview();
            },
          )
        ],
  
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
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
                 decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6 ? 'password can not be less than 6 charectors' : null,
                obscureText: true,
                onChanged:(val){
                  setState(() => password = val);

                } ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.green[400],
                  child: Text('Register', style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{
                    if (_formkey.currentState.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.regWithEmailPass(email, password) ;
                      if (result == null){
                        setState(() {
                        error = 'Enter a vilid email';
                        loading = false;
                        
                       
                        });
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