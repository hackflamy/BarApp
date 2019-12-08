import 'package:demoapp/models/user.dart';
import 'package:demoapp/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthSerice{


final FirebaseAuth _auth = FirebaseAuth.instance;
//create user object based on firebase user 

User _userFromFirebaseUser(FirebaseUser user){
  return user != null ? User(uid: user.uid) : null;
}
//auth change user stream 

Stream<User>get user{
  return _auth.onAuthStateChanged
  .map((FirebaseUser user) => _userFromFirebaseUser(user));
  // or .map(_userFromFirebaseUser);
}

//sign in  anon
Future signInAnon() async{
  try{
   AuthResult result = await _auth.signInAnonymously();
   FirebaseUser user = result.user;
   return _userFromFirebaseUser(user);
  }
  catch(e){
    print(e.toString());
    return null;
  }
}
//sign in with password and email
Future signInWithEmailPass(String email, String pass) async{
  try{
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password: pass);
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;

  }
}
//reister with password and email
Future regWithEmailPass(String email, String pass) async{
  try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email,password: pass);
    FirebaseUser user = result.user;

    //create a new firestore document for the user 
    await DatabaseService(uid: user.uid).updateUserData('0', 'new bar member', 100);
    return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;

  }
}

//sign out 
Future signOut() async{
  try{
    return await _auth.signOut();
  } catch(e){
    print(e.toString());
    return null;
  }
}

}