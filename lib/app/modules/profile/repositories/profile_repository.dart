import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_blood/app/modules/login/models/user_model.dart';

class ProfileRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _collection = Firestore.instance.collection('users');

  Future<DocumentSnapshot> getUser() async {
    final user = await _firebaseAuth.currentUser();
    return _collection.document(user.uid).get();
  }

  Future update(UserModel user) async {
    final id = (await _firebaseAuth.currentUser()).uid;
    return _collection.document(id).updateData(user.toMap());
  }

  Future delete(String id) async {
    return _collection.document(id).delete();
  }
}
