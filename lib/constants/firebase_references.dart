import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseReferences{

  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference usersReference = FirebaseFirestore.instance.collection('users');
  CollectionReference complaintsReference = FirebaseFirestore.instance.collection('complaints');
}