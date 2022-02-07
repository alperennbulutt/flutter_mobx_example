import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  var firestore = FirebaseFirestore.instance;

  getUserName() {
    var userName = firestore.collection("test").doc("names").snapshots();
    return userName;
  }
}
