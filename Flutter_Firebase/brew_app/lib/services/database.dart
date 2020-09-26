import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  // A CollectionReference object can be used for adding documents, getting document references, and querying for documents (using the methods inherited from [Query]).
  final CollectionReference brewCollection = Firestore.instance.collection(
      'brews'); // if no collection exist, firebase will automatically create one

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .document(uid)
        .setData({'sugars': sugars, 'name': name, 'strength': strength});
  }

  // Get brew stream
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
