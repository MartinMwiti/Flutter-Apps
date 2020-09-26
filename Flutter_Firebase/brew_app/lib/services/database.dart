import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // collection reference
  // A CollectionReference object can be used for adding documents, getting document references, and querying for documents (using the methods inherited from [Query]).
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');
}
