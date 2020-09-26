import 'package:brew_app/models/brew.dart';
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

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '', // if it doesn't exist, return empty string
        strength: doc.data['strength'] ?? 0,
        sugar: doc.data['sugars'] ?? '0'
      );
    }).toList(); // .toList() convert to list since map returns an iterable
  }

  // Get brew stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
