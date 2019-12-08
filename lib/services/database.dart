import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoapp/models/bar.dart';
class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference barCollection = Firestore.instance.collection('bar');
  Future updateUserData(String ice, String name, int strength) async {
    return await barCollection.document(uid).setData({
      'ice': ice,
      'name': name,
      'strength': strength,
    });
  }
  //bar list from snapshot
  List<Bar> _barList(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Bar(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        ice: doc.data['ice'] ?? '0',
        
      );
    }).toList();
  }
  //get brew streams 
  Stream<List<Bar>> get bar{
    return barCollection.snapshots()
    .map(_barList);
    
  }
}